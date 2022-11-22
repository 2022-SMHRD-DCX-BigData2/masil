<%@page import="domain.MBR"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!--
입력받은 글 내용과, param에서 얻은 글 타입(type), 타입 별 세부 번호(type_nbr),
세션에서 얻은 회원 번호, 회원 코드를 servlet에 전송하고 그 servlet에서
dao를 통해 db에 넣습니다.
WRT_DAO 에 새 DAO를 만들어야 합니다.
-->
타입 ${param.type}
<br>
번호 ${param.type_nbr}
<br>
<%
MBR loginedMBR = (MBR) session.getAttribute("loginedMBR");
%>
<%=loginedMBR.getMbr_nbr()%>

<form action="CreateWriting" method="post">
<input type="hidden" name="type" value="${param.type}">
<input type="hidden" name="type_nbr" value="${param.type_nbr}">
<input type="hidden" name="mbr_nbr" value="<%=loginedMBR.getMbr_nbr()%>">
제목<input type="text" name="title"><br>
<textarea name="content"></textarea>
<input type="submit">
</form>








</body>
</html>