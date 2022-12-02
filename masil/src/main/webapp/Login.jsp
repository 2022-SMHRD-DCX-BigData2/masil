<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
	<title>Animated Login Form</title>
	<link rel="stylesheet" type="text/css" href="./LoginForm/css/Login.css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
if(${param.result}==0){
	alert("정확한 아이디와 비밀번호를 입력해 주세요");
}

</script>
</head>
<body>
	<img class="wave" src="./LoginForm/img/wave.png">
	<div class="container">
		<div class="img">
			<img src="./LoginForm/img\logo.png" id="logo">
		</div>
		<div class="login-content">
			<form action="Login" method="post">
				<img src="./LoginForm/img/pro2.png">
				<h2 class="title">Welcome</h2>
           		<div class="input-div one">
           		   <div class="i">
           		   		<i class="fas fa-user"></i>
           		   </div>
           		   <div class="div">
           		   		<h5>Username</h5>
           		   		<input type="text" class="input" name="mbr_id">
           		   </div>
           		</div>
           		<div class="input-div pass">
           		   <div class="i"> 
           		    	<i class="fas fa-lock"></i>
           		   </div>
           		   <div class="div">
           		    	<h5>Password</h5>
           		    	<input type="password" class="input" name="mbr_pw">
            	   </div>
            	</div>
            	<a href="Join.jsp">회원가입</a>
            	<input type="submit" class="btn" value="SignUp">
            </form>
        </div>
    </div>
<script type="text/javascript" src="./LoginForm/js/Login.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script type="text/javascript">









</script>



</body>
</html>
