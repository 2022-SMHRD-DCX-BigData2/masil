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
			//console.log(res);
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
			//console.log(res);
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
			//console.log(res);
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

var isOkey = 0;

function checkID(){
	var check = $("input[name=mbr_id]").val();
	$.ajax({
		url: "checkID",
		data: {"check":check},
		dataType : "text",
		type: "POST",
		success: function(res) {
				if(res=="중복"){
					$("#check").html("");
					$("#check").css("color","red");
					$("#check").append("중복된 아이디입니다.");
					isOkey = 1;
				}else if(check.length==0){
					$("#check").html("");					
					$("#check").css("color","blue");
					$("#check").append("아이디를 입력하세요.");
				}else{
					$("#check").html("");
					$("#check").css("color","green");
					$("#check").append("사용가능한 아이디입니다.");
					isOkey = 2;
				}
		},
		error: function(xhr) {
			alert("ajax 아이디 체크 실패!");
		}
	});	

};

function isOkeyf(){
	var check = $("input[name=mbr_id]").val();
	if(isOkey==0||check.length==0){
		alert('아이디를 입력하세요');
		return false;
	}else if(isOkey==1){
		alert('중복된 아이디 입니다');
		return false;
	}else if(isOkey==2){
		document.join.submit();
	}
};



</script>
</head>

<body>

    <form name="join" action="Join" method="POST" class="joinForm" onsubmit="DoJoinForm__submit(this);">
                                                                                                
        <h2>회원가입</h2>
        <div class="textForm">
        <input name="mbr_id" type="text" class="id" placeholder="아이디" onchange="checkID()">
        	<div id="check" style="position:relative;top:3px; font-size: 14px;"></div>
        </div>
        <div class="textForm">
        <input name="mbr_pw" type="password" class="pw" placeholder="비밀번호">
        </div>
        <div class="textForm">
        <select id="selectbox" name="b_cls"  class="area" placeholder="지역" onchange="changeSelect()"></select>
        <select id="selectNextbox" name="s_cls" class="area2" placeholder="지역"></select>
        </div>
        <input type="button" class="btn" value="J O I N" onclick="isOkeyf()"/>
    </form>




</body>
</html>




