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
<%int i=0; %>
<input type="hidden" id="refreshed" value="no">
<script type="text/javascript">
onload=function(){
	var e=document.getElementById("refreshed");
	if(e.value=="no")e.value="yes";
	else{e.value="no";location.reload();}
	}
</script>
<%
if(null == session.getAttribute("name"))
{
	response.sendRedirect("Admin.html");
}
%>
<%
Class.forName("com.mysql.jdbc.Driver");
String url=("jdbc:mysql://localhost:3306/bus_booking");
String un="root";
String pwd="root";
Connection con=DriverManager.getConnection(url,un,pwd);
PreparedStatement ps=con.prepareStatement("select b.b_id,b.r_id,b.b_name,b.no_of_seat,r.src,b.scdl_srcarr,r.distination,b.scdl_destarr,b.dep_date,date_,time_ from bus b,route r where b.r_id=r.r_id");
ResultSet rs=ps.executeQuery();
%>
<center>
<p><h3 style="color:brown;"> Bus Details</h3></p>
<div class="wrapper">
  
  <div class="table">
    
    <div class="row header">
    <div class="cell">
        Date
      </div>
    <div class="cell">
        Time
      </div>
      <div class="cell">
        Bus_ID
      </div>
      <div class="cell">
        Root ID
      </div>
      <div class="cell">
        Bus Name
      </div>
      <div class="cell">
        Seating Capacity 
      </div>
<div class="cell">
      Source 
      </div>
<div class="cell">
      Scheduled Arrival
      </div>
<div class="cell">
       Distination
      </div>
<div class="cell">
       Destination Arrival  
      </div>
<div class="cell">
        Departure Date
      </div>
      <div class="cell">
        Update
      </div>
      <div class="cell">
        Delete
      </div>
            
    </div>



<%while(rs.next()) {%>
<div class="row">
     <div class="cell" data-title="Date">
        <%=rs.getString(10) %>
      </div>
      <div class="cell" data-title="Time">
        <%=rs.getString(11) %>
      </div>
      <div class="cell" data-title="Bus_ID">
        <%=rs.getString(1) %>
      </div>
      <div class="cell" data-title="Root ID">
        <%=rs.getString(2) %>
      </div>
      <div class="cell" data-title="Bus name">
        <%=rs.getString(3) %>
      </div>
      <div class="cell" data-title="Seating Capacity">
       <%=rs.getString(4) %>
      </div>
 <div class="cell" data-title="Source">
       <%=rs.getString(5) %>
      </div>
 <div class="cell" data-title="Scheduled Arrival">
       <%=rs.getString(6) %>
      </div>
 <div class="cell" data-title="Destination">
       <%=rs.getString(7) %>
      </div>
 <div class="cell" data-title="Scheduled destination arrival">
       <%=rs.getString(8) %>
      </div>
 <div class="cell" data-title="Departure date">
       <%=rs.getString(9) %>
      </div>
      <div class="cell" data-title="Update">
       <a href="updatebus.jsp?bid=<%=rs.getString(1)%>"><b>Update</b></a>
      </div>
      <div class="cell" data-title="Delete">
       <a href="delbus.jsp?bid=<%=rs.getString(1)%>"><b>Delete</b></a>
      </div>
      </div>

<%i=1; %>
</p>
<%}%>
<br>
<%if(i==0) 
{
	out.println("<script>alert('Bus Details Not Available');window.location='welcomeadmin.jsp';</script>");
}%>
<!-- css code -->
</div>
</div>
  <style type="text/css">
  
  body {
  font-family: "Helvetica Neue", Helvetica, Arial;
  font-size: 14px;
  line-height: 20px;
  font-weight: 400;
  color: #3b3b3b;
  -webkit-font-smoothing: antialiased;
  font-smoothing: antialiased;
  background: ;
}
@media screen and (max-width: 580px) {
  body {
    font-size: 16px;
    line-height: 22px;
  }
}

.wrapper {
  margin-left: -300px;
  padding: 40px;
  max-width: 800px;
}

.table {
  margin: 0 0 40px 0;
  width: 100%;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
  display: table;
}
@media screen and (max-width: 580px) {
  .table {
    display: block;
  }
}

.row {
  display: table-row;
  background: #f6f6f6;
}
.row:nth-of-type(odd) {
  background: #e9e9e9;
}
.row.header {
  font-weight: 900;
  color: #ffffff;
  background: #ea6153;
}
.row.green {
  background: #27ae60;
}
.row.blue {
  background: #2980b9;
}
@media screen and (max-width: 580px) {
  .row {
    padding: 14px 0 7px;
    display: block;
  }
  .row.header {
    padding: 0;
    height: 6px;
  }
  .row.header .cell {
    display: none;
  }
  .row .cell {
    margin-bottom: 10px;
  }
  .row .cell:before {
    margin-bottom: 3px;
    content: attr(data-title);
    min-width: 98px;
    font-size: 10px;
    line-height: 10px;
    font-weight: bold;
    text-transform: uppercase;
    color: #969696;
    display: block;
  }
}

.cell {
  padding: 6px 12px;
  display: table-cell;
}
@media screen and (max-width: 580px) {
  .cell {
    padding: 2px 16px;
    display: block;
  }
}

</style>
<a href="welcomeadmin.jsp">Main Menu</a>
</center>
</body>
</html>