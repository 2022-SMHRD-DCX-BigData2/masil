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
<!-- ��å��� -->
<!-- ajax�� ��� ��ȣ�� ��� �̸� �ҷ����� �߰� -->
<!-- �ݷ��� ��� split���� ���ڰ� ���̰� �ϱ� -->
<%
List<WLK_LOG> logs = (List) session.getAttribute("logs");
for(WLK_LOG log : logs){ %>
	�۾��� : <%=log.getMbr_nbr_for_wlk_log() %>
	���� �� �ݷ��� : <%=log.getWlk_dog_list()%>
	��å �ð� : <%=log.getWlk_time() %>
<%
}
%>

</body>
</html>