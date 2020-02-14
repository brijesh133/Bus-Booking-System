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
CallableStatement st=con.prepareCall("{call display()}");
ResultSet rs=st.executeQuery();


%>

<center>
<center>
<p><h3 style="color:brown;"> Route Details</h3></p>
<div class="wrapper">
  
  <div class="table">
    
    <div class="row header">
      <div class="cell">
        Route_id
      </div>
      <div class="cell">
        Route From
      </div>
<div class="cell">
        Route upto
      </div>
        <div class="cell">
        Update
      </div>
       <div class="cell">
        delete
      </div>
   </div>

<%while(rs.next()) {%>
<div class="row">
      <div class="cell" data-title="Route_id">
        <%=rs.getString("r_id") %>
      </div>
      <div class="cell" data-title="Route From">
        <%=rs.getString("src") %>
      </div>
      <div class="cell" data-title="Route upto">
       <%=rs.getString("distination") %>
      </div>
      <div class="cell" data-title="update">
       <a href="rtnme_updt.jsp?rid=<%=rs.getString(1)%>">Update</a>
      </div>
       <div class="cell" data-title="delete">
       <a href="rted.jsp?rid=<%=rs.getString(1)%>">Delete</a>
      </div>
    
    </div>

<%i=1; %>
<%}%>

<%if(i==0) 
{
	out.println("<script>alert('Route Details Not Available');window.location='welcomeadmin.jsp';</script>");
}%>
    
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
  margin: 0 auto;
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
<a href="welcomeadmin.jsp"> Main Menu</a>
</center>
</body>
</html>