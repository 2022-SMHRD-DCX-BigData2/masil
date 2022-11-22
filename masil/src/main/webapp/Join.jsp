<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
	var temp;
	
	$.ajax({
		url : "SetBclsArea",
		type : "get",
		dataType : "json",
		success : function(res){
			console.log(res);
			$("#selectbox").html("");
			for(var i=0 ; i<res.length ; i++){
				if(i==0){
					temp=res[i]
				}
				$("#selectbox").append("<option value="+res[i]+">"+res[i]+"</option>");
			}			
		},
		error : function(){
			alert("Ajax 통신 실패!!");	
		}
	});
	
	$.ajax({
		url : "SetArea",
		type : "get",
		dataType : "json",
		success : function(res){
			console.log(res);
			$("#selectNextbox").html("");
			for(var i=0 ; i<res.length ; i++){
				if(res[i].b_cls==temp){
				$("#selectNextbox").append("<option value="+res[i].s_cls+">"+res[i].s_cls+"</option>");
				}
			}			
		},
		error : function(){
			alert("Ajax 통신 실패!!");	
		}
	});	
});

function changeSelect(){
	var select = $("#selectbox option:selected").text();
	$.ajax({
		url : "SetArea",
		type : "get",
		dataType : "json",
		success : function(res){
			console.log(res);
			$("#selectNextbox").html("");
			for(var i=0 ; i<res.length ; i++){
				if(res[i].b_cls==select){
				$("#selectNextbox").append("<option value="+res[i].s_cls+">"+res[i].s_cls+"</option>");
				}
			}			
		},
		error : function(){
			alert("Ajax 통신 실패!!");	
		}
	});	
}
	
	

</script>
</head>

<body>
<form action="Join" method="post">
ID <input type="text" name="mbr_id">
PW <input type="text" name="mbr_pw">
<!-- 사는 지역 -->
<select name="b_cls" id="selectbox" onchange="changeSelect()">
</select>
<select id="selectNextbox">
</select>
<input type="submit">
</form>
</body>


</html>