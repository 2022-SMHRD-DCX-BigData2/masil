<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 목록 보여줘야 함 -->




<!-- 게시판 타입(type/ request에서 얻어옴),
게시판 타입별 세부 번호(type_nbr/ request에서 얻어옴),
아래 주소 쿼리 스트링으로 들어가야 합니다 -->
<a href="CreateWriting.jsp?type=${reqeustScope.type}&type_nbr=${requestScope.type_nbr}">글 작성하기</a>
<!-- to Front : 로그인하지 않았으면 글 작성 페이지로 못 감 -->

</body>
</html>