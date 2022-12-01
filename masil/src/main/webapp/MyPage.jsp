<%@page import="domain.MBR"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<link rel="stylesheet" href="Mypage.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link href="https://fonts.googleapis.com/css2?family=Cutive+Mono&family=Poppins:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<title>My Page</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="Mypage.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<%@ include file="header.jsp" %>
    <div class="container">
        <div class="card">
            <div class="header">
                <a href="FavList.jsp">
                <div class="hamburger-menu"> 
                    <div class="center"></div>
                </div>
                </a>
                <a href="DogList.jsp" class="mail">
                    <i class="fa fa-paw" aria-hidden="true" style="font-size: 1.4rem;"></i>
                </a>
                <div class="main">
                    <img class="image" src="LoginForm/img/pro2.png" alt="alternative">
                    <div class="image2"></div>
                    <h3 class="name">${sessionScope.loginedMBR.mbr_id}</h3>
                    <h3 class="sub-name">PATHWAY</h3>
                </div>
            </div>
            <div class="content">
                <div class="left">
                    <div class="absolute-container">
                        <h3 class="title">About</h3>
                        <p class="text">안녕하세요! 제 강아지 자두와 산책하는걸 좋아합니다! 같이 산책하실분?</p>
                    </div>
                    <div class="icons-container">
                        <a href="#" class="icon">
                            <i class="fab fa-facebook"></i>
                        </a>
                        <a href="#" class="icon">
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a href="#" class="icon">
                            <i class="fab fa-google-plus-g"></i>
                        </a>
                        <a href="#" class="icon">
                            <i class="fab fa-twitter"></i>
                        </a>
                    </div>
                    <div class="buttons-wrap">
                        <div class="follow-wrap">
                            <a href="ChangeInfo.jsp" class="follow">정보수정</a>
                        </div>
                        <div class="share-wrap">
                            <a href="ShowRecord?mbr_nbr=${sessionScope.loginedMBR.mbr_nbr}" class="share">산책조회</a>
                        </div>
                    </div>
                </div>
                <div class="right">
                    <div>
                        <h3 class="number">골드</h3>
                        <h5 class="number-title">등급</h5>
                    </div>
                    <div>
                        <h3 class="number">24562</h3>
                        <h5 class="number-title">걸음</h5>
                    </div>
                    <div>
                        <h3 class="number">21회</h3>
                        <h5 class="number-title">산책완료</h5>
                    </div>
                </div>
                </div>
            <div class="delete">
            	  <br><br>
                  <a href="Exit" class="delete-user">회원탈퇴</a>
             </div>


        </div>
    </div>
    


</body>
</html>





    




