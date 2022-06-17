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
<title>신고 페이지</title>

<style>
 
 #container {
 	color : white;
 }
 
 .center {
 	text-align : center;
 }
 
 
 h3 {
 	color : white;
 }
</style>
</head>

<body>

<div id="container"> 
	<section>
	<hr>
	<form id="form" action="reportInsert.do" method="post">
	<h3>신고 사유를 선택하세요.</h3>
		<hr>
			<ul>
				<li><label><input type="radio" name="report" value="스팸홍보/도배글입니다."> 스팸홍보/도배글입니다.</label>
				<li><label><input type="radio" name="report" value="음란물입니다."> 음란물입니다.</label>
				<li><label><input type="radio" name="report" value="욕설/생명경시/혐오/차별적 표현입니다."> 욕설/생명경시/혐오/차별적 표현입니다.</label>
				<li><label><input type="radio" name="report" value="개인정보 노출 게시물입니다."> 개인정보 노출 게시물입니다.</label> 
			</ul>
			<h3>신고내용</h3>
			<hr>
			<textarea id ="content" name="content" cols="70" rows="5"></textarea>
			<input type ="submit" value="신고하기">
			<input type ="reset" value="다시입력">
	</form>
</section>
</div>
</body>

<script>
	
</script>

</html>