<%@page import="domain.MBR"%>
<%@page import="domain.WRT"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
 -->
<link rel="stylesheet" type="text/css" media="screen" href="reply.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link href="https://fonts.googleapis.com/css2?family=Cutive+Mono&family=Poppins:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
</head>
<body>
<!-- Header --> 
<%@ include file="header.jsp" %>


<%
MBR loginedMBR = (MBR) session.getAttribute("loginedMBR");
WRT writing = (WRT) request.getAttribute("writing");
%>



    <div class="board_wrap">
        
        <div class="board_title">
        	<c:choose>
	        	<c:when test="${param.type eq '1'}">
	        		<strong>자유게시판</strong>
	        	</c:when>
	        	<c:when test="${param.type eq '2'}">
	        		<strong>산책로 리뷰</strong>
	        	</c:when>
	        	<c:otherwise>
	        		<strong>모임 게시판</strong>
	        	</c:otherwise>
            </c:choose>
            <p>산책로 관련하여 자유롭게 의견을 나눠주세요!</p>
        </div>

        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>&nbsp&nbsp제목</dt>
                        <dd><%=writing.getWrt_ttl() %></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>글쓴이</dt>
                        <dd id=wrt_id></dd>
                    </dl>
                </div>
                <div class="cont" >
                    <div style="height:250px;"><%=writing.getWrt_cnt() %></div>
                </div>
            </div>
        </div>
    </div>
</form>

<div class="reply_wrap">
    <div id="form-commentInfo">
    <form action="insertCMT" method="post">
        <div id="comment-count">댓글 <span id="count"></span></div>
        <input id="wrt_nbr" name="wrt_nbr" type="hidden" value="<%=writing.getWrt_nbr() %>">
        <input id="cmt_ath" name="cmt_ath" type="hidden" value="${sessionScope.loginedMBR.mbr_nbr}">
        <input type="hidden" name="wrt_type" value="${param.type}">
        <input id="comment-input" name="cmt_cnt" type="text" placeholder="댓글을 입력해 주세요.">
        <button name="inputCMT" id="submit">등록</button>
    </form>
    </div>
    <div id=comments>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">

var id = GetId(<%=writing.getWrt_ath() %>);
$("#wrt_id").append(id);


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


//이전 댓글 보여주기
$(document).ready(function () {
		$.ajax({
			url : "setCMT",
			type : "post",
			data : {wrt_nbr : $("#wrt_nbr").val()},
			dataType : "json",
			success : function(res){
				console.log("setCMT Ajax 통신 성공!!");
				$("#count").append(res.length)
				for(var i=0;i<res.length;i++){
					var rootDiv = document.querySelector("#comments");
					var userName = document.createElement('div');
				    var inputValue = document.createElement('span');
				    var showTime = document.createElement('div');
					var commentList = document.createElement('div');
					
					console.log(res[i].cmt_ath)
					commentList.className = "eachComment";
				    userName.className="name";
				    inputValue.className="inputValue";
				    showTime.className="time";
				    userName.innerHTML = res[i].cmt_id;
				    
				    var delBtn = document.createElement('button');
					//아이디가 동일한 경우에만 삭제 버튼 보이게 하기
					if(res[i].cmt_ath==${sessionScope.loginedMBR.mbr_nbr}){
						delBtn.className ="deleteComment";
						delBtn.id = res[i].cmt_nbr;
						delBtn.innerHTML="삭제";
						userName.appendChild(delBtn);
					}

	
				    inputValue.innerText = res[i].cmt_cnt;
				    showTime.innerHTML = res[i].cmt_time;
				    
					commentList.appendChild(userName);
					commentList.appendChild(inputValue);
					commentList.appendChild(showTime);
					rootDiv.prepend(commentList);
				}
			},
			error : function(){
				$(this).attr( 'id' )
			}
		});

	});

$(document).ready(function () {
	  $(document).on("click", "button[class='deleteComment']", function () {
	    $.ajax({
			url : "DeleteCMT",
			type : "post",
			data : {cmt_id : $(this).attr( 'id' )},
			success : function(res){
				console.log("DeleteCMT Ajax 통신 성공!!");
			},
			error:function(){
				console.log("DeleteCMT Ajax 통신 실패!!");
			}
	    });

	  });
	});
</script>

</body>
</html>








