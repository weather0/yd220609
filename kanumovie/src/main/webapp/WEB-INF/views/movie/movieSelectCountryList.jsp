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
<style>
	#countryTitle {
		margin: 3% 0% 3% 2%;
	}
	#countryTitle i {
		color: #e53637;
	}
</style>
</head>
<body>
<div class="category-kind-container">
	<h3 id="countryTitle"><a href="home.do"><i class="fa fa-home"></i></a> > Categories > Country > ${koreanTitle}</h3>
</div>
<div class="infinite">
	<!-- 국가 코드 저장 -->
	<input type="hidden" id="countryId" value="${id}">
	<!-- 유저의 이메일 저장 -->
	<input type="hidden" id = "c_sessionId" value="${email}">
	<!-- 무한 스크롤 구현 전 첫 2페이지 -->
	<div class="movie-card-container" data-value='1'>
	</div>
	<div class="movie-card-container" data-value='2'>
	</div>
</div>
<script src="js/rating.js"></script>
<script src="js/makeMovieCard.js"></script>
<script src="js/country-movie.js"></script>
<script>
let page = 0;
window.onscroll = function() {
	let container = document.querySelector('div.infinite');
	if (page < 5) {
		if (window.scrollY > window.innerHeight && (window.scrollY) >= (container.offsetHeight-400)) {
			countryMovieList(c_count);
			c_count++;
			page++;
		} 
	}
}
</script>
</body>
</html>