<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%@ include file="top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	session_id = (String) session.getAttribute("user");
	if(session_id == null)
		response.sendRedirect("login.jsp");
	String s_id = session_id;

	String c_id = request.getParameter("c_id");
	String c_id_no = request.getParameter("c_id_no");
	Connection myConn = null;
	Statement stmt = null;
	String mySQL = null;
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "db";
	String passwd = "0000";
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(dbdriver);
	myConn = DriverManager.getConnection(dburl, user, passwd);
	stmt = myConn.createStatement();
	mySQL = "DELETE FROM enroll WHERE s_id='"+s_id+"' and c_id='"+c_id+"' and c_id_no='"+c_id_no+"'";
	ResultSet resultSet = stmt.executeQuery(mySQL);

	%> 
	<script>
	location.href="delete.jsp";
	</script> <%
%>
</body>
</html>