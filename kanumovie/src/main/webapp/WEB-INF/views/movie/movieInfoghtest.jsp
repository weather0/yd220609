<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta charset="UTF-8">
<title>MovieInfo</title>
<style>
div.scroller_wrap {
	position: relative;
	top: 0;
	left: 0;
}

ol.people.scroller {
	-webkit-overflow-scrolling: touch;
	overflow-y: hidden;
	overflow-x: scroll;
	margin-left: -10px;
	margin-top: -10px;
	padding-bottom: 10px;
}

ol.people {
	list-style-type: none;
	list-style-position: inside;
	margin: 0;
	padding: 0;
	display: flex;
	position: relative;
	top: 0;
	left: 0;
}

.card {
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	border: 1px solid rgba(var(- -lightGrey), 1);
	background-color: #fff;
}

ol.people li.card {
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: 10px;
	margin-right: 4px;
	border: 1px solid rgba(var(- -lightGrey), 1);
	padding-bottom: 10px;
	border-radius: var(- -imageBorderRadius);
	overflow: hidden;
}

ol.people li {
	min-width: 140px;
	width: 140px;
	background-color: #fff;
	margin-right: 10px;
}

ol.people li>a {
	min-width: 138px;
	width: 138px;
	height: 175px;
	display: block;
}

section.panel ol.people li a+p {
	padding-top: 10px;
}

ol.people li p {
	font-size: 1em;
	margin: 0;
	padding: 0 10px;
	overflow: hidden;
	text-overflow: ellipsis;
}

ol.people li p a {
	font-weight: bold;
	color: #000;
}
</style>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/plyr.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">

