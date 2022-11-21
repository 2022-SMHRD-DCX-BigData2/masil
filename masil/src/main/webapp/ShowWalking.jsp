<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 지역별 산책로 경로 보여주기 -->



<!-- 동네별 산책로 등록하기 -->
<a href="CreateWalking.jsp?area_nbr=${requestScope.type_nbr}">글 작성하기</a>
</body>
</html>