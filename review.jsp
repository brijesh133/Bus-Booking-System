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
<%
if(null == session.getAttribute("username"))
{
	response.sendRedirect("Userlog.html");
}

%>
<center>
<p align="right"><a href="welcome_user.jsp"><input type="submit" class="contact-form-btn" value="User Panel"></a>
</p>
<% String rt=request.getParameter("bid");%>

<% String tid=request.getParameter("tid");%>
<div class="contact-section">
<h1>Rating</h1>
<div class="border"></div>

<form action="rev_in.jsp" class="contact-form"  method="post">

<input type="hidden" name="bid" class="contact-form-text"  value=<%out.print(rt); %>  placeholder="enter the bus id">
<input type="hidden" name="tid" class="contact-form-text"  value=<%out.print(tid); %> >
<p><h2>Rating Out Of 5	</h2></p> 
<input type="text" pattern="[1-12-23-34-45-5]" name="rt" class="contact-form-text" placeholder="enter the Ratings"><br>
<br>
<input type="submit" class="contact-form-btn"  value="submit"><br>
</form>
</center>

</body>
</html>