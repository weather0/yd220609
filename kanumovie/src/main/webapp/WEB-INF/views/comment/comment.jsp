<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String email = (String)session.getAttribute("email");
%>
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
					<c:if test="${comments.email == email }">
					
					<a href="#">수정</a>
					<button type="button"
                        class="btn btn-sm btn-outline-danger comment-delete-btn"
                        data-comment-id="{{cid}}">삭제
               	    </button>
					</c:if>
					<a href="#">신고</a>
					</h6>
					
					<p>${comments.comments }</p>
				</div>
			</div>
		</c:forEach>
	</div>


	<c:if test="${email != null }">
	<div class="anime__details__form">
		<div class="section-title">
			<h5>Your Comment</h5>
		</div>
		<form id ="writeCommentForm" action="commentInsert.do" method="post">
			<textarea id="comments" name="comments" placeholder="Your Comment"></textarea>
			<button type="submit">
				<i class="fa fa-location-arrow"></i> Review
			</button>
		</form>
	</div>
	</c:if>
</body>

<Script>
{
  // 삭제 버튼 선택
  const commentDeleteBtns = document.querySelectorAll(".comment-delete-btn");
  // 삭제 버튼 이벤트를 처리
  commentDeleteBtns.forEach(btn => {
    // 각 버튼의 이벤트 처리를 등록
    btn.addEventListener("click", (event) => {
      // 이벤트 발생 요소를 선택
      const commentDeleteBtn = event.target;
      // 삭제 댓글 id 가져오기
      const commentId = commentDeleteBtn.getAttribute("data-comment-id");
      console.log(`삭제 버튼 클릭: ${commentId}번 댓글`);
    });
  });
}
</script>
</html>