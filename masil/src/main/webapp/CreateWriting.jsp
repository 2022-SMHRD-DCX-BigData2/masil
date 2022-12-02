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

<title>자유게시판</title>
</head>
<body  style="width: 1000px; display: contents;">
<%@ include file="header.jsp" %>
<%
MBR loginedMBR = (MBR) session.getAttribute("loginedMBR");
%>

<form name="cw" action="CreateWriting" method="post" style="padding-top: 34px;">
<input type="hidden" name="type" value="${param.type}">
<input type="hidden" name="type_nbr" value="${param.type_nbr}">
<input type="hidden" name="mbr_nbr" value="<%=loginedMBR.getMbr_nbr()%>">

    <div class="board_wrap" style="margin-left: 300px;">
        
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
            <p>자유롭게 의견을 나눠주세요!</p>
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
                <button type="button" onclick="but()" class="zx">등록</button>
                <button type="reset" class="del">취소</button>
            </div>
        </div>
    </div>
</form>

<script src="./js/jquery.min.js"></script>

<script>
	function but(){
		var title = $("input[name=title]").val();
		var content = $("input[name=content]").val();
		if(title.length==0||content==null){
			alert("내용을 입력해주세요!")
		}else{
			document.cw.submit();
			
		}
	}
</script>



</body>
</html>





