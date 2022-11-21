<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url : "SetArea",
		type : "get",
		dataType : "json",
		success : function(res){
			console.log(res);
			$("#SetArea").html("");
			for(var i=0 ; i<res.length ; i++){
				$("#SetArea").append("<a href=\'Writing?b_cls="+res[i].b_cls+"&s_cls="+res[i].s_cls+"&wrt_type=2\'>"+res[i].b_cls+"  "+res[i].s_cls+"</a>&nbsp");
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
<!-- 사는 지역 -->
산책로 지역
<div id="SetArea"></div>
</body>
</html>