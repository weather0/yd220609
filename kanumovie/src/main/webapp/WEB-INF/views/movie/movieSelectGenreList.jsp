<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<c:forEach items="${movielist}" var="movie">
			<table>
				<tr>
					<td>${movie.id}</td>
					<td>${movie.title}</td>
					<td>${movie.voteAverage}</td>
					<td>${movie.voteCount}</td>
				</tr>
			</table>
		</c:forEach>
	</div>
</body>
</html>