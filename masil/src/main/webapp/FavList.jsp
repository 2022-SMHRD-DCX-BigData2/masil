<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="domain.MBR"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="Favorites.css">
<title>Insert title here</title>
</head>
<%@ include file="header.jsp"%>
<body>
    <div class="board_wrap">
        <div class="board_title">
            <strong>즐겨찾기</strong>
            <p>즐겨찾기 목록을 확인하세요</p>
        </div>
        <div class="board_list_wrap">
            <div class="board_list" id="favList">
                <div class="top">            
                    <div class="btn" style="text-align:center ">표시</div>
                    <!--  <div class="title">목적지이름</div>-->
                    <div class="title" style="text-align:center">산책로이름</div>         
                </div>
                <!--
                <div>
                    <input type="button" class="btn" value="⭐">
                    <div class="title"><a href="view.html">산책목적로1</a></div>
                    <div class="writer">경로1</div>
                </div>
               	-->
            </div>
            <!-- <div class="board_page">
                <a href="#" class="bt first"><<</a>
                <a href="#" class="bt prev"><</a>
                <a href="#" class="num on">1</a>
                <a href="#" class="num">2</a>
                <a href="#" class="num">3</a>
                <a href="#" class="num">4</a>
                <a href="#" class="num">5</a>
                <a href="#" class="bt next">></a>
                <a href="#" class="bt last">>></a>
            </div> -->
            <!--  
            <div class="bt_wrap">
                <a href="write.html" class="on">등록</a>
                <a href="write.html" class="on">취소</a>
                -->
                <!--<a href="#">수정</a>-->
            </div>

        </div>
    </div>

 <script src="1.js"></script>
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
		text +="<div><button class='btn-like done' id='"+<%=string%>+"'>⭐</button>";
		//text +="<div class='title'></div>";
		text += "<div class='title'><a href=\'ShowWalkingRt.jsp?wlk_rt_nbr=";
		text += "<%=string%>\'>";
		text += temp;
		text += "</a></div>";
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



$(document).ready(function () {
	$(document).on("click",".done",function() {
		var wrt_nbr = $(this).attr("id");
	    $.ajax({
			url: "MinusFavList",
			data: {
				"mbr_nbr":${sessionScope.loginedMBR.mbr_nbr},
				"wlk_rt_nbr":wrt_nbr
			},
			type: "POST",
			async: false,
			success: function(response) {
				console.log("ajax 즐겨찾기 삭제 성공");
				$(this).removeClass("done");
				$(this).addClass("notdone");
				window.location.reload();
			},
			error: function(xhr) {
				console.log("ajax 즐겨찾기 삭제 실패");
			}
		});	
	});
});


</script>



</body>
</html>