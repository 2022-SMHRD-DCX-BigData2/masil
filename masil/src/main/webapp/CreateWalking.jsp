<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link href="https://fonts.googleapis.com/css2?family=Cutive+Mono&family=Poppins:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen" href="./CSS/path_list_write.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<!-- 목적지 이름이 중복되는가 확인해야 함 중복이 안 되면
request.setAttribute에 area_name,area_nbr,isChecked 가지고 다시 옴-->

    <div class="board_wrap">
        <div class="board_title">
        <c:choose>
			<c:when test="${empty requestScope.isChecked}">
				<p>목적지를 입력해 주세요</p>
			</c:when>
			<c:when test="${requestScope.isChecked==false}">
				<p>중복된 목적지입니다.</p>
			</c:when>
			<c:otherwise>
				<p>새로운 목적지 입니다. 지도를 클릭해주세요!</p> 
			</c:otherwise>
		</c:choose>
            <strong>산책로 목적지 등록</strong>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
             <form action="CheckWalkingName" method="get">
                <div class="title" style="display:inline-block;">
                    <dl>
                        <dt>목적지 이름</dt>
        				  <c:choose>
								<c:when test="${requestScope.isChecked==true}">
									<font size="3em">${param.wlk_name}</font>
								</c:when>
								<c:otherwise>
									<dd><input type="text" name="wlk_name"></dd>	
									<dd><input type="hidden" name="area_nbr" value="${param.area_nbr}"></dd>
									<dd><button type="submit" class="ok">확인</button></dd>
                    			</c:otherwise>
                    		</c:choose>
                    </dl>
                </div>
                </form>
                	<%
                	if(request.getAttribute("isChecked")!=null){
	                	Boolean isChecked = (Boolean) request.getAttribute("isChecked");
	                	if(isChecked==true){
                	%>
                	<div class="cont">
                		<div id="map" style="width:100%;height:350px;"></div>
                		<div id="clickLatlng"></div>
                	</div>
                	<form action="InsertWalking" method="get" style="padding-left: 20px;">
						<input type="hidden" name="wlk_name" value="${requestScope.wlk_name}"><!-- 목적지 이름 -->
						<input type="hidden" name="area_nbr" value="${requestScope.area_nbr}"><!-- 지역 번호 -->
					<div id="wlk_info"></div> 
         			<div class="bt_wrap">
		               <button type="submit" class="on">등록</button>
		               <button type="reset" style="background-color:white;">취소</button>
		              </div>
					</form><!-- 목적지 이름 값이 없으면 목적지 이름을 정하라고 하고 돌려보내야 함 -->   		
                	
                	
                	<%} }%>

                	
                </div>
            </div>
        </div>
    




<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e94a31acf891a4c020db55b18fc70c54"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(34.96479451435151, 127.55329298926941), // 지도의 중심좌표
	        
	        //area_nbr에 해당하는 중심 좌표가 찍히게 설정하기
	        
	        level: 3 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 지도를 클릭한 위치에 표출할 마커입니다
	var marker = new kakao.maps.Marker({ 
	    // 지도 중심좌표에 마커를 생성합니다 
	    position: map.getCenter() 
	}); 
	// 지도에 마커를 표시합니다
	marker.setMap(map);
	
	// 지도에 클릭 이벤트를 등록합니다
	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = mouseEvent.latLng; 
	    
	    // 마커 위치를 클릭한 위치로 옮깁니다
	    marker.setPosition(latlng);
	    
	    //var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
	    //message += '경도는 ' + latlng.getLng() + ' 입니다';
	    
	    var resultDiv = document.getElementById('clickLatlng'); 
	    //resultDiv.innerHTML = message;
	    
	    $("#wlk_info").replaceWith('<input type="hidden" name="lat" value="'+latlng.getLat()+'"><input type="hidden" name="lon" value="'+latlng.getLng()+'">');
	    
	    
	});
</script>


</body>
</html>