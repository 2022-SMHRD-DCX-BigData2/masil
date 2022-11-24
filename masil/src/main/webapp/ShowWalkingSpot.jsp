<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<body>

${param.wlk_nbr}<br>
${param.wlk_name}<br>
<div id="map" style="width:100%;height:350px;"></div>
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
</script>

<!--목적지가 있는 상태에서 경로 입력하기 -->
<a href="CreateWalkingRT.jsp?wlk_nbr=${param.wlk_nbr}&wlk_name=${param.wlk_name}&lat=${param.lat}&lon=${param.lon}">경로 입력하기</a>



<div id="WlkRtList"></div>
<!-- ${param.wlk_nbr}에 해당하는 경로 보여주기 -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url : "SetWalkingRt",
		type : "get",
		data : {"wlk_nbr" :${param.wlk_nbr}},
		dataType : "json",
		success : function(res){
			console.log(res);
			$("#WlkRtList").html("");
			for(var i=0 ; i<res.length ; i++){
				$("#WlkRtList").append("<a href=\'ShowWalkingRt.jsp?wlk_rt_nbr="+res[i].wlk_rt_nbr+"\'>"+res[i].wlk_rt_name+"'</a><br>");
			}			
		},
		error : function(){
			alert("Ajax 통신 실패!!");	
		}
	});
});










</script>

</body>
</html>