<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
        <%@page import="java.io.*" %>
         <%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<input type="hidden" id="refreshed" value="no">
<script type="text/javascript">



	onload=function(){
	var e=document.getElementById("refreshed");
	if(e.value=="no")e.value="yes";
	else{e.value="no";location.reload();}
	}
</script>
<%int b=0; %>
<%
if(null == session.getAttribute("username"))
{
	response.sendRedirect("Userlog.html");
}

%>
<center>
<p align="right"><a href="welcome_user.jsp"><input type="submit" class="contact-form-btn" value="User Panel"></a>
</p>
<p><h3 style="color:brown;"> Booking Details</h3></p>
<div class="wrapper">
  
  <div class="table">
    
    <div class="row header">
      <div class="cell">
        Ticket ID
      </div>
      <div class="cell">
        Bus ID
      </div>
      <div class="cell">
        Bus Name
      </div>
<div class="cell">
      Passenger Name 
      </div>
<div class="cell">
      Gender
      </div>
<div class="cell">
       Source
      </div>
<div class="cell">
        Source Arrival 
      </div>
<div class="cell">
        Distination
      </div>
<div class="cell">
      Distination Arrival
      </div>
          
<div class="cell">
       Departure Date
      </div>  
      <div class="cell">
       Seat No
      </div>  
      <div class="cell">
       Fare
      </div>  
    </div>
<%!int flag=0;
String user_id;%>
<body>
<%int seat=0;
int seat_1=0;
int value=0;
int tk=0;
int a[]=new int[1000];
String dt;
%>
<%String ticket=""; %>
<%String bus=""; %>
<%!int noofseat; %>
<%
user_id=(String)session.getAttribute("username");
String p_name=request.getParameter("pn");
String cont=request.getParameter("co");
String gender=request.getParameter("gd");
String address=request.getParameter("ad");
String bus_id=request.getParameter("bui");
int age=Integer.parseInt(request.getParameter("ag"));

Class.forName("com.mysql.jdbc.Driver");
String url=("jdbc:mysql://localhost:3306/bus_booking");
String un="root";
String pwd="root";
Connection con=DriverManager.getConnection(url,un,pwd);
PreparedStatement stcp=con.prepareStatement("select no_of_seat from bus where b_id=?");
stcp.setString(1,bus_id);
ResultSet rsa=stcp.executeQuery();
while(rsa.next())
noofseat=rsa.getInt("no_of_seat");
 PreparedStatement pids=con.prepareStatement("select seat_no from passenger where b_id=?");
 pids.setString(1,bus_id);
 seat=0;
ResultSet rss=pids.executeQuery();

	if(!rss.next()){
		seat=1;
		
	}
	else if(seat==1){
		seat=2;
	}
	else{
		seat=2;
		while(rss.next()){
			
			seat++;
			
		}
		}
	%>

	<%
	PreparedStatement po=con.prepareStatement("select seat_no from seat where b_id=?");
	po.setString(1,bus_id);
	ResultSet pa=po.executeQuery();
	int i=0;
	while(pa.next())
	{
		i=1;
		
	}
	/*out.print(i);
	if(i==0)
	{
		out.print("no value");
	}
	else
	{
		out.print("value");
	}*/
	%>
