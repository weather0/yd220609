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
let container = document.querySelector('.infinite');
if (document.querySelectorAll('.likemovie').length > 0) {
let div = document.createElement('div');
let header = document.createElement('h1');
header.innerHTML = "보고싶은 영화 리스트";
div.append(header);
container.append(div);
document.querySelectorAll('.likemovie').forEach((elem) => {
	fetch('https://api.themoviedb.org/3/movie/' + elem.value + '?api_key=e51d70c65b46eb8bd60cafccc9325e8b&language=ko-KR')
		.then(response => response.json())
		.then(data => {
			let card = makeCard(data);
			document.querySelector('.movie-card-container').append(card);
			rating(); 
		})
})
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