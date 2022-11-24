<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix= "c"  %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>road_board</title>
    <link rel="stylesheet" href="assets\css\road_board.css">

</head>
<body>
 <!-- Wrapper -->
    <div id="wrapper">

        <!-- Header --> 
        <%@ include file="header.jsp" %>



            <div id="board-search" style="margin-top: 110px;">
                <hr>
                <div class="container">
                    <div class="search-window">
                        <div class="search-wrap">
                            <select name="condi" id="condi" title="ì¡°ê±´ì ì ííì¸ì">
                                <option value="">ì í</option>
                                <option value="Suncheon">ìì²</option>
                                <option value="Gwangyang">ê´ì</option>
                            </select>
                            <select name="condi2" id="condi" title="ì¡°ê±´ì ì ííì¸ì">
                                <option value="">ì í</option>
                                <option value="Suncheon">ìì²</option>
                                <option value="Gwangyang">ê´ì</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        <div class = "tb">
            <table class="member">
                <tr>
                    <th>EMPNO</th>
                    <th>ENAME</th>
                    <th>JOB</th>
                </tr>
                <tr>
                    <td>7566</td>
                    <td>JONES</td>
                    <td>MANAGER</td>
                </tr>
                <tr>
                    <td>7788</td>
                    <td>SCOTT</td>
                    <td>ANALYST</td>
                </tr>
                <tr>
                    <td>7844</td>
                    <td>TURNER</td>
                    <td>SALESMAN</td>
                </tr>
                <tr>
                    <td>7876</td>
                    <td>ADAMS</td>
                    <td>CLERK</td>
                </tr>
                <tr>
                    <td>7369</td>
                    <td>SMITH</td>
                    <td>CLERK</td>
                </tr>
                <tr>
                    <td>7839</td>
                    <td>KING</td>
                    <td>PRESIDENT</td>
                </tr>
            </table>
        </div>
            <!-- board seach area -->
            <div id="board-search">
                <div class="container">
                    <div class="search-window">
                            <div class="search-wrap">
                                <button type="submit" class="btn btn-dark">ë±ë¡</button>
                            </div>
                    </div>
                </div>
            </div>

            

    </div>
    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>