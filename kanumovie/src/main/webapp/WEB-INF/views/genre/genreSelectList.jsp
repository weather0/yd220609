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

.genre-card:hover, .country-card:hover {
	transform: scale(1.1);
	transition: 0.4s;
	cursor: pointer;
}

.genre-card:hover h3, .country-card:hover h3 {
	text-decoration: underline;
}

#schbox {
    width: 40%;
    height: 50px;
    margin: 0 auto 13px;
    border: none;
    border-radius: 15px;
    text-align: center;
    background: #B7B8CE;
    font-size: 25px;
}

form {
	margin: 3%;
}

        @keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @-moz-keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @-webkit-keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @-o-keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @-moz-keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @-webkit-keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @-o-keyframes rotate-loading {
            0%  {transform: rotate(0deg);-ms-transform: rotate(0deg); -webkit-transform: rotate(0deg); -o-transform: rotate(0deg); -moz-transform: rotate(0deg);}
            100% {transform: rotate(360deg);-ms-transform: rotate(360deg); -webkit-transform: rotate(360deg); -o-transform: rotate(360deg); -moz-transform: rotate(360deg);}
        }

        @keyframes loading-text-opacity {
            0%  {opacity: 0}
            20% {opacity: 0}
            50% {opacity: 1}
            100%{opacity: 0}
        }

        @-moz-keyframes loading-text-opacity {
            0%  {opacity: 0}
            20% {opacity: 0}
            50% {opacity: 1}
            100%{opacity: 0}
        }

        @-webkit-keyframes loading-text-opacity {
            0%  {opacity: 0}
            20% {opacity: 0}
            50% {opacity: 1}
            100%{opacity: 0}
        }

        @-o-keyframes loading-text-opacity {
            0%  {opacity: 0}
            20% {opacity: 0}
            50% {opacity: 1}
            100%{opacity: 0}
        }
        .loading-container,
        .loading {
            height: 100px;
            position: relative;
            width: 100px;
            border-radius: 100%;
        }


        .loading-container { margin: 40px auto }

        .loading {
            border: 2px solid transparent;
            border-color: transparent #fff transparent #FFF;
            -moz-animation: rotate-loading 1.5s linear 0s infinite normal;
            -moz-transform-origin: 50% 50%;
            -o-animation: rotate-loading 1.5s linear 0s infinite normal;
            -o-transform-origin: 50% 50%;
            -webkit-animation: rotate-loading 1.5s linear 0s infinite normal;
            -webkit-transform-origin: 50% 50%;
            animation: rotate-loading 1.5s linear 0s infinite normal;
            transform-origin: 50% 50%;
        }

        .loading-container:hover .loading {
            border-color: transparent #E45635 transparent #E45635;
        }
        .loading-container:hover .loading,
        .loading-container .loading {
            -webkit-transition: all 0.5s ease-in-out;
            -moz-transition: all 0.5s ease-in-out;
            -ms-transition: all 0.5s ease-in-out;
            -o-transition: all 0.5s ease-in-out;
            transition: all 0.5s ease-in-out;
        }

        #loading-text {
            -moz-animation: loading-text-opacity 2s linear 0s infinite normal;
            -o-animation: loading-text-opacity 2s linear 0s infinite normal;
            -webkit-animation: loading-text-opacity 2s linear 0s infinite normal;
            animation: loading-text-opacity 2s linear 0s infinite normal;
            color: #E53637;
            font-family: "Helvetica Neue, "Helvetica", ""arial";
            font-size: 10px;
            font-weight: bold;
            margin-top: 45px;
            opacity: 0;
            position: absolute;
            text-align: center;
            text-transform: uppercase;
            top: 0;
            width: 100px;
        }
  #form-container, #category-container, .footer {
  	display:none;
  }
</style>
</head>
<body>
<!-- Preloader -->
<div class="loading-container">
	<div class="loading"></div>
	<div id="loading-text">loading</div>
</div>
<!-- 로딩 후 원래 아이템 출력 -->
<script>
	setTimeout(function() {
		document.querySelector('.loading-container').setAttribute('style', 'display:none');
		document.querySelector('#form-container').setAttribute('style', 'display:block');
		document.querySelector('#category-container').setAttribute('style', 'display:block');
		document.querySelector('.footer').setAttribute('style', 'display:block');
	}, 2000);
</script>
	<div id="form-container">
	<!-- 장르 또는 국가 서치할 키워드 넣는 Input Form -->
		<form>
			<input type="text" placeholder="Search Your Category" onkeyup="searching()" id="schbox">
		</form>
	</div>
	<!-- 전체 카테고리 컨테이너 -->
	<div id="category-container">
		<div id="button-container">
			<h4>카테고리 둘러보기</h4>
			<!-- 장르 카테고리 팝업 버튼 -->
			<button type="button" id = "genreButton" onclick="genreList()">장르</button>
			<!-- 국가 카테고리 팝업 버튼 -->
			<button type="button" id = "countryButton" onclick="countryList()">국가</button>
		</div>
		<!-- 장르 컨테이너 -->
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
		
		// 국가 리스트 호출
		fetch('countrySelectList.do')
			.then(response => response.json())
			.then(data => {
				let div = document.createElement('div');
				div.setAttribute('class', 'country-card-container');
				div.setAttribute('style', 'display:none');
				document.querySelector('#category-container').append(div);
				data.forEach((elem) => {
					let card = makeList(elem);
					div.append(card);
				})
			})
		
		// 국가 카드 만들기
		function makeList(elem) {
			let div = document.createElement('div');
			div.setAttribute('class', 'country-card');
			div.setAttribute('style', 'background-image:url(img/' + elem.id + '.jpg)');
			div.setAttribute('onclick', "location.href='movieSelectCountryList.do?name=" + elem.koreanName + "&id=" + elem.id + "'");
			let country = document.createElement('div');
			let countryname = document.createElement('h3');
			countryname.innerHTML = elem.koreanName;
			country.append(countryname);
			div.append(country);
			return div;
		}
		
		// 장르 버튼 누를 시 국가 컨테이너 블록 처리 
		document.querySelector('#genreButton').addEventListener('click', () => {
			document.querySelector('.genre-card-container').setAttribute('style', 'display:grid');
			document.querySelector('.country-card-container').setAttribute('style', 'display:none');
		})
		
		// 국가 버튼 누를 시 장르 컨테이너 블록 처리 
		document.querySelector('#countryButton').addEventListener('click', () => {
			document.querySelector('.genre-card-container').setAttribute('style', 'display:none');
			document.querySelector('.country-card-container').setAttribute('style', 'display:grid');
		})
			
    // 검색 기능
    function searching(){
      let schbox, name, item;
      schbox = document.getElementById("schbox").value.toUpperCase();
      item = document.querySelectorAll(".genre-card,.country-card");

      for(let i = 0; i < item.length; i++){
        name = item[i].querySelectorAll("h3")
        if(name[0].innerHTML.toUpperCase().indexOf(schbox) > -1){
          item[i].style.display = "flex";
        }else{
          item[i].style.display = "none";
        }
      }
    }

		</script>
	</div>
</body>
</html>