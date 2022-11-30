<%@page import="java.lang.reflect.Parameter"%>
<%@page import="domain.MBR"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
<!--  All snippets are MIT license http://bootdey.com/license -->
<title>path_detail</title>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./pd_css/path_detail.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>

<body style="background-color: #f4f4f4; ">


<%@ include file="header.jsp" %>




	<!-- 상단메뉴 -->

    <div class="container confirm" style="margin-top: 48px;">
		<div class="card" style="width: 69.3rem;">
			<div class="card-body text-center">
				<div id="mark">			
<!-- 즐겨찾기 -->
<%
int wlk_rt_nbr = Integer.parseInt(request.getParameter("wlk_rt_nbr"));
String str_wlk_rt_nbr = Integer.toString(wlk_rt_nbr);
MBR loginedMBR = (MBR) session.getAttribute("loginedMBR");
String favList = loginedMBR.getFav_list();
if(favList==null){
	out.print("<button class='btn-like notdone' id='"+str_wlk_rt_nbr+"'>⭐</button>");
}else{
	if(favList.contains(str_wlk_rt_nbr)){
		out.print("<button class='btn-like done' id='"+str_wlk_rt_nbr+"'>⭐</button>");
	}else{
		out.print("<button class='btn-like notdone' id='"+str_wlk_rt_nbr+"'>⭐</button>");
	}
}
%>
				</div>
				
				<div id="map" style="width:100%;height:350px;"></div>

				<br>
				<div>
					<!-- 강아지, 인증버튼 -->
					<button name="nowLoc">현재 위치 확인하기</button>
					<br><br>
					<div id="record">
					<button name="startRecord">인증시작</button><br>
					</div>
					<br>
					<!-- 댕댕이 목록(체크박스) 비동기 통신으로 보여주기 -->
					<div id="dogCheckbox"></div>
				</div>
			</div>
		</div>
	</div>

	
	<div class="container board">
		<div class="job-box">
			<div class="job-box-filter">
			<!--  
				<button id="show" onclick="location.href='CreateWriting.jsp?type=2&type_nbr=${param.wlk_rt_nbr}'">리뷰등록</button>--> 
				<button id="show">리뷰등록</button>
				<div class="background">
					<div class="window">
						<div class="popup">
							<h1 class="rating_heading">산책로를 평가해 주세요!</h1>
							<div class="star_rating ">
									<p>산책로는 어떠셨나요?</p>
									<button class="star">&#9734;</button>
									<button class="star">&#9734;</button>
									<button class="star">&#9734;</button>
									<button class="star">&#9734;</button>
									<button class="star">&#9734;</button>
									<p class="current_rating">0 of 5</p>
									<input id="type" type="hidden" value="2">
									<input id="type_nbr" type="hidden" value="${param.wlk_rt_nbr}">
									<input id="mbr_nbr" type="hidden" value="${loginedMBR.mbr_nbr}">
									<input id="comment-input1" type="text" placeholder="제목">
									<input id="comment-input2" type="text" placeholder="간단한 후기 부탁드립니다!">

							</div>
			
							<button id="close" onclick="clearInput()" ><a href="path_detail.html" style="color: white;">등록</a></button>
						</div>
						
					</div>
				</div>
				
			</div>
			<section class="notice">
         
        <!-- board list area -->
          <div id="board-list">
              <div class="container">
                  <table class="board-table">
                      <thead>
                      <tr>
                          <th scope="col" class="th-num">작성자</th>
                          <th scope="col" class="th-title">리뷰이름</th>
                          <th scope="col" class="th-date">등록일</th>
                      </tr>
                      </thead>
                      <tbody class="tb" id="RVList">
                      </tbody>
                  </table>
              </div>
          </div>
		</section>


<!-- script -->
<script type="text/javascript"></script>
<script src="./pd_js/review.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script src="./pd_js/path_detail.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e94a31acf891a4c020db55b18fc70c54"></script>
<script type="text/javascript">
	
	let LinePath=[];
	//ajax로 LinePath받기
	$(document).ready(function(){
		$.ajax({
			url : "SetWalkingRtPath",
			type : "post",
			data : {"wlk_rt_nbr" : ${param.wlk_rt_nbr}},
			dataType : "json",
			async : false,
			success : function(res){
				for(var i=0 ; i<res.length ; i++){
					LinePath.push(new kakao.maps.LatLng(res[i].lat_for_wlk_rt,res[i].lon_for_wlk_rt));
				}
				
				
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			    mapOption = { 
			        center: new kakao.maps.LatLng(LinePath[LinePath.length-1]["Ma"], LinePath[LinePath.length-1]["La"]), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };

				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
				var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
				
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

				//리뷰 리스트
				$(document).ready(function(){
					$.ajax({
						url : "SetWalkingRTRVList",
						type : "get",
						data : {"wlk_rt_nbr" : ${param.wlk_rt_nbr}},
						dataType : "json",
						success : function(res){
							console.log(res);
							$("#RVList").html("");
							for(var i=0 ; i<res.length ; i++){
								var text = "";
								text += "<tr>";
								text += "<td>";
								text += GetId(res[i].wrt_ath);
								text += "</td>"
								text += "<th>";
								text += "<a href=\'ShowWritingContent?type=2&wrt_nbr=";
								text += res[i].wrt_nbr;
								text += "&type_nbr=";//wlk_rt_nbr을 쓰고 싶은데 el이 아무것도 없으면 js오류 나서 이렇게 함
								text += ${param.wlk_rt_nbr};
								text += "'>";
								text += res[i].wrt_ttl;
								text += "</a>";
								text += "</th>";
								text += "<td>";
								text += res[i].wrt_time;
								text += "</td>"
								text += "</tr>";
								$("#RVList").append(text);
							}			
						},
						error : function(){
							alert("Ajax 통신 실패!!");	
						}
					});
				});
				
				
				
				function GetId(mbr_nbr) {
					var mbr_id;
					$.ajax({
						url: "GetId",
						data: {"mbr_nbr":mbr_nbr},
						async : false,
						dataType : "text",
						type: "POST",
						success: function(res) {
								mbr_id=res;
						},
						error: function(xhr) {
						}
					});
					return mbr_id;
				}	
				
				
				
				
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
								    				"wlk_rt_nbr":${param.wlk_rt_nbr},
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
							
							
							
							

							
							

						},

						error : function(){
							alert("Ajax 통신 실패!!");	
						}
					});
				});				
			},
			error : function(){
				alert("SetWalkingRtPath Ajax 통신 실패!!");	
			},
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