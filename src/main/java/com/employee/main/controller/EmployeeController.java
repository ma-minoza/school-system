package com.employee.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.employee.main.model.Employee;
import com.employee.main.service.EmployeeService;

@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeService service;
	
	@GetMapping("/viewAllEmployees")
	public String getAllEmployees(@ModelAttribute("message")String message,Model model){
		model.addAttribute("employeeList",service.getAllEmployees());
		model.addAttribute("message",message);
		return "ViewEmployeeList";
	}

	@GetMapping("/addEmployee")
	public String addEmployee(@ModelAttribute("message")String message, Model model) {
		model.addAttribute("employee", new Employee());
		
		return "AddEmployee";
	}
	
	@PostMapping("/saveEmployee")
	public String saveEmployee(Employee employee, RedirectAttributes redirectAttributes) {
		if(service.saveOrUpdateEmployee(employee)) {
			redirectAttributes.addFlashAttribute("message", "Save Success");
			return "redirect:/viewAllEmployees";
		}
		
		redirectAttributes.addFlashAttribute("message", "Save Failure");
		return "redirect:/addEmployee";
	}
	
	@GetMapping("/editEmployee/{id}")
	public String editEmployee(@PathVariable Long id,Model model) {
		model.addAttribute("employee", service.getEmployeeById(id));
		return "EditEmployee";
	}
	
	@PostMapping("/editSaveEmployee")
	public String editSaveEmployee(Employee employee, RedirectAttributes redirectAttributes) {
		if(service.saveOrUpdateEmployee(employee)) {
			redirectAttributes.addFlashAttribute("message", "Edit Success");
			return "redirect:/viewAllEmployees";
		}
		
		redirectAttributes.addFlashAttribute("message", "Edit Failure");
		return "redirect:/editEmployee/" +employee.getId();
	}
	
	@GetMapping("/deleteEmployee/{id}")
	public String deleteEmployee(@PathVariable Long id,RedirectAttributes redirectAttributes) {
		if(service.deleteEmployee(id)) {
			redirectAttributes.addFlashAttribute("message", "Delete Success");
		}
		else {
			redirectAttributes.addFlashAttribute("message", "Delete Failure");
		}
		return "redirect:/viewAllEmployees";
	}
}
