<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>데이터베이스를 활용한 수강신청 시스템입니다.</title>
</head>
<body>
<%@ include file="top.jsp" %>
   <table width="75%" align="center" height="68%" id="main_table">
      <% 
      String prof = "";
      if(stu_mode == false ) prof = "교수";
      if (session_id!= null) { %>
      <tr>
         <td align="center"><b><%=user_name%><%=prof%>님</b> 방문을환영합니다.</td> 
      </tr>
      <% } else { %>
      <tr>
         <td align="center">로그인 한 후 사용하세요.<br/><br/><br/>
         <a href="login.jsp" id="main_a">로그인</a>
         </td>
      </tr>
      <%
      }
      %>
   </table>
</body>