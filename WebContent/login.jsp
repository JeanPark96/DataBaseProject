<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1" >        
<link rel="stylesheet" href="css/bootstrap.css">
<title>���� ��û �ý��� �α���</title>
</head>
<body class="text-center">
    <div class="container">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
                <form method = "post" action="login_verify.jsp">
                    <h2 style="text-align:center;">LOG IN</h2>
                    <div class ="form-group">
                        <input type ="text" class="form-control" placeholder="���̵�" name ="userID" maxlength='20'>
                    </div>
                    <div class ="form-group">
                        <input type ="password" class="form-control" placeholder="��й�ȣ" name ="userPassword" maxlength='20'>
                    </div>
                    <input type="submit" class="btn btn-primary form-control" value="�α���">
                </form>
            </div> 
        </div> 
        <div class="col-lg-4"></div>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>
