package com.employee.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.employee.main.model.Employee;
import com.employee.main.repository.EmployeeRepository;

@Service
public class EmployeeService {
	
	@Autowired
	EmployeeRepository repo;
	
	
	public List<Employee> getAllEmployees(){
		
		return repo.findAll();
		
	}
	
	public Employee getEmployeeById(long id) {
		
		return repo.findById(id).get();
				 
	}
	
	public boolean saveOrUpdateEmployee(Employee employee){
		Employee updatedEmployee = repo.save(employee);
		
		if(getEmployeeById(updatedEmployee.getId()) != null) {
			return true;
		}
		
		return false;
	}
	
	public boolean deleteEmployee(long id) {
		repo.deleteById(id);
		
		if (repo.findById(id) != null) {
            return true;
        }
		
		return false;
		
	}

}
