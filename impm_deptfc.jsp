<%@page language= "java" import ="java.sql.*"%>
<%!
   Connection conn;
   Statement stmtFillcombo,stmtArray;
   ResultSet rs1,rs2;
   String DeptCode,DeptName[],Depthead[],PhnNo[];
   int i;
   public void doconnect (){
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
  doconnect();
 DeptName = new String[20];
 Depthead= new  String[20];
 PhnNo= new String[20];
  try{
	 stmtArray = conn.createStatement();
	 rs2 = stmtArray.executeQuery("select * from impm_tbldept");
	 i=0;
	 while(rs2.next()){
		 DeptName[i]=rs2.getString("DeptName");
		 Depthead[i]=rs2.getString("Depthead");
		 PhnNo[i]=rs2.getString("PhoneNo");
		 i=i+1;
	 }
 }
 catch(SQLException ex){
 out.println("Error"+ex);
 }
%>


<html>
<head>
<title>IMPM</title>
<style type= "text/css">
	input[type="text"]{
	width:250px;
	height:25px;
	border-style:ritched;
	border-radius:6px;
	
}
.largeBtn{
	width:140px;
	height:50px;
	color:white;
	background-color:green;
	border:solid;
	border-color:black;
}
</style>
<script language= "javascript">
function showDepartment(){
	var jDeptName = new Array();
	var jDepthead = new Array();
	var jPhnNo = new Array();
	var j,k;
	j=0;
	<%
	  i=0;
	  while(i<DeptName.length){
	%>
	jDeptName[j]="<%=DeptName[i]%>";
	jDepthead[j]="<%=Depthead[i]%>";
	jPhnNo[j]="<%=PhnNo[i]%>";
	j=j+1;
	<%
	  i=i+1;
	  }
	 %>
	 k=document.f1.cmbDeptCode.selectedIndex;
	 k= k-1;
	 document.f1.txtDeptName.value=jDeptName[k];
	 
	 document.f1.txtDeptName.value=jDeptName[k];
	 document.f1.txtDepthead.value=jDepthead[k];
	 document.f1.txtPhnNo.value=jPhnNo[k];
}
</script>
</head>
<body>
<table width ="100%">
<tr height ="70">
<td  align="center" valign = "middle" bgcolor="maroon">
<font face="copperplate gothic" size="5" color="white">
Industrial Manpower Management
</font>
<font face="" size="3"color="yellow">
<sup>A step ahead...</sup>
</font>
</td>
</tr>
</table>
<form name="f1" action="impm_deptfs.jsp" method="GET">
<center>
<h1>Department Profile</h1>
<hr width="70%" align="center"><br><br>
<table width="700" border="0">
<tr>
<td>Department Code:</td>
<td>
	<select name="cmbDeptCode" onchange="showDepartment()">
	  <option value=""> -Select-</option>
	  <%
   doconnect();
   try{
	   stmtFillcombo = conn.createStatement();
	   rs1 = stmtFillcombo.executeQuery("select * from impm_tbldept");
	   
	   while(rs1.next()){
		   DeptCode=rs1.getString("DeptCode");
%>
<option value ="<%=DeptCode%>"><%=DeptCode%></option>
<%
	   }
   }
   catch(SQLException ex) {
	   out.println("unable to create combo");
   }
%>
	</select>
</td>
</tr>
<tr>
<td>Department Name:</td>
<td><input type = "text" name="txtDeptName"></td>
</tr>
<tr>
<td>Head of Department:</td>
<td><input type="text" name="txtDepthead"></td>
</tr>
<tr>
<td>Phone No:</td>
<td><input type ="text" name="txtPhnNo"></td>
</tr>
</table><br><br><br><br>
<input type="submit" name="btnupdate" value="Update" class="largeBtn">
<input type="button" name="btnback" value="Back" class="largeBtn">
<input type="submit" name="btndelete" value="Delete" class="largeBtn">
</center>
</form><br><br><br><br><br><br><br><br><br>
<table width ="100%">
<tr height ="70">
<td  align="center" valign = "middle" bgcolor="maroon">
<font face="copperplate gothic" size="5" color="white">
 <marquee>&copy;SM Group of Industries</marquee>
</font>
</td>
</tr>
</table>
</body>
</html>


