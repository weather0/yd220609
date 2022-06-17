<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta charset="UTF-8">
<title>MovieInfo</title>

<!-- 좋아요아이콘 -->
<link rel='stylesheet'
	href='https://fonts.googleapis.com/icon?family=Material+Icons'>

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

<!-- movieInfo스타일 -->
<link rel="stylesheet" href="css/movieInfo.css">

<!-- movieInfo스크립트 -->
<script src="js/movieInfo.js"></script>

<style>
ul {
	list-style: none;
}
</style>



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
					<div class="col-lg-4 poster">
						<img class="posterImg">
						<!-- <div class="anime__details__pic"> -->
						<!-- <div class="comment"><i class="fa fa-comments"></i> 11</div> -->
						<!-- <div class="view"><i class="fa fa-eye"></i> 9141</div> -->
						<!-- </div> -->
					</div>
					<div class="col-lg-8 details">
						<div class="anime__details__text">
							<div class="anime__details__title">
								<h3></h3>
								<span class="subInfo"></span>
							</div>
							<div class="anime__details__rating">
								<div class="rating">



									<!-- 좋아요 버튼 start -->
									<div class="like-container">
										<div class="like-cnt unchecked" id="like-cnt">
											<i class="like-btn material-icons">thumb_up</i>
										</div>
									</div>

									<script
										src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
									<script src='https://cdn.jsdelivr.net/mojs/latest/mo.min.js'></script>
									<script
										src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/DrawSVGPlugin.min.js'></script>
									<script
										src='https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.0/TweenMax.min.js'></script>
									<script id="rendered-js">
                      var check_status = false;
                      var like_cnt = $("#like-cnt");
                      var like_parent = $(".like-container");

                      var burst = new mojs.Burst({
                        parent: like_parent,
                        radius: { 20: 60 },
                        count: 15,
                        angle: { 0: 30 },
                        children: {
                          delay: 250,
                          duration: 700,
                          radius: { 10: 0 },
                          fill: ['#ddca7e'],
                          easing: mojs.easing.bezier(.08, .69, .39, .97)
                        }
                      });



                      $("#like-cnt").click(function () {
                        var t1 = new TimelineLite();
                        var t2 = new TimelineLite();
                        if (!check_status) {
                          t1.set(like_cnt, { scale: 0 });
                          t1.set('.like-btn', { scale: 0 });
                          t1.to(like_cnt, 0.6, { scale: 1, background: '#ddca7e', ease: Expo.easeOut });
                          t2.to('.like-btn', 0.65, { scale: 1, ease: Elastic.easeOut.config(1, 0.3) }, '+=0.2');
                          //    t1.timeScale(5);
                          check_status = true;
                          //circleShape.replay();
                          burst.replay();

                          // 좋아요 DB입력
                          fetch('likes.do?id=' + getParameter('id'))
                            .catch(err => console.log(err));

                        } else {
                          t1.to(like_cnt, 1, { scale: 1 }).
                            to(like_cnt, 1, { scale: 1, background: 'rgba(255,255,255,0.3)', ease: Power4.easeOut });
                          t1.timeScale(7);
                          check_status = false;
                        }

                      });
                    </script>

									<!-- 좋아요 버튼 end -->






								</div>
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
						</div>







						<!-- <div class="anime__details__btn">
                  <a href="#" class="follow-btn"><i class="fa fa-heart-o"></i> Follow</a>
                  <a href="#" class="watch-btn"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                </div> -->

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
										<img src="img/profile/${comments.fileName }" alt="">
									</div>
									<div class="anime__review__item__text">
										<h6>
											<span id="commentnick">${comments.nick }</span> - <span>${comments.wdate }</span>
											<c:if test="${comments.email == email }">
												<!-- 수정 삭제시 댓글의 번호 값을 넘겨줌 -->
												<input type="button"
													onclick="commentUpdate(${comments.cid})"
													class="btn btn-sm btn-success" value="수정" />
												<button onclick="commentDelete(${comments.cid})"
													class="btn btn-sm btn-success">삭제</button>

											</c:if>
											<button class="btn btn-sm btn-success"
												onclick="report('${comments.email}')" data-toggle="modal"
												data-target="#myModal">신고</button>

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
								<textarea id="comments" name="comments"
									placeholder="Your Comment"></textarea>
								<input type="hidden" id="id" name="id" value="${movieid}">
								<button onclick="replyInsert()" class="btn btn-sm btn-success">등록</button>
							</div>
						</c:if>
					</div>



					<!-- 신고하기 modal 화면 -->
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<h2 class="modal-title">신고</h2>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<div class="modal-body">
									<div id="container">
										<section>
											<hr>
											<form id="form" action="reportInsert.do" method="post">
												<input type="hidden" class="form-control"	id="reported_name" name="reported_name">
												<h4>신고 사유를 선택하세요.</h4>
												<hr>
												<ul>
													<li><label><input type="radio" name="report"
															value="스팸홍보/도배글입니다."> 스팸홍보/도배글입니다.</label>
													<li><label><input type="radio" name="report"
															value="음란물입니다."> 음란물입니다.</label>
													<li><label><input type="radio" name="report"
															value="욕설/생명경시/혐오/차별적 표현입니다."> 욕설/생명경시/혐오/차별적
															표현입니다.</label>
													<li><label><input type="radio" name="report"
															value="개인정보 노출 게시물입니다."> 개인정보 노출 게시물입니다.</label>
												</ul>
												<h4>신고내용</h4>
												<hr>
												<textarea id="content" name="content" cols="70" rows="5"></textarea>
												<br> <input type="submit" value="신고"> <input
													type="reset" value="다시입력">
											</form>
										</section>
									</div>

								</div>

								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>

						</div>
					</div>
					<script>



	function report(cnick) {
		let nick = cnick;
		console.log(nick);
		
		$('#myModal').on('show.bs.modal', function () {
			 $(".modal-body #reported_name").val(cnick);
		})
		
		
		
		
	}
					
					
					
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