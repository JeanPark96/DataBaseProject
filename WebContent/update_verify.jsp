<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<html>
<head>
<title>������û ����� ���� ���� Ȯ��</title></head>
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
	   alert("�л������� �����Ǿ����ϴ�." );
	   location.href = "update.jsp";
	</script>
	<%
	}
	  catch(SQLException ex) {
	     	String sMessage;
		if(ex.getErrorCode() == 20002)
			sMessage = "��ȣ�� 4�ڸ� �̻��̾�� �մϴ�.";
		else if(ex.getErrorCode() == 20003)
			sMessage = "��ȣ�� ������ �Էµ��� �ʽ��ϴ�.";
		else
			sMessage = "��� �� �ٽ� �õ��Ͻʽÿ�" ;
	%>
	<script>
	    alert("<%=sMessage%>" );
	    location.href = "update.jsp";
	</script>
<% }%>

</body>
</html>