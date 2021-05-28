<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Employee Details</title>
</head>
<body>

<div align="center">
<h1>Employee Details</h1>

<table>

<tr>
<td colspan="5">
Id </td><td>:</td><td><input type="text" id="inid" placeholder="Enter Id"></input>
</td>
</tr>

<tr>
<td colspan="5">
Name </td><td>:</td><td><input type="text" id="inname" placeholder="Enter Name"></input>
</td>
</tr>

<tr>
<td colspan="5">
salary </td><td>:</td><td><input type="text" id="insalary" placeholder="Enter Salary"></input>
</td>
</tr>

<tr>
<td>
<input type="submit" value="insert" onclick="insert()"></input>


<input type="submit" value="Update" onclick="update()"></input>
</td>

</tr>
</table>

<p><a href="./InsertUpdate?type=showdata">Click here To Show Data</a></p>

<p><a href="EmployeeLogin.jsp">Click Here To Employee Login Page</a></p>

</div>

<script type="text/javascript">

var inid = document.getElementById("inid");

inid.onkeyup = function(){
	debugger;
//alert("onkeyup");
	var searchId = inid.value;

	var url = "<%=request.getContextPath()%>/InsertUpdate";
	var data = "type=check&id="+searchId;

	$.ajax({
	    url : url,
	    type : 'POST',
	    datatype : 'JSON',
	    data : data,

	    success : function(responsejson){
		    if(responsejson =="" || responsejson =="undefined" || responsejson ==null){

			    return false;
			    }else{
	alert(responsejson);
			    }
	        },

	        error : function(error){
			alert("error="+error);
			        
	            }

			});
}



function insert(){
debugger;
	var name = $("#inname").val();
	var id = $("#inid").val();
	var salary = $("#insalary").val();

	var url = "<%=request.getContextPath()%>/InsertUpdate";
	var data = "type=insert&name="+name+"&id="+id+"&salary="+salary;

	$.ajax({
    url : url,
    type : 'POST',
    datatype : 'JSON',
    data : data,

    success : function(responsejson){
alert(responsejson);
        },

        error : function(error){
alert(error.responseText);
            }

		});
}

function update(){
	debugger;
		var name = $("#inname").val();
		var id = $("#inid").val();
		var salary = $("#insalary").val();

		var url = "<%=request.getContextPath()%>/InsertUpdate";
		var data = "type=update&name="+name+"&id="+id+"&salary="+salary;

		$.ajax({
	    url : url,
	    type : 'POST',
	    datatype : 'JSON',
	    data : data,

	    success : function(responsejson){
	alert("responsejson= "+responsejson);
	        },

	        error : function(error){
	alert("error= "+error.responseText);
	            }

			});
	}

</script>
</body>
</html>