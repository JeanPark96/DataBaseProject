<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
      Statement p_stmt=myConn.createStatement();
      

      String mySQL="select s_id from student where s_id='"+userID+"'and s_pwd='"+userPassword+"'";
      String p_mySQL = "select p_id, p_pwd, p_name from professor where p_id='" + userID + "' and p_pwd='"+ userPassword +"'";
      

      ResultSet rs=stmt.executeQuery(mySQL);
      ResultSet p_rs = p_stmt.executeQuery(p_mySQL);
      
      String ID=null;

      if(rs != null && p_rs != null){
         if (rs.next()) {
         ID=rs.getString("s_id");
         session.setAttribute("user", ID);
         
%>
            <script> 
               alert("�α��� ����!"); 
               location.href="main.jsp";  
            </script>
<%
         }
         else if (p_rs.next()) {
         ID=rs.getString("p_id");
         session.setAttribute("user", ID);
         
%>
            <script> 
               alert("�α��� ����!"); 
               location.href="main.jsp";  
            </script>
<%
         }
         else {
%>
            <script> 
               alert("���̵�/�н����带 Ȯ���ϼ���."); 
               location.href="login.jsp";  
            </script>  
<%
         }
      }   

      

      if(stmt!=null) stmt.close();

      if(myConn!=null) myConn.close();

      }catch(SQLException e){

         

      }

%>