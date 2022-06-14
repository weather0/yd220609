<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.genre-card-container {
		display: grid;
		grid-template-columns: 25% 25% 25% 25%;
		padding: 1%;
	}
	.genre-card {
		margin: 3%;
		border-radius: 10px;
		height: 200px;
		background-image: url(img/Action.jpg);
		background-size: cover;
		padding: 2%;
	}
	.genre-card h3 {
		color: #fff;
		font-weight: bold;
	}
	.genre-hover {
			
	}
</style>
</head>
<body>
	<div>
	<form>
		<input type="text" placeholder="Search Your Show">
		<input type="submit" value="Search">
	</form>
	<div class="genre-card-container">
		<c:forEach items="${genrelist}" var="genre">
			<div class="genre-card" style="background-image:url(img/${genre.name}.jpg)">
				<a href="movieSelectGenreList.do?name=${genre.name}&id=${genre.id}">
					<div>
					<h3>${genre.name}</h3>
					</div>
				</a>
			</div>
		</c:forEach>
	</div>
</div>
</body>
</html>