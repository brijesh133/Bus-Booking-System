<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% session.invalidate(); %>
<% out.println("<script>alert('Successfully logged out');window.location='Start_bus.html';</script>");
%>


</body>
</html>