<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<html>
<head>
<title>수강신청 사용자 정보 수정 확인</title></head>
<%

String formId = request.getParameter("id");
String formPass = request.getParameter("password");
String confirmPass = request.getParameter("passwordConfirm");
String formAddr = request.getParameter("address");
String st = request.getParameter("mode");
         
Connection myConn = null;
         String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
         String user = "db";   String passwd = "0000";
         String dbdriver = "oracle.jdbc.driver.OracleDriver";
	 	 Class.forName(dbdriver);
		 PreparedStatement pstmt = null;
		 PreparedStatement p_pstmt = null;
	     
	     try {
	    	 
		 	 myConn = DriverManager.getConnection(dburl, user, passwd);
	    	
		 	 if(st.equals("false")){
	    		String p_mySQL = "UPDATE professor SET s_pwd=?, s_name=?, s_email=? WHERE p_id=?";
	    		 p_pstmt = myConn.createStatement(p_mySQL);
	    		 p_pstmt.setString(1, p_pwd);
			     p_pstmt.setString(2, p_name);
			     p_pstmt.setString(3, p_email);
			     p_pstmt.setString(4, p_id);
			     p_pstmt.executeUpdate();
	    	 }
	    	 else{
	    		String mySQL = "UPDATE student SET s_pwd=?, s_name=?, s_email=? WHERE s_id=?";
					pstmt = myConn.prepareStatement(mySQL);
					 pstmt.setString(1, s_pwd);
			    	 pstmt.setString(2, s_name);
			    	 pstmt.setString(3, s_email);
			    	 pstmt.setString(4, s_id);
					pstmt.executeUpdate();
		
				}
	    		    	
	    	}
	    		 
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
			sMessage = "암호는 최소 4자리 이상이어야 합니다.";
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