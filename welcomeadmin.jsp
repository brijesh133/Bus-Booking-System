<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
<%
if(null == session.getAttribute("name"))
{
	response.sendRedirect("Admin.html");
}

%><center>
<h1 style="color:white;">Welcome,<%=session.getAttribute("name")%></h1>
</center>
<p align="right"><a href="logout.jsp"><input type="submit" class="contact-form-btn" value="Logout"></a>
</p>

<h1 style="color:white;">Route</h1>

<a href="route.jsp"><input type="submit" class="contact-form-btn" value="Insert"></a>
<a href="preparestmt.jsp"><input type="submit" class="contact-form-btn" value="Display"></a>


<h1 style="color:white;">BUS</h1>

<a href="buses_input.jsp"><input type="submit" class="contact-form-btn" value="Insert"></a>

<a href="busdis.jsp"><input type="submit" class="contact-form-btn" value="Display"></a>


<h1 style="color:white;">Passenger</h1>
<a href="passengerdis.jsp"><input type="submit" class="contact-form-btn" value="Display"></a>

<h1 style="color:white;">Ticket</h1>
<a href="ticket_input.jsp"><input type="submit" class="contact-form-btn" value="Insert"></a>
<a href="ticketdis.jsp"><input type="submit" class="contact-form-btn" value="Display"></a>

<h1 style="color:white;">Review</h1>
<a href="revdisp.jsp"><input type="submit" class="contact-form-btn" value="Display"></a>


<style type="">
html{
scroll-behavior:smooth;
}
body{
     margin: 0;
    padding: 0;
    background: url(bg.png) no-repeat center;
    background-size: cover;
      
    font-family: sans-serif;
}
	h1{
		 
		 margin: 30px;
	}
	h1{
		 
		 margin: 30px;
	}
	.contact-form-btn{
  float: center;
  border: 0;
  background: #34495e;
  color: #fff;
  padding: 12px 50px;
  border-radius: 20px;
  cursor: pointer;
  transition: 0.5s;
}
.contact-form-btn:hover{
  background: #2980b9;
}

</style>

</body>
</html>