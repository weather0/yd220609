<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String email=(String) session.getAttribute("email"); %>
<% String nick = (String) session.getAttribute("nick"); %>
<!DOCTYPE html>
<html>
<head>
<style>
#banner {
	margin: 0 auto;
	width: 80%;
}

#showcontainer {
	float: left;
	width: 70%;
	padding-left: 5%;
	height: 1800px;
	position: relative;
}

#showcontainer .row {
	box-sizing: border-box;
	display: block;
	width: 100%;
	margin: 5% 0% 5% 0%;
	padding: 0;
	height: 600px;
	max-width: 100%;
	max-height: 600px;
	
}

#showcontainer .large-16 {
	width: 100%;
	height: 500px;
	max-height: 500px;
	padding: 0%;
	margin: 0%;
}

#showcontainer .owl-carousel {
	width: 100%;
	height: 100%;
	padding: 2%;
}

#showcontainer .owl-stage-outer {
	height: 100%;
	width: 100%;
	padding: 2% 2% 2% 2%;

}

#showcontainer .owl-stage .active {
	overflow: visible;
	height: 100%;
}

#showcontainer .owl-stage {
	width: 100%;
	height: 100%;
	
}

#showcontainer .owl-item {
	padding: 0%;
	width: 95%;
	height: 100%;
}

h1 {
	color: white;
}

.item {
	position: relative;
	width: 95%;
	height: 100%;
	background-size: 100% 100%;
	border-radius: 10px;
	margin: 0%;
}

.item:hover {
	transform: scale(1.1);
	transition: 0.5s;
	cursor: selector;
	border-radius: 10px;
	z-index: 50;
}

.item:hover h2 {
	visibility: hidden;
}

.item:hover p {
	display: none;
}

.item h2 {
	position: absolute;
	top: -3%;
	left: -3%;
	color: #fff;
	font-weight: bold;
	z-index: 100;
	
	
}

#showcontainer h3 {
	color: white;
	margin:3% 0% 0% 3%;
	width: 100%;
}

#showcontainer p {
	color: #fff;
	position: absolute;
	display: flex;
	top: 70%;
	left: 5%;
	font-size: xx-large;
	line-height: 140%;
	overflow: visible;
}

#bdirname {
	background-size: 100% 100%;
}

