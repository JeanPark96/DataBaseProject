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
   <td align="center"><b><a href="update.jsp" id="top_a">����� ���� ����</b></td>
<%   if( stu_mode == false ) {
%>
   <td align="center"><b><a href="insert.jsp" id="top_a">�������� �߰�</b></td>
   <td align="center"><b><a href="delete.jsp" id="top_a">�������� ����</b></td>
   <td align="center"><b><a href="select.jsp" id="top_a">�������� ��ȸ</b></td>
<%  }
   else {
%>
   <td align="center"><b><a href="insert.jsp" id="top_a">������û �Է�</b></td>
   <td align="center"><b><a href="delete.jsp" id="top_a">������û ����</b></td>
   <td align="center"><b><a href="select.jsp" id="top_a">������û ��ȸ</b></td>
<%  }
%>