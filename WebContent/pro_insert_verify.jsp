<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*, java.text.*" %>
<html>
<head>
<title>수강 신청 입력</title>
</head>
<body>
<% 
   request.setCharacterEncoding("EUC-KR");
   String dbdriver = "oracle.jdbc.driver.OracleDriver"; 
   Class.forName(dbdriver);
   Connection myConn = null; 
   
   String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
   String user="db";  
   String passwd="0000";
     
   String result = null;

   Statement stmt = null; ResultSet rs = null;
   CallableStatement cstmt = null;

   String sql = null;
   String c_id = null;
   
   String c_name = request.getParameter("c_name");
   String id = request.getParameter("id");
   int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));
   int c_unit = Integer.parseInt(request.getParameter("c_unit"));
   int t_max = Integer.parseInt(request.getParameter("t_max"));
   String t_room = request.getParameter("t_room");
   String t_time = request.getParameter("t_time");
   String t_day = request.getParameter("t_day");


        Class.forName(dbdriver);
         myConn =  DriverManager.getConnection (dburl, user, passwd);
         stmt = myConn.createStatement();
         
         sql = "select c_id from course where c_name = '" + c_name + "'";
         
         rs = stmt.executeQuery(sql);
    
            while(rs.next() != false){
               c_id = rs.getString("c_id");
               result = c_id;
            }
            stmt.close();

            if(c_id == null){

              System.out.println("해당 과목이 존재하지 않습니다.");

            }
            else{
            System.out.println(c_name+'\t'+c_id+'\t'+c_id_no+'\t'+t_day+'\t'+t_time+'\t'+t_room+'\t'+t_max);
            
            cstmt = myConn.prepareCall("{call Insertlecture(?,?,?,?,?,?,?,?)}"); 

          cstmt.setString(1, id); 

          cstmt.setString(2, c_id);

          cstmt.setInt(3, c_id_no);

          cstmt.setString(4, t_day); 

          cstmt.setString(5, t_time); 

          cstmt.setString(6, t_room); 

          cstmt.setInt(7, t_max);

          cstmt.registerOutParameter(8, java.sql.Types.VARCHAR); 
          
            try{
               cstmt.execute();
         
         result = cstmt.getString(8);
         %>
         <script>
            alert("<%=result%>");
           location.href="pro_insert.jsp";
         </script>
         <%
         }catch(SQLException ex) {
        System.err.println("SQLException: " + ex.getMessage());
    }finally {
              if(stmt != null){
                 try{myConn.close();
                    stmt.close();
                 }catch(SQLException ex) { 
                     out.print("에러");
              }
              
          }
          }
          }%>
</body>

