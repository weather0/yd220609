<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Stylesheets -->
<link
	href='https://fonts.googleapis.com/css?family=Lato:300,400,700,400italic,300italic'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="assets/css/docs.theme.min.css">

<!-- Owl Stylesheets -->
<link rel="stylesheet"
	href="assets/owlcarousel/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="assets/owlcarousel/assets/owl.theme.default.min.css">

<!-- Favicons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="shortcut icon" href="assets/ico/favicon.png">
<link rel="shortcut icon" href="favicon.ico">
<!-- javascript -->
<script src="assets/vendors/jquery.min.js"></script>
<script src="assets/owlcarousel/owl.carousel.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/movie.js"></script>
<style>
body {
	height: 800px;
	background: #fff;
}
img {
	width: 8%;
	height: 13%;
}
div h5 {
	color: #fff;
}
</style>
</head>
<body>
	<div id="container">
		<div class="row">
			<div>
				<h3>Now Trending Movie</h3>
			</div>
			<div class="large-16 columns">
				<div class="owl-carousel owl-theme">
					<div class="item">
						<img id="movie-1">
					</div>
					<div class="item">
						<img id="movie-2">
					</div>
					<div class="item">
						<img id="movie-3">
					</div>
					<div class="item">
						<img id="movie-4">
					</div>
					<div class="item">
						<img id="movie-5">
					</div>
					<div class="item">
						<img id="movie-6">
					</div>
					<div class="item">
						<img id="movie-7">
					</div>
					<div class="item">
						<img id="movie-8">
					</div>
					<div class="item">
						<img id="movie-9">
					</div>
					<div class="item">
						<img id="movie-10">
					</div>
					<div class="item">
						<img id="movie-11">
					</div>
					<div class="item">
						<img id="movie-12">
					</div>
					<div class="item">
						<img id="movie-13">
					</div>
					<div class="item">
						<img id="movie-14">
					</div>
					<div class="item">
						<img id="movie-15">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div>
				<h3>Now Trending Show</h3>
			</div>
			<div class="large-16 columns">
				<div class="owl-carousel owl-theme">
					<div class="item">
						<img id="show-1">
					</div>
					<div class="item">
						<img id="show-2">
					</div>
					<div class="item">
						<img id="show-3">
					</div>
					<div class="item">
						<img id="show-4">
					</div>
					<div class="item">
						<img id="show-5">
					</div>
					<div class="item">
						<img id="show-6">
					</div>
					<div class="item">
						<img id="show-7">
					</div>
					<div class="item">
						<img id="show-8">
					</div>
					<div class="item">
						<img id="show-9">
					</div>
					<div class="item">
						<img id="show-10">
					</div>
					<div class="item">
						<img id="show-11">
					</div>
					<div class="item">
						<img id="show-12">
					</div>
					<div class="item">
						<img id="show-13">
					</div>
					<div class="item">
						<img id="show-14">
					</div>
					<div class="item">
						<img id="show-15">
					</div>
				</div>
				<script type="text/javascript">
					let owl = $('.owl-carousel');
					owl.owlCarousel({
						margin : 10,
						nav : true,
						loop : true,
						responsive : {
							0 : {
								items : 1
							},
							600 : {
								items : 2
							},
							1000 : {
								items : 3
							}
						}
					})
				</script>
			</div>
		</div>
	</div>
	<script src="assets/vendors/highlight.js"></script>
	<script src="assets/js/app.js"></script>
</body>
</html>