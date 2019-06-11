<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1" >        
<link rel="stylesheet" href="css/bootstrap.css">
<title>수강신청 사용자 정보 수정</title>
</head>
<body>
<%@ include file="./top.jsp" %>
<%
	request.setCharacterEncoding("EUC-KR");
	session_id = (String) session.getAttribute("user");
	if(session_id == null)
		response.sendRedirect("login.jsp");
	String studentID = session_id;
	Connection myConn = null;
	Statement stmt = null;
	String mySQL = null;
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "db";
	String passwd = "0000";
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(dbdriver);
	myConn = DriverManager.getConnection(dburl, user, passwd);
	stmt = myConn.createStatement();
	mySQL = "select * from student where s_id = '" + studentID + "'";
	ResultSet myResultSet = stmt.executeQuery(mySQL);
%>
<br><br><br>
<form method="post" action="update_verify.jsp" class="form-horizontal">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-4 control-label">USER ID</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="s_id" value="<%=studentID%>" readonly>
    </div>
  </div>
  <%
	while(myResultSet.next() != false){ 
		String s_pwd = myResultSet.getString("s_pwd");
		String s_name =myResultSet.getString("s_name");
		String s_email = myResultSet.getString("s_email");%>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-4 control-label">NAME</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="s_name" value="<%=s_name%>">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword4" class="col-sm-4 control-label">PASSWORD</label>
    <div class="col-sm-4">
      <input type="password" class="form-control" name="s_pwd" value="<%=s_pwd%>">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword5" class="col-sm-4 control-label">EMAIL</label>
    <div class="col-sm-4">
      <input type="email" class="form-control" name="s_email" value="<%=s_email%>">
    </div>
  </div>
  <%}
%> 
  <div class="form-group">
    <div class="col-sm-offset-4 col-sm-2">
      <input type="submit" class="btn btn-primary btn-block" name="modify" value="수정" >
    </div>
    <div class="col-sm-2">
      <input type="button" class="btn btn-primary btn-block" value="취소" onclick="javascript:window.location='main.jsp'">   
    </div>
  </div>
</form>
</body>
</html>