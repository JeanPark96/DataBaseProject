<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv=��Content-Type�� content=��text/html; charset=EUC-KR��>
<meta name="viewport" content="width=device-width", initial-scale="1" >        
<link rel="stylesheet" href="css/bootstrap.css">
<title>������û �Է�</title>
</head>
<body>
	<%@ include file="./top.jsp" %>
	<div class="container">
	<table class="table table-hover table-bordered">
	<br>
	<thead style="text-align:center">
	<tr class="info"><th>�����ȣ</th><th>�й�</th><th>�����</th><th>����</th><th>������û</th></tr>
	</thead>
	<%
	int nyear = 2019;
	int nsemester = 2;
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
	
	mySQL = "SELECT c.c_id, c.c_id_no, c.c_name, c.c_unit, t.t_year, t.t_semester FROM course c, teach t WHERE c.c_id = t.c_id AND t.t_year = '2019' AND t.t_semester = '2' AND c.c_id_no=t.c_id_no AND (c.c_id) not in (select c_id from enroll where s_id='" + session_id + "') order by c.c_id ";
	ResultSet myResultSet = stmt.executeQuery(mySQL);
	if (myResultSet != null) {
		while (myResultSet.next()) { // ������û���ɰ���. �л��� �̼����Ѱ���    
	String c_id = myResultSet.getString("c_id"); 
	int c_id_no = myResultSet.getInt("c_id_no");
	String c_name = myResultSet.getString("c_name");
	int c_unit = myResultSet.getInt("c_unit");
	int t_year = myResultSet.getInt("t_year"); 
	int t_semester = myResultSet.getInt("t_semester");
	%>
	<td align="center"><%= c_id %></td>
	<td align="center"><%= c_id_no %></td>
	<td align="center"><%= c_name %></td>
	<td align="center"><%= c_unit %></td>
	<td align="center">
	
	<a class="btn btn-default btn-sm form-control" href="insert_verify.jsp?c_id=<%= c_id %>&c_id_no=<%= c_id_no %>">��û</a> 
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