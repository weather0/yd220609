<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>preferGenreForm.do</title>
<style>
    .n {
        color:red;
    }
</style>
</head>
<body>
    <div align="center">
        <div>
            <div><h1 class="n">선호 장르 페이지</h1></div>
        </div>
        <div>
            <table>
                <tr>
                    <th>영화이름</th>
                    <th>포스터</th>
                    <th>장르</th>
                </tr>
                <c:forEach items="${list }" var="li">
                    <tr  onclick="genSelect(this)">
                        <td>${li.name }</td>
                        <td class="posterow">
                        <img src='https://image.tmdb.org/t/p/w300${li.poster }' /></td>
                        <td id="genre"+i>${li.genre }</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    
    <script>
        function genSelect() {
        	let gen = document.querySelector('#genre').innerHTML;
        	console.log(gen);
        }
    </script>
</body>
</html>