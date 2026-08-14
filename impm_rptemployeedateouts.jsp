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
   String EmployeeId,ReferenceNo,Date,EmployeeName,Gender,Department,ShiftName,EndTime,OutTime;
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
<h2>EMPLOYEE INFORMATION[Date-(out)]</h2>
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
<th>Employee Id</th>
<th>Reference No</th>
<th>Date</th>
<th>Employee Name</th>
<th>Gender</th>
<th>Department</th>
<th>Shift Name</th>
<th>End Time</th>
<th>Out Time</th>
</tr>
<%
doconnect();
try{
     stmtview=conn.createStatement();
	 Date=request.getParameter("dtDate");
	 rs=stmtview.executeQuery("select*from impm_tblattendanceout where date='"+Date+"'");
	 slno=1;
	 while(rs.next()){
		   EmployeeId=rs.getString("employeeid");
		   ReferenceNo=rs.getString("referenceno");
		   Date=rs.getString("date");
		    EmployeeName=rs.getString("employeename");
			Gender=rs.getString("gender");
			Department=rs.getString("department");
			ShiftName=rs.getString("shiftname");
			EndTime=rs.getString("endtime");
			OutTime=rs.getString("outtime");
			
			if(slno%2==0)
				out.println("<tr bgcolor=#ccddcc>");
			else 
				out.println("</tr>");
				
%>
<td><%=slno%></td>
<td><%=EmployeeId%></td>
<td><%=ReferenceNo%></td>
<td><%=Date%></td>
<td><%=EmployeeName%></td>
<td><%=Gender%></td>
<td><%=Department%></td>
<td><%=ShiftName%></td>
<td><%=EndTime%></td>
<td><%=OutTime%></td>

</tr>
<% 
slno=slno+1;
	 }
}
catch(SQLException  ex){
out.println("error"+ex);
}
%>
</table>
</center>
</body>
</html>	