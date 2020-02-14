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
<%!int flag=0; %>
<%
if(null == session.getAttribute("name"))
{
	response.sendRedirect("Admin.html");
}
%>
<%
String bus_id=request.getParameter("tx");
String t_price=request.getParameter("tp");
Class.forName("com.mysql.jdbc.Driver");
String url=("jdbc:mysql://localhost:3306/bus_booking");
String un="root";
String pwd="root";
Connection con=DriverManager.getConnection(url,un,pwd);
PreparedStatement ps=con.prepareStatement("insert into ticket value (?,?)");
ps.setString(1,t_price);
ps.setString(2,bus_id);
%>
<%try{%>
<%  flag=ps.executeUpdate();%>
<%out.println("<script>alert('Inserted Sucessfully');window.location='ticketdis.jsp';</script>");

%> 
 
<% }
catch(Exception e)
{%>
	
	<%out.println("<script>alert('Not Inserted Sucessfully');window.location='ticket_input.jsp';</script>");

%> 
 
	
<%}%>

</body>
</html>