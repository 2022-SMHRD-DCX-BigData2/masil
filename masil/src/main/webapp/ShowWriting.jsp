<%@page import="domain.WRT"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="TemplateMo">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="./CSS/fb_bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="./CSS/fb_font-awesome.css">  
    <link rel="stylesheet" href="./CSS/free_board.css">
    <link rel="stylesheet" href="./CSS/fb_owl-carousel.css">
    <link rel="stylesheet" href="./CSS/fl_css.css">
    
<title>Insert title here</title>
</head>
<body>
<!-- Header --> 
<%@ include file="header.jsp" %>
<div class="left-image-decor" ></div>
<div class="right-image-decor" ></div>
<div class="board_wrap">
        <div class="board_title">
            <strong>자유게시판</strong>
            <p>자유롭게 의견을 나눠주세요!</p>
        </div>
        
	<div class="search" style="position:relative;">
		<form action="SearchWRT" method="post">
	 		<select name="ttl_or_cnt" style="height: 40px; width: 7rem;">
				<option value="ttl">글제목</option>
				<option value="ath">글쓴이</option>
			</select>
			<input type="hidden" name="type" value="${requestScope.type}">
			<input type="hidden" name="type_nbr" value="${requestScope.type_nbr}">
			<input type="text" name="target" placeholder="검색어를 입력해주세요." class="ipt">
			<button class="gm">검색</button>
		</form>
	</div>
	<br>
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="num">작성시간</div>
                    <div class="title">제목</div>
                    <div class="writer">글쓴이</div>
                </div>
            </div>
            <!-- 
            <div class="board_page">
                <a href="#" class="bt first"><<</a>
                <a href="#" class="bt prev"><</a>
                <a href="#" class="num on">1</a>
                <a href="#" class="num">2</a>
                <a href="#" class="num">3</a>
                <a href="#" class="num">4</a>
                <a href="#" class="num">5</a>
                <a href="#" class="bt next">></a>
                <a href="#" class="bt last">>></a>
            </div>
             -->
        </div>
    </div>
        <div class="bt_wrap" >

            <a href="CreateWriting.jsp?type=${requestScope.type}&type_nbr=${requestScope.type_nbr}" class="on" style="position:relative;">등록</a>
        </div>



<!-- Bootstrap -->
<!-- <script src="./assets/js/fb_popper.js"></script> -->
<!-- <script src="./assets/js/fb_bootstrap.min.js"></script> -->
<!-- Plugins -->
<script src="./assets/js/fb_owl-carousel.js"></script>
<script src="./assets/js/fb_scrollreveal.min.js"></script>
<script src="./assets/js/fb_waypoints.min.js"></script>
<script src="./assets/js/fb_jquery.counterup.min.js"></script>
<script src="./assets/js/fb_imgfix.min.js"></script>
<!-- Global Init -->
<script src="./assets/js/fb_custom.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
<%
List<WRT> writings = (List) request.getAttribute("Writing");
for(WRT wrt : writings){ %>
	var type
	var id = GetId(<%= wrt.getWrt_ath()%>);
	var wrt_nbr = "<%=wrt.getWrt_nbr()%>";
	var wrt_ttl = "<%= wrt.getWrt_ttl()%>";
	var wrt_time = "<%=wrt.getWrt_time()%>";
	var text = "";
	
	wrt_time = wrt_time.substr(2,8);
	
	var link = "";
	link += "ShowWritingContent?&type=";
	link += '${requestScope.type}';
	link += "&type_nbr=";
	link += '${requestScope.type_nbr}';
	link += "&wrt_nbr=";
	link += wrt_nbr
	text += "<div>"
	text += "<div class='num'>"+wrt_time+"</div>";
	text += "<div class='title'><a href='"+link+"'>"+wrt_ttl+"</a></div>";
	text += "<div class='writer'>"+id+"</div>"
	text += "</div>"
	$(".top").after(text);
<%
}
%>
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
</script>
</body>
</html>