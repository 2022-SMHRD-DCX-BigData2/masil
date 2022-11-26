<%@page import="domain.MBR"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Directive by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="./LoginForm/css/index.css" />
	</head>
	<body class="is-preload">
	

<!-- 로그인 세션 확인 -->
<%
MBR loginedMBR = (MBR) session.getAttribute("loginedMBR");
%>

<c:if test="${loginedMBR.mbr_type eq 'ADMIN'}">
	<c:import url="Admin.jsp"/>
</c:if>

			<div id="main">

				<header class="major container medium">
					<h2>We conduct experiments that
					<br />
					may or may not seriously
					<br />
					break the universe</h2>
				</header>

				<div class="box alt container">
					<section class="feature left">
						<a href="LocalWalkingList.jsp" class="image icon solid fal fa-walking"><img src="./LoginForm/img\bg1.jpg" alt="" /></a>
						<div class="content">
							<h3>산책로</h3>
							<p>Vitae natoque dictum etiam semper magnis enim feugiat amet curabitur tempor orci penatibus. Tellus erat mauris ipsum fermentum etiam vivamus eget. Nunc nibh morbi quis fusce lacus.</p>
						</div>
					</section>
					<section class="feature right">
						<a href="Writing?wrt_type=1&type_nbr=0" class="image icon solid far fa-users"><img src="./LoginForm/img\bg2.jpg" alt="" /></a>
						<div class="content">
							<h3>자유게시판</h3>
							<p>Vitae natoque dictum etiam semper magnis enim feugiat amet curabitur tempor orci penatibus. Tellus erat mauris ipsum fermentum etiam vivamus eget. Nunc nibh morbi quis fusce lacus.</p>
						</div>
					</section>
					<section class="feature left">
						<a href="MyPage.jsp" class="image icon solid fas fa-edit"><img src="./LoginForm/img\bg3.jpg" alt="" /></a>
						<div class="content">
							<h3>마이페이지</h3>
							<p>Vitae natoque dictum etiam semper magnis enim feugiat amet curabitur tempor orci penatibus. Tellus erat mauris ipsum fermentum etiam vivamus eget. Nunc nibh morbi quis fusce lacus.</p>
						</div>
					</section>
				</div>

				<footer class="major container medium" style="bottom: 10px;">
					<h3>Get shady with science</h3>
					<p>Vitae natoque dictum etiam semper magnis enim feugiat amet curabitur tempor orci penatibus. Tellus erat mauris ipsum fermentum etiam vivamus.</p>
					
					<c:if test="${empty loginedMBR}">
						<a href="Login.jsp"><input type="submit" class="button" value="JOIN CREW"></a>
					</c:if>
					<c:if test="${not empty loginedMBR}">
						<a href="Logout"><input type="submit" class="button" value="LOGOUT"></a>
					</c:if>
				</footer>

			</div>
			<script src="./LoginForm/js\jquery.min.js"></script>
			<script src="./LoginForm/js\browser.min.js"></script>
			<script src="./LoginForm/js\breakpoints.min.js"></script>
			<script src="./LoginForm/js\util.js"></script>
			<script src="./LoginForm/js\main.js"></script>
    </body>
</html>