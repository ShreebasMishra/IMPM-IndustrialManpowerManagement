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
   String EmployeeId,EmployeeName,Gender,DOBirth,Photo,FatherName,MotherName,Locality,City,StateUnionterritory,Pin,PhoneNo,Email,DOJoin,Department,ShiftCode,ShiftName,StartTime,EndTime,BasicSalary,DearnessAllowances,HouseRent,ProvidentFund,Tax;
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
<h2>EMPLOYEE INFORMATION[Shift]</h2>
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
<th>Employee Name</th>
<th>Gender</th>
<th>DOBirth</th>
<th>Photo</th>
<th>Father Name</th>
<th>Mother Name</th>
<th>Locality</th>
<th>City</th>
<th>StateUnionterritory</th>
<th>Pin</th>
<th>Phone No</th>
<th>Email</th>
<th>DOJoin</th>
<th>Department</th>
<th>Shift Code</th>
<th>Shift Name</th>
<th>Start Time</th>
<th>End Time</th>
<th>Basic Salary</th>
<th>Dearness Allowances</th>
<th>House Rent</th>
<th>Provident Fund</th>
<th>Tax</th>
</tr>
<%
doconnect();
try{
     stmtview=conn.createStatement();
	 ShiftName=request.getParameter("txtShiftName");
	 rs=stmtview.executeQuery("select*from impm_tblemployee where shiftname='"+ShiftName+"'");
	 slno=1;
	 while(rs.next()){
		   EmployeeId=rs.getString("employeeid");
		   EmployeeName=rs.getString("employeename");
		   Gender=rs.getString("gender");
		    DOBirth=rs.getString("dobirth");
			Photo=rs.getString("photo");
			FatherName=rs.getString("fathername");
			MotherName=rs.getString("mothername");
			
			Locality=rs.getString("locality");
			City=rs.getString("city");
			StateUnionterritory=rs.getString("state");
			Pin=rs.getString("pin");
			PhoneNo=rs.getString("phoneno");
			Email=rs.getString("email");
			DOJoin=rs.getString("dojoin");
			Department=rs.getString("department");
			ShiftCode=rs.getString("shiftcode");
			ShiftName=rs.getString("shiftname");
			StartTime=rs.getString("starttime");
			EndTime=rs.getString("endtime");
			BasicSalary=rs.getString("basicsalary");
			DearnessAllowances=rs.getString("dearnessallowances");
			HouseRent=rs.getString("houserent");
			ProvidentFund=rs.getString("providentfund");
			Tax=rs.getString("tax");
			if(slno%2==0)
				out.println("<tr bgcolor=#ccddcc>");
			else 
				out.println("</tr>");
				
%>
<td><%=slno%></td>
<td><%=EmployeeId%></td>
<td><%=EmployeeName%></td>
<td><%=Gender%></td>
<td><%=DOBirth%></td>
<td><%=Photo%></td>
<td><%=FatherName%></td>
<td><%=MotherName%></td>
<td><%=Locality%></td>
<td><%=City%></td>
<td><%=StateUnionterritory%></td>
<td><%=Pin%></td>
<td><%=PhoneNo%></td>
<td><%=Email%></td>
<td><%=DOJoin%></td>
<td><%=Department%></td>
<td><%=ShiftCode%></td>
<td><%=ShiftName%></td>
<td><%=StartTime%></td>
<td><%=EndTime%></td>
<td><%=BasicSalary%></td>
<td><%=DearnessAllowances%></td>
<td><%=HouseRent%></td>
<td><%=ProvidentFund%></td>
<td><%=Tax%></td>
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