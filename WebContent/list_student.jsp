<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1" >        
<link rel="stylesheet" href="css/bootstrap.css">
<title>학생리스트</title>
</head>
<body>
<%
String c_id = request.getParameter("c_id"); 
int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));
String search_year = request.getParameter("search_year");
String search_semester = request.getParameter("search_semester");

String s_id = null;
String s_name = null;
String s_grade = null;
String s_college = null;
String s_major = null;

String sql;
String sub_sql;
String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "db";                                       
String passwd = "0000";
Connection conn = null;		
PreparedStatement pstmt = null; 
ResultSet rs = null;
ResultSet sub_rs = null;
%>

<%@include file="top.jsp"%>

<div class="container">
	<table width="75%" align="center" id="select_table" class="table table-hover table-bordered">
		<thead style="text-align:center">
		<tr class="info">
			<th>학번</th><th>이름</th><th>학년</th><th>학교</th> <th>전공</th>
		</tr>
		</thead>
<%
try {
		Class.forName("oracle.jdbc.driver.OracleDriver");            
		conn = DriverManager.getConnection(dburl, user, passwd);
		
		sql = "SELECT s_id FROM enroll WHERE c_id = ? and c_id_no = ? and e_year = ? and e_semester = ?";		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, c_id);
		pstmt.setInt(2, c_id_no);
		pstmt.setString(3, search_year);
		pstmt.setString(4, search_semester);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			
			s_id = rs.getString("s_id");
			
			sub_sql = "SELECT s_name, s_grade, s_college,s_major FROM student WHERE s_id = ?";
			pstmt = conn.prepareStatement(sub_sql);
			pstmt.setString(1, s_id);
			sub_rs = pstmt.executeQuery();
			if (sub_rs.next()) {
				s_name =sub_rs.getString("s_name");
				s_grade =sub_rs.getString("s_grade");
				s_college =sub_rs.getString("s_college");
				s_major =sub_rs.getString("s_major");
			}
			%>			
			<tr>
			<td align="center"><%=s_id %></td>
			<td align="center"><%=s_name %></td>
			<td align="center"><%=s_grade %></td>
			<td align="center"><%=s_college%></td>
			<td align="center"><%=s_major %></td>
<%
		}
		rs.close();
		sub_rs.close();
		pstmt.close();
		conn.close();
	} 
	catch(SQLException ex) { 
		System.err.println("SQLException: " + ex.getMessage());
	}
%>
		</tr>
	</table>
	</div>
	<br/>
	<br/>
	<div width="75%" align="center">
	</div>
</body>
</html>