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
                    <tr onclick="genSelect()">
                        <td>${li.name }</td>
                        <td class="posterow">
                        <img src='https://image.tmdb.org/t/p/w300${li.poster }' /></td>
                        <td id="genre">${li.genre }</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="col-lg-4 poster">
              <img class="posterImg">
  
            </div>
            <div class="anime__details__title">
                  <h3></h3>
                </div>
    </div>
    
    <script>
        function genSelect() {
        	let gen = document.querySelector('#genre').innerHTML;
        	console.log(gen);
        }
        
        
     // Get방식 파라미터값 추출
        let getParameter = function (paramName) {
          paramName = paramName.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
          let regex = new RegExp("[\\?&]" + paramName + "=([^&#]*)");
          let results = regex.exec(location.search);
          return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }

        const API_KEY = 'api_key=e51d70c65b46eb8bd60cafccc9325e8b';
        const BASE_URL = 'https://api.themoviedb.org/3';
        const MOVIE_URL = '/movie/' + '338953';
        const IMG_URL = "https://image.tmdb.org/t/p/w300";
        let movieInfoAPI = BASE_URL + MOVIE_URL + '?' + API_KEY + '&language=ko-KR';
        let recomAPI = BASE_URL + MOVIE_URL + '/recommendations?' + API_KEY + '&language=ko-KR';
        let creditAPI = BASE_URL + MOVIE_URL + '/credits?' + API_KEY + '&language=ko-KR';
        let ratingAPI = BASE_URL + MOVIE_URL + '/rating?' + API_KEY + '&guest_session_id=5667cdad051a40c848b9b34da163b4dc';



        fetch(movieInfoAPI)
          .then(response => response.json())
          .then(movie => {
            console.log(movie);
            // 제목
            document.querySelector('.anime__details__title>h3').innerHTML = movie.title;


            // 포스터
            let posterImg = document.querySelector('.posterImg');
            posterImg.src = IMG_URL + movie.poster_path;
       
          })
          .catch(err => console.log(err));

        
    </script>
</body>
</html>