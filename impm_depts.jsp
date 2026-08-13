<%@page language="java" contentType="text/html" import="java.sql.*"%>
<html>
<head>
<title>IMPM </title>
</head>
<body>
<%!
Connection conn;
Statement stmtSave;
   String Deptcode,DeptName,Depthead,PhnNo;
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
 Deptcode =request.getParameter("txtDeptCode");
  DeptName=request.getParameter("txtDeptName");
  Depthead=request.getParameter("txtDepthead");
  PhnNo=request.getParameter("txtPhnNo");
   %>
 <%
   doconnect();
    try{
		stmtSave=conn.createStatement();
		stmtSave.executeUpdate("insert into impm_tbldept values('"+Deptcode+"','"+DeptName+"','"+Depthead+"','"+PhnNo+"')");
		out.println("One Record Saved Successfully");
    }		
	catch(SQLException ex){
		out.println("Unable to Save..."+ex);
	}
   
  %>
  </body>
</html>
  