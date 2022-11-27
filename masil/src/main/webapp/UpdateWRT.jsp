<%@page import="domain.MBR"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link href="https://fonts.googleapis.com/css2?family=Cutive+Mono&family=Poppins:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen" href="reply.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Insert title here</title>
</head>
<body>

<%
MBR loginedMBR = (MBR) session.getAttribute("loginedMBR");
%>
<!-- Header --> 
<%@ include file="header.jsp" %>


<form action="#" method="post">


    <div class="board_wrap">
        
        <div class="board_title">
        	<c:choose>
	        	<c:when test="${requestScope.type eq '1'}">
	        		<strong>자유게시판</strong>
	        	</c:when>
	        	<c:when test="${requestScope.type eq '2'}">
	        		<strong>산책로 리뷰</strong>
	        	</c:when>
	        	<c:otherwise>
	        		<strong>모임 게시판</strong>
	        	</c:otherwise>
            </c:choose>
            <p>글을 수정합니다.</p>
        </div>

        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>&nbsp&nbsp제목</dt>
                        <dd>${requestScope.wrt_ttl}</dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><%=loginedMBR.getMbr_id()%></dd>
                    </dl>
                </div>
                <div class="cont">
                    <textarea name="content">${requestScope.wrt_cnt}</textarea>
                </div>
            </div>
            
            <div class="bt_wrap">
                <button type="submit" class="on" >수정</button>
                <button type="reset" class="on">취소</button>
            </div>
        </div>
    </div>
</form>


</body>
</html>
