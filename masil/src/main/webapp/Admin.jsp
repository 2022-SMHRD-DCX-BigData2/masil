<%@page import="domain.MBR"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="Favorites.css">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>




    <div class="board_wrap">
        <div class="board_title">
            <strong>회원목록</strong>
        </div>
        <div class="board_list_wrap">
            <div class="board_list" id="MBRList">
                <div class="top">            
                    <div class="btn " style="text-align:center ">관리</div>
                    <!--  <div class="title">목적지이름</div>-->
                    <div class="title" style="position:relative;left:10%">회원 아이디</div>         
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
var text = "";
<%
List<MBR> AllCMBR = (List) request.getAttribute("AllCMBR");
if(AllCMBR!=null){
	for(MBR mbr : AllCMBR){
		%>
		text += "<div><form action='DeleteMBR' method='post'><div class='btn' style='float:left;align:center;width:28%;position:relative;bottom:10px'>";
		text += "<input type='hidden' name='mbr_nbr' value='";
		text += "<%=mbr.getMbr_nbr()%>"
		text += "'>";
		text += "<input type='submit' value=' X '></form></div>"
		text += "<div class='title' style='float:left;position:relative;bottom:10px'>";
		text += "<%=mbr.getMbr_id()%>";
		text += "</div></div>";
		<%
	}
}
%>
$("#MBRList").append(text);
</script>
</body>
</html>