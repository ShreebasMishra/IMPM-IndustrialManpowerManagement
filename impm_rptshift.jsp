<%@page language="java" contentType="text/html" import="java.sql.*"%>
<html>
<head>
<title>Report</title>
</head>
<body>
<%! 
   Connection 	conn;
   Statement stmtview;
   ResultSet rs;
   String ShiftCode,ShiftName,StartTime,EndTime;
   int slno;
   public void doconnect(){
   try{
        Class.forName("com.mysql.jdbc.Driver");
		}
	catch(ClassNotFoundException ex){
        System.out.println("unable to Load Driver");
}
try{
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3307/impmdb","root","root");
}
catch(SQLException   ex){
 System.out.println("unable to connect");
}
}
%>
<center>
<h2>SHIFT INFORMATION</h2>
</center>
<blockquote>
<font color="red" size="5">
SM Group Of Industries<br>
Madhupatna<br>
Cuttack
</blockquote>
</font>
<center>
<table width = "95%" border="1">
<tr bgcolor="cyan">
<th>Serial No.</th>
<th>Shift Code </th>
<th>Shift Name</th>
<th>Start Time</th>
<th>End Time</th>
</tr>
<%
doconnect();
try{
     stmtview=conn.createStatement();
	 rs=stmtview.executeQuery("select*from impm_tblshift");
	 slno=1;
	 while(rs.next()){
		   ShiftCode=rs.getString("shiftcode");
		   ShiftName=rs.getString("shiftname");
		   StartTime=rs.getString("starttime");
		    EndTime=rs.getString("endtime");
%>
<tr>
<td><%=slno%></td>
<td><%=ShiftCode%></td>
<td><%=ShiftName%></td>
<td><%=StartTime%></td>
<td><%=EndTime%></td>
</tr>
<% 
slno=slno+1;
	 }
}
catch(SQLException  ex){
out.println("error");
}
%>
</table>
</center>
</body>
</html>	