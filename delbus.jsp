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
<%! String userdbroute;
%>
<%
String id=request.getParameter("bid");
Class.forName("com.mysql.jdbc.Driver");
String url=("jdbc:mysql://localhost:3306/bus_booking");
String un="root";
String pwd="root";
Connection con=DriverManager.getConnection(url,un,pwd);
%>
<% 
String sql = "select * from bus where b_id=?";
PreparedStatement is = con.prepareStatement(sql);

is.setString(1,id);

ResultSet rs = is.executeQuery();
%>
<% if(rs.next())
{ %>
<%userdbroute = rs.getString("b_id");%>

<% if(id.equals(userdbroute))
{%>
<% 
PreparedStatement ss=con.prepareStatement("delete from bus where b_id=?");
ss.setString(1,id);
ss.executeUpdate();

%>
<h3>Sucessfull Updated Bus details </h3>
<a href="busdis.jsp">Click here to see bus details</a><br><br>
<a href="welcomeadmin.jsp">Main menu</a>

<% } else
{%>
 
	<% rs.close();
	is.close();
	%>
<% }%>
<% } // end of if
else
{%>
<center>
<h3>Enter the correct details</h3>
<a href="updatebus.html.jsp">Back</a>
<a href="Admin.html"> Main menu </a>
</center>
<% 
}
%>
</body>
</html>