<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Employee Data</title>
</head>
<body>

<div align="center">
<h1>Employee Total Data</h1>
<table border="1">

<tr><th>...</th><th>CODE</th><th>NAME</th><th>SALARY</th></tr>
<c:forEach var = "emp" items="${employee}">
<tr>
<td>
<input type="submit" id="${emp.id}" value="Delete" onclick="deletes(this)"></input>
</td>
<td>
<input type="text" value="${emp.id}"/>
</td>
<td>
${emp.name}
</td>
<td>
${emp.salary}
</td>
</tr>

</c:forEach>

</table>
<p><a href="index.jsp">Click here To Back</a></p>
</div>

<script type="text/javascript">

function deletes(id){
	debugger;

	var deleteid = id.id;

		var url = "<%=request.getContextPath()%>/InsertUpdate";
		var data = "type=delete&id="+deleteid;

		$.ajax({
	    url : url,
	    type : 'GET',
	    datatype : 'JSON',
	    data : data,

	    success : function(responsejson){
	alert(responsejson);
	   location.href=url+"?type=showdata";
	        },

	        error : function(error){
	alert(error.responseText);
	            }

			});
	}

</script>
</body>
</html>