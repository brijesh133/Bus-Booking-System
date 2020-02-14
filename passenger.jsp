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
<%
String bid=request.getParameter("bid");
%>
<div class="contact-section">
<h1>Passenger Details</h1>
<div class="border"></div>
<form class="contact-form" action="passenger_insert.jsp" method="post" >
<p><h2>Passenger Name</p></h2> 
<input type="text" name="pn" class="contact-form-text" pattern="[A-Za-z\s]{1,32}"  placeholder="enter the passenger name" required><br>
<p><h2>Age</p></h2>
<input type="number" class="contact-form-text" name="ag" placeholder="enter the age" required><br>
<p><h2>Contact No</p></h2> 
<input type="phone" pattern ="[789][0-9]{9}" class="contact-form-text" placeholder="enter the contact no" name="co" required name=""><br>

<p><h2>Gender</p></h2> 
<input type= name="gd" class="contact-form-text" name="gd" pattern="[m-mM-Mf-fF-F]{0,1}" placeholder="enter the gender  for ex: male:m,female:f" required><br>
<p><h2>Adrress</p></h2> 
<input type="text" name="ad" class="contact-form-text"  placeholder="enter the adress" required><br>
 
<input type="hidden" name="bui" class="contact-form-text" value=<%out.print(bid); %> placeholder="enter the bus id" readonly><br>

<input type="submit" class="contact-form-btn" value="submit"><br>
</form>
</div>
</center>

</body>
</html>