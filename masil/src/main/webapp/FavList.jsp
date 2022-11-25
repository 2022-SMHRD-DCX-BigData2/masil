<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="domain.MBR"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Insert title here</title>
</head>
<body>
즐겨찾기 목록입니다
<div id="favList"></div>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">

<%
MBR loginedMBR = (MBR) session.getAttribute("loginedMBR");
String strFavList = loginedMBR.getFav_list();
if(strFavList!=null){
	String[] favList = strFavList.split("\\|");
	for(String string: favList){
		%>
		var temp = GetWlkRTName(<%=string%>)
		var text = "";
		text += "<a href=\'ShowWalkingRt.jsp?wlk_rt_nbr=";
		text += "<%=string%>\'>";
		text += temp;
		text += "</a><br>"
		console.log(text)
		$("#favList").append(text);
		<%
	}
}
%>



function GetWlkRTName (wlk_rt_nbr){
	var wlk_rt_name;
	$.ajax({
		url : "GetWlkRTName",
		type : "get",
		data : {"wlk_rt_nbr" :wlk_rt_nbr},
		dataType : "text",
		async : false,
		success : function(res){
			wlk_rt_name=res;
		},
		error : function(){
			alert("GetWlkRTName Ajax 통신 실패!!");	
		}
	});
	return wlk_rt_name;
}

</script>



</body>
</html>