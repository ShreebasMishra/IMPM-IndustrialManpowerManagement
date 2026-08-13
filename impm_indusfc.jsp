<%@page language= "java" import ="java.sql.*"%>
<%!
   Connection conn;
   Statement stmtFillcombo,stmtArray;
   ResultSet rs1,rs2;
   String Regdno,Estdt[],Nmindus[],Hdindus[],Locality[],City[],State[],Phnno[],Emailid[],GSTno[],GSTdt[];
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
 Estdt = new String[20];
 Nmindus= new  String[20];
 Hdindus= new String[20];
 Locality= new String[20];
 City= new String[20];
 State= new String[20];
 Phnno= new String[20];
 Emailid= new String[20];
 GSTno= new String[20];
 GSTdt= new String[20];
 try{
	 stmtArray = conn.createStatement();
	 rs2 = stmtArray.executeQuery("select * from impm_tblindus");
	 i=0;
	 while(rs2.next()){
		 Estdt[i]=rs2.getString("Estdt");
		 Nmindus[i]=rs2.getString("Nmindus");
		 Hdindus[i]=rs2.getString("Hdindus");
		 Locality[i]=rs2.getString("Locality");
		 City[i]=rs2.getString("City");
		 State[i]=rs2.getString("State");
		 Phnno[i]=rs2.getString("phoneno");
		 Emailid[i]=rs2.getString("Emailid");
		 GSTno[i]=rs2.getString("GSTno");
		 GSTdt[i]=rs2.getString("GSTdt");
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
function showIndustry(){
	var jEstdt = new Array();
	var jNmindus = new Array();
	var jHdindus = new Array();
	var jLocality = new Array();
	var jCity = new Array();
	var jState = new Array();
	var jPhnno = new Array();
	var jEmailid = new Array();
	var jGSTno = new Array();
	var jGSTdt = new Array();
	
	var j,k;
	j=0;
	<%
	  i=0;
	  while(i<Estdt.length){
	%>
	jEstdt[j]="<%=Estdt[i]%>";
	jNmindus[j]="<%=Nmindus[i]%>";
	jHdindus[j]="<%=Hdindus[i]%>";
	jLocality[j]="<%=Locality[i]%>";
	jCity[j]="<%=City[i]%>";
	jState[j]="<%=State[i]%>";
	jPhnno[j]="<%=Phnno[i]%>";
	jEmailid[j]="<%=Emailid[i]%>";
	jGSTno[j]="<%=GSTno[i]%>";
	jGSTdt[j]="<%=GSTdt[i]%>";
	
	j=j+1;
	<%
	  i=i+1;
	  }
	 %>
	 k=document.f1.cmbRegdno.selectedIndex;
	 k= k-1;
	 document.f1.txtEstdt.value=jEstdt[k];
	 alert(jNmindus[k]);
	 document.f1.txtNmindus.value=jNmindus[k];
	 document.f1.txtHdindus.value=jHdindus[k];
	 document.f1.txtLocality.value=jLocality[k];
	 document.f1.txtCity.value=jCity[k];
	 document.f1.cmbState.value=jState[k];
	 document.f1.txtPhnno.value=jPhnno[k];
	 document.f1.txtEmailid.value=jEmailid[k];
	 document.f1.txtGSTno.value=jGSTno[k];
	 document.f1.txtGSTdt.value=jGSTdt[k];
	 
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
<form name="f1" action="impm_indusfs.jsp" method="Get">
<center>
<h1>Industry Profile</h1>
<hr width="70%" align="center"><br><br>
<table width="800" border="0">
<tr>
<td>Registration No:</td>
<td><select name = "cmbRegdno" onchange="showIndustry()">
<option value= "">-Select-</option>
<%
   doconnect();
   try{
	   stmtFillcombo = conn.createStatement();
	   rs1 = stmtFillcombo.executeQuery("select * from impm_tblindus");
	   
	   while(rs1.next()){
		   Regdno=rs1.getString("Regdno");
%>
<option value ="<%=Regdno%>"><%=Regdno%></option>
<%
	   }
   }
   catch(SQLException ex) {
	   out.println("unable to create combo");
   }
%>
</select>
</td>
<td>Estd.Date:</td>
<td><input type="text" Name="txtEstdt"></td>
</tr>
<tr>
<td>Name Of Industry:</td>
<td><input type="text" Name="txtNmindus"></td>
</tr>
<tr>
<td>Head Of Industry:</td>
<td><input type="text" Name="txtHdindus"></td>
</tr>
<tr>
<td>Locality:</td>
<td><input type="text" Name="txtLocality"></td>
</tr>
<tr>
<td>City:</td>
<td><input type="text" Name="txtCity"></td>
</tr>
<tr>
<td>State/Union territory:</td>
<td>
      <select name = "cmbState" id="idState">
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
</tr>
<tr>
<td>Phone No:</td>
<td><input type="text" name="txtPhnno"></td>
</tr>
<tr>
<td>Email Id:</td>
<td><input type="text" name="txtEmailid"></td>
</tr>
<tr>
<td>G.S.T Number:</td>
<td><input type="text" name="txtGSTno"></td>
<td>G.S.T Date:</td>
<td><input type="text" name="txtGSTdt"></td>
</tr>
</table>
<br><br><br><br><br><br>
<input type="submit" name="btnupdate" value="Update" class="largeBtn">
<input type="button" name="btnback" value="Back" class="largeBtn">
<input type="submit" name="btndelete" value="Delete" class="largeBtn">
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




