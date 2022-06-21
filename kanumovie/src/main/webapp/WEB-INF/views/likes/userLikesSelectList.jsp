<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String email = (String) session.getAttribute("email");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/project-movie.css">
<script src='js/rating.js'></script>
<script src='js/makeMovieCard.js'></script>
<style>
	body {
		height: 7400px;
	}
	.none {
		text-align: center;
	}
	.none h2 {
		margin: 3%;
	}
	.none button {
		background: tomato;
	}
	.none button:hover {
		transform: scale(1.1);
		transition: 0.3s;
	}
	
	#paginationNum li {
		background: #fff;
		color: #000;
	}
	
</style>
</head>
<body>
	<input type="hidden" id="sessionId" value="${email}">
	<div class="infinite">
		<div class="movie-card-container">
			<c:forEach items="${likeslist}" var="movie">
				<input type="hidden" class="likemovie" value="${movie.id}">
			</c:forEach>
		</div>
	</div>
</body>
<script>
// 사용자가 보고싶어요 한 영화 출력
let sessionId = document.querySelector('#sessionId').value;
let container = document.querySelector('.infinite');
// 사용자가 보고싶어한 영화가 1개 이상 있는 경우
if (document.querySelectorAll('.likemovie').length > 0) {
let div = document.createElement('div');
let header = document.createElement('h1');
header.innerHTML = "보고싶은 영화 리스트";
div.append(header);
container.append(div);
// DB에서 아이디 받아와서 fetch로 호출
document.querySelectorAll('.likemovie').forEach((elem) => {
	fetch('https://api.themoviedb.org/3/movie/' + elem.value + '?api_key=e51d70c65b46eb8bd60cafccc9325e8b&language=ko-KR')
		.then(response => response.json())
		.then(data => {
			let card = makeCard(data);
			document.querySelector('.movie-card-container').append(card);
			// 별점 평가 함수 실행
			rating();
			// 좋아요 하트 버튼 추가 (보고싶어요한 영화이기 때문에 Default color = red로 지정)
			console.log(document.querySelector('.fa-heart'));
			let heart = document.querySelector('#movie-'+data.id);
			heart.setAttribute('style', 'color:red');
			// 좋아요 풀 경우 해당 영화 카드 삭제
			heart.addEventListener('click', function(e) {
				heart.parentElement.parentElement.parentElement.remove(); 
			})
			})
			})		
// 사용자가 보고싶어한 영화가 0개인 경우
} else if (document.querySelectorAll('.likemovie').length == 0) {
	console.log("hi");
	let container = document.querySelector('.infinite');
	let div = document.createElement('div');
	div.setAttribute('class', 'none');
	let h2 = document.createElement('h2');
	h2.innerHTML = "아직 찜한 컨텐츠가 없으시네요?";
	div.append(h2);
	let button = document.createElement('button');
	button.setAttribute('onclick', 'location.href="genreSelectList.do"')
	button.innerHTML = "영화보러 가기";
	div.append(button);
	container.append(div);
}
</script>
</html>