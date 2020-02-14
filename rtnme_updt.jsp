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

<style>
body {
	margin: 0;
	padding: 0;
	background-image: url("ju.jpg");
	font-family: sans-serif;
	
  background-size: cover;
	
}

.ab
{
top:250%;
left:50%;
width:60%;
position:absolute;
background:rgba(0,0,0,0.4);
   color:#fff;
transform: translate(-50%,-50%)	;
box-sizing: border-box;
padding:60px 80px;

	
}

input[type=text],select{
align:center;
width:20%;
padding:12px 20px;
margin:8px 0;
display:inline-block;
border:1px solid #ccc;
border-radius:4px;
box-sizing:border-box;

}

input[type=text]:focus {
    background-color: grey;
    color: white;
}

input[type=file],select{
align:center;
width:20%;
padding:12px 20px;
margin:8px 0;
display:inline-block;
border:1px solid #ccc;
border-radius:4px;
box-sizing:border-box;
background-color:white;
}

input[type=date],select{
align:center;
width:20%;
padding:12px 20px;
margin:8px 0;
display:inline-block;
border:1px solid #ccc;
border-radius:4px;
box-sizing:border-box;
background-color:white;
}


input[type=submit] {
align:center;
width:20%;
background-color:black;
color:white;
padding:14px 20px;
margin:8px 0;
 border: 2px solid grey;
cursor:pointer;
}

input[type=submit]:hover{

background-color:grey;
transition-duration: 0.4s;
}

div{
border-radius:5px;
background-color:#f2f2f2;
padding:20px;

}

h1 {
    text-align: center;
    text-transform: uppercase;
   
    font-size:30px;
      text-shadow:
       3px 3px 0 #000,
     -1px -1px 0 #000,  
      1px -1px 0 #000,
      -1px 1px 0 #000,
       1px 1px 0 #000;
}

h3 {

color:blue;
}

a {
    background-color: blue; /* Green */
    border: none;
    color: white;
    padding: 6px 22px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}

a {
    background-color: red; 
    color: white; 
    border: 2px solid red;
}


a:hover {
    background-color: grey;
    color: white;
}

</style>

</head>
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
	PreparedStatement ps=con.prepareStatement("select * from route where r_id=?");
	ps.setString(1,r_id);
	ResultSet rs=ps.executeQuery();

  if(rs.next()) 
   {
	%>    



<h1 style="color:red"><U> DETAILS UPDATE</U></h1><BR>
<form method="post" action="rtnme_updt.jsp">

<center>
<h3> Root ID   :<br><input type="text" name="r_id"  value=<%=rs.getString(1) %> readonly> </h3> <br>

<h3> Source   :<br><input type="text" name="sr"  value=<%=rs.getString(2) %>> </h3> <br>

<h3>Distination  :        <br><input type="text" name="dt"  value=<%=rs.getString(3) %>> </h3> <br>


<tr><td><p><input type="submit" name="submit" value="UPDATE"/>  </p></td>
<td><input type="reset"name="reset"></td></tr>
</center>

</center>

 </form>
   <%  
   }

	%>


<%
String r_id1=request.getParameter("r_id");
String src=request.getParameter("sr");
String dest=request.getParameter("dt");

int i=0;
if(src!=null &&dest!=null &&r_id1!=null){
	if(src!=""&&dest!=""&&r_id1!=""){


try
 {
   Class.forName("com.mysql.jdbc.Driver");
   
   

   
   
   PreparedStatement et=con.prepareStatement("update route set src=?,distination=? where r_id=? ");
   et.setString(1,src);
   et.setString(2,dest);
   et.setString(3,r_id1);
   i=et.executeUpdate();
	
	if(i!=0)
	{
		
    	 out.println("<script>alert('Updated Sucessfully');window.location='preparestmt.jsp';</script>");

		
	
	
	}
	
 }
	
	
	
	catch(Exception e1)
	{
		 out.println(e1);
		 
			out.println("<script>alert(' Not Updated Sucessfully');window.location='preparestmt.jsp';</script>");
	}
		}
}

%>

</div>
</form>





</body>
</html>