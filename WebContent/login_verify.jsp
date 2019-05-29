<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
		Boolean isTrue=false;
		String userID=request.getParameter("userID");
		String userPassword=request.getParameter("userPassword");
		
		try{
		String dbdriver = "oracle.jdbc.driver.OracleDriver";
		String dburl ="jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "db";
		String passwd ="0000";
		Class.forName(dbdriver);
		Connection myConn=DriverManager.getConnection(dburl, user, passwd);
		Statement stmt=myConn.createStatement();
		
		String mySQL="select s_id from student where s_id='"+userID+"'and s_pwd='"+userPassword+"'";
		
		ResultSet rs=stmt.executeQuery(mySQL);
		String ID=null;
		if(rs.next()){
			isTrue=true;
			ID=rs.getString("s_id");
		}
		if(isTrue){
			session.setAttribute("user",ID);
			%> <script> location.href="main.jsp"</script> <%
		}else{
			session.invalidate();
			%><script> location.href="login.jsp"</script> <%
		}
		
		if(stmt!=null) stmt.close();
		if(myConn!=null) myConn.close();
		}catch(SQLException e){
			
		}
%>