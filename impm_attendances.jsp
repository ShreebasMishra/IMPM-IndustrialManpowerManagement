<%@page language="java" contentType="text/html" import="java.sql.*"%>
<html>
<head>
<title>IMPM </title>
</head>
<body>
<%!
Connection conn;
Statement stmtSave;
String EmployeeId,ReferenceNo,Date,EmployeeName,Gender,Department,ShiftName,StartTime,InTime;
 public void doconnect(){
	   try{
		   Class.forName("com.mysql.jdbc.Driver");
	   }
	   catch(ClassNotFoundException  ex){
		   System.out.println("unable to load Driver");
	   }
	   try{
		   conn=DriverManager.getConnection("jdbc:mysql://localhost:3307/impmdb","root","root");
	   }
	   catch(SQLException ex){
          System.out.println("unable to connect");
	   }
   }   
	   
 %>
<%
 ReferenceNo=request.getParameter("txtReferenceNo");
  Date=request.getParameter("dtDate");
  EmployeeId=request.getParameter("cmbEmployeeId");
  EmployeeName=request.getParameter("txtEmployeeName");
  Gender=request.getParameter("txtGender");
  Department=request.getParameter("txtDepartment");
 ShiftName=request.getParameter("txtShiftName");
 StartTime=request.getParameter("tmeStartTime");
 InTime=request.getParameter("tmeInTime");
  %>
 <%
   doconnect();
    try{
		stmtSave=conn.createStatement();
		stmtSave.executeUpdate("insert into impm_tblattendance values('"+ReferenceNo+"','"+Date+"','"+EmployeeId+"','"+EmployeeName+"','"+Gender+"','"+Department+"','"+ShiftName+"','"+StartTime+"','"+InTime+"')");
		out.println("One Record Saved Successfully");
    }		
	catch(SQLException ex){
		out.println("Unable to Save..."+ex);
	}
   
  
 %>  
</body>
</html>