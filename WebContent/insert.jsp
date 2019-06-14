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
	<table class="table table-hover table-bordered">
	<br>
	<thead style="text-align:center">
	<tr class="info"><th>과목번호</th><th>분반</th><th>과목명</th><th>날짜</th><th>시간</th><th>현재 신청자 수</th><th>정원 수</th><th>학점</th><th>수강신청</th></tr>
	</thead>
	<%
	int nyear = 2019;
	int nsemester = 2;
	int current_student_num=0;
	request.setCharacterEncoding("EUC-KR");
	session_id = (String) session.getAttribute("user");
	if(session_id == null)
		response.sendRedirect("login.jsp");
	String studentID = session_id;
	Connection myConn = null;
	Statement stmt = null;
	PreparedStatement pstmt=null;
	PreparedStatement pstmt2=null;
	String mySQL = null;
	String sub_sql=null;
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "db";
	String passwd = "0000";
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	try {
	Class.forName(dbdriver);
	myConn = DriverManager.getConnection(dburl, user, passwd);
	stmt = myConn.createStatement();
	} catch(SQLException ex) { System.err.println("SQLException: " + ex.getMessage()); }
	mySQL="SELECT to_number(to_char(sysdate, 'YYYY')), to_number(to_char(sysdate, 'MM')) FROM DUAL";
	
	ResultSet myResultSet = stmt.executeQuery(mySQL);
	int month=0;
	while(myResultSet.next()){ 
		nyear = myResultSet.getInt(1);
		month = myResultSet.getInt(2);
	}
	if(month==11 || month==12)
		nyear+=1;
	if(month==0) month=5; 
	if(month>=5 && month<10){
		nsemester=2;
	}else
		nsemester=1;
	
	mySQL = "SELECT c.c_id, c.c_id_no, c.c_name, c.c_unit, t.t_year, t.t_semester,t.t_time,t.t_day,t.t_max FROM course c, teach t WHERE c.c_id = t.c_id AND t.t_year = ? AND t.t_semester = ? AND c.c_id_no=t.c_id_no order by c.c_id ";
	pstmt = myConn.prepareStatement(mySQL);
	pstmt.setInt(1, nyear);
	pstmt.setInt(2, nsemester);
	//pstmt.setString(3,studentID);
	myResultSet = pstmt.executeQuery();
	if (myResultSet != null) {
		while (myResultSet.next()) { // 수강신청가능과목. 학생이 미수강한과목    
			String c_id = myResultSet.getString("c_id"); 
			int c_id_no = myResultSet.getInt("c_id_no");
			String c_name = myResultSet.getString("c_name");
			int c_unit = myResultSet.getInt("c_unit");
			int t_year = myResultSet.getInt("t_year"); 
			int t_semester = myResultSet.getInt("t_semester");
			String t_time=myResultSet.getString("t_time");
			String t_day=myResultSet.getString("t_day");
			int t_max=myResultSet.getInt("t_max");
			
			sub_sql = "SELECT s_id FROM enroll WHERE c_id = ? and c_id_no = ?";
			pstmt2 = myConn.prepareStatement(sub_sql);
			pstmt2.setString(1, c_id);
			pstmt2.setInt(2, c_id_no);
			ResultSet sub_rs = pstmt2.executeQuery();
			while (sub_rs.next())
				current_student_num++;
	%>
	<td align="center"><%= c_id %></td>
	<td align="center"><%= c_id_no %></td>
	<td align="center"><%= c_name %></td>
	<td align="center"><%= t_day %></td>
	<td align="center"><%= t_time %></td>
	<td align="center"><%= current_student_num %></td>
	<td align="center"><%= t_max %></td>
	<td align="center"><%= c_unit %></td>
	<td align="center">
	
	<a class="btn btn-default btn-sm form-control" href="insert_verify.jsp?c_id=<%= c_id %>&c_id_no=<%= c_id_no %>">신청</a> 
	</td>
	</tr>
	<% current_student_num=0;}
		
	}
	stmt.close();
	myConn.close();
	%>
	</table>
	</div>
</body>
</html>