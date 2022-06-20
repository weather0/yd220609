<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="assets/css/docs.theme.min.css">
<link rel="stylesheet"
	href="assets/owlcarousel/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="assets/owlcarousel/assets/owl.theme.default.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css?ver=1" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/plyr.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css?ver=1" type="text/css">


<!-- javascript -->

<!-- <script src="assets/vendors/jquery.min.js"></script>
<script src="assets/owlcarousel/owl.carousel.js"></script>  -->
</head>
<body>
	<tiles:insertAttribute name="header" />
	<c:if test="${authority eq 'admin'}">
	<tiles:insertAttribute name="sidebar" />
	</c:if>
	<div>
	<tiles:insertAttribute name="body" />
	</div>
	<div style="clear:both;">
	<tiles:insertAttribute name="footer" />
	</div>

	<!-- Js Plugins -->
	<script src="assets/vendors/highlight.js"></script>
	<script src="assets/js/app.js"></script>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/player.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>