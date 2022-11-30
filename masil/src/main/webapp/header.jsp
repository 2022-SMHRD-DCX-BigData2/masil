<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/d0972172f0.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:ital,wght@0,200;0,300;0,400;0,600;0,700;0,900;1,200;1,300;1,400;1,600;1,700;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Header.css">
    <title>Header</title>
</head>
<body>
 <div class="header_wrap">
        <nav class="navbar2">
            <div class="navbar_logo">
                <a href="Main.jsp">PATH WAY</a>
            </div>
        </nav>

        <nav class="navbar">

            <ul class="navbar_menu">
                <li><a href="Writing?area_nbr=${loginedMBR.area_nbr_for_mbr}&wrt_type=4" class="cm">PATH</a></li>
                <li><a href="Writing?wrt_type=1&type_nbr=0" class="cm">FREE_BOARD</a></li>
                <li><a href="MyPage.jsp" class="cm">MYPAGE</a></li>
            <c:if test="${loginedMBR.mbr_type eq 'ADMIN'}">
				<li><a href="Admin" class="cm">ADMIN</a></li>
			</c:if>
                
            </ul>
        </nav>
    </div>
</body>
</html>