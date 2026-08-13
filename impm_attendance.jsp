<%@page language= "java" import ="java.sql.*"%>
<%!
   Connection conn;
   Statement stmtFillcombo,stmtArray;
   ResultSet rs1,rs2;
   String EmployeeId,EmployeeName[],Gender[],Department[],ShiftName[],StartTime[];
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
 EmployeeName=new  String[20];
 Gender=new  String[20];
 Department=new  String[20];
 ShiftName=new  String[20];
 StartTime=new  String[20];
 try{
	 stmtArray = conn.createStatement();
	 rs2 = stmtArray.executeQuery("select * from impm_tblemployee");
	 i=0;
	 while(rs2.next()){
		 EmployeeName[i]=rs2.getString("EmployeeName");
		 Gender[i]=rs2.getString("Gender");
		 Department[i]=rs2.getString("Department");
		 ShiftName[i]=rs2.getString("ShiftName");
		 StartTime[i]=rs2.getString("StartTime");
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
	GreenBlack
	color:black;
	background-color:green;
	border:solid;
	border-color:white;
}
</style>
<script language= "javascript">
function showAttendance(){
	var jEmployeeName = new Array();
	var jGender = new Array();
	var jDepartment = new Array();
	var jShiftName = new Array();
	var jStartTime = new Array();
		var j,k;
	j=0;
	<%
	  i=0;
	  while(i<ShiftName.length){
	%>
	jEmployeeName[j]="<%=EmployeeName[i]%>";
	jGender[j]="<%=Gender[i]%>";
	jDepartment[j]="<%=Department[i]%>";
	jShiftName[j]="<%=ShiftName[i]%>";
	jStartTime[j]="<%=StartTime[i]%>";
	
	j=j+1;
	<%
	  i=i+1;
	  }
	 %>
	 k=document.f1.cmbEmployeeId.selectedIndex;
	 k= k-1;
	 document.f1.txtEmployeeName.value=jEmployeeName[k];
	 document.f1.txtGender.value=jGender[k];
	 document.f1.txtDepartment.value=jDepartment[k];
	 document.f1.txtShiftName.value=jShiftName[k];
	 document.f1.tmeStartTime.value=jStartTime[k];
	 
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
<form name="f1" action = "impm_attendances.jsp" method = "GET" >
<center>
<h1>Attendance Register</h1>
<hr width="70%" align="center"><br><br>
<table width="900" border="0">
<tr>
<td>Reference No:</td>
<td><input type= "text" name="txtReferenceNo"></td>
<td>Date:</td>
<td><input type="date" name="dtDate"></td>
</tr>
<tr>
<td>Employee Id:</td>
<td><select name="cmbEmployeeId"  onchange="showAttendance()">
<option value="">-select-</option>
<%
   doconnect();
   try{
	   stmtFillcombo = conn.createStatement();
	   rs1 = stmtFillcombo.executeQuery("select * from impm_tblemployee");
	   
	   while(rs1.next()){
		   EmployeeId=rs1.getString("EmployeeId");
%>
<option value ="<%=EmployeeId%>"><%=EmployeeId%></option>
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
<td>Employee Name:</td>
<td><input type= "text" name="txtEmployeeName"></td>
<td>Gender:</td>
<td><input type="text" name="txtGender"></td>
</tr>
<tr>
<td>Department:</td>
<td><input type="text" name="txtDepartment"></td>
<td>Shift Name:</td>
<td><input type="text" name="txtShiftName"></td>
</tr>
<tr>
<td>Start Time:</td>
<td><input type="time" name="tmeStartTime"></td>
<td>In Time:</td>
<td><input type="time" name="tmeInTime"></td>
</tr>
</tr>
</table>
<br><br><br><br><br><br><br>
<input type="submit" name="btnsub" value="Submit" class="largeBtn">
<input type="reset" name="btnres" value="Reset" class="largeBtn">
</center>
</form><br>
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