<script>


      const API_KEY = 'api_key=e51d70c65b46eb8bd60cafccc9325e8b';
      const BASE_URL = 'https://api.themoviedb.org/3';
      const MOVIE_URL = '/movie/146724';
      const poster = "https://image.tmdb.org/t/p/w300";
      let movieInfoAPI = BASE_URL + MOVIE_URL + '?' + API_KEY + '&language=ko-KR';
      let ratingAPI = BASE_URL + MOVIE_URL + '/rating?' + API_KEY + '&guest_session_id=5667cdad051a40c848b9b34da163b4dc';
      let creditAPI = BASE_URL + MOVIE_URL + '/credits?' + API_KEY + '&language=ko-KR';
      // let sessionAPI = BASE_URL + '/authentication/session/new?' + API_KEY



      fetch(movieInfoAPI)
        .then(response => response.json())
        .then(movie => {
          console.log(movie);
          // 제목
          document.querySelector('.anime__details__title>h3').innerHTML = movie.title;

          // 개봉연도 | 러닝타임
          document.querySelector('.subInfo').innerHTML = movie.release_date.substring(0, 4) + '\u00A0\u00A0\u00A0|\u00A0\u00A0\u00A0' + movie.runtime + ' min';

          // 포스터
          let pic = document.querySelector('.anime__details__pic');
          pic.dataset.setbg = poster + movie.poster_path;
          pic.style.setProperty('background-image', 'url(' + poster + movie.poster_path + ')');

          // 줄거리
          document.querySelector('.overview').innerHTML = movie.overview;

          // 부가정보
          let detailInfo = function (arr, str, str2) {
            let arr2 = [];
            arr.forEach(obj => {
              arr2.push(obj.name);
            });
            let span = document.createElement('span')
            span.innerHTML = str;
            document.querySelector(str2).append(span);
            span.after(arr2.join(', '));
          }

          detailInfo(movie.genres, '장르:', '.genre');

          let span = document.createElement('span')
          span.innerHTML = '개봉일:';
          document.querySelector('.releaseDate').append(span);
          span.after(movie.release_date);

          detailInfo(movie.production_countries, '국가:', '.countries');
          detailInfo(movie.production_companies, '제작 및 배급:', '.companies');



          // 별점
          movie.vote_count
          let fullstar = parseInt(movie.vote_average / 2);
          let halfstar = movie.vote_average % 2;
          let rating = document.querySelector('.rating');
          let starFn = function (str) {
            let atag = document.createElement('a');
            atag.href = '#';
            let itag = document.createElement('i');
            itag.className = str;
            atag.append(itag);
            rating.append(atag);
          }

          if (halfstar >= 0.5) {
            for (let i = 0; i < fullstar; i++) {
              starFn('fa fa-star');
            }
            starFn('fa fa-star-half-o');
            for (let i = 0; i < (4 - fullstar); i++) {
              starFn('fa fa-star-o');
            }
          } else {
            for (let i = 0; i < fullstar; i++) {
              starFn('fa fa-star');
            }
            for (let i = 0; i < (5 - fullstar); i++) {
              starFn('fa fa-star-o');
            }
          }

          document.querySelector('.votesCnt').innerHTML = movie.vote_count + ' Votes';


        })
        .catch(err => console.log(err));







      // Cast & Crew 카드 섹션

      fetch(creditAPI)
        .then(response => response.json())
        .then(credit => {
          console.log(creditAPI);
          let ol = document.querySelector('.people');
          let anony = 'https://mvp.microsoft.com/ko-kr/PublicProfile/Photo/720101';

          // 감독 카드

          credit.crew.forEach(function (obj, i) {

            if (obj.job == 'Director') {
              let li = document.createElement('li');
              li.className = 'card';
              let atag = document.createElement('a');
              atag.href = 'https://www.themoviedb.org/person/' + credit.crew[i].id;
              let img = document.createElement('img');
              img.loading = 'lazy';
              img.className = 'profile';
              if (credit.crew[i].profile_path == null) {
                img.src = anony;
                img.srcset = anony + ' 1x';
                img.style = 'height:175px';
              } else {
                img.src = 'https://www.themoviedb.org/t/p/w138_and_h175_face' + credit.crew[i].profile_path;
                img.srcset = 'https://www.themoviedb.org/t/p/w138_and_h175_face' + credit.crew[i].profile_path + ' 1x';
              }
              img.alt = credit.crew[i].name;

              atag.append(img);

              let atag2 = document.createElement('a');
              atag2.innerHTML = credit.crew[i].name;
              let ptag = document.createElement('p');
              ptag.append(atag2)

              let ptag2 = document.createElement('p');
              ptag2.className = 'character';
              ptag2.innerHTML = credit.crew[i].job;

              li.append(atag);
              li.append(ptag);
              li.append(ptag2);
              ol.append(li);

            }
          })



          // 배우 카드
          for (let i = 0; i < 7; i++) {
            let li = document.createElement('li');
            li.className = 'card';
            let atag = document.createElement('a');
            atag.href = 'https://www.themoviedb.org/person/' + credit.cast[i].id;
            let img = document.createElement('img');
            img.loading = 'lazy';
            img.className = 'profile';
            if (credit.cast[i].profile_path == null) {
              img.src = anony;
              img.srcset = anony + ' 1x';
              img.style = 'height:175px';
            } else {
              img.src = 'https://www.themoviedb.org/t/p/w138_and_h175_face' + credit.cast[i].profile_path;
              img.srcset = 'https://www.themoviedb.org/t/p/w138_and_h175_face' + credit.cast[i].profile_path + ' 1x';
            }
            img.alt = credit.cast[i].name;

            atag.append(img);

            let atag2 = document.createElement('a');
            atag2.innerHTML = credit.cast[i].name;
            let ptag = document.createElement('p');
            ptag.append(atag2)

            let ptag2 = document.createElement('p');
            ptag2.className = 'character';
            ptag2.innerHTML = credit.cast[i].character;

            li.append(atag);
            li.append(ptag);
            li.append(ptag2);
            ol.append(li);


          }







          // console.log('=========');
          // credit.crew.forEach(function (obj) {
          //   if (obj.job == 'Producer') {
          //     console.log(obj.name);
          //     console.log(', ');
          //   }
          // })


        })


    </script>






</head>


