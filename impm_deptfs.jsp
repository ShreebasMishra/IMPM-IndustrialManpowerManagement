<%@page language="java" contentType="text/html" import="java.sql.*"%>
<html>
<head>
<title>IMPM </title>
</head>
<body>
<%!
Connection conn;
Statement stmtup,stmtdel;
   String Deptcode,DeptName,Depthead,PhnNo,btnup,btndel;
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
  Deptcode =request.getParameter("cmbDeptCode");
  DeptName=request.getParameter("txtDeptName");
  Depthead=request.getParameter("txtDepthead");
  PhnNo=request.getParameter("txtPhnNo");
  btnup=request.getParameter("btnupdate");
  btndel=request.getParameter("btndelete");
   %>
 <%
   doconnect();
    try{
		if(btnup!=null){
		stmtup=conn.createStatement();
		stmtup.executeUpdate("update impm_tbldept set deptname='"+DeptName+"',depthead='"+Depthead+"',phoneno='"+PhnNo+"' where deptcode='"+Deptcode+"'");
		out.println("One Record Updated Successfully");
    }	
	else if(btndel!=null){
		stmtdel=conn.createStatement();
	stmtdel.executeUpdate("delete from impm_tbldept where DeptCode='"+Deptcode+"'");
	out.println("Record deleted");
		}
}
	
	catch(SQLException ex){
		out.println("Request failed");
	}
   
  %>
  </body>
</html>
  