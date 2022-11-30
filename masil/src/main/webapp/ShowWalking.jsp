<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="./dstn_css/dstn_list.css" />
<title>Insert title here</title>
<script src="./dstn_js/jquery.min.js"></script>
<script src="./dstn_js/browser.min.js"></script>
<script src="./dstn_js/breakpoints.min.js"></script>
<script src="./dstn_js/util.js"></script>
<script src="./dstn_js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	var temp;
	
	$.ajax({
		url : "SetBclsArea",
		type : "get",
		dataType : "json",
		success : function(res){
			console.log(res);
			$("#selectbox").html("<option value='' selected disabled hidden>"+"${param.b_cls}"+"</option>");
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
			console.log(res);
			$("#selectNextbox").html("<option value='' selected disabled hidden>"+"${param.s_cls}"+"</option>");
			//$("#selectNextbox").append("<option selected disabled hidden>"+선택+"</option>");
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
			console.log(res);
			$("#selectNextbox").html("<option value='' selected disabled hidden>"+"${param.s_cls}"+"</option>");
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
};


function setWalking(){
	var select1 = $("#selectbox option:selected").text();
	var select2 = $("#selectNextbox option:selected").text();
	$("#SetArea").html("");
	location.href="Writing?b_cls="+select1+"&s_cls="+select2+"&wrt_type=5";
}


$(document).ready(function(){
	$.ajax({
		url : "SetWalkingRtList",
		type : "get",
		data : {"area_nbr" : ${requestScope.type_nbr}},
		dataType : "json",
		success : function(res){
			$("#walkingRtList").html("");
			var text = "<table class='member'><tr><th>목적지</th></tr>";
			for(var i=0 ; i<res.length ; i++){
				text += "<tr><td><a href=\'ShowWalkingSpot.jsp?wlk_nbr="+res[i].wlk_nbr+"&lat="+res[i].lat_for_wlk+"&lon="+res[i].lon_for_wlk+"&wlk_name="+res[i].wlk_name+"'>"+res[i].wlk_name+"</a></td></tr>";
			}
			text += "</table>";
			$("#walkingRtList").append(text);
		},
		error : function(){
			alert("Ajax 통신 실패!!");	
		}
	});
});
</script>
</head>


<body class="is-preload">
<%@ include file="header.jsp" %>

		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Header -->
				<!-- Main -->
					<div id="main">
						
						<!-- Post -->
							<article class="post">
								<header>
									<div class="title">
										<h2>산 책 목 적 지</h2>
										<div class="btn">
											<button type="submit" class="btn-dark" id="addWalkingSpot">
												<a href="CreateWalking.jsp?area_nbr=${requestScope.type_nbr}">등록</a></button>
										</div>
									</div>
									<!-- <div class="meta">
										<time class="published" datetime="2015-11-01">November 1, 2015</time>
										<a href="#" class="author"><span class="name">Jane Doe</span><img src="images/avatar.jpg" alt="" /></a>
									</div> -->
								</header>
								<div id="board-search">
                
									<div class="container">
										<div class="search-window">
											<div class="search-wrap">
											<select id="selectbox" name="b_cls" class="condi"  onchange="changeSelect()"></select>
											<select id="selectNextbox" name="s_cls" class="condi" onchange="setWalking()"></select>
											</div>
										</div>
									</div>
							</div>
							<div class = "tb" id="SetArea">
								<!-- 지역별 산책로 경로 보여주기 -->
								<div id="walkingRtList"></div>
							</div>
						</article>
					</div>


			</div>


</body>
</html>