<body>


	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>


	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="./index.html"><i class="fa fa-home"></i> Home</a> <a
							href="./categories.html">Categories</a> <span>Romance</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Anime Section Begin -->
	<section class="anime-details spad">
		<div class="container">
			<div class="anime__details__content">
				<div class="row">
					<div class="col-lg-4">
						<div class="anime__details__pic">
							<!-- <div class="comment"><i class="fa fa-comments"></i> 11</div>
                <div class="view"><i class="fa fa-eye"></i> 9141</div> -->
						</div>
					</div>
					<div class="col-lg-8">
						<div class="anime__details__text">
							<div class="anime__details__title">
								<h3></h3>
								<span class="subInfo"></span>
							</div>
							<div class="anime__details__rating">
								<div class="rating"></div>
								<span class="votesCnt"></span>
							</div>
							<p class="overview"></p>
							<div class="anime__details__widget">
								<div class="row">
									<div class="col-lg-12 col-md-6">
										<ul>
											<!-- <li><span>Type:</span> TV Series</li> -->
											<li class="genre"></li>
											<li class="releaseDate"></li>
											<li class="countries"></li>
											<li class="companies"></li>
										</ul>
									</div>
									<!-- <div class="col-lg-6 col-md-6">
                      <ul>
                        <li><span>Scores:</span> 7.31 / 1,515</li>
                        <li><span>Rating:</span> 8.5 / 161 times</li>
                        <li><span>Duration:</span> 24 min/ep</li>
                        <li><span>Quality:</span> HD</li>
                        <li><span>Views:</span> 131,541</li>
                      </ul>
                    </div> -->
								</div>
							</div>






							<section class="panel top_billed scroller">
								<h3 dir="auto">Cast & Crew</h3>



								<div id="cast_scroller"
									class="scroller_wrap should_fade is_fading">
									<ol class="people scroller">

										<!-- <li class="card">
                        <a href="https://www.themoviedb.org/person/6384-keanu-reeves?language=ko">
                          <img loading="lazy" class="profile"
                            src="https://www.themoviedb.org/t/p/w138_and_h175_face/4D0PpNI0kmP58hgrwGC3wCjxhnm.jpg"
                            srcset="https://www.themoviedb.org/t/p/w138_and_h175_face/4D0PpNI0kmP58hgrwGC3wCjxhnm.jpg 1x, https://www.themoviedb.org/t/p/w276_and_h350_face/4D0PpNI0kmP58hgrwGC3wCjxhnm.jpg 2x"
                            alt="Keanu Reeves">
                        </a>
                        <p><a href="https://www.themoviedb.org/person/6384-keanu-reeves?language=ko">Keanu Reeves</a>
                        </p>
                        <p class="character">Thomas A. Anderson / Neo</p>
                      </li>

                      <li class="filler view_more">
                        <p><a href="/movie/603-the-matrix/cast?language=ko">더 보기 <span
                              class="glyphicons_v2 arrow-thin-right"></span></a></p>
                      </li> -->

									</ol>

								</div>


							</section>

							<div class="anime__details__btn">
								<a href="#" class="follow-btn"><i class="fa fa-heart-o"></i>
									Follow</a> <a href="#" class="watch-btn"><span>Watch Now</span>
									<i class="fa fa-angle-right"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>









			<!-- comment 시작 -->
			<div class="row">
				<div class="col-lg-8 col-md-8">
					<div class="anime__details__review">
						<div class="section-title">
							<h5>Reviews</h5>
						</div>
						<div id="test">
						<c:forEach items="${comments }" var="comments">
						
							<div class="anime__review__item" id="${comments.cid }">
								<div class="anime__review__item__pic">
									<img src="img/anime/review-1.jpg" alt="">
								</div>
								<div class="anime__review__item__text">
									<h6>
										${comments.nick } - <span>${comments.wdate }</span>
										<c:if test="${comments.email == email }">
											<!-- 수정 삭제시 댓글의 번호 값을 넘겨줌 -->
											<input type="button" onclick="commentUpdate(${comments.cid})" class="btn btn-sm btn-success" value="수정" />
											<button onclick="commentDelete(${comments.cid})" class="btn btn-sm btn-success">삭제</button>
											
										</c:if>
										<button onclick="#" class="btn btn-sm btn-success">신고</button>
									</h6>
									<div>
									<p id="p_${comments.cid}">${comments.comments }</p>
									</div>
								</div>
							</div>
							
						</c:forEach>
</div>



						<c:if test="${email != null }">
							<div class="anime__details__form">
								<div class="section-title">
									<h5>Your Comment</h5>
								</div>
									<textarea id="comments" name="comments"	placeholder="Your Comment"></textarea>
									<input type="hidden" id="id" name="id" value="${movieid}">
									<button onclick="replyInsert()" class="btn btn-sm btn-success">등록</button>
								</div>
						</c:if>
					</div>

