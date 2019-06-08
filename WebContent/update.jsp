<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1" >        
<link rel="stylesheet" href="css/bootstrap.css">
<title> 정보 수정 </title>
</head>
<body>
<%@ include file="./top.jsp" %>
<%
	request.setCharacterEncoding("EUC-KR");
if(stu_mode == true )
	session_id = (String) session.getAttribute("user");
else
	session_id = (String) session.getAttribute("prof");

	if(session_id == null)
		response.sendRedirect("login.jsp");
	String userID = session_id;
	Connection myConn = null;
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "db";
	String passwd = "0000";
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(dbdriver);
	myConn = DriverManager.getConnection(dburl, user, passwd);
    Statement stmt=myConn.createStatement();
    Statement p_stmt=myConn.createStatement();
	   

    String mySQL="select * from student where s_id = '" + userID + "'";
    String p_mySQL ="select * from professor where p_id='" + userID + "'";
    

    ResultSet rs=stmt.executeQuery(mySQL);
    ResultSet p_rs = p_stmt.executeQuery(p_mySQL);
%>
<br>
<form method="post" action="update_verify.jsp" class="form-horizontal">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-4 control-label">USER ID</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="s_id" value="<%=userID%>" readonly>
    </div>
  </div>
  <%
	while(rs.next() != false){ 
		String s_pwd = rs.getString("s_pwd");
		String s_name =rs.getString("s_name");
		String s_email = rs.getString("s_email");
		
		
		%>
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
 <%
 }
	  while(p_rs.next() != false){ 
			String p_pwd = p_rs.getString("p_pwd");
			String p_name =p_rs.getString("p_name");
			String p_email = p_rs.getString("p_email");						
			%>
	  <div class="form-group">
	    <label for="inputPassword3" class="col-sm-4 control-label">NAME</label>
	    <div class="col-sm-4">
	      <input type="text" class="form-control" name="s_name" value="<%=p_name%>">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="inputPassword4" class="col-sm-4 control-label">PASSWORD</label>
	    <div class="col-sm-4">
	      <input type="password" class="form-control" name="s_pwd" value="<%=p_pwd%>">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="inputPassword5" class="col-sm-4 control-label">EMAIL</label>
	    <div class="col-sm-4">
	      <input type="email" class="form-control" name="s_email" value="<%=p_email%>">
	    </div>
	  </div>
	 <%  
  }
%> 


  <div class="form-group">
    <div class="col-sm-offset-4 col-sm-2">
      <input type="submit" class="btn btn-primary btn-block" name="modify" value="수 정" >
    </div>
    <div class="col-sm-2">
      <input type="button" class="btn btn-primary btn-block" value="취소" onclick="javascript:window.location='main.jsp'">   
    </div>
  </div>
</form>
</body>
</html>