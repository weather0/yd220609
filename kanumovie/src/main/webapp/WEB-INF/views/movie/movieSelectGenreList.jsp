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

.movie-card {
	background-image: url('img/Default.jpg');
	margin: 3%;
	border-radius: 10px;
	height: 600px;
	background-size: cover;
	padding: 2%;
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
		<h2><%= genre %></h2>
		<div class="movie-card-container">
			<c:forEach items="${movielist}" var="movie">
				<div class="movie-card"
					style="background-image: url('https://image.tmdb.org/t/p/w500${movie.posterPath}')">
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>