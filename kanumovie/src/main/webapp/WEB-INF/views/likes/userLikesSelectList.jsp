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
		margin: 5%;
		padding: 3%;
		text-align: center;
	}
	.none h2 {
		margin: 3%;
	}
	
	.infinite {
		height: 1300px;
	}
	.infinite h3 {
		color: white;
		margin: 3% 0% 3% 2%;
	}
	
	.infinite h3 i {
		color: #e53637;
	}
	.none button {
		background: none;
		border-radius: 10px;
		border: 1px solid #e53637;
	}
	.none button:hover {
		transform: scale(1.1);
		transition-duration: 0.3s, 0.3s;
		transition-property: transform, background;
		background: #e53637;
	}
	
	.infinite .movie-card-container {
		width: 90%;
		margin: 5% auto;
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
let header = document.createElement('h3');
header.innerHTML = " 보고싶은 영화 리스트";
let icon = document.createElement('i');
icon.setAttribute('class', 'fa fa-heart');
header.prepend(icon);
div.append(header);
container.prepend(div);
// DB에서 아이디 받아와서 fetch로 호출
document.querySelectorAll('.likemovie').forEach((elem) => {
	fetch('https://api.themoviedb.org/3/movie/' + elem.value + '?api_key=e51d70c65b46eb8bd60cafccc9325e8b&language=ko-KR')
		.then(response => response.json())
		.then(data => {
			// 카드 수만큼 높이 맞추기
			let totalData = document.querySelectorAll('.likemovie').length;
			let height = Math.ceil(totalData/5) * 400 + 600;
			document.querySelector('.infinite').setAttribute('style', 'height:' + height + 'px');
			let card = makeCard(data);
			document.querySelector('.movie-card-container').append(card);
			// 별점 평가 함수 실행
			rating();
			// 좋아요 하트 버튼 추가 (보고싶어요한 영화이기 때문에 Default color = red로 지정)
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
	let container = document.querySelector('.infinite');
	let div = document.createElement('div');
	div.setAttribute('class', 'none');
	let h2 = document.createElement('h2');
	h2.innerHTML = "아직 찜한 컨텐츠가 없으시네요?";
	div.append(h2);
	let button = document.createElement('button');
	button.setAttribute('onclick', 'location.href="genreSelectList.do"')
	button.innerHTML = "지금 영화보러 가기";
	div.append(button);
	container.append(div);
}
</script>
</html>