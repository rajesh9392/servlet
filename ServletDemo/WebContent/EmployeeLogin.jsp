<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>Employee Login Page</title>
</head>
<body>
<div align="center">
<h1>WelCome To Employee Login</h1>
<table>
<tbody>

<tr><td>User Name </td><td>:</td> <td><input type="text" id="in_user_name" placeholder="Enter Name"></input></td></tr>

<tr><td>Password </td><td>:</td> <td><input type="password" id="in_password" placeholder="Enter Password"></input></td></tr>

<tr><td><input type="submit" id="in_signin" value="SignIn" onclick="signin()"></input></td>
<td><p><a href="index.jsp"><input type="submit" value="SignUp"></input></a></p></td></tr>

</tbody>
</table>

<p><a href="./InsertUpdate?type=showdata">Click here To Show Data</a></p>

</div>

<script type="text/javascript">

function signin(){
	debugger;
		var username = $("#in_user_name").val();
		var password = $("#in_password").val();

		var url = "<%=request.getContextPath()%>/InsertUpdate";
		var data = "type=signin&username="+username+"&password="+password;

		$.ajax({
	    url : url,
	    type : 'GET',
	    datatype : 'JSON',
	    data : data,

	    success : function(responsejson){
	//alert(responsejson);
	$("html").html(responsejson);
	        },

	        error : function(error){
	alert(error.responseText);
	            }

			});
	}

</script>
</body>
</html>