<%@page language="java" contentType="text/html" import="java.sql.*"%>
<html>
<head>
<title>Report</title>
</head>
<body background="bk3.jpg">
<%! 
   Connection 	conn;
   Statement stmtview;
   ResultSet rs;
   String DeptCode,DeptName,Depthead,phnNo;
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
<h2>DEPARTMENT INFORMATION</h2>
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
<th>Department Code</th>
<th>Department Name</th>
<th>Department Head</th>
<th>Phone No.</th>
</tr>
<%
doconnect();
try{
     stmtview=conn.createStatement();
	 rs=stmtview.executeQuery("select*from impm_tbldept");
	 slno=1;
	 while(rs.next()){
		   DeptCode=rs.getString("deptcode");
		   DeptName=rs.getString("deptname");
		   Depthead=rs.getString("depthead");
		    phnNo=rs.getString("phoneno");
%>
<tr>
<td><%=slno%></td>
<td><%=DeptCode%></td>
<td><%=DeptName%></td>
<td><%=Depthead%></td>
<td><%=phnNo%></td>
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