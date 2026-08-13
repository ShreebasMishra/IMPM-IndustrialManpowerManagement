<%@page language= "java" import ="java.sql.*"%>
<%!
   Connection conn;
   Statement stmtFillcombo,stmtArray;
   Statement stmtFillcombo1,stmtArray1,stmtArray4;
   ResultSet rs1,rs2,rs3,rs4;
   String EmployeeId,DeptName1,ShiftCode1;
   String EmployeeName[],Gender[],DOBirth[],Photo[],FatherName[],MotherName[],Locality[],City[],StateUnionterritory[],Pin[],PhoneNo[],Email[],DOJoin[],Department[],ShiftCode[],ShiftName[],StartTime[],EndTime[],BasicSalary[],DearnessAllowances[],HouseRent[],ProvidentFund[],Tax[];
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
<%
  doconnect();
 EmployeeName=new String[20];
 Gender=new  String[20];
DOBirth=new String[20];
 Photo=new String[20];
 FatherName=new String[20];
 MotherName=new String[20];
 Locality=new String[20];
 City=new String[20];
 StateUnionterritory=new String[20];
 Pin=new String[20];
 PhoneNo=new String[20];
Email=new String[20];
DOJoin=new String[20];
 Department=new String[20];
 ShiftCode=new String[20];
 ShiftName=new String[20];
StartTime=new String[20];
 EndTime=new String[20];
 BasicSalary=new String[20];
