<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="Edit.css">
    <title>Document</title>
</head>
<body>
<%@ include file="header.jsp" %>
    <form action="#" method="POST" class="joinForm" onsubmit="DoJoinForm__submit(this);">
                                                                                                
        <h2>회원정보수정</h2>
        <!-- <div class="textForm">
        <input name="loginId" type="text" class="id" placeholder="아이디">
        </input>
        </div> -->
        <div class="textForm">
        <input name="loginPw" type="password" class="pw" placeholder="비밀번호 변경">
        </div>
        <!-- <div class="textForm">
        <input name="loginPwConfirm" type="password" class="pw" placeholder="비밀번호 확인">
        </div>
        <div class="textForm">
        <input name="name" type="password" class="name" placeholder="이름">
        </div>
        <div class="textForm">
        <input name="email" type="text" class="email" placeholder="이메일">
        </div> -->
        <!-- <div class="textForm">
        <input name="nickname" type="text" class="nickname" placeholder="닉네임">
        </div> -->
        <!-- <div class="textForm">
        <input name="area" type="select" class="area" placeholder="지역">
        <input name="area" type="select" class="area" placeholder="지역">
        </div> -->
        <input type="submit" class="btn" value="정보수정"/>
        <input type="submit" class="btn" value="회원탈퇴"/>

    </form>



</body>
</html>