.product__sidebar__comment {
	width: 25%;
	float:right;
}
</style>
<link rel="stylesheet" href="css/project-movie.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- banner start -->
<div id="banner">
		<div class="hero__slider owl-carousel">
			<c:forEach items="${blist}" var="b">
				<div id="bdirname" class="hero__items set-bg" style="background-image: url('img/banner/${b.bdirname}')">
					<div class="row">
						<div class="col-lg-6">
							<div class="hero__text">
								<div class="label" id="genrename">${b.genrename}</div>
								<h2 id="btitle">${b.btitle}</h2>
								<p id="bcontent">${b.bcontent}</p>
								<a href="#"><span>Watch Now</span> <i
									class="fa fa-angle-right"></i></a> 
									<c:if test="${authority eq 'admin'}"> <!-- 관리자일 경우만 보이게 -->
									<a href="bannerupdateform.do?bid=${b.bid}" class="btn btn-sm btn-primary"
									style="margin-top: 20px; color: white; background-color: #E53637"
									>수정</a>
									<a href="deletebanner.do?bid=${b.bid}" class="btn btn-sm btn-primary" 
									style="margin-top: 20px; color: white; background-color: #E53637">삭제</a>
									</c:if>
									
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			
		</div>
	</div>
	
	<!-- banner end -->
	
	<div id="showcontainer">
		<div class="row">
			<div>
				<h3>Now Trending Movie</h3>
			</div>
			<div class="large-16 columns">
				<div class="owl-carousel owl-theme movie">
					<div class="item" id="movie1"></div>
					<div class="item" id="movie2"></div>
					<div class="item" id="movie3"></div>
					<div class="item" id="movie4"></div>
					<div class="item" id="movie5"></div>
					<div class="item" id="movie6"></div>
					<div class="item" id="movie7"></div>
					<div class="item" id="movie8"></div>
					<div class="item" id="movie9"></div>
					<div class="item" id="movie10"></div>
					<div class="item" id="movie11"></div>
					<div class="item" id="movie12"></div>
					<div class="item" id="movie13"></div>
					<div class="item" id="movie14"></div>
					<div class="item" id="movie15"></div>
					<div class="item" id="movie16"></div>
					<div class="item" id="movie17"></div>
					<div class="item" id="movie18"></div>
					<div class="item" id="movie19"></div>
					<div class="item" id="movie20"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<div>
				<h3>Now Trending Show</h3>
			</div>
			<div class="large-16 columns">
				<div class="owl-carousel owl-theme show">
					<div class="item" id="show1"></div>
					<div class="item" id="show2"></div>
					<div class="item" id="show3"></div>
					<div class="item" id="show4"></div>
					<div class="item" id="show5"></div>
					<div class="item" id="show6"></div>
					<div class="item" id="show7"></div>
					<div class="item" id="show8"></div>
					<div class="item" id="show9"></div>
					<div class="item" id="show10"></div>
					<div class="item" id="show11"></div>
					<div class="item" id="show12"></div>
					<div class="item" id="show13"></div>
					<div class="item" id="show14"></div>
					<div class="item" id="show15"></div>
					<div class="item" id="show16"></div>
					<div class="item" id="show17"></div>
					<div class="item" id="show18"></div>
					<div class="item" id="show19"></div>
					<div class="item" id="show20"></div>
				</div>
			</div>
		</div>
		<c:if test="${email != null}">
		<div class="prefer row">
			<div>
				<input type="hidden" id="sessionId" value="${email}">
				<h3>${nick}님의 찜 목록</h3>
			</div>
			<div class="large-16 columns">
				<div class="owl-carousel owl-theme movie">
					<div class="item" id="movie1"></div>
					<div class="item" id="movie2"></div>
					<div class="item" id="movie3"></div>
					<div class="item" id="movie4"></div>
					<div class="item" id="movie5"></div>
					<div class="item" id="movie6"></div>
					<div class="item" id="movie7"></div>
					<div class="item" id="movie8"></div>
					<div class="item" id="movie9"></div>
					<div class="item" id="movie10"></div>
					<div class="item" id="movie11"></div>
					<div class="item" id="movie12"></div>
					<div class="item" id="movie13"></div>
					<div class="item" id="movie14"></div>
					<div class="item" id="movie15"></div>
					<div class="item" id="movie16"></div>
					<div class="item" id="movie17"></div>
					<div class="item" id="movie18"></div>
					<div class="item" id="movie19"></div>
					<div class="item" id="movie20"></div>
				</div>
			</div>
		</div>
		</c:if>
		<aside>
			
		</aside>
	</div>
	<script type="text/javascript">  
		let name = "<%=request.getAttribute("message")%>";
		if (name == 'login') {
			alert('로그인되었습니다.')
		} else if (name == 'logout') {
			alert('로그아웃되었습니다')
		} else if (name == 'login2') {
			alert('로그인 실패!!')
		} else if (name == 'signup') {
			alert('회원가입 완료!!')
		}
	</script>
	 <div class="product__sidebar__comment">
        <div class="section-title">
            <h5>New Comment</h5>
        </div>
        <div class="product__sidebar__comment__item">
            <div class="product__sidebar__comment__item__pic">
                <img src="img/sidebar/comment-1.jpg" alt="">
            </div>
            <div class="product__sidebar__comment__item__text">
                <ul>
                    <li>Active</li>
                    <li>Movie</li>
                </ul>
                <h5><a href="#">The Seven Deadly Sins: Wrath of the Gods</a></h5>
                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
            </div>
        </div>
        <div class="product__sidebar__comment__item">
            <div class="product__sidebar__comment__item__pic">
                <img src="img/sidebar/comment-2.jpg" alt="">
            </div>
            <div class="product__sidebar__comment__item__text">
                <ul>
                    <li>Active</li>
                    <li>Movie</li>
                </ul>
                <h5><a href="#">Shirogane Tamashii hen Kouhan sen</a></h5>
                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
            </div>
        </div>
        <div class="product__sidebar__comment__item">
            <div class="product__sidebar__comment__item__pic">
                <img src="img/sidebar/comment-3.jpg" alt="">
            </div>
            <div class="product__sidebar__comment__item__text">
                <ul>
                    <li>Active</li>
                    <li>Movie</li>
                </ul>
                <h5><a href="#">Kizumonogatari III: Reiket su-hen</a></h5>
                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
            </div>
        </div>
        <div class="product__sidebar__comment__item">
            <div class="product__sidebar__comment__item__pic">
                <img src="img/sidebar/comment-4.jpg" alt="">
            </div>
            <div class="product__sidebar__comment__item__text">
                <ul>
                    <li>Active</li>
                    <li>Movie</li>
                </ul>
                <h5><a href="#">Monogatari Series: Second Season</a></h5>
                <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
            </div>
        </div>
    </div>
	<script src="js/makeMovieCard.js"></script>
>>>>>>> branch 'dev' of https://github.com/Tessa1217/Kanumovie.git
	<script src="js/movie.js"></script>
	<script>
	const posterpath = "https://image.tmdb.org/t/p/w500"
	let param = {"email":'<%=email%>'};
	if ('<%=email%>' != null) {
		fetch('userLikesSelectList.do', {
			method:'POST',
			headers:{'Content-Type':'application/json'},
			body:JSON.stringify(param)
		})
			.then(response => response.json())
			.then(data => {
				data.forEach((elem, idx) => {
					if (idx < 20) {
					fetch('https://api.themoviedb.org/3/movie/' + elem.id + '?api_key=e51d70c65b46eb8bd60cafccc9325e8b&language=ko-KR')
						.then(response => response.json())
						.then(data => {
							let moviecard = document.querySelector('.prefer #movie' + (idx+1));				
							let title = document.createElement('p');
							title.innerHTML = data.title;
							moviecard.append(title);
							moviecard.setAttribute('style', 'background-image:url(' + posterpath + data.poster_path + ')');
						})
					}
				})
			})
	}
	
	
	</script>
	<script src="js/banner.js?ver=1"></script>
</body>
</html>