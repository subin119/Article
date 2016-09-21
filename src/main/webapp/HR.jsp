<%@page import="com.dat.hr.vo.EmployeesVO"%>
<%@page import="com.dat.hr.dao.HRDaoImpl"%>
<%@page import="com.dat.hr.dao.HRDao"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	HRDao dao = new HRDaoImpl();
	List<EmployeesVO> employees = dao.getEmployees();
%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EMPLOYEES</title>
</head>
<body>
	<h1>EMPLOYEES</h1>
	<hr>
	<a href="http://www.naver.com">NAVER</a>,
	<a href="http://www.daum.net">DAUM</a>,
	<a href="http://www.google.com" target="_blank">GOOGLE</a>
	
	<a href="./index.jsp?name=sbHwang" target="_blank">INDEX</a>
	<hr>
	
	<table style = "width:100%; border-collapse: collapse; border: 1px solid #000000; background-color: #CCCCCC;">
		<tr style = "height: 50px;">
			<th>EMPLOYEE_ID</th>
			<th>FIRST_NAME</th>
			<th>LAST_NAME</th>
			<th>EMAIL</th>
			<th>PHONE_NUMBER</th>
			<th>HIRE_DATE</th>
			<th>JOB_ID</th>
			<th>SALARY</th>
			<th>COMMISSION_PCT</th>
			<th>MANAGER_ID</th>
			<th>DEPARTMENT_ID</th>
		</tr>
<%
	int employeesSize = employees.size();
	EmployeesVO employee = null; // 사원하나를 받기 위한 임시 객체
	for(int i = 0; i < employeesSize; i++) {
		employee = employees.get(i);
%>		
		<tr>
			<td><%= employee.getEmployeeId() %></td>
			<td><%= employee.getFirstName() %></td>
			<td><%= employee.getLastName() %></td>
			<td><%= employee.getEmail() %></td>
			<td><%= employee.getPhoneNumber() %></td>
			<td><%= employee.getHireDate() %></td>
			<td><%= employee.getJobId() %></td>
			<td><%= employee.getSalary() %></td>
			<td><%= employee.getCommissionPCT() %></td>
			<td><%= employee.getManagerId() %></td>
			<td><%= employee.getDepartmentId() %></td>
		</tr>
<% } %>
	</table>
</body>
</html>