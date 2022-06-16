<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#category-container {
	width: 90%;
	margin: 0 auto;
	background: rgba(0, 0, 0, 0.5);
	padding: 2%;
}

#button-container {
	width: 90%;
	margin: 2% auto;
	text-align: center;
}

#button-container button {
	background: transparent;
}

#button-container h4 {
	color: #fff;
	text-align: left;
	font-weight: bold;
}

#button-container button:hover {
	border-bottom: 2px solid #fff;
	font-weight: bold;
}

.genre-card-container, .country-card-container {
	display: grid;
	grid-template-columns: 25% 25% 25% 25%;
	padding: 1%;
}

.genre-card, .country-card {
	margin: 3%;
	border-radius: 10px;
	height: 200px;
	background-image: url(img/Action.jpg);
	background-size: cover;
	padding: 2%;
}

.genre-card h3, .country-card h3 {
	color: #fff;
	font-weight: bold;
}

.genre-card:hover {
	transform: scale(1.1);
	transition: 0.4s;
	cursor: pointer;
}

.genre-card:hover h3 {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div>
		<form>
			<input type="text" placeholder="Search Your Show"> <input
				type="submit" value="Search">
		</form>
	</div>
	<div id="category-container">
		<div id="button-container">
			<h4>카테고리 둘러보기</h4>
			<button type="button">장르</button>
			<button type="button" onclick="countryList()">국가</button>
		</div>
		<div class="genre-card-container">
			<c:forEach items="${genrelist}" var="genre">
				<div class="genre-card"
					style="background-image:url(img/${genre.name}.jpg)"
					onclick="location.href='movieSelectGenreList.do?name=${genre.name}&id=${genre.id}'">
					<div>
						<h3>${genre.name}</h3>
					</div>
				</div>
			</c:forEach>
		</div>
		<script>
		
			function countryList() {
				searchCountry();
			}
			
			function searchCountry() {
				fetch('countrySelectList.do')
					.then(response => response.json())
					.then(data => {
						if (document.querySelector(".genre-card-container")) {
							document.querySelector(".genre-card-container").remove();
							let div = document.createElement('div');
							div.setAttribute('class', 'country-card-container');
							document.querySelector('#category-container').append(div);
							data.forEach((elem) => {
								let card = makeList(elem);
								div.append(card);
							})
						}
					})
					.catch(err => console.log(err))
			}
			
			function makeList(elem) {
				let div = document.createElement('div');
				div.setAttribute('class', 'country-card');
				div.setAttribute('style', 'background-image:url(img/Action.jpg)');
				div.setAttribute('onclick', 'location.href="#"');
				let country = document.createElement('div');
				let countryname = document.createElement('h3');
				countryname.innerHTML = elem.koreanName;
				country.append(countryname);
				div.append(country);
				return div;
			}
			
		</script>
	</div>
</body>
</html>