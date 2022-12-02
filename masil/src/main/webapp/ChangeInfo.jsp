<%@page import="domain.MBR"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="Edit.css">
    <title>회원정보수정</title>
</head>
<body>
<%
MBR loginedMBR = (MBR) session.getAttribute("loginedMBR");
%>
<%@ include file="header.jsp" %>
    <form action="ChangePW" method="POST" class="joinForm" onsubmit="DoJoinForm__submit(this);">
                                                                                                
        <h2>회원정보수정</h2>

        <div class="textForm">
        <input type="hidden" name="mbr_nbr" value="${loginedMBR.mbr_nbr}">
        <input type="password"  name="PW" class="pw" placeholder="비밀번호 변경">
        </div>
      
        <input type="submit" class="btn" value="정보수정"/>
        
        </form>



</body>
</html>