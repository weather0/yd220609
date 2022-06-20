<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${fn:length(commentlist) == 0}">
			<h1>아직 코멘트를 남기지 않으셨네요? 영화를 보고 코멘트를 남겨주세요!</h1>
		</c:when>
		<c:otherwise>
			<c:forEach items="${commentlist}" var="movie">
				<h3>${movie.id}</h3>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</body>
</html>