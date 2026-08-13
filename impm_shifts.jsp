<%@page language="java" contentType="text/html" import="java.sql.*"%>
<html>
<head>
<title>IMPM </title>
</head>
<body>
<%!
Connection conn;
Statement stmtSave;
   String ShiftCode,ShiftName,StartTime,EndTime;
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
 ShiftCode =request.getParameter("txtShiftCode");
  ShiftName=request.getParameter("txtShiftName");
  StartTime=request.getParameter("tmeStartTime");
  EndTime=request.getParameter("tmeEndTime");
   %>
 <%
   doconnect();
    try{
		stmtSave=conn.createStatement();
		stmtSave.executeUpdate("insert into impm_tblshift values('"+ShiftCode+"','"+ShiftName+"','"+StartTime+"','"+EndTime+"')");
		out.println("One Record Saved Successfully");
    }		
	catch(SQLException ex){
		out.println("Unable to Save..."+ex);
	}
   
  %>
  </body>
</html>
  