DearnessAllowances=new String[20];
HouseRent=new String[20];
 ProvidentFund=new String[20];
  Tax=new String[20];
 try{
 stmtArray4 = conn.createStatement();
	 rs4 = stmtArray4.executeQuery("select * from impm_tblemployee");
	 i=0;
	 while(rs4.next()){
		 EmployeeName[i]=rs4.getString("EmployeeName");
		  Gender[i]=rs4.getString("Gender");
		 DOBirth[i]=rs4.getString("DOBirth");
		 Photo[i]=rs4.getString("Photo");
		FatherName[i]=rs4.getString("FatherName");
		 MotherName[i]=rs4.getString("MotherName");
		 Locality[i]=rs4.getString("Locality");
		 City[i]=rs4.getString("City");
		 StateUnionterritory[i]=rs4.getString("State");
		Pin[i]=rs4.getString("Pin");
		PhoneNo[i]=rs4.getString("PhoneNo");
		Email[i]=rs4.getString("Email");
		 DOJoin[i]=rs4.getString("DOJoin");
		 Department[i]=rs4.getString("Department");
		 ShiftCode[i]=rs4.getString("ShiftCode");
		 ShiftName[i]=rs4.getString("ShiftName");
		 StartTime[i]=rs4.getString("StartTime");
		 EndTime[i]=rs4.getString("EndTime");
		 BasicSalary[i]=rs4.getString("BasicSalary");
		 DearnessAllowances[i]=rs4.getString("DearnessAllowances");
		 HouseRent[i]=rs4.getString("HouseRent");
		 ProvidentFund[i]=rs4.getString("ProvidentFund");
		  Tax[i]=rs4.getString("Tax");
		 i=i+1;
	 }
 }
 catch(SQLException ex){
 out.println("Error 1"+ex);
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

<script language= "javascript">
function showEmployee(){
	var jEmployeeName = new Array();
	var jGender = new Array();
	var jDOBirth = new Array();
	var jPhoto = new Array();
	var jFatherName = new Array();
	var jMotherName = new Array();
	var jLocality= new Array();
	var jCity = new Array();
	var jStateUnionterritory = new Array();
	var jPin = new Array();
	var jPhoneNo = new Array();
	var jEmail = new Array();
	var jDOJoin = new Array();
	var jDepartment = new Array();
	var jShiftCode = new Array();
	var jShiftName = new Array();
	var jStartTime= new Array();
	var jEndTime = new Array();
	var jBasicSalary = new Array();
	var jDearnessAllowances= new Array();
	var jHouseRent = new Array();
	var jProvidentFund = new Array();
	var jTax = new Array();
	
	var j,k;
	j=0;
	<%
	  i=0;
	  while(i<EmployeeName.length){
	%>
	jEmployeeName[j]="<%=EmployeeName[i]%>";
	jGender[j]="<%=Gender[i]%>";
	jDOBirth[j]="<%=DOBirth[i]%>";
	jPhoto[j]="<%=Photo[i]%>";
	jFatherName[j]="<%=FatherName[i]%>";
	jMotherName[j]="<%=MotherName[i]%>";
	jLocality[j]="<%=Locality[i]%>";
	jCity[j]="<%=City[i]%>";
	jStateUnionterritory[j]="<%=StateUnionterritory[i]%>";
	jPin[j]="<%=Pin[i]%>";
	jPhoneNo[j]="<%=PhoneNo[i]%>";
	jEmail[j]="<%=Email[i]%>";
	jDOJoin[j]="<%=DOJoin[i]%>";
	jDepartment[j]="<%=Department[i]%>";
	jShiftCode[j]="<%=ShiftCode[i]%>";
	jShiftName[j]="<%=ShiftName[i]%>";
	jStartTime[j]="<%=StartTime[i]%>";
	jEndTime[j]="<%=EndTime[i]%>";
	jBasicSalary[j]="<%=BasicSalary[i]%>";
	jDearnessAllowances[j]="<%=DearnessAllowances[i]%>";
	jHouseRent[j]="<%=HouseRent[i]%>";
	jProvidentFund[j]="<%=ProvidentFund[i]%>";
	jTax[j]="<%=Tax[i]%>";
	
	j=j+1;
	<%
	  i=i+1;
	  }
	 %>
	 k=document.f1.cmbEmployeeId.selectedIndex;
	 k= k-1;
	document.f1.txtEmployeeName.value=jEmployeeName[k];
	document.f1.cmbGender.value=jGender[k];
	document.f1.dtDOBirth.value=jDOBirth[k];
	//document.f1.flPhoto.value=jPhoto[k];
	document.f1.txtFatherName.value=jFatherName[k];
	document.f1.txtMotherName.value=jMotherName[k];
	document.f1.txtLocality.value=jLocality[k];
	document.f1.txtCity.value=jCity[k];
	document.f1.cmbState.value=jStateUnionterritory[k];
	document.f1.txtPin.value=jPin[k];

	document.f1.txtPhoneNo.value=jPhoneNo[k];
	document.f1.txtEmail.value=jEmail[k];
	document.f1.dtDOJoin.value=jDOJoin[k];
	document.f1.cmbDepartment.value=jDepartment[k];
	document.f1.cmbShiftCode.value=jShiftCode[k];
	document.f1.txtShiftName.value=jShiftName[k];
	document.f1.tmeStartTime.value=jStartTime[k];
	document.f1.tmeEndTime.value=jEndTime[k];
	document.f1.txtBasicSalary.value=jBasicSalary[k];
	document.f1.txtDearnessAllowances.value=jDearnessAllowances[k];
	document.f1.txtHouseRent.value=jHouseRent[k];
	document.f1.txtPF.value=jProvidentFund[k];
	document.f1.txtTax.value=jTax[k];
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
<form name="f1" action= "impm_employeefs.jsp" method="GET"  >
<center>
<h1>Employee Profile</h1>
<hr width="70%" align="center"><br><br>
<table width="900" border="0">
<tr>
<td nowrap>Employee Id:</td>
<td>
<select name = "cmbEmployeeId" onchange="showEmployee()">
<option value= "">-Select-</option>
<%
   doconnect();
   try{
	   stmtFillcombo1 = conn.createStatement();
	   rs3 = stmtFillcombo1.executeQuery("select * from impm_tblemployee");
	   
	   while(rs3.next()){
		   EmployeeId=rs3.getString("EmployeeId");
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
<td align="center" rowspan="5" colspan="2"><img src="" width="130" height="140" name="imgPhoto" border="2"></td>
</tr>
<tr>
<td nowrap>Employee Name:</td>
<td><input type= "text" name="txtEmployeeName"></td>
</tr>
<tr>
<td>Gender:</td>
<td><select name="cmbGender" onchange="showGender()">
	  <option value=""> -Select-</option>
	  <option value="Male">Male</option>
	  <option value="Female">Female</option>
	  <option value="Others">Others</option>
	  </td>
</tr>
<tr>
<td>D.O.Birth:</td>
<td><input type= "date" name="dtDOBirth"></td>
</tr>
<td>Photo:</td>
<td><input type= "File" name="FilePhoto"></td>
</tr>
<tr>
<td>Father Name:</td>
<td><input type= "text" name="txtFatherName"></td>
<td>Mother Name:</td>
<td><input type= "text" name="txtMotherName"></td>
</tr>
<tr>
<td>Locality:</td>
<td><input type= "text" name="txtLocality"></td>
<td>City:</td>
<td><input type= "text" name="txtCity"></td>
</tr>
<tr>
<td>State/Union territory:</td>
<td>
      <select name="cmbState" id="idState">
		<option value= "Andhra pradesh">Andhra Pradesh</option>
		<option value= "Arunanchal Pradesh">Arunanchal Pradesh</option>
		<option value= "Assam">Assam</option>
		<option value = "Bihar">Bihar</option>
		<option value = "Chattisgarh">Chattisgarh</option>
		<option value = "Goa">Goa</option>
		<option value = "Gujrat">Gujrat</option>
		<option value = "Haryana">Haryana</option>
		<option value = "Himanchal pradesh">Himanchal Pradesh</option>
		<option value = "Jharkhand">Jharkhand</option>
		<option value ="Karnataka">Karnataka</option>
		<option value = "Kerala">Kerala</option>
		<option value = "Madhya Pradesah">Madhya Pradesh</option>
		<option value = "Maharashtra">Maharashtra</option>
		<option value = "Manipur">Manipur</option>
		<option value = "Meghalaya">Meghalaya</option>
		<option value = "Mizoram">Mizoram</option>
		<option value = "Nagaland">Nagaland</option>
		<option value = "Odisha">Odisha</option>
		<option value = "Punjab">Punjab</option>
		<option value = "Rajasthan">Rajasthan</option>
		<option value = "sikkim">Sikkim</option>
		<option value = "Tamil Nadu">Tamil Nadu</option>
		<option value = "Telangana">Telangana</option>
		<option value = "Tripura">Tripura</option>
		<option value = "Uttar Pradesh">Uttar Pradesh</option>
		<option value = "Uttarakhand">Uttarakhand</option>
		<option value = "West Bengal">West Bengal</option>
		<option value = "Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
		<option value = "Chandigarh">Chandigarh</option>
		<option value = "Dadra and Nagar Haveli and Daman and Diu">Dadra and Nagar Haveli and Daman and Diu</option>
		<option value= "Delhi">Delhi</option>
		<option value = "Jammu and Kashmir">Jammu and Kashmir</option>
		<option value = "Ladakh">Ladakh</option>
		<option value = "Lakshadweep">Lakshadweep</option>
		<option value = "Puducherry">Puducherry</option>
	
</select>
</td>
<td>Pin:</td>
<td><input type= "text" name="txtPin"></td>
</tr>
<tr>
<td>Phone No:</td>
<td><input type= "text" name="txtPhoneNo"></td>
<td>Email:</td>
<td><input type= "text" name="txtEmail"></td>
</tr>
<tr>
<td>D.O.Join:</td>
<td><input type= "date" name="dtDOJoin"></td>
<td>Department:</td>
<td><select name = "cmbDepartment" id="idDepartment">
    <option value="">-select-</option value>
	<%
   doconnect();
   try{
	   stmtFillcombo = conn.createStatement();
	   rs1 = stmtFillcombo.executeQuery("select * from impm_tbldept");
	   
	   while(rs1.next()){
		   DeptName1=rs1.getString("DeptName");
%>
<option value ="<%=DeptName1%>"><%=DeptName1%></option>
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
<td>ShiftCode:</td>
<td>
<select name = "cmbShiftCode"onchange="showShift()" id="idShiftCode">
<option value="">-select-</option value>
<%
   doconnect();
   try{
	   stmtFillcombo = conn.createStatement();
	   rs1 = stmtFillcombo.executeQuery("select * from impm_tblshift");
	   
	   while(rs1.next()){
		   ShiftCode1=rs1.getString("ShiftCode");
%>
<option value ="<%=ShiftCode1%>"><%=ShiftCode1%></option>
<%
	   }
   }
   catch(SQLException ex) {
	   out.println("unable to create combo");
   }
%>
</select>
</td>
<td>ShiftName:</td>
<td><input type= "text" name="txtShiftName"></td>
</tr>
<tr>
<td>StartTime:</td>
<td><input type= "time" name="tmeStartTime"></td>
<td>EndTime:</td>
<td><input type= "time" name="tmeEndTime"></td>
</tr>
<tr>
<td>BasicSalary:</td>
<td><input type= "text" name="txtBasicSalary"></td>
</tr>
<tr>
<td>DearnessAllowances:</td>
<td><input type= "text" name="txtDearnessAllowances"></td>
<td>HouseRent:</td>
<td><input type= "text" name="txtHouseRent"></td>
</tr>
<tr>
<td>ProvidentFund:</td>
<td><input type= "text" name="txtPF"></td>
<td>Tax:</td>
<td><input type= "text" name="txtTax"></td>
</tr>
</table>
<br><br>
<input type="submit" name="btnupdate" value="Update" class="largeBtn">
<input type="button" name="btnback" value="Back" class="largeBtn">
<input type="submit" name="btndelete" value="Delete" class="largeBtn">
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



