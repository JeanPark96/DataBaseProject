<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
   boolean stu_mode = true;
   String user_name = (String)session.getAttribute("user_name");
   String session_id= (String)session.getAttribute("user");
   if(session_id == null) {
      session_id = (String)session.getAttribute("prof");
      if(session_id != null) stu_mode = false;
   }
   String log;
%>

<% 
if (session_id == null)
log = "<a href=login.jsp>로그인</a>";
else log = "<a href=logout.jsp>로그아웃</a>"; 
%>

<nav class ="navbar navbar-default">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expand="false">
                <span class ="icon-bar"></span>
                <span class ="icon-bar"></span>
                <span class ="icon-bar"></span>
            </button>
            <a class ="navbar-brand" href="main.jsp">숙명여자대학교</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
            	<li><%=log%></li>
            	<%  if( stu_mode){ %>
                <li><a href="update.jsp">사용자 정보 수정</a></li>
                <li><a href="insert.jsp">수강 신청 입력</a></li>
                <li><a href="delete.jsp">수강 신청 삭제</a></li>
                <li><a href="select.jsp">수강 신청 조회</a></li>
                <li><a href="searchCourse.jsp">과목 조회</a></li>
                <% } 
            	else{ %>
            	 <li><a href="pro_update.jsp">사용자 정보 수정</a></li>
                <li><a href="insert.jsp">수업과목 추가</a></li>
                <li><a href="delete.jsp">수업과목 삭제</a></li>
                <li><a href="select.jsp">수업과목 조회</a></li>
                <% } %>
            </ul>
        </div>
    </nav>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
