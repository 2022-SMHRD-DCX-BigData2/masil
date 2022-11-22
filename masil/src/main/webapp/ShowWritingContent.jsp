<%@page import="domain.WRT"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
WRT writing = (WRT) request.getAttribute("writing");
%>

<%=writing.getWrt_ath() %>
<%=writing.getWrt_ttl() %>
<%=writing.getWrt_cnt() %>
<%=writing.getWrt_time() %>


</body>
</html>