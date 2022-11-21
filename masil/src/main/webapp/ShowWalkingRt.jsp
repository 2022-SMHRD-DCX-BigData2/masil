<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
    <style>
.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
.number {font-weight:bold;color:#ee6152;}
.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
.distanceInfo .label {display:inline-block;width:50px;}
.distanceInfo:after {content:none;}
</style>


</head>
<body>
${param.wlk_rt_nbr}<br>
${param.wlk_rt_name}<br>

<div id="map" style="width:100%;height:350px;"></div>  

<!-- 경로 보여주기 -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e94a31acf891a4c020db55b18fc70c54"></script>
<script type="text/javascript">


$(document).ready(function(){
	$.ajax({
		url : "SetWalkingRtPath",
		type : "get",
		data : {"wlk_rt_nbr" :${param.wlk_rt_nbr}},
		dataType : "json",
		success : function(res){
			

			let linePath =[];
			let path_text ="[";
			//linePath생각과 다르게 작동
			for(var i = 0 ; i<res.length;i++){
				var tempLat = parseFloat(res[i].lat_for_wlk_rt);
				var tempLon = parseFloat(res[i].lon_for_wlk_rt);
				var temp = new kakao.maps.LatLng(tempLat,tempLon);
				path_text += "new kakao.maps.LatLng("+tempLat+","+tempLon+"),"
				linePath.push(temp);
			}
			
			path_text = path_text.slice(0, -1);
			
			path_text +="]";
			//이상하게 linePath에 kakao.maps.LatLng클래스가 유지 된 채로 들어가지 않음
		    //왜 그런지 알아볼 필요 있음
		    //일단 돌아가야하니 eval씀
			console.log(linePath[length-1] instanceof kakao.maps.LatLng);
			
			var text = "";
			text += "clickLine = new kakao.maps.Polyline({";
			text += "map: map, "
			text += "path:";
			text += path_text;
			text +=", // 선을 구성하는 좌표 배열입니다. ";
			text += "strokeWeight: 3,";
			text += "strokeColor: '#db4040', ";
			text += "strokeOpacity: 1,";
			text += "strokeStyle: 'solid' ";
			text += "});";
			
			console.log(text)
			eval(text);


			var distance = Math.round(clickLine.getLength());
			var content = getTimeHTML(distance)
			var position = linePath[length-1]; 
			showDistance(content,position)//마지막 배열의 위도.경도 넣기

			   

			//선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
			function showDistance(content, position) {

			if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
			    
			    // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
			    distanceOverlay.setPosition(position);
			    distanceOverlay.setContent(content);
			    
			} else { // 커스텀 오버레이가 생성되지 않은 상태이면
			    
			    // 커스텀 오버레이를 생성하고 지도에 표시합니다
			    distanceOverlay = new kakao.maps.CustomOverlay({
			        map: map, // 커스텀오버레이를 표시할 지도입니다
			        content: content,  // 커스텀오버레이에 표시할 내용입니다
			        position: position, // 커스텀오버레이를 표시할 위치입니다.
			        xAnchor: 0,
			        yAnchor: 0,
			        zIndex: 3  
			    });      
			}
			}

			//그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
			//HTML Content를 만들어 리턴하는 함수입니다
			function getTimeHTML(distance) {

			// 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
			var walkkTime = distance / 67 | 0;
			var walkHour = '', walkMin = '';

			// 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
			if (walkkTime > 60) {
			    walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
			}
			walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

			// 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
			var bycicleTime = distance / 227 | 0;
			var bycicleHour = '', bycicleMin = '';

			// 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
			if (bycicleTime > 60) {
			    bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
			}
			bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

			// 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
			var content = '<ul class="dotOverlay distanceInfo">';
			content += '    <li>';
			content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
			content += '    </li>';
			content += '    <li>';
			content += '        <span class="label">도보</span>' + walkHour + walkMin;
			content += '    </li>';
			content += '    <li>';
			content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
			content += '    </li>';
			content += '</ul>'

			return content;
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