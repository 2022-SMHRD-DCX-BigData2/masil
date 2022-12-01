<%@page import="domain.MBR"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="./CSS/path_list.css" />
</head>
<body>
<%
MBR loginedMBR = (MBR) session.getAttribute("loginedMBR");
String favList = loginedMBR.getFav_list();
%>
<%@ include file="header.jsp" %>


	<body class="is-preload">
	<div id="wrapper">
				<!-- Main -->
					<div id="main">
						<!-- Post -->
							<article class="post">
								<header>
									<div class="title">
										<h2><a href="#">${param.wlk_name}</a></h2>
										<p>즐거운 산책 되세요!</p>
									</div>
									<div class="meta">
										<!--<time class="published" datetime="2015-11-01">November 1, 2015</time> -->
										<a href="CreateWalkingRT.jsp?wlk_nbr=${param.wlk_nbr}&wlk_name=${param.wlk_name}&lat=${param.lat}&lon=${param.lon}" class="author">
										<span class="name">산책로 등록 하러가기💨</span>
										</a>
									</div>
								</header>
                            <!-- 카카오API -->
                                <div id="map" style="width:100%;height:350px;"></div>
                                    <div class="container">
                                        <table class="board-table">
                                            <thead>
                                            <tr>
                                                <th name="즐겨찾기"></th>
                                                <th>경로</th>
                                            </tr>
                                            </thead>
                                            <tbody id="WlkRtList">
                                            </tbody>
                                        </table>
                                    </div>
							</article>
					</div>
			</div>

<div id="map" style="width:100%;height:350px;"></div>
<script src="./js/jquery.min.js"></script>
<script src="./js/mark.js"></script>
<script src="./js/browser.min.js"></script>
<script src="./js/breakpoints.min.js"></script>
<script src="./js/util.js"></script>
<script src="./js/main.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e94a31acf891a4c020db55b18fc70c54"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${param.lat},  ${param.lon}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(${param.lat}, ${param.lon}); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    

var iwContent = '<div style="padding:5px;">${param.wlk_name}<div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(${param.lat}, ${param.lon}); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 



$(document).ready(function(){
	$.ajax({
		url : "SetWalkingRt",
		type : "get",
		data : {"wlk_nbr" :${param.wlk_nbr}},
		dataType : "json",
		success : function(res){
			$("#WlkRtList").html("");
			var favList="<%=favList%>";
			for(var i=0 ; i<res.length ; i++){
				var text = "<tr>";
				text += "<td id='mark'>";
				var rt_nbr = res[i].wlk_rt_nbr;
				if(favList.indexOf(rt_nbr)==-1){
					text += "<button class='btn-like notdone' id='"+rt_nbr+"'>⭐</button>";
				}else{
					text += "<button class='btn-like done' id='"+rt_nbr+"'>⭐</button>";
				}
				text += "</td>";
				text += "<td>";
				text += "<a href=\'ShowWalkingRt.jsp?wlk_rt_nbr="+res[i].wlk_rt_nbr+"\'>"+res[i].wlk_rt_name+"</a>";
				if(${loginedMBR.mbr_type eq 'ADMIN'}){
					text += "&nbsp;&nbsp;&nbsp;&nbsp;<button style='background-color: inherit; border: 0; font-size: 1.2rem;' id='"+res[i].wlk_rt_nbr+"' class='deleteWLK_RT_MTH'>x</button>";
				}
				text += "</td></tr>";
				$("#WlkRtList").append(text);
			}			
		},
		error : function(){
			alert("Ajax 통신 실패!!");	
		}
	});
});

//경로 삭제

$(document).on("click", ".deleteWLK_RT_MTH" , function(){
	var wlk_rt_nbr = $(this).attr('id');
	$.ajax({
		url : "DeleteWLK_RT_MTH",
		type : "post",
		data : {"wlk_rt_nbr":wlk_rt_nbr},
		success : function(res){
			window.location.reload();
		},
		error : function(){
			alert("deleteWLK_RT Ajax 통신 실패!!");	
		}
	});	
	
});









$(document).ready(function () {
	$(document).on("click",".notdone",function() {
		var wrt_nbr = $(this).attr("id");
	    $.ajax({
			url: "PlusFavList",
			data: {
				"mbr_nbr":${sessionScope.loginedMBR.mbr_nbr},
				"wlk_rt_nbr":wrt_nbr
			},
			type: "POST",
			async: false,
			success: function(response) {
				console.log("ajax 즐겨찾기 추가 성공");
				window.location.reload();
				$(this).removeClass("notdone");
				$(this).addClass("done");
			},
			error: function(xhr) {
				console.log("ajax 즐겨찾기 추가 실패");
			}
		});	
	});
});

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