<%@page language="java" contentType="text/html" import="java.sql.*"%>
<html>
<head>
<title>IMPM </title>
</head>
<body>
<%!
Connection conn;
Statement stmtSave;
String ReferenceNo,Date,EmployeeId,EmployeeName,Gender,Department,ShiftName,EndTime,OutTime;
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
 EndTime=request.getParameter("tmeEndTime");
 OutTime=request.getParameter("tmeOutTime");
  %>
 <%
   doconnect();
    try{
		stmtSave=conn.createStatement();
		stmtSave.executeUpdate("insert into impm_tblattendanceout values('"+ReferenceNo+"','"+Date+"','"+EmployeeId+"','"+EmployeeName+"','"+Gender+"','"+Department+"','"+ShiftName+"','"+EndTime+"','"+OutTime+"')");
		out.println("One Record Saved Successfully");
    }		
	catch(SQLException ex){
		out.println("Unable to Save..."+ex);
	}
   
  
 %>  
</body>
</html>