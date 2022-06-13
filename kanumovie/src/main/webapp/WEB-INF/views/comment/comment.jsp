<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="anime__details__review">
		<div class="section-title">
			<h5>Reviews</h5>
		</div>
		<c:forEach items="${comments }" var="comments">

			<div class="anime__review__item">
				<div class="anime__review__item__pic">
					<img src="img/anime/review-1.jpg" alt="">
				</div>
				<div class="anime__review__item__text">
					<h6>
					${comments.nick }	- <span>${comments.wdate }</span>
					</h6>
					<p>${comments.comments }</p>
				</div>
		</c:forEach>
	</div>



	<div class="anime__details__form">
		<div class="section-title">
			<h5>Your Comment</h5>
		</div>
		<form action="#">
			<textarea placeholder="Your Comment"></textarea>
			<button type="submit">
				<i class="fa fa-location-arrow"></i> Review
			</button>
		</form>
	</div>
</body>
</html>