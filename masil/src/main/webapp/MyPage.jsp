<%@page import="domain.MBR"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url : "SetDogList",
		type : "post",
		data : {"mbr_nbr" :${sessionScope.loginedMBR.mbr_nbr} },
		dataType : "json",
		success : function(res){
			$("#DogList").html("");
			for(var i=0 ; i<res.length ; i++){
				var text = res[i];
				text += "<form action='minusDog' method='post'>";
				text += "<input type='hidden' name='mbr_nbr' value=\'"+${sessionScope.loginedMBR.mbr_nbr}+"\'>"
				text += "<input type='hidden' name='dogNmae' vlaue=\'"+res[i]+"\' >";
				text += "<input type='submit' value='x'></form>"
				$("#DogList").append(text);
			}
			$("#DogList").append("댕댕이 추가하기 <button name='plusDog'> + </button>");
		},

		error : function(){
			alert("Ajax 통신 실패!!");	
		}
	});
});

$(document).ready(function () {
	$(document).on("click","button[name='plusDog']",function(){
		//PlusDog에서는 다시 마이페이지로 리다리엑트하기
		text = "<form action='PlusDog' method='post'>";
		text += "<input type='hidden' name='mbr_nbr' value=\'"+${sessionScope.loginedMBR.mbr_nbr}+"\'>";
		text += "댕댕이 이름 <input type='text' name='DogName'>";
		text += "<input type='submit'></form>";
		$("#DogList").append(text);	
	});
});

</script>



</head>
<body>

<form action="#" method="post">
비밀번호 변경<input type="text" name="PW">
<input type="submit">
</form>

<div id="DogList"></div>






</body>
</html>