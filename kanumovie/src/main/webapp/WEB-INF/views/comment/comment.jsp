<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String email = (String) session.getAttribute("email");
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
			<div class="anime__review__item" id="${comments.cid }">
				<div class="anime__review__item__pic">
					<img src="img/anime/review-1.jpg" alt="">
				</div>
				<div class="anime__review__item__text">
					<h6>
						${comments.nick } - <span>${comments.wdate }</span>
						<c:if test="${comments.email == email }">

							<a href="#">수정</a>
							<a href="#" onclick="commentDelete(${comments.cid})">삭제</a>
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
			<form id="writeCommentForm" action="commentInsert.do" method="post">
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
	 var httpRequest = null;
	  // httpRequest 객체 생성
	function getXMLHttpRequest(){
		  var httpRequest = null;
		  if(window.ActiveXObject){
				 try{
				 httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
				 } catch(e) {
					     try{
						       httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
						    } catch (e2) { httpRequest = null;
						 }          
						      }      
						      }      
						      else if(window.XMLHttpRequest){ 
							               httpRequest = new window.XMLHttpRequest(); 
							           }          
							  return httpRequest;   
							         }
		
	
	//댓글 삭제창
	function commentDelete(cid) {
		var msg = confirm("댓글을 삭제합니다.");
		if(msg == true) {
			deleteCmt(cid);
		}
		else {
			return false;
		}
	}
	
	//댓글 삭제
	function deleteCmt(cid) {
		document.getElementById(cid).remove();
		var param="cid="+cid;
		httpRequest = getXMLHttpRequest();
		httpRequest.onreadystatechange = checkFunc;
		httpRequest.open("POST", "commentDelete.do", true); 
		httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8');  
		httpRequest.send(param);

	}
	
	function checkFunc(){
		  if(httpRequest.readyState == 4){
			// 결과값을 가져온다.   
	      var resultText = httpRequest.responseText;
		  if(resultText == 1) { 
			    document.location.reload(); // 상세보기 창 새로고침 
	     }   
	  }   
	}
}
</script>
</html>