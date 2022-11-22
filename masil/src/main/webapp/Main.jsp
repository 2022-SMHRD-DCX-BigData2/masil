<%@page import="domain.MBR"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PathWay에 오신 것을 환영합니다<title>
</head>
<body>
<!-- 로그인 세션 확인 -->
<%
MBR loginedMBR = (MBR) session.getAttribute("loginedMBR");
%>



<c:if test="${empty loginedMBR}">
	<c:import url="Login.jsp"/>
	<c:import url="Join.jsp"/>
</c:if>
<c:if test="${not empty loginedMBR}">
	<c:import url="Logout.jsp"/>
</c:if>
<c:if test="${loginedMBR.mbr_type eq 'ADMIN'}">
	<c:import url="Admin.jsp"/>
</c:if>


<!-- 지역 게시판 -->
<br>
<c:import url="LocalWritingList.jsp"/>
<br>

<!-- 로그인한 사람이 속한 동네 산책로로 이동 -->
<!-- to Front : 로그인 하지 않은 사람이 지역 게시판을 누르면
				로그인하라고 알람 -->
<a href="Writing?area_nbr=${loginedMBR.area_nbr_for_mbr}&wrt_type=4">동네 산책로</a>
<br>
<c:import url="LocalWalkingList.jsp"/>
<br>



</body>
</html>