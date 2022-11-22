<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url : "SetWalkingRtList",
		type : "get",
		data : {"area_nbr" : ${requestScope.type_nbr}},
		dataType : "json",
		success : function(res){
			console.log(res);
			$("#walkingRtList").html("");
			for(var i=0 ; i<res.length ; i++){
				$("#walkingRtList").append("<a href=\'ShowWalkingSpot.jsp?wlk_nbr="+res[i].wlk_nbr+"&lat="+res[i].lat_for_wlk+"&lon="+res[i].lon_for_wlk+"&wlk_name="+res[i].wlk_name+"'>"+res[i].wlk_name+"</a><br>");
			}			
		},
		error : function(){
			alert("Ajax 통신 실패!!");	
		}
	});
});
</script>
</head>


<body>
<!-- 지역별 산책로 경로 보여주기 -->
<div id="walkingRtList"></div>


<!-- 동네별 산책로 등록하기 -->
<a href="CreateWalking.jsp?area_nbr=${requestScope.type_nbr}">글 작성하기</a>
</body>
</html>