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
<%!int flag; %>
<%
int val=0;
String bus_id=request.getParameter("bi");
String bus_name=request.getParameter("bn");
String sorce_arrival=request.getParameter("sa");
String dist_arr=request.getParameter("da");
String depart_date=request.getParameter("dd");
String no_of_seat=request.getParameter("ns");
String src=request.getParameter("rt");
String drc=request.getParameter("rtt");
String route="";
Class.forName("com.mysql.jdbc.Driver");
String url=("jdbc:mysql://localhost:3306/bus_booking");
String un="root";
String pwd="root";
Connection con=DriverManager.getConnection(url,un,pwd);
PreparedStatement os=con.prepareStatement("select r_id from route where src=? and distination=?");
os.setString(1,src);
os.setString(2,drc);
	ResultSet rs=os.executeQuery();

if(rs.next())
{ val=1;
	route=rs.getString(1);
}

if(val==0)
{
	out.println("<script>alert('Route Does Not Exists');window.location='buses_input.jsp';</script>");
}
%>
<% 
PreparedStatement ps=con.prepareStatement("insert into bus values(?,?,?,?,?,?,?,CURRENT_DATE(),CURRENT_TIME())");
ps.setString(1,bus_id);
ps.setString(2,bus_name);
ps.setString(3,sorce_arrival);
ps.setString(4,dist_arr);
ps.setString(5,depart_date);
ps.setString(6,no_of_seat);
ps.setString(7,route);
%>
<%try{%>
<%  flag=ps.executeUpdate();%>
<%out.println("<script>alert('Inserted Sucessfully');window.location='busdis.jsp';</script>");

%> 
<% }
catch(Exception e)
{%>
	
	<%out.println("<script>alert(' Not Inserted Sucessfully');window.location='buses_input.jsp';</script>");

%> 
	
<%}%>



</body>
</html>