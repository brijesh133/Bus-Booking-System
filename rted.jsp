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
<%! String userdbroute; %>
<%
if(null == session.getAttribute("name"))
{
	response.sendRedirect("Admin.html");
}
%>
<%
String r_id=request.getParameter("rid");
Class.forName("com.mysql.jdbc.Driver");
String url=("jdbc:mysql://localhost:3306/bus_booking");
String un="root";
String pwd="root";
Connection con=DriverManager.getConnection(url,un,pwd);
CallableStatement st=con.prepareCall("{call display2(?)}");
st.setString(1,r_id);
st.execute();
ResultSet rs = st.executeQuery();
%>
<% if(rs.next())
{ %>
<%userdbroute = rs.getString("r_id");%>

<% if(r_id.equals(userdbroute))
{%>
<% 
PreparedStatement ss=con.prepareStatement("delete from route where r_id=?");
ss.setString(1,r_id);
ss.executeUpdate();
%>
<h3>Sucessfull deleted route </h3>
<a href="preparestmt.jsp">Click here to see route details</a><br><br>
<a href="welcomeadmin.jsp">Back</a>

<% } else
{%>
 
	<% rs.close();
	st.close();%>
<% }%>
<% } // end of if
else
{%>
<center>
<h3>Enter the correct details</h3>
<a href="rtnme.html.jsp">Back</a>
<a href="Admin.html"> Main menu </a>
</center>
<% 
}
%>
	

</body>
</html>