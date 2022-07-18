<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.chainsys.jspproject.commonutil.*,
    java.text.ParseException,java.io.PrintWriter, com.chainsys.jspproject.pojo.Employee,com.chainsys.jspproject.dao.EmployeeDao,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add new Emp</title>
</head>
<body>
<%

String source="AddNewEmployee";
String message="<h1>Error while "+source+"</h1>";
Employee emp=new Employee();

try {

	String emp_id = request.getParameter("id");
	try {
		Validator.checkStringForParseInt(emp_id);
	} catch (InvalidInputDataException e) {
		message +=" Error in Employee id input </p>";
		String errorPage=ExceptionManager.handleException(e, source, message);
		out.print(errorPage);
       return; // It terminates the Code execution beyond this point 
	}
	int id = Integer.parseInt(emp_id);
	try {
		Validator.CheckNumberForGreaterThanZero(id);
	} catch (InvalidInputDataException e) {
		message +=" Error in Employee id input </p>";
		String errorPage=ExceptionManager.handleException(e, source, message);					out.print(errorPage);
       return;
	}
	emp.setEmp_Id(id);


	String emp_Firstname = request.getParameter("fname");
	try {
		Validator.checkStringOnly(emp_Firstname);
	} catch (InvalidInputDataException e) {
		message +=" Error in First Name input </p>";
		String errorPage=ExceptionManager.handleException(e, source, message);
		out.print(errorPage);
       return;
	}
	emp.setFirst_name(emp_Firstname);
	String emp_LastName = request.getParameter("lname");
	try {
		Validator.checkStringOnly(emp_LastName);
	} catch (InvalidInputDataException e) {
		message +=" Error in Last Name input </p>";
		String errorPage=ExceptionManager.handleException(e, source, message);
		out.print(errorPage);
       return;
	}
	emp.setLast_name(emp_LastName);
	String emp_email = request.getParameter("email");
	try {
		Validator.checkEmail(emp_email);
	} catch (InvalidInputDataException e) {
		message +=" Error in email input </p>";
		String errorPage=ExceptionManager.handleException(e, source, message);
		out.print(errorPage);
       return;
	}
	emp.setEmail(emp_email);
	SimpleDateFormat hire_dateFormate = new SimpleDateFormat("dd/MM/yyyy");
	String emp_HireDate = request.getParameter("hdate");
	// Date hire_date=hire_dateFormate.parse(emp_HireDate);

	try {
		Validator.checkDate(emp_HireDate);
		Validator.checkHireDate(emp_HireDate);
	} catch (InvalidInputDataException e) {
		message +=" Error in Hire Date input </p>";
		String errorPage=ExceptionManager.handleException(e, source, message);
		out.print(errorPage);
       return;
	}
	try {
		emp.setHire_date(hire_dateFormate.parse(emp_HireDate));
	} catch (ParseException e) {
		message +=" Error in Hire Date input </p>";
		String errorPage=ExceptionManager.handleException(e, source, message);
		out.print(errorPage);
       return;
	}
	String emp_Job_id = request.getParameter("jobid");
	try {
		Validator.checkJobId(emp_Job_id);
	} catch (InvalidInputDataException e) {
		message +=" Error in Job Id input </p>";
		String errorPage=ExceptionManager.handleException(e, source, message);
		out.print(errorPage);
       return;
	}
	emp.setJob_id(emp_Job_id);
	String emp_salary = null;
	try {
		emp_salary = request.getParameter("salary");
		Validator.checkFloat(emp_salary);
	} catch (InvalidInputDataException e) {
		message +=" Error in Salary input </p>";
		String errorPage=ExceptionManager.handleException(e, source, message);
		out.print(errorPage);
       return;
	}
	float salary = Float.parseFloat(emp_salary);
	emp.setSalary(salary);
	int result = EmployeeDao.insertEmployee(emp);
	out.println(result + "row inserted");
} 
catch (Exception e) {
	message +=" Error while inserting record </p>";
	String errorPage=ExceptionManager.handleException(e, source, message);
	out.print(errorPage);
   return;
   }
try {
} catch (Exception e) {
	message +="Message: "+e.getMessage();
	String errorPage=ExceptionManager.handleException(e, source, message);
	out.print(errorPage);
   return;
}
%>
	
</body>
</html>