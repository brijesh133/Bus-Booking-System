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
<center>
<p align="right"><a href="welcome_user.jsp"><input type="submit" class="contact-form-btn" value="User Panel"></a>
</p>
<%
if(null == session.getAttribute("username"))
{
	response.sendRedirect("Userlog.html");
}

%>
<div class="contact-section">
 
<h1> Journey details</h1>
<div class="border"></div>
<form class="contact-form" action="checkbus.jsp" method="post">
<p><h2>From</h2></p> 
<input type="text" class="contact-form-text" pattern="[A-Za-z]{1,32}" placeholder="Journey from" name="fr" required>
<p><h2>To</h2></p>    
 <input type="text" class="contact-form-text" pattern="[A-Za-z]{1,32}" placeholder="Journey to" name="to" required>
<p><h2>Date of Journey</h2></p>
<input type="date"  class="contact-form-text" name="dat" placeholder="Journey Date(Optional field)">
<input type="submit"  class="contact-form-btn" value="submit"><br>

</form>
</div>
</center>
</body>
</html>