<%@page language="java" contentType="text/html" import="java.sql.*"%>
<html>
<head>
<title>IMPM </title>
</head>
<body>
<%!
Connection conn;
Statement stmtCheck;
ResultSet rs;
   String UserName,Password;
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
  UserName=request.getParameter("txtUserName");
  Password=request.getParameter("txtPassword");
  
 %>
 <%
   doconnect();
    try{
		stmtCheck=conn.createStatement();
		rs=stmtCheck.executeQuery("select * from impm_tbllogin where username='"+UserName+"' and password='"+Password+"'");
		if(rs.next()){
			%>
		     <script language="javascript">
			     alert("Login Successful");
				 window.location="impm_menu.html";
			</script> 
		<%
		}
		else{
			%>
			<script language="javascript">
			     alert("Login Failed");
				 window.location="impm_loginc.html";
			</script>
			<%
		}
    }		
	catch(SQLException ex){
		out.println("Unable to Proceed..."+ex);
	}
   
  
 %>  
</body>
</html> 
 