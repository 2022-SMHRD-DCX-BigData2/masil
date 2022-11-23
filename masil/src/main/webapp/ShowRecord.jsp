<%@page import="domain.WLK_LOG"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 산책기록 -->
<!-- ajax로 멤버 번호로 멤버 이름 불러오기 추가 -->
<!-- 반려견 목록 split으로 예쁘게 보이게 하기 -->
<%
List<WLK_LOG> logs = (List) session.getAttribute("logs");
for(WLK_LOG log : logs){ %>
	글쓴이 : <%=log.getMbr_nbr_for_wlk_log() %>
	같이 간 반려견 : <%=log.getWlk_dog_list()%>
	산책 시간 : <%=log.getWlk_time() %>
<%
}
%>

</body>
</html>