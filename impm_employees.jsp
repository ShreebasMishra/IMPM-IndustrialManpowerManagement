<%@page language="java" contentType="text/html" import="java.sql.*"%>
<html>
<head>
<title>IMPM </title>
</head>
<body>
<%!
Connection conn;
Statement stmtSave;
 String EmployeeId,EmployeeName,Gender,DOBirth,Photo,FatherName,MotherName,Locality,City,StateUnionterritory,Pin,PhoneNo,Email,DOJoin,Department,ShiftCode,ShiftName,StartTime,EndTime,BasicSalary,DearnessAllowances,HouseRent,ProvidentFund,Tax;
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
  EmployeeId=request.getParameter("txtEmployeeId");
  EmployeeName=request.getParameter("txtEmployeeName");
  Gender=request.getParameter("cmbGender");
  DOBirth=request.getParameter("dtDOBirth");
  Photo=request.getParameter("FilePhoto");
  FatherName=request.getParameter("txtFatherName");
  MotherName=request.getParameter("txtMotherName");
  Locality=request.getParameter("txtLocality");
  City=request.getParameter("txtCity");
  StateUnionterritory=request.getParameter("cmbState");
  Pin=request.getParameter("txtPin");
  PhoneNo=request.getParameter("txtPhoneNo");
  Email=request.getParameter("txtEmail");
  DOJoin=request.getParameter("dtDOJoin");
  Department=request.getParameter("cmbDepartment");
  ShiftCode=request.getParameter("cmbShiftCode");
  ShiftName=request.getParameter("txtShiftName");
  StartTime=request.getParameter("tmeStartTime");
  EndTime=request.getParameter("tmeEndTime");
  BasicSalary=request.getParameter("txtBasicSalary");
  DearnessAllowances=request.getParameter("txtDearnessAllowances");
  HouseRent=request.getParameter("txtHouseRent");
  ProvidentFund=request.getParameter("txtPF");
  Tax=request.getParameter("txtTax");
 %>
 <%
   doconnect();
    try{
		stmtSave=conn.createStatement();
		stmtSave.executeUpdate("insert into impm_tblemployee values('"+EmployeeId+"','"+EmployeeName+"','"+ Gender+"','"+ DOBirth+"','"+Photo+"','"+FatherName+"','"+MotherName+"','"+ Locality+"','"+City+"','"+StateUnionterritory+"','"+Pin+"','"+PhoneNo+"','"+Email+"','"+DOJoin+"','"+Department+"','"+ShiftCode+"','"+ShiftName+"','"+StartTime+"','"+EndTime+"','"+BasicSalary+"','"+ DearnessAllowances+"','"+HouseRent+"','"+ ProvidentFund+"','"+ Tax+"')");
		out.println("One Record Saved Successfully");
    }		
	catch(SQLException ex){
		out.println("Unable to Save..."+ex);
	}
   
  
 %>  
</body>
</html> 
 