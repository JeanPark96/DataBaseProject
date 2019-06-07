<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv=”Content-Type” content=”text/html; charset=EUC-KR“>
<meta name="viewport" content="width=device-width", initial-scale="1" >        
<link rel="stylesheet" href="css/bootstrap.css">
<title>수강신청 입력</title>
</head>
<body>
	<%@ include file="./top.jsp" %>
	<div class="container">
	<table width="75%" align="center" border class="table table-hover table-bordered">
	<br>
	<thead style="text-align:center">
	<tr class="info"><th>과목번호</th><th>분반</th><th>과목명</th><th>학점</th><th>수강신청</th></tr>
	</thead>
	<%
	request.setCharacterEncoding("EUC-KR");
	session_id = (String) session.getAttribute("user");
	if(session_id == null)
		response.sendRedirect("login.jsp");
	String studentID = session_id;
	Connection myConn = null;
	Statement stmt = null;
	String mySQL = null;
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "db";
	String passwd = "0000";
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	try {
	Class.forName(dbdriver);
	myConn = DriverManager.getConnection(dburl, user, passwd);
	stmt = myConn.createStatement();
	} catch(SQLException ex) { System.err.println("SQLException: " + ex.getMessage()); }
	
	mySQL = "select c_id,c_id_no,c_name,c_unit from course where c_id not in (select c_id from enroll where s_id='" + studentID + "')"; 
	ResultSet myResultSet = stmt.executeQuery(mySQL);
	if (myResultSet != null) {
		while (myResultSet.next()) { // 수강신청가능과목. 학생이 미수강한과목    
	String c_id = myResultSet.getString("c_id"); 
	int c_id_no = myResultSet.getInt("c_id_no");
	String c_name = myResultSet.getString("c_name"); 
	int c_unit = myResultSet.getInt("c_unit"); %>
	<td align="center"><%= c_id %></td>
	<td align="center"><%= c_id_no %></td>
	<td align="center"><%= c_name %></td>
	<td align="center"><%= c_unit %></td>
	<td align="center">
	
	<a class="btn btn-default btn-sm form-control" href="insert_verify.jsp?c_id=<%= c_id %>&c_id_no=<%= c_id_no %>">신청</a> 
	</td>
	</tr>
	<%}
	}
	stmt.close();
	myConn.close();
	%>
	</table>
	</div>
</body>
</html>