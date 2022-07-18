<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.chainsys.jspproject.commonutil.*,
    java.text.ParseException,java.io.PrintWriter, com.chainsys.jspproject.pojo.Employee,com.chainsys.jspproject.dao.EmployeeDao,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Employee</title>
</head>
<body>
	<%
	PrintWriter out1 = response.getWriter();
	Employee emp = new Employee();
	String source = "DELETEEMPLOYEE";
	String message = "<h1>Error while " + source + "</h1>";
	String emp_id = request.getParameter("id");
	try {
		Validator.checkStringForParseInt(emp_id);
	} catch (InvalidInputDataException e) {
		message += " Error while inserting record </p>";
		String errorPage = ExceptionManager.handleException(e, source, message);
		out.print(errorPage);
		return;
	}
	int id = Integer.parseInt(emp_id);
	int result = EmployeeDao.deleteEmployee(id);
	System.out.println(result);
	out1.println(result + "row deleted");
	
	try {
		out1.close();
	} catch (Exception e) {
		message += " Error while inserting record </p>";
		String errorPage = ExceptionManager.handleException(e, source, message);
		out.print(errorPage);
		return;
	}
	%>

</body>
</html>