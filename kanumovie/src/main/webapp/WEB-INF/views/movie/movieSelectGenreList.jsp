<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String email=(String) session.getAttribute("email"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Icon Library -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Project Stylesheet -->
<link rel="stylesheet" href="css/project-movie.css">
</head>
<body>
<div class="category-kind-container">
	<h3 id="genreTitle">Categories > Genre > ${genre}</h3>
</div>
<div class="infinite">
	<input type="hidden" value="${id}">
	<input type="hidden" id = "sessionId" value="${email}">
	<div class="movie-card-container" data-value='1'>
	</div>
	<div class="movie-card-container" data-value='2'>
	</div>
</div>
<script src="js/rating.js"></script>
<script src="js/makeMovieCard.js"></script>
<script src="js/scroll.js"></script>
<script src="js/genre-movie.js"></script>
</body>
</html>