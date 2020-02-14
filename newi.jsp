<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
        <%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name=request.getParameter("admin_n");
String  uname=request.getParameter("a");
String  password=request.getParameter("password");
String  ph=request.getParameter("m");
String gen=request.getParameter("Gender");
String mail=request.getParameter("s");
Class.forName("com.mysql.jdbc.Driver");
String url=("jdbc:mysql://localhost:3306/bus_booking");
String un="root";
String pwd="root";
Connection con=DriverManager.getConnection(url,un,pwd);
PreparedStatement ps=con.prepareStatement("insert into login_admin values(?,?,?,?,?,?)");
ps.setString(1,name);
ps.setString(2,uname);
ps.setString(3,password);
ps.setString(4,ph);
ps.setString(5,gen);
ps.setString(6,mail);
%>
<%try{%>
<% int flag=ps.executeUpdate();
out.println("<script>alert('Successfully Registered');window.location='Admin.html';</script>");
%>
<%}catch(Exception e){%>
<% 
out.println("<script>alert('Registration Failed');window.location='newu.html';</script>");
%>
<%} %>
</body>
</html>