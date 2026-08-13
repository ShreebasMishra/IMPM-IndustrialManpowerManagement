<%@page language="java" contentType="text/html" import="java.sql.*"%>
<html>
<head>
<title>IMPM </title>
</head>
<body>
<%!
Connection conn;
Statement stmtup,stmtdel;
   String ShiftCode,ShiftName,StartTime,EndTime,btnup,btndel;
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
  ShiftCode =request.getParameter("cmbShiftCode");
  ShiftName=request.getParameter("txtShiftName");
  StartTime=request.getParameter("tmeStartTime");
  EndTime=request.getParameter("tmeEndTime");
   btnup=request.getParameter("btnupdate");
  btndel=request.getParameter("btndelete");
   %>
 <%
   doconnect();
    try{
		if(btnup!=null){
		stmtup=conn.createStatement();
		stmtup.executeUpdate("update impm_tblshift set shiftname='"+ShiftName+"',starttime='"+StartTime+"',endtime='"+EndTime+"' where shiftcode='"+ShiftCode+"'");
		out.println("One Record Updated Successfully");
    }	
	else if(btndel!=null){
		stmtdel=conn.createStatement();
	stmtdel.executeUpdate("delete from impm_tblshift where ShiftCode='"+ShiftCode+"'");
	out.println("Record deleted");
		}
}
	
	catch(SQLException ex){
		out.println("Request failed");
	}
   
  %>
  </body>
</html>
  