<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<html>
<head>
<title>강사 사용자 정보 수정 확인</title></head>
<%
         String p_id = request.getParameter("p_id");
         String p_pwd = request.getParameter("p_pwd");
         String p_name= new String(request.getParameter("p_name").getBytes("8859_1"),"EUC-KR");
         String p_college= new String(request.getParameter("p_college").getBytes("8859_1"),"EUC-KR");
         String p_major= new String(request.getParameter("p_major").getBytes("8859_1"),"EUC-KR");
         String p_email =request.getParameter("p_email");
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
		 mySQL = "UPDATE professor SET p_pwd=?, p_name=?, p_email=?, p_college=?, p_major=? WHERE p_id=?";
	     
	     try {
	    	 pstmt = myConn.prepareStatement(mySQL);
	    	 pstmt.setString(1, p_pwd);
	    	 pstmt.setString(2, p_name);
	    	 pstmt.setString(3, p_email);
	    	 pstmt.setString(4, p_college);
	    	 pstmt.setString(5, p_major);
	    	 pstmt.setString(6, p_id);
	    	 int rs = pstmt.executeUpdate();
	%>
	<script>
	   alert("강사정보가 수정되었습니다." );
	   location.href = "pro_update.jsp";
	</script>
	<%
	}
	  catch(SQLException ex) {
	     	String sMessage;
		if(ex.getErrorCode() == 20002)
			sMessage = "암호는 최소 4자리 이상이어야 합니다.";
		else if(ex.getErrorCode() == 20003)
			sMessage = "암호에 공란은 입력되지 않습니다.";
		else
			sMessage = "잠시 후 다시 시도하십시오" ;
	%>
	<script>
	    alert("<%=sMessage%>" );
	    location.href = "pro_update.jsp";
	</script>
<% }%>

</body>
</html>