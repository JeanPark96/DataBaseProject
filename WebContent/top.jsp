<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% String session_id = (String) session.getAttribute("user");
String log;
if (session_id == null)
log = "<a href=login.jsp>�α���</a>";
else log = "<a href=logout.jsp>�α׾ƿ�</a>"; %>
<nav class ="navbar navbar-default">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expand="false">
                <span class ="icon-bar"></span>
                <span class ="icon-bar"></span>
                <span class ="icon-bar"></span>
            </button>
            <a class ="navbar-brand" href="main.jsp">�����ڴ��б�</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
            	<li><%=log%></li>
                <li><a href="update.jsp">����� ���� ����</a></li>
                <li><a href="insert.jsp">���� ��û �Է�</a></li>
                <li><a href="delete.jsp">���� ��û ����</a></li>
                <li><a href="select.jsp">���� ��û ��ȸ</a></li>
                <li><a href="searchCourse.jsp">���� ��ȸ</a></li>
            </ul>
        </div>
    </nav>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
