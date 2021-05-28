<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>SignIn Page</title>
</head>
<body>
<div align="left">
<h1>WelCome To User Details</h1>

<table>
<c:forEach var="emplogin" items="${employeelogin}">
<tr><td>Employee Code</td><td>:</td><td>${emplogin.id}</td></tr>
<tr><td>Employee Name</td><td>:</td><td>${emplogin.name}</td></tr>
<tr><td>Employee Salary</td><td>:</td><td>${emplogin.salary}</td></tr>
</c:forEach>
</table>
</div>
</body>
</html>