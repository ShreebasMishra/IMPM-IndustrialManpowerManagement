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
   String RegistrationNo,EstdDate,NameOfIndustry,HeadOfIndustry,Locality,City,StateUnionterritory,PhoneNo,EmailId,GSTNumber,GSTDate;
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
<h2>INDUSTRY INFORMATION</h2>
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
<th>Registration No</th>
<th>Estd Date</th>
<th>Name Of Industry</th>
<th>Head Of Industry</th>
<th>Locality</th>
<th>City</th>
<th>State/Unionterritory</th>
<th>Phone No</th>
<th>Email Id</th>
<th>GST Number</th>
<th>GST Date</th>
</tr>
<%
doconnect();
try{
     stmtview=conn.createStatement();
	 rs=stmtview.executeQuery("select*from impm_tblindus");
	 slno=1;
	 while(rs.next()){
		   RegistrationNo=rs.getString("regdno");
		   EstdDate=rs.getString("estdt");
		   NameOfIndustry=rs.getString("nmindus");
		    HeadOfIndustry=rs.getString("hdindus");
			Locality=rs.getString("locality");
			City=rs.getString("city");
			StateUnionterritory=rs.getString("state");
			PhoneNo=rs.getString("phoneno");
			EmailId=rs.getString("emailid");
			GSTNumber=rs.getString("gstno");
			GSTDate=rs.getString("gstdt");
			if(slno%2==0)
				out.println("<tr bgcolor=#ccddcc>");
			else 
				out.println("</tr>");
				
%>
<td><%=slno%></td>
<td><%=RegistrationNo%></td>
<td><%=EstdDate%></td>
<td><%=NameOfIndustry%></td>
<td><%=HeadOfIndustry%></td>
<td><%=Locality%></td>
<td><%=City%></td>
<td><%=StateUnionterritory%></td>
<td><%=PhoneNo%></td>
<td><%=EmailId%></td>
<td><%=GSTNumber%></td>
<td><%=GSTDate%></td>
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