<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"  %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1" >        
<link rel="stylesheet" href="css/bootstrap.css">
      <title>������û �Է�</title>
      <link rel="stylesheet" type="text/css" href='mystyle.css' />
   </head>
<body>
<%@ include file="top.jsp" %>
<%    
   request.setCharacterEncoding("EUC-KR");
   if (session_id==null) response.sendRedirect("login.jsp");  
%> 
	<div class="container">
      <table id = "insert" class="table table-bordered">
      <br>
         <tr>
            <th>�����</th>
            <th>����</th>
            <th>�й�</th>
            <th>���� �ð�</th>
            <th>���ǽ�</th>
            <th>�ο�</th>
             <th>���� �߰�</th>
         </tr>
         <tr></tr><tr></tr><tr></tr>
         <tr></tr><tr></tr><tr></tr>
         <tr>   </tr>
         <tbody style="text-align:center">
         <form action="pro_insert_verify.jsp?id=<%=session_id%>" method="post">
            <td><br><input class="form-control" type="text" name="c_name"></td>
            <td style="text-align:center"><br><input class="form-control" type="text" name="c_unit" value="3"  ></td>
            <td align="center"><br><input class="form-control" type="text" name="c_id_no"></td>
            <td align="center" style="width:110px">
                  <select class="form-control" name="t_day"style="width:130px">
                      <option value="��,��">��,��</option>

                      <option value="ȭ,��">ȭ,��</option>

                     <option value="��,��">��,��</option></select>   
                  </select>
                  <br>
                  <select class="form-control" name="t_time">

             <option value="09:00-10:15">09:00-10:15</option>

             <option value="10:30-11:45">10:30-11:45</option>

            <option value="12:00-13:15">12:00-13:15</option>

            <option value="13:30-14:45">13:30-14:45</option>

            <option value="15:00-16:15">15:00-16:15</option>

            <option value="16:30-17:45">16:30-17:45</option>

            <option value="18:00-19:15">18:00-19:15</option></select>   
            <td align="center" style="width:130px"><br>
            <select class="form-control" name="t_room">

             <option value="���305">���305</option>

             <option value="���308">���308</option>

            <option value="���309">���309</option>

            <option value="���408">���408</option>

            <option value="���409">���409</option>

            <option value="���413">���413</option>

            <option value="���416">���416</option>

            <option value="���509">���509</option>

            <option value="���514">���514</option>

            <option value="���516">���516</option></select>   
            <td align="center"><br><input class="form-control" type="text" name="t_max"  ></td>
            
            <td align="center"><br><input class="btn btn-default btn-sm form-control" type="submit" value="�߰�" id = "button"></td>
         </form>
         </tr>
         </tbody>
         </table>
         </div>
