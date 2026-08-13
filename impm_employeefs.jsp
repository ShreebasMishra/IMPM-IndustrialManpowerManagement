<%@page language="java"  import="java.sql.*"%>
<%!
Connection conn;
Statement stmtup,stmtdel;
 String EmployeeId,EmployeeName,Gender,DOBirth,Photo,FatherName,MotherName,Locality,City,StateUnionterritory,Pin,PhoneNo,Email,DOJoin,Department,ShiftCode,ShiftName,StartTime,EndTime,BasicSalary,DearnessAllowances,HouseRent,ProvidentFund,Tax,btnup,btndel;
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
  EmployeeId=request.getParameter("cmbEmployeeId");
  EmployeeName=request.getParameter("txtEmployeeName");
 Gender=request.getParameter("cmbGender");
 DOBirth=request.getParameter("dtDOBirth");
  Photo=request.getParameter("flPhoto");
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
  btnup=request.getParameter("btnupdate");
  btndel=request.getParameter("btndelete");
doconnect();
 try{
    if(btnup!=null){
	System.out.println("here");
	
		stmtup=conn.createStatement();
	stmtup.executeUpdate("update impm_tblemployee set employeename='"+EmployeeName+"',gender='"+Gender+"',dobirth='"+DOBirth+"',photo='"+Photo+"',fathername='"+FatherName+"',mothername='"+MotherName+"',locality='"+Locality+"',city='"+City+"',State='"+StateUnionterritory+"',pin='"+Pin+"',phoneno='"+PhoneNo+"',email='"+Email+"',dojoin='"+DOJoin+"',department='"+Department+"',shiftcode='"+ShiftCode+"',shiftname='"+ShiftName+"',starttime='"+StartTime+"',endtime='"+EndTime+"',basicsalary='"+BasicSalary+"',dearnessallowances='"+DearnessAllowances+"',houserent='"+HouseRent+"',providentfund='"+ProvidentFund+"',tax='"+Tax+"' where employeeid='"+EmployeeId+"'");
	out.println("Record updated");
	}
		else if(btndel!=null)
	 {
	stmtdel=conn.createStatement();
	stmtdel.executeUpdate("delete from impm_tblemployee where employeeid='"+EmployeeId+"'");
	out.println("Record Deleted");
	}
}
catch(SQLException ex){
out.println("Request failed"+ex);
}
%>