<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String genre = request.getParameter("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Icon Library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
#movielist-container {
	width: 90%;
	margin: 0 auto;
}

.movie-card-container {
	display: grid;
	grid-template-columns: 20% 20% 20% 20% 20%;
	gap: 0.5%;
	justify-content: center;
}

.movie-card, .show-card {
	position: relative;
	width: 95%;
	height: 400px;
	padding: 2%;
}

.movie-card img, .show-card img {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 100%;
	border-radius: 10px;
	object-fit: cover;
}

.movie-card div, .show-card div {
	position: absolute;
	border-radius: 10px;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	opacity: 0;
}

.movie-card:hover, .show-card:hover {
	transform: scale(1.1) translateY(-1%);
	overflow: visible;
	cursor: pointer;
	transition: 0.4s;
}

.movie-card:hover img, .show-card:hover img {
	opacity: 0.7;
}

.movie-card:hover > div, .show-card:hover > div {
	opacity: 1;
	background: rgba(0, 0, 0, 0.4);
}

.movie-card:hover div p, .show-card:hover p {
	position: absolute;
	top: 50%;
	left: 3%;
	color: #fff;
	font-weight: bold;
	font-size: large;
}

.star-rate .checked, .star-rate .fa-star-half-o {
	color: orange;
}

.movie-card:hover div .star-rate, .show-card:hover div .star-rate {
	position: absolute;
	z-index: 300;
	top: 70%;
	left: 5%;
	opacity: 1;
}

h2 {
	color: #fff;
	font-weight: bold;
	margin: 2%;
}
</style>
</head>
<body>
	<div id="movielist-container">
		<h2><%=genre%></h2>
		<div class="movie-card-container">
			<c:forEach items="${movielist}" var="movie">
				<div class="movie-card" onclick="location.href='#'">
					<img src="https://image.tmdb.org/t/p/w500${movie.posterPath}">
					<div>
						<p>${movie.title}</p>
						<div class="star-rate" data-rate="${movie.voteAverage}">
							<span class="fa fa-star"></span> 
							<span class="fa fa-star"></span> 
							<span class="fa fa-star"></span> 
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
						</div>
					</div>
				</div>
			</c:forEach>
			<c:forEach items="${showlist}" var="show">
				<div class="show-card" onclick="location.href='#'">
					<img src="https://image.tmdb.org/t/p/w500${show.posterPath}">
					<div>
						<p>${show.name}</p>
						<div class="star-rate" data-rate="${show.voteAverage}">
							<span class="fa fa-star"></span> 
							<span class="fa fa-star"></span> 
							<span class="fa fa-star"></span> 
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<script>
		let rating=$('.star-rate');
		rating.each(function() {
			let score = $(this).attr('data-rate');
		 	score = parseFloat(score)/2;
			let numScore = Math.trunc(score);
			let floatScore = score - Math.trunc(score);
		 	if (floatScore < 0.5) {
		 		$(this).find('span:nth-child(-n+'+numScore+')').addClass('checked');
		 	} else if (floatScore >= 0.5) {
		 		$(this).find('span:nth-child(-n+'+numScore+')').addClass('checked');
		 		$(this).find('span:nth-child('+ (numScore+1) + ')').addClass('fa-star-half-o');
		 	}
		})
	</script>
</body>
</html>