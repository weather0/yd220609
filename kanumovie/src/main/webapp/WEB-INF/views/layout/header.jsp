<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.col-lg-8 {
	padding-right: 0;
	padding-left: 0;
}

.col-lg-2 {
	padding-right: 0;
	padding-left: 0;
}

.header__right a {
	margin-right: 10px;
}
</style>
</head>
<body>

	<header class="header">
		<div class="container">
			<div class="row">
				<div class="col-lg-2">
					<div class="header__logo">
						<a href="home.do"> <img src="img/kanumovielogo.png" alt="">
						</a>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="header__nav">
						<nav class="header__menu mobile-menu">
							<ul>
								<li class="active"><a href="home.do">Homepage</a></li>
								<li><a href="genreSelectList.do">Categories</a></li>
								<c:if test="${not empty email}">
								<li><a href="userLikesSelectList.do?email=${email}">보고싶어요</a>
								<li><a href="commentSelectList.do?email=${email}">리뷰한 작품</a>
								</c:if>
							</ul>
						</nav>
					</div>
				</div>
				<div class="col-lg-2">
					<div class="header__right">
						<a href="#" class="search-switch"><span class="icon_search"></span></a>
						<div class="search-model">
							<div
								class="h-100 d-flex align-items-center justify-content-center">
								<div class="search-close-switch">
									<i class="icon_close"></i>
								</div>
								<form class="search-model-form" name="searchFn" action="movieSearch.do" method="GET">
									<input type="text" id="search-input" name="query" placeholder="Search here.....">
								</form>
							</div>
						</div>

						<!--  <a href="loginForm.do"><span class="icon_profile"></span></a> -->
						<c:if test="${not empty email}">
							<a href="userManageForm.do"> <img
								style="width: 41px; height: 37px;" alt="${fileName}"
								src="img/profile/${fileName}">
							</a>
						</c:if>
						<!--  임시 프로필 확인용 -->
						<c:choose>
							<c:when test="${not empty email}">
								<a href="logout.do">Logout</a>
							</c:when>
							<c:otherwise>
								<a href="signUpForm.do">Sign Up</a>
								<a href="loginForm.do">Login</a>
							</c:otherwise>
						</c:choose>
					</div>

				</div>
			</div>
		</div>

		<div id="mobile-menu-wrap"></div>

	</header>

</body>
</html>