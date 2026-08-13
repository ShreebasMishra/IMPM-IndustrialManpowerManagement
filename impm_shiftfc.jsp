<%@page language= "java" import ="java.sql.*"%>
<%!
   Connection conn;
   Statement stmtFillcombo,stmtArray;
   ResultSet rs1,rs2;
   String ShiftCode,ShiftName[],StartTime[],EndTime[];
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
 ShiftName = new String[20];
 StartTime= new  String[20];
 EndTime= new  String[20];
 try{
	 stmtArray = conn.createStatement();
	 rs2 = stmtArray.executeQuery("select * from impm_tblshift");
	 i=0;
	 while(rs2.next()){
		 ShiftName[i]=rs2.getString("ShiftName");
		 StartTime[i]=rs2.getString("StartTime");
		 EndTime[i]=rs2.getString("EndTime");
		 i=i+1;
	 }
 }
 catch(SQLException ex){
 out.println("Error");
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
	color:white;
	background-color:green;
	border:solid;
	border-color:white;
}
</style>
<script language= "javascript">
function showShift(){
	var jShiftName = new Array();
	var jStartTime = new Array();
	var jEndTime = new Array();
		var j,k;
	j=0;
	<%
	  i=0;
	  while(i<ShiftName.length){
	%>
	jShiftName[j]="<%=ShiftName[i]%>";
	jStartTime[j]="<%=StartTime[i]%>";
	jEndTime[j]="<%=EndTime[i]%>";
	
	j=j+1;
	<%
	  i=i+1;
	  }
	 %>
	 k=document.f1.cmbShiftCode.selectedIndex;
	 k= k-1;
	 document.f1.txtShiftName.value=jShiftName[k];
	 document.f1.tmeStartTime.value=jStartTime[k];
	 document.f1.tmeEndTime.value=jEndTime[k];
	 
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
<form name="f1" action="impm_shiftfs.jsp" method="Get">
<center>
<h1>Shift Information</h1>
<hr width="70%" align="center"><br><br>
<table width="800" border="0">
<tr>
<td>ShiftCode:</td>
<td><select name = "cmbShiftCode" onchange="showShift()">
<option value= "">-Select-</option>
<%
   doconnect();
   try{
	   stmtFillcombo = conn.createStatement();
	   rs1 = stmtFillcombo.executeQuery("select * from impm_tblshift");
	   
	   while(rs1.next()){
		   ShiftCode=rs1.getString("ShiftCode");
%>
<option value ="<%=ShiftCode%>"><%=ShiftCode%></option>
<%
	   }
   }
   catch(SQLException ex) {
	   out.println("unable to create combo");
   }
%>
</select>
</td>
<tr>
<td>ShiftName:</td>
<td><input type="text" Name="txtShiftName"></td>
</tr>
<tr>
<td>StartTime:</td>
<td><input type="time" Name="tmeStartTime"></td>
</tr>
<tr>
<td>EndTime:</td>
<td><input type="time" Name="tmeEndTime"></td>
</tr>
</table>
<br><br><br><br><br><br>
<input type="submit" name="btnupdate" value="Update" class="largeBtn">
<input type="button" name="btnback" value="Back" class="largeBtn">
<input type="submit" name="btndelete" value="Delete" class="largeBtn">
</center>
</form><br><br><br><br><br><br>
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




