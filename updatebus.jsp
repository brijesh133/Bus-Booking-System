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
String bid=request.getParameter("bid");

	Class.forName("com.mysql.jdbc.Driver");

	String url=("jdbc:mysql://localhost:3306/bus_booking");
	String un="root";
	String pwd="root";
	Connection con=DriverManager.getConnection(url,un,pwd);
	PreparedStatement ps=con.prepareStatement("select b_id,b_name,dep_date,scdl_srcarr,scdl_destarr,r_id,no_of_seat from bus where b_id=? ");
	ps.setString(1,bid);
	ResultSet rs=ps.executeQuery();

  if(rs.next()) 
   {
	%>    



<h1 style="color:red"><U> Bus DETAILS UPDATE</U></h1><BR>
<form method="post" action="updatebus.jsp">

<center>

<input type="hidden" name="b_id"  value=<%=rs.getString(1) %> readonly> </h3>

<h3> Bus Name   :<br><input type="text" name="bn"  value=<%=rs.getString(2) %>> </h3> <br>

<h3>Departure Date  :        <br><input type="text" name="dd"  value=<%=rs.getString(3) %>> </h3> <br>

<h3>  Source Arrival     :<br><input type="text" name="sa"  value=<%=rs.getString(4) %>> </h3><br>

<h3> Destination Arrival  : <br><input type="text" name="da" value=<%=rs.getString(5) %>></h3><br>

<h3> root id  :  <br><input type="text" name="rid"value=<%=rs.getString(6) %>></h3><b>route details</b>
<a href="preparestmt.jsp">click here</a><br>

<h3> Seating Capacity  : <br><input type="text" name="sc"value=<%=rs.getString(7) %>></h3><br>
<tr><td><p><input type="submit" name="submit" value="UPDATE"/>  </p></td>
<td><input type="reset"name="reset"></td></tr>
</center>

</center>

 </form>
   <%  
   }

	%>


<%
String bid1=request.getParameter("b_id");
String bnam=request.getParameter("bn");
String date=request.getParameter("dd");
String sa=request.getParameter("sa");
String da=request.getParameter("da");
String root=request.getParameter("rid");
String capacity=request.getParameter("sc");

int i=0;
if(bnam!=null &&date!=null &&sa!=null &&da!=null&&root!=null &&bid1!=null &&capacity!=null ){
	if(bnam!=""&&date!=""&&sa!=""&&da!=""&&root!=""&&bid1!="" &&capacity!="" ){


try
 {
   Class.forName("com.mysql.jdbc.Driver");
   
   

   
   
   PreparedStatement et=con.prepareStatement("update bus set b_name=?,dep_date=?,scdl_srcarr=?,scdl_destarr=?,r_id=?,no_of_seat=?  where b_id=? ");
   et.setString(1,bnam);
   et.setString(2,date);
   et.setString(3,sa);
   et.setString(4,da);
   et.setString(5,root);
   et.setString(6,capacity);
   et.setString(7,bid1);
   
   
   i=et.executeUpdate();
	
	if(i!=0)
	{
		
    	 out.println("<script>alert('Updated Sucessfully');window.location='busdis.jsp';</script>");

		
	
	
	}
	
 }
	
	
	
	catch(Exception e1)
	{
		
		 
			out.println("<script>alert(' Not Updated Sucessfully');window.location='busdis.jsp';</script>");
	}
		}
}

%>

</div>
</form>


</body>

</body>
</html>