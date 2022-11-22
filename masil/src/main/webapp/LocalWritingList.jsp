<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url : "SetBclsArea",
		type : "get",
		dataType : "json",
		success : function(res){
			console.log(res);
			$("#BclsArea").html("");
			for(var i=0 ; i<res.length ; i++){
				$("#BclsArea").append("<a href=\'Writing?area="+res[i]+"&wrt_type=1\'>"+res[i]+"</a>&nbsp");
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
지역별 게시판
<div id="BclsArea"></div>
</body>


</html>