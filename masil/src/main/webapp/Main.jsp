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
MBR loginedMBR = (MBR) session.getAttribute("loginedMember");
%>

	<c:choose>
		<c:when test="${empty loginedMBR}">
			로그인<br>
			<%@ include file="Login.jsp" %>
			회원가입<br>
			<%@ include file="Join.jsp" %>
		</c:when>
		<c:otherwise>
			<c:if test="${loginedMBR.mbr_type eq 'ADMIN'}">
			<a href="Administrate">회원관리</a>>
			</c:if> 
			<a href="Logout">로그아웃</a>
			<a href="Update.jsp">개인정보수정</a>
		</c:otherwise>
	</c:choose>

<!-- 지역 게시판 -->
<br>
<%@ include file="LocalWritingList.jsp" %>
<br>

<!-- 로그인한 사람이 속한 동네 산책로로 이동 -->
<!-- to Front : 로그인 하지 않은 사람이 지역 게시판을 누르면
				로그인하라고 알람 -->
<a href="Writing?area_nbr=${loginedMBR.area_nbr_for_mbr}&wrt_type=4">동네 산책로</a>
<br>
<%@ include file="LocalWalkingList.jsp" %>
<br>

</body>
</html>