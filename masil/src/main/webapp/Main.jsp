<%@page import="domain.MBR"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE HTML>
<html>
<head>
<title>PATHWAY</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- SEO Meta Tags -->
    <meta name="description" content="Tivo is a HTML landing page template built with Bootstrap to help you crate engaging presentations for SaaS apps and convert visitors into users.">
    <meta name="author" content="Inovatik">

    <!-- OG Meta Tags to improve the way the post looks when you share the page on LinkedIn, Facebook, Google+ -->
	<meta property="og:site_name" content="" /> <!-- website name -->
	<meta property="og:site" content="" /> <!-- website link -->
	<meta property="og:title" content=""/> <!-- title shown in the actual shared post -->
	<meta property="og:description" content="" /> <!-- description shown in the actual shared post -->
	<meta property="og:image" content="" /> <!-- image link, make sure it's jpg -->
	<meta property="og:url" content="" /> <!-- where do you want your post to link to -->
	<meta property="og:type" content="article" />

    <!-- Website Title -->
    <title>main</title>
    
    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700&display=swap&subset=latin-ext" rel="stylesheet">
    <link href="./main_css/main_bo.css" rel="stylesheet">
    <link href="./main_css/main_fontawesome-all.css" rel="stylesheet">
    <link href="./main_css/main_swiper.css" rel="stylesheet">
	<link href="./main_css/main_magnific-popup.css" rel="stylesheet">
	<link href="./main_css/main_st.css" rel="stylesheet">
</head>
	
	

<!-- 로그인 세션 확인 -->
<%
MBR loginedMBR = (MBR) session.getAttribute("loginedMBR");
%>

<!--  
<c:if test="${loginedMBR.mbr_type eq 'ADMIN'}">
	<c:import url="Admin.jsp"/>
</c:if>
-->


<body data-spy="scroll" data-target=".fixed-top">
    
    <!-- Preloader -->
	<div class="spinner-wrapper">
        <div class="spinner">
            <div class="bounce1"></div>
            <div class="bounce2"></div>
            <div class="bounce3"></div>
        </div>
    </div>
    <!-- end of preloader -->
    


    <!-- Header -->
    <header id="header" class="header">
        <div class="header-content">
            <div class="container">
                <div class="row">
                    <div class="image-container">
                        <div class="img-wrapper">
                            <img class="img-fluid" src="./main_img/kmain.gif" alt="alternative">
                        </div> <!-- end of img-wrapper -->
                    </div> <!-- end of image-container -->
                </div> <!-- end of row -->
            </div> <!-- end of container -->
        </div> <!-- end of header-content -->
        <div class="pat">
            <h1>PATHWAY</h1>
            <p class="p-large">다니는 산책로가 지겨워지셨나요? <br> 새로운 산책로를 알려드릴게요😊</p>
            <!-- 로그인 연결 -->
			<c:if test="${empty loginedMBR}">
				<a class="btn-solid-lg page-scroll" href="Login.jsp">SIGN UP</a>
			</c:if>
			<c:if test="${not empty loginedMBR}">
				<a class="btn-solid-lg page-scroll" href="Logout">LOGOUT</a>
			</c:if>
            
        </div>
    </header> <!-- end of header -->
    <svg class="header-frame" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none" viewBox="0 0 1920 310"><defs><style>.cls-1{fill:#2FD599;}</style></defs><title>header-frame</title><path class="cls-1" d="M0,283.054c22.75,12.98,53.1,15.2,70.635,14.808,92.115-2.077,238.3-79.9,354.895-79.938,59.97-.019,106.17,18.059,141.58,34,47.778,21.511,47.778,21.511,90,38.938,28.418,11.731,85.344,26.169,152.992,17.971,68.127-8.255,115.933-34.963,166.492-67.393,37.467-24.032,148.6-112.008,171.753-127.963,27.951-19.26,87.771-81.155,180.71-89.341,72.016-6.343,105.479,12.388,157.434,35.467,69.73,30.976,168.93,92.28,256.514,89.405,100.992-3.315,140.276-41.7,177-64.9V0.24H0V283.054Z"/></svg>
    <!-- end of header -->


 <!-- Description -->
 <div class="cards-1">
    <div class="container">

        <div class="row">
            <div class="col-lg-12">

                <!-- Card -->
                <div class="card">
                    <div class="card-image">
                        <!-- 목적지연결 -->
                        <a href="Writing?area_nbr=${loginedMBR.area_nbr_for_mbr}&wrt_type=4"><img class="img-fluid1" src="./main_img/walking.png" alt="alternative"></a>
                    </div>
                    <div class="card-body">
                        <h4 class="card-title">PATH</h4>
                        <p>목적지/경로 보러가기</p>
                    </div>
                </div>
                <!-- end of card -->

                <!-- Card -->
                <div class="card">
                    <div class="card-image">

                        <!-- 자유게시판연결 -->
                        <a href="Writing?wrt_type=1&type_nbr=0"><img class="img-fluid1" src="./main_img/content-writing.png" alt="alternative"></a>
                    </div>
                    <div class="card-body">
                        <h4 class="card-title">FREE_BOARD</h4>
                        <p>반려견 자랑/소통소통</p>
                    </div>
                </div>
                <!-- end of card -->

                <!-- Card -->
                <div class="card">
                    <div class="card-image">

                        <!-- 마이페이지연결 -->
                        <a href="MyPage.jsp"><img class="img-fluid1" src="./main_img/personal.png" alt="alternative"></a>
                    </div>
                    <div class="card-body">
                        <h4 class="card-title">MYPAGE</h4>
                        <p>비밀번호변경/반려견등록/즐겨찾기목록</p>
                    </div>
                </div>
                <!-- end of card -->

            </div> <!-- end of col -->
        </div> <!-- end of row -->
    </div> <!-- end of container -->
</div> <!-- end of cards-1 -->













<script src="./main_js/main_jquery.min.js"></script> <!-- jQuery for Bootstrap's JavaScript plugins -->
<script src="./main_js/main_popper.min.js"></script> <!-- Popper tooltip library for Bootstrap -->
<script src="./main_js/main_bootstrap.min.js"></script> <!-- Bootstrap framework -->
<script src="./main_js/main_jquery.easing.min.js"></script> <!-- jQuery Easing for smooth scrolling between anchors -->
<script src="./main_js/main_swiper.min.js"></script> <!-- Swiper for image and text sliders -->
<script src="./main_js/main_jquery.magnific-popup.js"></script> <!-- Magnific Popup for lightboxes -->
<script src="./main_js/main_validator.min.js"></script> <!-- Validator.js - Bootstrap plugin that validates forms -->
<script src="./main_js/main_scripts.js"></script> <!-- Custom scripts -->


</body>
</html>