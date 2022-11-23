<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="signup.css">
<title>Document</title>
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

    <form action="Join" method="POST" class="joinForm" onsubmit="DoJoinForm__submit(this);">
                                                                                                
        <h2>회원가입</h2>
        <div class="textForm">
        <input name="mbr_id" type="text" class="id" placeholder="아이디">
        </input>
        </div>
        <div class="textForm">
        <input name="mbr_pw" type="text" class="pw" placeholder="비밀번호">
        </div>
        <div class="textForm">
        <select id="selectbox" name="b_cls"  class="area" placeholder="지역" onchange="changeSelect()"></select>
        <select id="selectNextbox" name="area" class="area2" placeholder="지역"></select>
        </div>
        <input type="submit" class="btn" value="J O I N"/>
    </form>




</body>
</html>




