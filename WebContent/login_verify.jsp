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
      String p_mySQL = "select p_id from professor where p_id='" + userID + "' and p_pwd='"+ userPassword +"'";
      

      ResultSet rs=stmt.executeQuery(mySQL);
      ResultSet p_rs = p_stmt.executeQuery(p_mySQL);
      
      String ID=null;

      if (p_rs.next()) {
          ID=p_rs.getString("p_id");
          session.setAttribute("prof", ID);         
 %>
             <script> 
             alert("�α��� ����!"); 
             location.href="main.jsp"; 
             </script>

<%
         }
         else if (rs.next()) {
             ID=rs.getString("s_id");
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
               alert("���̵� Ȥ�� �н����尡 ��ġ���� �ʽ��ϴ�."); 
               location.href="login.jsp";  
            </script>  
<%
         }
         

      

      if(stmt!=null) stmt.close();

      if(myConn!=null) myConn.close();

      }catch(SQLException e){

         

      }

%>