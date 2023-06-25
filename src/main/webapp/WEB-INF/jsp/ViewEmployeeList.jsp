<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>View Employee</title>
	
		<link rel="stylesheet"
	    	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	    <link rel="stylesheet"
	        href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
	    <script
	    	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	    <script
	    	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	    <script
	        src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	
	<style>
	    a{
	        color: white;
	    }
	    a:hover {
	        color: white;
	        text-decoration: none;
	    }
	</style>
</head>
<body>
	<div class="container">
		<h1 class="p-3"> Employee List </h1>
		<form>
			<table class="table table-bordered">
				<tr>
					<th>ID</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>	
					<th>Edit</th>
					<th>Delete</th>	
				</tr>
				
				<c:forEach var="employee" items="${employeeList}">
					<tr>
						<td>${employee.id}</td>
						<td>${employee.firstName}</td>
						<td>${employee.lastName}</td>
						<td>${employee.emailId}</td>
						<td>
							<button type="button" class="btn btn-success">
								<a href="/editEmployee/${employee.id}">Edit</a>
							</button>						
						</td>
						<td>
							<button type="button" class="btn btn-danger">
								<a href="/deleteEmployee/${employee.id}">Delete</a>
							</button>						
						</td>
					</tr>
				</c:forEach>
			</table>
		</form>
		
		<button type="button" class="btn btn-primary btn-lock">
			<a href="/addEmployee">Add New Employee</a>
		</button>
	</div>
	
	<script th:inline="javascript">
		window.onload = function() {

			var msg = "${message}";
			console.log(msg);
			if (msg == "Save Success") {
				Command: toastr["success"]("Employee saved successfully.")
			}
			else if(msg == "Save Failure"){
				Command: toastr["error"]("Something went wrong with the save.")
			}
			else if(msg == "Edit Success"){
				Command: toastr["success"]("Employee updated successfully.")
			}
			else if(msg == "Edit Failure"){
				Command: toastr["error"]("Something went wrong, couldn't updat employee.")
			}
			else if(msg == "Delete Success"){
				Command: toastr["success"]("Employee deleted successfully.")
			}
			else if(msg == "Delete Failure"){
				Command: toastr["error"]("Something went wrong, couldn't delete employee.")
			}
	
			toastr.options = {
				"closeButton": true,
				"debug": false,
				"newestOnTop": false,
				"progressBar": true,
				"positionClass": "toast-top-right",
				"preventDuplicates": false,
				"showDuration": "300",
				"hideDuration": "1000",
				"timeOut": "5000",
				"extendedTimeOut": "1000",
				"showEasing": "swing",
				"hideEasing": "linear",
				"showMethod": "fadeIn",
				"hideMethod": "fadeOut"
			}
  	  	}
	   </script>
</body>
</html>