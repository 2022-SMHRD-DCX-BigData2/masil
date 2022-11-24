<%@page import="java.util.List"%>
<%@page import="domain.WLK_LOG"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>MyLog</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<script src="Mypage.js"></script>
<link rel="stylesheet" href="Mypage.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link href="https://fonts.googleapis.com/css2?family=Cutive+Mono&family=Poppins:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

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
                    <i class="fa fa-paw" aria-hidden="true"></i>
                </a>
                <div class="main">
                    <div class="image">

                    </div>
                    <!--<div class="image2"></div>-->
                    <h3 class="name">${sessionScope.loginedMBR.mbr_id}</h3>
                    <!--<h3 class="sub-name">자두</h3>-->
                </div>
            </div>
            <div class="content">
                <div class="left">
             <div class="absolute-container">
                        <h3 class="title">나의 기록</h3>
                        <p class="text" >
<%
List<WLK_LOG> logs = (List) session.getAttribute("logs");
for(WLK_LOG log : logs){ %>
	글쓴이 : <%=log.getMbr_nbr_for_wlk_log() %>
	같이 간 반려견 : <%=log.getWlk_dog_list()%>
	산책 시간 : <%=log.getWlk_time() %>
<%
}
%>
             
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>











</body>
</html>