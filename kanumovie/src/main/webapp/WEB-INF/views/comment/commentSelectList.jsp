<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/project-movie.css">
<script src="js/makeMovieCard.js"></script>
<style>
	#noComment {
		margin: 5%;
		padding: 3%;
		color: white;
		text-align: center;
	}
	
	#goToCategory {
		text-align: center;
	}
	
	#goToCategory #GenreButton {
		background: none;
		border-radius: 10px;
		border: 1px solid #e53637;
	}
	
	#goToCategory #GenreButton:hover {
		transform: scale(1.1);
		transition-property: transform, background;
		transition-duration: 0.3s, 0.3s;
		background: #e53637;
	}
	
	.headerContainer {
		margin: 3%;
	}
	
	.headerContainer h3 {
		color: white;
	}
	
	.headerContainer h3 i {
		color: #e53637;
	}
	
	.infinite .movie-card-container {
		width: 90%;
		margin: 0 auto;
	}
</style>
</head>
<body>
	<!-- 사용자가 코멘트를 하나도 남기지 않은 경우 -->
	<!-- 사용자가 코멘트를 한 개이상의 영화에 남긴 경우 -->
	<c:choose>
		<c:when test="${fn:length(commentlist) == 0}">
			<h3 id="noComment">아직 코멘트를 남기지 않으셨네요?<br><br>영화를 보고 코멘트를 남겨주세요!</h3>
			<div id="goToCategory">
				<button id="GenreButton" onclick="location.href='genreSelectList.do'">영화 보러 가기</button>
			</div>
		</c:when>
		<c:otherwise>
			<div class="infinite">
				<div class="headerContainer">
					<h3><i class = "fa fa-pencil"></i> 리뷰한 영화</h3>
				</div>
				<div class="movie-card-container">
					<c:forEach items="${commentlist}" var="movie">
						<div class="movie-card">
							<input type="hidden" value="${movie.id}"> 
							<img src="https://image.tmdb.org/t/p/w500${movie.posterPath}">
							<div>
								<p>${movie.title}</p>
								<div class="star-rate" data-rate="${movie.voteAverage}">
									<span class="fa fa-star"></span> <span class="fa fa-star"></span>
									<span class="fa fa-star"></span> <span class="fa fa-star"></span>
									<span class="fa fa-star"></span>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<script>
	// 무비 카드 클릭 시 movieInfo 페이지로 이동
	let cards = document.querySelectorAll('.movie-card');
	let height = Math.ceil(cards.length/5) * 400 + 400;
	document.querySelector('.infinite').setAttribute('style', 'height:' + height + 'px');
	cards.forEach((elem) => {
		elem.addEventListener('click', function() {
			location.href="movieInfo.do?id=" + elem.children[0].value;
			})
		})
		
	// 별점 매기기 (rating 함수 jQuery 실행 안 되어서 새로 작성)
	let stars = document.querySelectorAll('.star-rate');
	stars.forEach(elem => {
		let score = elem.getAttribute('data-rate');
		score = parseFloat(score) / 2;
		let numScore = Math.trunc(score);
		let floatScore = score - Math.trunc(score);
		if (floatScore < 0.5) {
			for (let i = 0; i < numScore; i++) {
				elem.children[i].setAttribute('class', 'fa fa-star checked');
			}
		} else if (floatScore >= 0.5) {
			for (let i = 0; i < numScore; i++) {
				elem.children[i].setAttribute('class', 'fa fa-star checked');
				elem.children[numScore].setAttribute('class', 'fa fa-star fa-star-half-o');
			}
		}
	})
	</script>

</body>
</html>