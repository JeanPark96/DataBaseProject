<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1" >        
<link rel="stylesheet" href="css/bootstrap.css">
<title>강사 사용자 정보 수정</title>
</head>
<body>
<%@ include file="top.jsp" %>
<%
	request.setCharacterEncoding("EUC-KR");
	session_id = (String) session.getAttribute("prof");
	if(session_id == null)
		response.sendRedirect("login.jsp");
	String profID = session_id;
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
	mySQL = "select * from professor where p_id = '" + profID + "'";
	ResultSet myResultSet = stmt.executeQuery(mySQL);
%>
<br><br><br>
<form method="post" action="pro_update_verify.jsp" class="form-horizontal">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-4 control-label">USER ID</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="p_id" value="<%=profID%>" readonly>
    </div>
  </div>
  <%
	while(myResultSet.next() != false){ 
		String p_pwd = myResultSet.getString("p_pwd");
		String p_name =myResultSet.getString("p_name");
		String p_college = myResultSet.getString("p_college"); 
		String p_major = myResultSet.getString("p_major");
		String p_email = myResultSet.getString("p_email");
		%>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-4 control-label">NAME</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="p_name" value="<%=p_name%>">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword4" class="col-sm-4 control-label">PASSWORD</label>
    <div class="col-sm-4">
      <input type="password" class="form-control" name="p_pwd" value="<%=p_pwd%>">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-4 control-label">COLLEGE</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="p_college" value="<%=p_college%>">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-4 control-label">MAJOR</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="p_major" value="<%=p_major%>">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword5" class="col-sm-4 control-label">EMAIL</label>
    <div class="col-sm-4">
      <input type="email" class="form-control" name="p_email" value="<%=p_email%>">
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