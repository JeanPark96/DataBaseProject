<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����ͺ��̽��� Ȱ���� ������û �ý����Դϴ�.</title>
</head>
<body>
<%@ include file="top.jsp" %>
   <table width="75%" align="center" height="68%" id="main_table">
      <% 
      String prof = "";
      if(stu_mode == false ) prof = "����";
      if (session_id!= null) { %>
      <tr>
         <td align="center"><b><%=user_name%><%=prof%>��</b> �湮��ȯ���մϴ�.</td> 
      </tr>
      <% } else { %>
      <tr>
         <td align="center">�α��� �� �� ����ϼ���.<br/><br/><br/>
         <a href="login.jsp" id="main_a">�α���</a>
         </td>
      </tr>
      <%
      }
      %>
   </table>
</body>