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
${requestScope.wlk_rt_name}<br>
${requestScope.wlk_rt_nbr}
<!-- 경로 보여주기 찍은 점마다 거리 보여주는 것도 추가하기-->
<div id="map" style="width:100%;height:350px;"></div>  

<button name="nowLoc">현재 위치 확인하기</button>

<div id="record">
<button name="startRecord">인증시작</button><br>
</div>
<!-- 댕댕이 목록(체크박스) 비동기 통신으로 보여주기 -->
<div id="dogCheckbox"></div>


<!-- wlk_rt_nbr에 해당하는 경로 리뷰 보여주기 & 경로 리뷰 쓰기 -->
<!-- 경로 리뷰 보여주기는 비동기로 만들어보기! -->
<div id="RVList"></div>
<a href="CreateWriting.jsp?type=2&type_nbr=${requestScope.wlk_rt_nbr}">리뷰 작성하기</a>


<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e94a31acf891a4c020db55b18fc70c54"></script>
<script type="text/javascript">

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(${requestScope.lat}, ${requestScope.lon}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
	var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
	var LinePath = ${requestScope.path};
	
	clickLine = new kakao.maps.Polyline({
	    map: map, // 선을 표시할 지도입니다 
	    path: LinePath, // 선을 구성하는 좌표 배열입니다
	    strokeWeight: 3, // 선의 두께입니다 
	    strokeColor: '#db4040', // 선의 색깔입니다
	    strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid' // 선의 스타일입니다
	});
	
	var distanceOverlay;
	var distance = Math.round(clickLine.getLength());
	var content = getTimeHTML(distance);
	showDistance(content, LinePath[LinePath.length-1]);
	
	
	
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


	$(document).ready(function(){
		$.ajax({
			//이름도 받아야 함. 어떻게?
			url : "SetWalkingRTRVList",
			type : "get",
			data : {"wlk_rt_nbr" : ${requestScope.wlk_rt_nbr}},
			dataType : "json",
			success : function(res){
				console.log(res);
				$("#RVList").html("");
				for(var i=0 ; i<res.length ; i++){
					$("#RVList").append(res[i].wrt_ath+"<a href=\'ShowWritingContent?wrt_nbr="+res[i].wrt_nbr+"'>"+res[i].wrt_ttl+"</a>"+res[i].wrt_time+"<br>");
				}			
			},
			error : function(){
				alert("Ajax 통신 실패!!");	
			}
		});
	});
	
	
	$(document).ready(function () {
		  $(document).on("click", "button[name='nowLoc']", function () {
			// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
			  if (navigator.geolocation) {
			      
			      // GeoLocation을 이용해서 접속 위치를 얻어옵니다
			      navigator.geolocation.getCurrentPosition(function(position) {
			          
			          var lat = position.coords.latitude, // 위도
			              lon = position.coords.longitude; // 경도
			          
			          var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			              message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
			          
			          // 마커와 인포윈도우를 표시합니다
			          displayMarker(locPosition, message);
			              
			        });
			      
			  } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			      
			      var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
			          message = 'geolocation을 사용할수 없어요..'
			          
			      displayMarker(locPosition, message);
			  }

		    
		  });
		});
	

	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {

	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({  
	        map: map, 
	        position: locPosition
	    }); 
	    
	    var iwContent = message, // 인포윈도우에 표시할 내용
	        iwRemoveable = true;

	    // 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content : iwContent,
	        removable : iwRemoveable
	    });
	    
	    // 인포윈도우를 마커위에 표시합니다 
	    infowindow.open(map, marker);
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);      
	}
	
	
	//댕댕이 목록
	let dogList=[];
	$(document).ready(function(){
		$.ajax({
			url : "SetDogList",
			type : "post",
			data : {"mbr_nbr" :${sessionScope.loginedMBR.mbr_nbr} },
			dataType : "json",
			async:false,
			success : function(res){
				$("#dogCheckbox").html("");
				//이거 체크박스로 바꾸기
				if(res!="댕댕이가 없습니다"){
					$("#dogCheckbox").append("같이 하는 댕댕이<br>");
					for(var i=0 ; i<res.length ; i++){
						var text = "";
						text += res[i];
						text += "<input type='checkbox' id=\'"+res[i]+"\' >";
						$("#dogCheckbox").append(text);
						dogList.push(res[i]);
					}
				}else{
					$("#dogCheckbox").append(res+"<br>");
				}

			},

			error : function(){
				alert("Ajax 통신 실패!!");	
			}
		});
	});
	
	
	
	//인증시작 버튼(누르면 사라짐)
	$(document).ready(function () {
		  $(document).on("click", "button[name='startRecord']", function () {
			// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
			  if (navigator.geolocation) {
			      
			      // GeoLocation을 이용해서 접속 위치를 얻어옵니다
			      navigator.geolocation.getCurrentPosition(function(position) {
			          
			          var lat = position.coords.latitude, // 위도
			              lon = position.coords.longitude; // 경도
			          
			          var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			              message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
			          
			              //시작 위치랑 가까운지 점검
			              //가까우면 인증 완료 버튼으로 변경
			              //시작 위치랑 멀면 그대로
			              
			              //polyLine의 getLength활용해서 수정해보자!
			              var myDistance = Math.abs(LinePath[0]["Ma"]-lat)+Math.abs(LinePath[0]["La"]-lon);
			              console.log(myDistance);
			              if(myDistance<1){
			            	  console.log("인증성공");
			            	  $("button[name='startRecord']").hide();
			            	  $("#record").append("<button name='endRecord'>인증완료</button><br>");
 
			            	  
			              }else{
			            	  console.log("인증실패");
			              }
								
			              
			          // 마커와 인포윈도우를 표시합니다
			          displayMarker(locPosition, message);
			              
			        });
			      
			  } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			      
			      var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
			          message = 'geolocation을 사용할수 없어요..'
			          
			      displayMarker(locPosition, message);
			  }

		    
		  });
		});
	
	//인증완료 버튼
	let checkedDogList = [];
	$(document).ready(function () {
		  $(document).on("click", "button[name='endRecord']", function () {
			// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
			  if (navigator.geolocation) {
			      
			      // GeoLocation을 이용해서 접속 위치를 얻어옵니다
			      navigator.geolocation.getCurrentPosition(function(position) {
			          
			          var lat = position.coords.latitude, // 위도
			              lon = position.coords.longitude; // 경도
			          
			          var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			              message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
			          
			              //시작 위치랑 가까운지 점검
			              //가까우면 인증 완료 버튼으로 변경
			              //시작 위치랑 멀면 그대로
			              
			              //polyLine의 getLength활용해서 수정해보자!
			              var myDistance = Math.abs(LinePath[LinePath.length-1]["Ma"]-lat)+Math.abs(LinePath[LinePath.length-1]["La"]-lon);
			              console.log(myDistance);
			              if(myDistance<1){
			            	  $("button[name='endRecord']").hide();	  
			            	  //ajax로 산책로 번호, 회원 번호 보내기
			            	  //체크박스에 클릭된 댕댕이 이름들도 보내기		            	  
								for(var i=0 ; i<dogList.length ; i++){
									if($("#"+dogList[i]).is(":checked") == true){
										checkedDogList.push(dogList[i]);
									}
								}
								console.log(checkedDogList)
								$.ajax({
					    			url: "Record",
					    			data: {
					    				"mbr_nbr":${sessionScope.loginedMBR.mbr_nbr},
					    				"wlk_rt_nbr":${requestScope.wlk_rt_nbr},
					    				"dogList":JSON.stringify(checkedDogList)
					    			},
					    			type: "POST",
					    			success: function(response) {
					    				$("#record").append("인증완료했습니다.")
					    			},
					    			error: function(xhr) {
					    				$("#record").append("인증실패했습니다.")
					    			},
					    		});	
			              }else{
			            	  $("#record").append("거리가 맞지 않아 인증실패했습니다.")
			              }
			          // 마커와 인포윈도우를 표시합니다
			          displayMarker(locPosition, message);
			              
			        });
			      
			  } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			      
			      var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
			          message = 'geolocation을 사용할수 없어요..'
			      displayMarker(locPosition, message);
			  }

		    
		  });
		});

	
	
</script>

</body>
</html>