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
<center>
<%
if(null == session.getAttribute("name"))
{
	response.sendRedirect("Admin.html");
}
%>
<div class="contact-section">
 
<h1> Bus details </h1>
<div class="border"></div>

<form  class="contact-form"  method="post" action="bus.jsp">

<p><h2>BUS ID</h2></p> 

<input type="number" class="contact-form-text" placeholder="enter the bus id" name="bi" required>
<p><h2>BUS Name</h2></p> 

<input type="text" class="contact-form-text" pattern="[A-Za-z\s]{1,32}" placeholder="enter the bus name" name="bn" required>
<p><h2>Source Arrival</h2></p>  

<input type="time" class="contact-form-text" placeholder="enter the Time from the Source" name="sa" required>

<p><h2>Distination Arrival</h2></p> 

<input type="time" class="contact-form-text" placeholder="enter the Destination arrival" name="da" required>

<p><h2>DEPARTURE DATE </h2></p> 

<input type="date" class="contact-form-text" placeholder="enter the Departure Date" name="dd" required>

<p><h2>NO of seat</h2></p> 

<input type="number" class="contact-form-text" placeholder="enter the Seat Capacity of Bus" name="ns" required>

<p><h2>Source</h2></p> 

<input type="text" class="contact-form-text" pattern="[A-Za-z]{1,32}"  placeholder="enter the source" name="rt" required>
<p><h2>Destination</h2></p> 

<input type="text" class="contact-form-text" pattern="[A-Za-z]{1,32}" placeholder="enter the source" name="rtt" required>

<input type="submit"  class="contact-form-btn" value="submit"><br>

</form>
</div>
</center>
</center>

</body>
</html>