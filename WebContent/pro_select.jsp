<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%@ include file="top.jsp" %>
<%
	if (session_id == null) 
		response.sendRedirect("login.jsp");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width", initial-scale="1" >        
	<link rel="stylesheet" href="css/bootstrap.css">
	<title>수강신청 조회</title>
	<script>
		function onSearch() {
			var fr = document.getElementById("select_form");
			var search_year = fr.search_year.value;
			var search_semester = fr.search_semester.value;
			location.href = "pro_select.jsp?search_year=" + search_year + "&search_semester=" + search_semester;
		}
	
		
	</script>
</head>
<body>
<% 
	String search_year = request.getParameter("search_year");
	String search_semester = request.getParameter("search_semester");
 	if (search_year == null)
		search_year = "2019";
	if (search_semester == null)
		search_semester = "2";
	String course_id;
	int course_id_no;
	String course_name ="";
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
	String sql;
	String sub_sql;
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "db";                                       
	String passwd = "0000";
%>
	<form method="post" width="75%" align="center" id="select_form" action="select.jsp"> 
		<br/>
		<br/>
		<div class="col-sm-offset-1 form-inline">
			<div class="form-group">
   	    		<label for="inputYear">년도</label>
      			<input type="text" class="form-control" name="search_year" value="<%=search_year %>" size="10"/>
      		</div>
      		<div class="form-group">
   				<label for="inputSemester" class="control-label">학기</label>
      			<input type="text" class="form-control" name="search_semester" value="<%=search_semester %>" size="10"/>
      		</div>
   			<input class="btn btn-primary btn-sm form-control" type="button" value="검색" onclick="onSearch()"/>
  		</div>
  		<br/>
	</form>
	
	<div class="container">
	<table width="75%" align="center" id="select_table" class="table table-hover table-bordered">
		<thead style="text-align:center">
		<tr class="info">
			<th>과목번호</th><th>분반</th><th>과목명</th><th>정원</th> <th>강의시간</th>
			<th>강의장소</th><th>학점</th><th>수강 학생</th>
		</tr>
		</thead>
<%			
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");            
		conn = DriverManager.getConnection(dburl, user, passwd);
		
			sql = "SELECT c_id, c_id_no FROM teach WHERE p_id = ? and t_year = ? and t_semester = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, session_id);
		pstmt.setInt(2, Integer.parseInt(search_year));
		pstmt.setInt(3, Integer.parseInt(search_semester));
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
			
			sub_sql = "SELECT s_id FROM enroll WHERE c_id = ? and c_id_no = ? and e_semester = ? and e_year = ?";
			pstmt = conn.prepareStatement(sub_sql);
			pstmt.setString(1, course_id);
			pstmt.setInt(2, course_id_no);
			pstmt.setString(3, search_semester);
			pstmt.setString(4, search_year);
			sub_rs = pstmt.executeQuery();
			while (sub_rs.next())
				current_student_num++;
			/*
			sql = "{? = call getStrDay(?)}";
			cstmt = conn.prepareCall(sql);
			cstmt.registerOutParameter(1, java.sql.Types.VARCHAR);
			cstmt.setString(2, int_course_day);
			cstmt.execute();
			str_course_day = cstmt.getString(1);*/
			
%>

		<tr>
			<td align="center"><%=course_id %></td>
			<td align="center"><%=course_id_no %></td>
			<td align="center"><%=course_name %></td>
			<td align="center"><%=current_student_num%>/<%=max_student_num %></td>
			<td align="center"><%=int_course_day %> <%=course_time %></td>
			<td align="center"><%=course_place %></td>
			<td align="center"><%=course_unit %></td>			
			<td><a class="btn btn-default btn-sm form-control" href="list_student.jsp?c_id=
			<%= course_id %>&c_id_no=<%= course_id_no %>&current_student=<%=current_student_num%>&search_semester=<%=search_semester %>&search_year=<%=search_year%>">조회</a></td>
			<% 		current_student_num = 0; %>
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
	</div>
	<br/>
	<br/>
	<div width="75%" align="center">
		<p><%=search_year %>년 <%=search_semester %>학기 강의 검색 결과 : </p>
		<p>현재 <%=total_course %>과목 강의중입니다 </p>
	</div>
</body>
</html>