<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>  
<%@ include file="top.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>수강신청</title>
</head>
<body>
<% 
	Statement stmt = null;
	String mySQL = null;
	ResultSet myResultSet =null;
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "db";
	String passwd = "0000";
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(dbdriver);
	
	session_id = (String) session.getAttribute("user");
	if(session_id == null)
		response.sendRedirect("login.jsp");
	String s_id = session_id;
	

	String course_id;
	int course_id_no;
	String course_name = "";
	int course_unit = 0;
	String professor_id = "";
	String professor_name = "";
	String int_course_day = "";
	String str_course_day = "";
	String course_time = "";
	String course_place = "";
	int max_student_num = 0;
	int current_student_num = 0;
	int total_course = 0;
	int total_unit = 0;
	Connection conn = null;		
	PreparedStatement pstmt = null;
	CallableStatement cstmt = null; 
	ResultSet rs = null;
	ResultSet sub_rs = null;
	ResultSet resultSet=null;
	String sql;
	String sub_sql;
	conn = DriverManager.getConnection(dburl, user, passwd);
	
	String year = "";
	String semester = "";
	int month=0;
	
	stmt = conn.createStatement();
	mySQL="SELECT to_char(sysdate, 'YYYY'), to_number(to_char(sysdate, 'MM')) FROM DUAL";
	
	myResultSet = stmt.executeQuery(mySQL);
	
	while(myResultSet.next()){ 
		year = myResultSet.getString(1);
		month = myResultSet.getInt(2);
	}
	if(year==null) year="2019";
	if(month==0) month=5; 
	if(month>=5 && month<10){
		semester="2";
	}else
		semester="1";
	
	%>
	<table width="75%" align="center" id="select_table">
		<tr>
			<th>과목번호</th><th>분반</th><th>과목명</th><th>강사</th> <th>강의시간</th>
			<th>강의장소</th><th>수강인원</th><th>삭제</th>
		</tr>
<%			
	try {           
		
		
			sql = "SELECT c_id, c_id_no FROM enroll WHERE s_id = ? and e_year = ? and e_semester = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, session_id);
		pstmt.setInt(2, Integer.parseInt(year));
		pstmt.setInt(3, Integer.parseInt(semester));
		rs = pstmt.executeQuery();
		while (rs.next()) {
			
			course_id = rs.getString("c_id");
			course_id_no = rs.getInt("c_id_no");
			
			sub_sql = "SELECT c_name, c_unit FROM course WHERE c_id = ? and c_id_no = ?";
			pstmt = conn.prepareStatement(sub_sql);
			pstmt.setString(1, course_id);
			pstmt.setInt(2, course_id_no);
			sub_rs = pstmt.executeQuery();
			if (sub_rs.next()) {
				course_name = sub_rs.getString("c_name");
				course_unit = sub_rs.getInt("c_unit");
				total_unit = total_unit + course_unit;
				total_course++;
			}
			
			sub_sql = "SELECT p_id, t_day, t_time, t_room, t_max FROM teach WHERE c_id = ? and c_id_no = ?";
			pstmt = conn.prepareStatement(sub_sql);
			pstmt.setString(1, course_id);
			pstmt.setInt(2, course_id_no);
			sub_rs = pstmt.executeQuery();
			if (sub_rs.next()) {
				professor_id = sub_rs.getString("p_id");
				int_course_day = sub_rs.getString("t_day");	//t_day 는 문자열 월 수 			
				
				course_time = "" + sub_rs.getString("t_time");
				course_place = sub_rs.getString("t_room"); 
				max_student_num = sub_rs.getInt("t_max");
			}
			
			sub_sql = "SELECT p_name FROM professor WHERE p_id = ?";
			pstmt = conn.prepareStatement(sub_sql);
			pstmt.setString(1, professor_id);
			sub_rs = pstmt.executeQuery();
			if (sub_rs.next())
				professor_name = sub_rs.getString("p_name");
			
			sub_sql = "SELECT s_id FROM enroll WHERE c_id = ? and c_id_no = ?";
			pstmt = conn.prepareStatement(sub_sql);
			pstmt.setString(1, course_id);
			pstmt.setInt(2, course_id_no);
			sub_rs = pstmt.executeQuery();
			if (sub_rs.next())
				current_student_num++;
	%>

		<tr>
			<td align="center"><%=course_id %></td>
			<td align="center"><%=course_id_no %></td>
			<td align="center"><%=course_name %></td>
			<td align="center"><%=professor_name %></td>
			<td align="center"><%=int_course_day %> <%=course_time %></td>
			<td align="center"><%=course_place %></td>
			<td align="center"><%=course_unit %></td>
			<td><a href="delete_verify.jsp?year<%=year%>&semester<%=semester%>&c_id=<%=course_id%>&c_id_no=<%=course_id_no%>">삭제</a></td>
<%
		}
		rs.close();
		pstmt.close();
		conn.close();
	} 
	catch(SQLException ex) { 
		System.err.println("SQLException: " + ex.getMessage());
	}
%>
		</tr>
	</table>
	<br/>
	<br/>
	<div width="75%" align="center">
		<p>현재까지 <%=total_course %>과목, 총 <%=total_unit %>학점 수강신청 했습니다 </p>
	</div>
</body>
</html>