<%if((seat<=noofseat)&&(i==0))
{%>

	<% 	
	
Random r=new Random();
HashSet<Integer> set=new HashSet<>();
while(set.size()<1)
{
	int random=r.nextInt(2000)+10;
	set.add(random);
}
PreparedStatement ps=con.prepareStatement("insert into passenger(uname,p_name,age,contact,gender,address,b_id,seat_no,t_id,date_,time_) values(?,?,?,?,?,?,?,?,?,CURRENT_DATE(),CURRENT_TIME());");
ps.setString(1,user_id);
ps.setString(2,p_name);
ps.setInt(3,age);
ps.setString(4,cont);
ps.setString(5,gender);
ps.setString(6,address);
ps.setString(7,bus_id);
ps.setInt(8,seat);
for( int randomNumbaers:set)
{
	ps.setInt(9,randomNumbaers);
	tk=randomNumbaers;
}

%>
<%try{%>
<%  flag=ps.executeUpdate();%>
<%PreparedStatement ptk=con.prepareStatement("select t_id,p.b_id,b.b_name,p_name,gender,src,scdl_srcarr,distination,scdl_destarr,dep_date,seat_no,t.tik_price,p.date_,p.time_ from passenger p,ticket t,bus b,route r where p.b_id=t.b_id and p.b_id=b.b_id and r.r_id=b.r_id and uname=? and t_id=?");
ptk.setString(1,user_id);
ptk.setInt(2,tk);
ResultSet rs=ptk.executeQuery();
%>
<%while(rs.next()) {%>

 <div class="row">
      <div class="cell" data-title="Bus_ID">
        <%=rs.getString(1) %>
      </div>
      <div class="cell" data-title="Bus name">
        <%=rs.getString(2) %>
      </div>
      <div class="cell" data-title="Seating Capacity">
       <%=rs.getString(3) %>
      </div>
 <div class="cell" data-title="Source">
       <%=rs.getString(4) %>
      </div>
 <div class="cell" data-title="Scheduled Arrival">
       <%=rs.getString(5) %>
      </div>
 <div class="cell" data-title="Destination">
       <%=rs.getString(6) %>
      </div>
 <div class="cell" data-title="Scheduled destination">
       <%=rs.getString(7) %>
      </div>
 <div class="cell" data-title="Departure date">
       <%=rs.getString(8) %>
      </div>
 <div class="cell" data-title="Fare">
       <%=rs.getString(9) %>
      </div>
      <div class="cell" data-title="Fare">
       <%=rs.getString(10) %>
      </div>
      <div class="cell" data-title="Fare">
       <%=rs.getString(11) %>
      </div>
      <div class="cell" data-title="Fare">
       <%=rs.getString(12) %>
      </div>
      
    
    </div>
<%b=1; %>


<%ticket=rs.getString(1); %>
<%bus=rs.getString(2); %>
<%}%>

 


 
<% }
catch(Exception e)
{%>
	
	<p>Something went wrong try again/enter the different passenger id</p>
<p><a href="passenger.html">back</a></p>
<%}%>

 <%} else if(i==1){%>
<% 
PreparedStatement pj=con.prepareStatement("select seat_no,t_id from seat where b_id=?");
pj.setString(1,bus_id);
ResultSet jk=pj.executeQuery();

int t=0;
while((jk.next())&&(t==0))
{
	a[0]=jk.getInt(1);
	seat_1=a[0];
	dt=jk.getString(2);
	t++;
	
	PreparedStatement ps=con.prepareStatement("delete from seat where t_id=?");
	ps.setString(1,dt);
	 ps.executeUpdate();
 }
Random r=new Random();
HashSet<Integer> set=new HashSet<>();
while(set.size()<1)
{
	int random=r.nextInt(2000)+10;
	set.add(random);
}
PreparedStatement ps=con.prepareStatement("insert into passenger(uname,p_name,age,contact,gender,address,b_id,seat_no,t_id,date_,time_) values(?,?,?,?,?,?,?,?,?,CURRENT_DATE(),CURRENT_TIME());");
ps.setString(1,user_id);
ps.setString(2,p_name);
ps.setInt(3,age);
ps.setString(4,cont);
ps.setString(5,gender);
ps.setString(6,address);
ps.setString(7,bus_id);
ps.setInt(8,seat_1);
for( int randomNumbaers:set)
{
	ps.setInt(9,randomNumbaers);
	tk=randomNumbaers;
}
 %>
 <%try{%>
<%  flag=ps.executeUpdate();%>
<%PreparedStatement ptk=con.prepareStatement("select t_id,p.b_id,b.b_name,p_name,gender,src,scdl_srcarr,distination,scdl_destarr,dep_date,seat_no,t.tik_price from passenger p,ticket t,bus b,route r where p.b_id=t.b_id and p.b_id=b.b_id and r.r_id=b.r_id and uname=? and t_id=?");
ptk.setString(1,user_id);
ptk.setInt(2,tk);
ResultSet rs=ptk.executeQuery();
%>



<%while(rs.next()) {%>
 <div class="row">
      <div class="cell" data-title="Bus_ID">
        <%=rs.getString(1) %>
      </div>
      <div class="cell" data-title="Bus name">
        <%=rs.getString(2) %>
      </div>
      <div class="cell" data-title="Seating Capacity">
       <%=rs.getString(3) %>
      </div>
 <div class="cell" data-title="Source">
       <%=rs.getString(4) %>
      </div>
 <div class="cell" data-title="Scheduled Arrival">
       <%=rs.getString(5) %>
      </div>
 <div class="cell" data-title="Destination">
       <%=rs.getString(6) %>
      </div>
 <div class="cell" data-title="Scheduled destination">
       <%=rs.getString(7) %>
      </div>
 <div class="cell" data-title="Departure date">
       <%=rs.getString(8) %>
      </div>
 <div class="cell" data-title="Fare">
       <%=rs.getString(9) %>
      </div>
      <div class="cell" data-title="Fare">
       <%=rs.getString(10) %>
      </div>
      <div class="cell" data-title="Fare">
       <%=rs.getString(11) %>
      </div>
      <div class="cell" data-title="Fare">
       <%=rs.getString(12) %>
      </div>
      
    
    </div>
<%b=1; %>


<%ticket=rs.getString(1); %>
<%bus=rs.getString(2); %>
<%}%>




 
<% }
catch(Exception e)
{%>
	
	<p>Something went wrong try again/enter the different passenger id</p>
<p><a href="passenger.html">back</a></p>
<%}%>
<% }else
{%>
<b>seat full</b>
<%}%>

<%if(b==0) 
{
	out.println("<script>alert('!!!!Seat full !!!!!');window.location='welcome_user.jsp';</script>");
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
<p><b>Share Your Experience</b></p><p><a href="review.jsp?tid=<% out.print(ticket); %>&bid=<%out.print(bus); %>">Click here</a></p>

</center>


</body>
</html>