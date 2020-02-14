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
if(null == session.getAttribute("username"))
{
	response.sendRedirect("Userlog.html");
}

%><center>
<h1 style="color:white;">Welcome,<%=session.getAttribute("username")%></h1>
</center>
<p align="right"><a href="logout.jsp"><input type="submit" class="contact-form-btn" value="Logout"></a>
</p>
<h1 style="color:white;">Book Bus Ticket</h1>
<a href="routefind.jsp"><input type="submit" class="contact-form-btn" value="Click Here"></a>

<h1 style="color:white;">Buses ON Various Route</h1>
<a href="busdisu.jsp"><input type="submit" class="contact-form-btn" value="Display"></a>

<h1 style="color:white;">Booking Details</h1>
<a href="findpass.jsp"><input type="submit" class="contact-form-btn" value="Display"></a>

<h1 style="color:white;">Ratings</h1>
<a href="allratuser.jsp"><input type="submit" class="contact-form-btn" value="Your Ratings"></a>

<h1 style="color:white;">Cancelled Ticket</h1>
<a href="passdlt.jsp"><input type="submit" class="contact-form-btn" value="Display"></a>
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