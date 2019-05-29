<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<html>
<head>
<title>수강신청 사용자 정보 수정 확인</title></head>
<%
		 //request.setCharacterEncoding("EUC-KR");
         String s_id = request.getParameter("s_id");
         String s_pwd = request.getParameter("s_pwd");
         String s_name= new String(request.getParameter("s_name").getBytes("8859_1"),"EUC-KR");
  
         String s_email =request.getParameter("s_email");
         Connection myConn = null;
         Statement stmt = null;
         String mySQL = ""; 
      
         String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
         String user = "db";   String passwd = "0000";
         String dbdriver = "oracle.jdbc.driver.OracleDriver";
	 	 Class.forName(dbdriver);
	 	 myConn = DriverManager.getConnection(dburl, user, passwd);
		 PreparedStatement pstmt = null;
		 stmt = myConn.createStatement();
		 mySQL = "UPDATE student SET s_pwd=?, s_name=?, s_email=? WHERE s_id=?";
	     
	   /* mySQL = mySQL+ "SET s_pwd='" + s_pwd +"',";
	     mySQL = mySQL + "s_name='"+ s_name + "',";
	     mySQL = mySQL + "s_email='"+ s_email +"'WHERE s_id='" + s_id + "'";*/
	     try {
	    	 pstmt = myConn.prepareStatement(mySQL);
	    	 pstmt.setString(1, s_pwd);
	    	 pstmt.setString(2, s_name);
	    	 pstmt.setString(3, s_email);
	    	 pstmt.setString(4, s_id);
	    	 ResultSet rs = pstmt.executeQuery();

			//stmt.executeUpdate(mySQL);
	%>
	<script>
	   alert("학생정보가 수정되었습니다." );
	   location.href = "update.jsp";
	</script>
	<%
	}
	  catch(SQLException ex) {
	     	String sMessage;
		if(ex.getErrorCode() == 20002)
			sMessage = "암호는 4자리 이상이어야 합니다.";
		else if(ex.getErrorCode() == 20003)
			sMessage = "암호에 공란은 입력되지 않습니다.";
		else
			sMessage = "잠시 후 다시 시도하십시오" ;
	%>
	<script>
	    alert("<%=sMessage%>" );
	    location.href = "update.jsp";
	</script>
<% }%>

</body>
</html>