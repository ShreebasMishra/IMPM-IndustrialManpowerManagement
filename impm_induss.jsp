<%@page language="java" contentType="text/html" import="java.sql.*"%>
<html>
<head>
<title>IMPM </title>
</head>
<body>
<%!
Connection conn;
Statement stmtSave;
   String Regdno,Estdt,Nmindus,Hdindus,Locality,City,State,Phnno,Emailid,GSTno,GSTdt;
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
  Regdno=request.getParameter("txtRegdno");
  Estdt=request.getParameter("txtEstdt");
  Nmindus=request.getParameter("txtNmindus");
  Hdindus=request.getParameter("txtHdindus");
  Locality=request.getParameter("txtLocality");
  City=request.getParameter("txtCity");
  State=request.getParameter("cmbState");
  Phnno=request.getParameter("txtPhnno");
  Emailid=request.getParameter("txtEmailid");
  GSTno=request.getParameter("txtGSTno");
  GSTdt=request.getParameter("txtGSTdt");
  
 %>
 <%
   doconnect();
    try{
		stmtSave=conn.createStatement();
		stmtSave.executeUpdate("insert into impm_tblIndus values('"+Regdno+"','"+Estdt+"','"+Nmindus+"','"+Hdindus+"','"+Locality+"','"+City+"','"+State+"','"+Phnno+"','"+Emailid+"','"+GSTno+"','"+GSTdt+"')");
		out.println("One Record Saved Successfully");
    }		
	catch(SQLException ex){
		out.println("Unable to Save..."+ex);
	}
   
  
 %>  
</body>
</html> 
 