<%@page language="java"  import="java.sql.*"%>
<%!
Connection conn;
Statement stmtup,stmtdel;
 String Regdno,Estdt,Nmindus,Hdindus,Locality,City,State,Phnno,Emailid,GSTno,GSTdt,btnup,btndel;
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
  Regdno=request.getParameter("cmbRegdno");
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
  btnup=request.getParameter("btnupdate");
  btndel=request.getParameter("btndelete");
 doconnect();
 try{
    if(btnup!=null){
	stmtup=conn.createStatement();
	stmtup.executeUpdate("update impm_tblIndus set estdt='"+Estdt+"',nmindus='"+Nmindus+"',hdindus='"+Hdindus+"',locality='"+Locality+"',city='"+City+"',state='"+State+"',phoneno='"+Phnno+"',emailid='"+Emailid+"',gstno='"+GSTno+"',gstdt='"+GSTdt+"' where regdno='"+Regdno+"'");
	out.println("Record updated");
	}
	else if(btndel!=null){
	stmtdel=conn.createStatement();
	stmtdel.executeUpdate("delete from impm_tblIndus where regdno='"+Regdno+"'");
	out.println("Record Deleted");
	}
}
catch(SQLException ex){
out.println("Request failed");
}
%>