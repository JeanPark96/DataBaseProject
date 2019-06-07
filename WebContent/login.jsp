<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1" >        
<link rel="stylesheet" href="css/bootstrap.css">
<title>수강 신청 시스템 로그인</title>
</head>
<body class="text-center">
    <div class="container">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
                <form method = "post" action="login_verify.jsp">
                    <h2 style="text-align:center;">LOG IN</h2>
                    <div class ="form-group">
                        <input type ="text" class="form-control" placeholder="아이디" name ="userID" maxlength='20'>
                    </div>
                    <div class ="form-group">
                        <input type ="password" class="form-control" placeholder="비밀번호" name ="userPassword" maxlength='20'>
                    </div>
                    <input type="submit" class="btn btn-primary form-control" value="로그인">
                </form>
            </div> 
        </div> 
        <div class="col-lg-4"></div>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>
