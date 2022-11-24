<%@page import="domain.MBR"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPet</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<script src="Mypage.js"></script>
<link rel="stylesheet" href="Mypage.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link href="https://fonts.googleapis.com/css2?family=Cutive+Mono&family=Poppins:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
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
			
			if(res!="댕댕이가 없습니다"){
				for(var i=0 ; i<res.length ; i++){
					var text = "";
					text += "<form action='minusDog' method='post'>";
					text +=  res[i];
					text += "<input type='hidden' name='mbr_nbr' value=\'"+${sessionScope.loginedMBR.mbr_nbr}+"\'>"
					text += "<input type='hidden' name='dogNmae' vlaue=\'"+res[i]+"\' >";
					text += "<input type='submit' value='x'></form>"
					$("#DogList").append(text);
				}
			}else{
				$("#DogList").append(res+"<br>");
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
		//공백 입력 못하게 막기
		$("#DogList").append(text);	
	});
});
</script>
</head>
<body>
<%@ include file="header.jsp" %>
    <div class="container">
        <div class="card">
            <div class="header">
                <a href="FavList.jsp">
                <div class="hamburger-menu">
                    <div class="center"></div>
                </div>
                </a>
                <a href="DogList.jsp" class="mail">
                    <i class="fa fa-paw" aria-hidden="true"></i>
                </a>
                <div class="main">
                    <div class="image">

                    </div>
                    <!--<div class="image2"></div>-->
                    <h3 class="name">${sessionScope.loginedMBR.mbr_id}</h3>
                    <!--<h3 class="sub-name">자두</h3>-->
                </div>
            </div>
            <div class="content">
                <div class="left">
             <div class="absolute-container">
                        <h3 class="title">나의 강아지</h3>
                        <p class="text" id="DogList"></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>