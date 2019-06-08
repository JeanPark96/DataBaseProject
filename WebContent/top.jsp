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
<table width="75%" align="center" bgcolor="#FFFF99" border>
<table width="75%" align="center" id="top_nav">
   <tr>
   <td align="center"><b><a href="update.jsp" id="top_a">사용자 정보 수정</b></td>
<%   if( stu_mode == false ) {
%>
   <td align="center"><b><a href="insert.jsp" id="top_a">수업과목 추가</b></td>
   <td align="center"><b><a href="delete.jsp" id="top_a">수업과목 삭제</b></td>
   <td align="center"><b><a href="select.jsp" id="top_a">수업과목 조회</b></td>
<%  }
   else {
%>
   <td align="center"><b><a href="insert.jsp" id="top_a">수강신청 입력</b></td>
   <td align="center"><b><a href="delete.jsp" id="top_a">수강신청 삭제</b></td>
   <td align="center"><b><a href="select.jsp" id="top_a">수강신청 조회</b></td>
<%  }
%>