<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<%
String genre = request.getParameter("name");
String id = request.getParameter("id");
%>
<div>
	<h1>${genre}</h1>
</div>
<div class="infinite">
	<input type="hidden" value="${id}">
	<div class="movie-card-container" data-value='1'>
	</div>
	<div class="movie-card-container" data-value='2'>
	</div>
</div>
<script src="js/project-movie.js"></script>
<script>
console.log(document.querySelector('input').value);
let cnt = 0;
window.onscroll = function() {
	let container = document.querySelector('div.infinite');
	console.log(container.offsetHeight);
	console.log(scrollY);
	if (window.scrollY > window.innerHeight && (window.scrollY) >= (container.offsetHeight-400)) {
		movieList(count);
		count++;
		console.log("add");
	}
}
</script>
</body>
</html>