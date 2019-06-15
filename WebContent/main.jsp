<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1" >        
<link rel="stylesheet" href="css/bootstrap.css">
<title>데이터베이스를 활용한 수강신청 시스템입니다.</title>
</head>
<body class="text-center">
<%@include file="top.jsp"%>
<table width="75%" align="center" height="100%">
<% if (session_id != null) { %>
<tr> <td align="center"><%=session_id%>님 방문을 환영합니다.</td> </tr>
<% } else { %>
<tr> <td align="center">로그인한 후 사용하세요.</td> </tr>
<% } %>
</table>
<br><br>
<% if (session_id != null) { %>
<img src="noonsong2.jpg" width="220px" height="220px" style="text-align:center">
<% } else { %>
<img src="noonsong.jpg" width="220px" height="220px" style="text-align:center">
<% } %>


</body>
</html>
