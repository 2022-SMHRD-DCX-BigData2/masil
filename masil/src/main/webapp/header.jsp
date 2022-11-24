<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>road_board</title>
    <link rel="stylesheet" href="assets\css\header.css">
</head>
<body>
 <!-- Wrapper -->
    <div id="wrapper">
        <!-- Header -->
            <header id="header">
                <h1><a href="Main.jsp">PATHWAY</a></h1>
                <nav class="links">
                    <ul>
                        <li><a href="LocalWalkingList.jsp" >ROUTE</a></li>
                        <li><a href="Writing?wrt_type=1&area=전국" >BORAD</a></li>
                        <li><a href="MyPage.jsp">MYPAGE</a></li>
                    </ul>
                </nav>
                <nav class="main_for_header">
                    <ul>
                        <li class="search">
                            <a class="fa-search" href="#search"></a>
                            <form id="search" method="get" action="#">
                                <input type="text" name="query" placeholder="Search" />
                            </form>
                        </li>
                        <li class="menu">
                            <a class="fa-bars" href="#menu"></a>
                        </li>
                    </ul>
                </nav>
            </header>
            
                  <!-- Menu -->
            <section id="menu">

                <!-- Search -->
                    <section>
                        <form class="search" method="get" action="#">
                            <input type="text" name="query" placeholder="Search" />
                        </form>
                    </section>

            </section>
    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>