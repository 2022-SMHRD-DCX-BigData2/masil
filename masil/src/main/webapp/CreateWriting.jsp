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

<!--
입력받은 글 내용과, param에서 얻은 글 타입(type), 타입 별 세부 번호(type_nbr),
세션에서 얻은 회원 번호, 회원 코드를 servlet에 전송하고 그 servlet에서
dao를 통해 db에 넣습니다.
WRT_DAO 에 새 DAO를 만들어야 합니다.
-->
<%
MBR loginedMBR = (MBR) session.getAttribute("loginedMBR");
%>
<!-- Header --> 
<%@ include file="header.jsp" %>


<form action="CreateWriting" method="post">
<input type="hidden" name="type" value="${param.type}">
<input type="hidden" name="type_nbr" value="${param.type_nbr}">
<input type="hidden" name="mbr_nbr" value="<%=loginedMBR.getMbr_nbr()%>">

    <div class="board_wrap">
        
        <div class="board_title">
        	<c:choose>
	        	<c:when test="${param.type eq '1'}">
	        		<strong>자유게시판</strong>
	        	</c:when>
	        	<c:when test="${param.type eq '2'}">
	        		<strong>산책로 리뷰</strong>
	        	</c:when>
	        	<c:otherwise>
	        		<strong>모임 게시판</strong>
	        	</c:otherwise>
            </c:choose>
            <p>산책로 관련하여 자유롭게 의견을 나눠주세요!</p>
        </div>

        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>&nbsp&nbsp제목</dt>
                        <dd><input type="text" name="title" placeholder="제목입력"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><%=loginedMBR.getMbr_id()%></dd>
                    </dl>
                </div>
                <div class="cont">
                    <textarea placeholder="내용입력" name="content"></textarea>
                </div>
            </div>
            
            <div class="bt_wrap">
                <button type="submit" class="on" >등록</button>
                <button type="reset" class="on">취소</button>
            </div>
        </div>
    </div>
</form>


</body>
</html>





