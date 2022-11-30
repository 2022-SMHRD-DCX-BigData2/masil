<%@page import="domain.MBR"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>

<div style="position:relative;top:100px">
<%
List<MBR> AllCMBR = (List) request.getAttribute("AllCMBR");
if(AllCMBR!=null){
	for(MBR mbr : AllCMBR){
		%>
		<form action="DeleteMBR" method="post">
		<%=mbr.getMbr_id()%><input type="hidden" name="mbr_nbr" value="<%=mbr.getMbr_nbr()%>">
		<input type="submit" value="삭제">
		</form>
		
		<%
	}
}
%>
</div>

</body>
</html>