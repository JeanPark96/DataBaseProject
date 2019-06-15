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
	<title>과목 검색</title>
	
</head>
<body>
<% 
	request.setCharacterEncoding("EUC-KR");
	String val= request.getParameter("val");
	String option=request.getParameter("option");
	if (option == null)
		option = "all";

	
	String course_id;
	String course_major;
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
	Statement stmt=null;
	ResultSet rs = null;
	ResultSet sub_rs = null;
	String sql;
	String sub_sql;
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "db";                                       
	String passwd = "0000";
%>
	
	<form method="post" width="75%" align="center" id="search" action="searchCourse.jsp"> 
		<br/>
		<br/>
		<div class="col-sm-offset-1 form-inline">
		<select class="form-control" name="option" id="optionSelect">
 			<option class="form-control" value="all">전체</option>
			<option class="form-control" value="c_id">과목 번호</option>
			<option class="form-control" value="c_name">과목 이름</option>
			<option class="form-control" value="c_major">전공</option></select>
		<input class="form-control" name="val" id="enterValue" size="30">
	    <button class="btn btn-primary btn-sm form-control">검색</button>
  		</div>
  		<br/>   
	</form>
	<script>
		document.getElementById("optionSelect").value = "<%=option%>";
		document.getElementById("enterValue").value = "<%=val%>";
	</script>
	<div class="container">
	<table width="75%" align="center" id="select_table" class="table table-hover table-bordered">
		<thead style="text-align:center">
		<tr class="info">
			<th>과목번호</th><th>분반</th><th>과목 이름</th><th>전공</th><th>강사</th> <th>강의시간</th>
			<th>강의장소</th><th>학점</th>
		</tr>
		</thead>

<%			
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");            
		conn = DriverManager.getConnection(dburl, user, passwd);
		stmt = conn.createStatement();
		
		sql = "select * from course";
		if(option.equals("c_id")) {
			sql = "select * from course where c_id LIKE '%" + val + "%'";
		} else if(option.equals("c_name")){
			sql = "select * from course where c_name LIKE '%" + val + "%'";
		} else if(option.equals("c_major")){
			sql = "select * from course where c_major LIKE '%" + val + "%'";
		}
			
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			course_id = rs.getString("c_id");
			course_id_no= rs.getInt("c_id_no");
			course_name = rs.getString("c_name");
			course_unit = rs.getInt("c_unit");
			course_major=rs.getString("c_major");
			
			sub_sql = "SELECT p_id, t_day, t_time, t_room, t_max FROM teach WHERE c_id = ? and c_id_no=?";
			pstmt = conn.prepareStatement(sub_sql);
			pstmt.setString(1, course_id);
			pstmt.setInt(2, course_id_no);
			sub_rs = pstmt.executeQuery();
			if (sub_rs.next()) {
				professor_id = sub_rs.getString("p_id");
				int_course_day = sub_rs.getString("t_day");		
				
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
			<td align="center"><%=course_major %></td>
			<td align="center"><%=professor_name %></td>
			<td align="center"><%=int_course_day %> <%=course_time %></td>
			<td align="center"><%=course_place %></td>
			<td align="center"><%=course_unit %></td>
			
	<%
	}
		
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
</body>
</html>