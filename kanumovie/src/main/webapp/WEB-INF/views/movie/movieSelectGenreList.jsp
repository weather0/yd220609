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
<style>
#movielist-container {
	width: 90%;
	margin: 0 auto;
}

.movie-card-container {
	display: grid;
	grid-template-columns: 25% 25% 25% 25%;
}

.movie-card, .show-card {
	position: relative;
	width: 95%;
	background-image: url('img/Default.jpg');
	margin: 3%;
	border-radius: 10px;
	height: 600px;
	background-size: cover;
	padding: 2%;
}

.movie-card:hover, .show-card:hover {
	position: absolute;
	z-index: 3;
	background-image: linear-gradient(rgba(0, 0, 0, 0) 0%,
		rgba(0, 0, 0, 0.9) 100%);
	transform: scale(1.4);
	background-position-x: initial;
	background-position-y: initial;
	background-size: initial;
	background-repeat-x: initial;
	background-repeat-y: initial;
	background-attachment: initial;
	background-origin: initial;
	background-clip: initial;
	background-color: initial;
	width: 15%;
	height: 100%;
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
				<div class="movie-card"
					style="background-image: url('https://image.tmdb.org/t/p/w500${movie.posterPath}')">
				</div>
			</c:forEach>
			<c:forEach items="${showlist}" var="show">
				<div class="show-card"
					style="background-image: url('https://image.tmdb.org/t/p/w500${show.posterPath}')">
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>