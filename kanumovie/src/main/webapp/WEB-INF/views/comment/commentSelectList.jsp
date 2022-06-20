<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/project-movie.css">
<script src="js/makeMovieCard.js"></script>
<script src="js/rating.js"></script>
</head>
<body>
	<c:choose>
		<c:when test="${fn:length(commentlist) == 0}">
			<h1>아직 코멘트를 남기지 않으셨네요? 영화를 보고 코멘트를 남겨주세요!</h1>
		</c:when>
		<c:otherwise>
			<div class="infinite">
				<div class="movie-card-container">
					<c:forEach items="${commentlist}" var="movie">
						<div class="movie-card">
							<input type="hidden" value="${movie.id}"> 
							<img src="https://image.tmdb.org/t/p/w500${movie.posterPath}">
							<div>
								<button type="button" class="w3-button w3-black w3-round"
									style="background: none; z-index: 999">
									<i class="fa fa-heart" style="color: grey"
										id="movie-${movie.id}"></i>
								</button>
							</div>
							<div>
								<p>${movie.title}</p>
								<div class="star-rate" data-rate="${movie.voteAverage}">
									<span class="fa fa-star"></span> <span class="fa fa-star"></span>
									<span class="fa fa-star"></span> <span class="fa fa-star"></span>
									<span class="fa fa-star"></span>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<script src="js/pagination.min.js"></script>
	<script>
	/* //기본 페이지 값 
	int page = 1;
	//유저가 요청한 페이지가 널이 아니라면 받은 페이지값 저장
	if(request.getParameter("page") != null) {
		page = Integer.parseInt(request.getParameter("page"));			
	}
	Paging paging = new Paging();
	paging.setPage(page);
	int totalCount = dao.selectAllUserCount();
	paging.setTotalCount(totalCount);
	
	int startNum = (page-1)*10+1;
	int endNum = page*10;
	
	list = dao.selectAllUserList(startNum,endNum);
	
	request.setAttribute("list", list);
	request.setAttribute("paging", paging);
	
	 */
	 
	 $('#demo').pagination({
		 dataSource: document.querySelectorAll('.movie-card-container'),
		 pageSize: 25,
		 showPrevious: false,
		 showNext; false,
		 callback: function(data, pagination) {
			 let html = template(data);
			 dataContainer.html(html);
		 }
	 })
		let cards = document.querySelectorAll('.movie-card');
		console.log(cards);
		cards.forEach((elem) => {
		elem.addEventListener('click', function() {
			location.href="movieInfo.do?id=" + elem.children[0].value;
			})
		})
		rating(); 
	</script>
</body>
</html>