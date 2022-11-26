<%@page import="domain.WRT"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
<div id="writing"></div>



<!-- 게시판 타입(type/ request에서 얻어옴),
게시판 타입별 세부 번호(type_nbr/ request에서 얻어옴),
아래 주소 쿼리 스트링으로 들어가야 합니다 -->
<a href="CreateWriting.jsp?type=${requestScope.type}&type_nbr=${requestScope.type_nbr}">글 작성하기</a>
<!-- to Front : 로그인하지 않았으면 글 작성 페이지로 못 감 -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">

<%
List<WRT> writings = (List) request.getAttribute("Writing");
for(WRT wrt : writings){ %>
	var type
	var id = GetId(<%= wrt.getWrt_ath()%>);
	var wrt_nbr = "<%=wrt.getWrt_nbr()%>";
	var wrt_ttl = "<%= wrt.getWrt_ttl()%>";
	var wrt_time = "<%=wrt.getWrt_time()%>";
	var text = "";
	text += id;
	text += "글 제목 : <a href='ShowWritingContent?wrt_nbr=";
	text += wrt_nbr+"'>"+wrt_ttl+"</a>"
	text += "작성 시간"+wrt_time+"<br>"
	$("#writing").append(text);
<%
}
%>


function GetId(mbr_nbr) {
	var mbr_id;
	$.ajax({
		url: "GetId",
		data: {"mbr_nbr":mbr_nbr},
		async : false,
		dataType : "text",
		type: "POST",
		success: function(res) {
				mbr_id=res;
		},
		error: function(xhr) {
		}
	});
	return mbr_id;
}
</script>
</body>
</html>