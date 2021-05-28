<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Form Creation</title>
</head>
<body>
<div align="center">

<table border="1">

<tr>
<td>
From name:</td>
<td><input type="text" id="informname"/></td>
<td>
</tr>
<tr>
<td>
Field:
</td>
<td><input type="text" id="infield"/></td>
<tr>
<td>
<input type="button" value="submit" onclick="submit()"></input>
</td>
</tr>
</table>
</div>

<script>
function submit(){
var fromname=$("#infromname").val();
var field=$("#infield").val();

var data="type=form&fromname="+fromname+"&filld="+field;

var url="<%=request.getContextPath()%>/webfrom/WebForm";

$.ajax({

	url:url,
	type:'POST',
	data:data,
	datatype:'JSON',


		success : function(responsejson){
			alert(responsejson);
			},
			error : function(error){
				alert(error);
				}
});
}


</script>
</body>
</html>