<script>
	// 댓글 수정 창
	function commentUpdate(cid) {
		let ww = document.querySelectorAll('#test textarea'); 
		
		ww.forEach(x => {
			if(x == null){
				console.log('ss');
			} else {
				document.querySelector('#zzz').remove();
			}
		})
			
				
		let br = document.createElement('br');
		let div = document.createElement('div');
		div.setAttribute('id','zzz')
		let p = document.getElementById('p_'+cid);
		let textarea = document.createElement('textarea');
		textarea.setAttribute('id','comments2');
		textarea.setAttribute('cols', 55);
		textarea.setAttribute('rows' , 3);
		textarea.setAttribute('placeholder', '수정할 값을 입력하세요');
		/* p.append(br);
		p.append(textarea); */
		p.append(div);
		div.append(textarea);
		
		let input = document.createElement('input');
		input.setAttribute('type', 'hidden');
		input.setAttribute('id' , 'ids');
		input.setAttribute('value',cid);
		/* p.append(input); */
		div.append(input);
		
		
		
		let br2 = document.createElement('br');
		let input2 = document.createElement('input');
		div.append(br2);
		
		input2.setAttribute('value', '수정');
		input2.setAttribute('type', 'button');
		input2.setAttribute('class', 'btn btn-sm btn-success');
		input2.setAttribute('id','changeBtn');
		
		/* p.append(br2);
		p.append(input2); */
		
		div.append(input2);
		
		
		let button2 = document.createElement('button');
		button2.setAttribute('class', 'btn btn-sm btn-success');
		button2.setAttribute('id','changeBtn2');
		button2.innerText = '취소';
		/* p.append(button2); */
		div.append(button2);
		
		let UpdateBtn = document.getElementById("changeBtn");
		let UpdateBtn2 = document.getElementById("changeBtn2");
		
		// 수정버튼을 클릭하면 실행
		UpdateBtn.addEventListener("click", function(e) {
			e.preventDefault();
			console.log(document.getElementById("ids"));
			console.log(document.getElementById("ids").value);
			console.log(document.getElementById("comments2").value);
			
			

			  $.ajax({
					url:"commentUpdate.do",
					method:"post",
					data : {
						// 글의 번호
						"cid" : document.getElementById("ids").value ,
						"comments" : document.getElementById("comments2").value
					},
					success:function(result) {
						console.log(result);
						location.reload();
					}
				})
		});
		
		
		
		//취소버튼을 클릭하면 실행
		UpdateBtn2.addEventListener("click", function() {
			document.getElementById("comments2").remove();
			
			
		});
	}
	

	
/*  	function replyUpdate() {
			$.ajax({
				url:"commentUpdate.do",
				method:"post",
				data : {
					// 수정할 텍스트의 값
					"uid" : document.getElementById("uid").value
					
				},
				success:function(result) {
					location.reload();
				}
			})
		});   */

	
	
	// 댓글 추가
	function replyInsert(){
		$.ajax({
			url:"commentInsert.do",
			method:"post",
			data : {
				"id" : document.getElementById("id").value,
				"comments" : document.getElementById("comments").value
			},
			success:function(result){
				location.reload();
			}
		})
	}
	
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
</script>


					<div class="col-lg-4 col-md-4">
						<div class="anime__details__sidebar">
							<div class="section-title">
								<h5>you might like...</h5>
							</div>
							<div class="product__sidebar__view__item set-bg"
								data-setbg="img/sidebar/tv-1.jpg">
								<div class="ep">18 / ?</div>
								<div class="view">
									<i class="fa fa-eye"></i> 9141
								</div>
								<h5>
									<a href="#">Boruto: Naruto next generations</a>
								</h5>
							</div>
							<div class="product__sidebar__view__item set-bg"
								data-setbg="img/sidebar/tv-2.jpg">
								<div class="ep">18 / ?</div>
								<div class="view">
									<i class="fa fa-eye"></i> 9141
								</div>
								<h5>
									<a href="#">The Seven Deadly Sins: Wrath of the Gods</a>
								</h5>
							</div>
							<div class="product__sidebar__view__item set-bg"
								data-setbg="img/sidebar/tv-3.jpg">
								<div class="ep">18 / ?</div>
								<div class="view">
									<i class="fa fa-eye"></i> 9141
								</div>
								<h5>
									<a href="#">Sword art online alicization war of underworld</a>
								</h5>
							</div>
							<div class="product__sidebar__view__item set-bg"
								data-setbg="img/sidebar/tv-4.jpg">
								<div class="ep">18 / ?</div>
								<div class="view">
									<i class="fa fa-eye"></i> 9141
								</div>
								<h5>
									<a href="#">Fate/stay night: Heaven's Feel I. presage
										flower</a>
								</h5>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
	<!-- Anime Section End -->



	<!-- Search model Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">
				<i class="icon_close"></i>
			</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search model end -->

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/player.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>



	<script>
      console.log(document.querySelector('.votesCnt'));
      document.querySelector('.votesCnt').addEventListener('click', function () {

        fetch(ratingAPI, {
          method: 'post',
          headers: { 'Content-type': 'application/x-www-form-urlencoded' },
          body: 'value=' + 8.5
        })
          .then(response => console.log(response))
          .catch(err => console.log(err));

      })





    </script>


</body>

</html>