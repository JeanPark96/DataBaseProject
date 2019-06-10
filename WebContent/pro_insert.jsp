<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"  %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1" >        
<link rel="stylesheet" href="css/bootstrap.css">
      <title>수강신청 입력</title>
      <link rel="stylesheet" type="text/css" href='mystyle.css' />
   </head>
<body>
<%@ include file="top.jsp" %>
<%    
   request.setCharacterEncoding("EUC-KR");
   if (session_id==null) response.sendRedirect("login.jsp");  
%> 
      <table width="75%" align="center" id = "insert">
      <br>
         <tr>
            <th>과목명</th>
            <th>학점</th>
            <th>분반</th>
            <th>수업 시간</th>
            <th>강의실</th>
            <th>인원</th>
             <th>강의 추가</th>
         </tr>
         <tr></tr><tr></tr><tr></tr>
         <tr></tr><tr></tr><tr></tr>
         <tr>   </tr>
         <form action="pro_insert_verify.jsp?id=<%=session_id%>" method="post">
            <td align="center"><input type="text" name="c_name"></td>
            <td align="center"><input type="text" name="c_unit" value="3" style="width:50px"></td>
            <td align="center"><input type="text" name="c_id_no" style="width:50px"></td>
            <td align="center" style="width:110px">
                  <select name="t_day"style="width:100px">
                      <option value="월,수">월,수</option>

                      <option value="화,목">화,목</option>

                     <option value="수,금">수,금</option></select>   
                  </select>
                  <select name="t_time">

             <option value="09:00-10:15">09:00-10:15</option>

             <option value="10:30-11:45">10:30-11:45</option>

            <option value="12:00-13:15">12:00-13:15</option>

            <option value="13:30-14:45">13:30-14:45</option>

            <option value="15:00-16:15">15:00-16:15</option>

            <option value="16:30-17:45">16:30-17:45</option>

            <option value="18:00-19:15">18:00-19:15</option></select>   
            <td align="center" style="width:110px">
            <select name="t_room">

             <option value="명신305">명신305</option>

             <option value="명신308">명신308</option>

            <option value="명신309">명신309</option>

            <option value="명신408">명신408</option>

            <option value="명신409">명신409</option>

            <option value="명신413">명신413</option>

            <option value="명신416">명신416</option>

            <option value="명신509">명신509</option>

            <option value="명신514">명신514</option>

            <option value="명신516">명신516</option></select>   
            <td align="center"><input type="text" name="t_max" style="width:50px" ></td>
            
            <td align="center"><input type="submit" value="추가" id = "button"></td>
         </form>
         </tr>
