<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/stylerf.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<input type="hidden" id="refreshed" value="no">
<script type="text/javascript">



	onload=function(){
	var e=document.getElementById("refreshed");
	if(e.value=="no")e.value="yes";
	else{e.value="no";location.reload();}
	}
</script>
<center align="right"><a href="welcomeadmin.jsp" class="contact-form-btn" >Admin Panel</a></center>
<center>
<%
if(null == session.getAttribute("name"))
{
	response.sendRedirect("Admin.html");
}
%>
<div class="contact-section">
 
<h1> Fare details</h1>
<div class="border"></div>


<form method="post" class="contact-form" action="tic_i.jsp">
<p><h2>Bus Id</h2></p> 
<input type="number" class="contact-form-text"  placeholder="enter the Bus id" name="tx" required>

<p><h2>Fare</h2></p> 

<input type="number" class="contact-form-text" placeholder="enter the ticket price" name="tp" required>

<input type="submit"  class="contact-form-btn" type="submit" value="submit">
</form>
</div>
</center>
</body>
</html>