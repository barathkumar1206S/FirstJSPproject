<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.chainsys.jspproject.commonutil.*,
    java.text.ParseException,java.io.PrintWriter, com.chainsys.jspproject.pojo.Employee,com.chainsys.jspproject.dao.EmployeeDao,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Employee</title>
</head>
<body>
<%
		Employee emp = new Employee();
		String source="UPDATEEMPLOYEE";
		String message="<h1>Error while "+source+"</h1>";

		try {

			String emp_id = request.getParameter("id");
			try {
				Validator.checkStringForParseInt(emp_id);
			} catch (InvalidInputDataException e) {
				message +=" Error while inserting record </p>";
				String errorPage=ExceptionManager.handleException(e, source, message);
				out.print(errorPage);
               return;

			}
			int id = Integer.parseInt(emp_id);
			try {
				Validator.CheckNumberForGreaterThanZero(id);
			} catch (InvalidInputDataException e) {
				message +=" Error while inserting record </p>";
				String errorPage=ExceptionManager.handleException(e, source, message);
				out.print(errorPage);
               return;
			}
			emp.setEmp_Id(id);

			String emp_Firstname = request.getParameter("fname");
			try {
				Validator.checkStringOnly(emp_Firstname);
			} catch (InvalidInputDataException e) {
				out.println("Error first name:" + e.getMessage());
			}
			emp.setFirst_name(emp_Firstname);
			String emp_LastName = request.getParameter("lname");
			try {
				Validator.checkStringOnly(emp_LastName);
			} catch (InvalidInputDataException e) {
				out.println("Error in Last name:" + e.getMessage());
			}
			emp.setLast_name(emp_LastName);
			String emp_email = request.getParameter("email");
			try {
				Validator.checkEmail(emp_email);
			} catch (InvalidInputDataException e) {
				message +=" Error while inserting record </p>";
				String errorPage=ExceptionManager.handleException(e, source, message);
				out.print(errorPage);
               return;			}
			emp.setEmail(emp_email);
			SimpleDateFormat hire_dateFormate = new SimpleDateFormat("dd/MM/yyyy");
			String emp_HireDate = request.getParameter("hdate");
			// Date hire_date=hire_dateFormate.parse(emp_HireDate);

			try {
				Validator.checkDate(emp_HireDate);
				Validator.checkHireDate(emp_HireDate);
			} catch (InvalidInputDataException e) {
				out.println("Error in Hire date:" + e.getMessage());
			}
			try {
				emp.setHire_date(hire_dateFormate.parse(emp_HireDate));
			} catch (ParseException e) {
				message +=" Error while inserting record </p>";
				String errorPage=ExceptionManager.handleException(e, source, message);
				out.print(errorPage);
               return;			}
			String emp_Job_id = request.getParameter("jobid");
			try {
				Validator.checkJobId(emp_Job_id);
			} catch (InvalidInputDataException e) {
				message +=" Error while inserting record </p>";
				String errorPage=ExceptionManager.handleException(e, source, message);
				out.print(errorPage);
               return;				
			}
			emp.setJob_id(emp_Job_id);
			String emp_salary = request.getParameter("salary");
			try {
				Validator.checkFloat(emp_salary);
			} catch (InvalidInputDataException e) {
				message +=" Error while inserting record </p>";
				String errorPage=ExceptionManager.handleException(e, source, message);
				out.print(errorPage);
               return;				
			}
			float salary = Float.parseFloat(emp_salary);
			emp.setSalary(salary);
			int result = EmployeeDao.updateEmployee(emp);
			out.println(result + "row Updated");
		} catch (Exception e) {
			message +=" Error while inserting record </p>";
			String errorPage=ExceptionManager.handleException(e, source, message);
			out.print(errorPage);
           return;		}
		try {
			out.close();
		} catch (Exception e) {
			message +=" Error while inserting record </p>";
			String errorPage=ExceptionManager.handleException(e, source, message);
			out.print(errorPage);
           return;		}
	%>
</body>
</html>