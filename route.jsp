<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/stylero.css">
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
<center>
<%
if(null == session.getAttribute("name"))
{
	response.sendRedirect("Admin.html");
}
%>
<div class="contact-section">
<h1>Route Details</h1>
<div class="border"></div>
<form class="contact-form" action="route_insert.jsp" method="post">
<p><h2>Route_id</h2></p> <input type="number" class="contact-form-text" placeholder="Enter the root id" name="ri" required>
<p><h2>From</h2></p>    <input type="text" pattern="[A-Za-z\s]{1,32}"  class="contact-form-text" placeholder="From" name="fr" required>
  <p><h2>To</h2></p>  <input type="text" pattern="[A-Za-z\s]{1,32}"  class="contact-form-text" placeholder="To" name="to"required >

<input type="submit"  class="contact-form-btn" value="submit"><br>

</form>
</body>
</html>