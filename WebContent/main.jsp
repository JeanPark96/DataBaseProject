<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1" >        
<link rel="stylesheet" href="css/bootstrap.css">
<title>�����ͺ��̽��� Ȱ���� ������û �ý����Դϴ�.</title>
</head>
<body class="text-center">
<%@include file="top.jsp"%>
<table width="75%" align="center" height="100%">
<% if (session_id != null) { %>
<tr> <td align="center"><%=session_id%>�� �湮�� ȯ���մϴ�.</td> </tr>
<% } else { %>
<tr> <td align="center">�α����� �� ����ϼ���.</td> </tr>
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
