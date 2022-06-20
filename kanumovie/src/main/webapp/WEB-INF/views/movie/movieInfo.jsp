<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String uid = (String) session.getAttribute("email");
%>
<!-- 로그인세션id호출 -->

<!DOCTYPE html>
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
/* 플레이어 관련 */
.video-js .vjs-dock-text, .vjs-current-time-display,
	.vjs-duration-display, .vjs-time-divider {
	font-size: 1.5em;
}

.vjs-pip-container, .youtube iframe {
	margin-bottom: 10px;
}

#myPlayerID {
	border-radius: 10px;
	border: 2px solid rgb(41, 41, 41);
}

/* 모달창 */
.modal2 {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.7);
}

.modal2.show {
	display: block;
}

.modal_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 960px;
	height: 540px;
	/* padding: 40px; */
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
	transition: all .4s;
}

.modalbox {
	width: 960px;
	text-align: right;
	margin-bottom: 20px;
}

.modalbtn {
	border-radius: 10px;
	width: 120px;
	height: 35px;
	padding: 0px;
	background-color: #1d1e39;
}

/* 차단 Comment box */
/*   #formContainer {
       width: 80%;
       margin: 5% auto;
       background: rgba(0, 0, 0, 0.5);
       padding: 3%;
    }
    #formContainer input[type="text"] {
       width: 80%;
       background: #212529; 
       border: none;
       border-radius: 10px;
    }
    #formContainer #buttonContainer {
       margin-top: 5%;
    }
    #formContainer button[type="submit"]:hover {
       background: red;
       transform: scale(1.1);
       transition: 0.3s;
    } */

/* comment box */
#comments {
	overflow: hidden;
	background-color: #b7b7b7;
	border: none;
	border-radius: 10px;
	font-size: 18px;
	line-height: 30px;
}

/* 신고 모달 */
#reportul {
	list-style: none;
}

#modalbutton {
	text-align: center;
}

#modal-header {
	text-align: center;
}

modal-title {
	text-align: center;
}

.moviePlayer, .youtube {
	margin: 0 auto;
}

/* 모달창(폐기) */
/* .modal2 {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: none;
            background-color: rgba(0, 0, 0, 0.7);

          }

          .modal2.show {
            display: block;
          }

          .modal_body {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 960px;
            height: 540px;
            text-align: center;
            background-color: rgb(255, 255, 255);
            border-radius: 10px;
            box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
            transform: translateX(-50%) translateY(-50%);
            transition: all .4s;
          } */

/* 비디오모달 스타일 */
.modalbox {
	width: 100%;
	text-align: right;
	margin-bottom: 20px;
}

.cmtdiv .btn {
	background-color: #e53637;
	border: none;
	font-weight: bold;
}

.cmtdiv .btn:hover {
	transform: scale(1.2);
	transition: 0.2s;
}

.btn-success:active, .btn-success:focus, .btn:active, .btn:focus, .btn:hover
	{
	background-color: #e53637;
	/* border: 1px solid #e53637; */
	box-shadow: none;
}

.btn-success {
	background-color: #1d1e39;
}

.modalbtn {
	border: 0px;
	border-radius: 10px;
	width: 130px;
	height: 40px;
	padding: 0px;
	background-color: #1d1e39;
	font-weight: bold;
	font-size: large;
}

.vModaldialog {
	max-width: 960px;
	/* height: 540px; */
	/* margin: 30px 100px; */
}

.vModalbody {
	width: 960px;
	height: 540px;
	margin: 0;
}
</style>

</head>


<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>





	<!-- Anime Section Begin -->
	<section class="anime-details spad">
		<div class="container">
			<div class="anime__details__content">
				<div class="row">

					<!-- brightcove player -->
					<div class="moviePlayer">
						<div class="vjs-pip-container">
							<video-js id="myPlayerID" data-account="6310593610001"
								data-player="mM7pq2WtL" data-embed="default" controls=""
								data-video-id="" data-playlist-id="" data-application-id=""
								width="960" height="540"> </video-js>
							</video-js>
						</div>
					</div>

					<!-- youtube player -->
					<div class="youtube">
						<iframe width="960" height="540" src=""
							title="YouTube video player" frameborder="3"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>

					<p></p>


					<!-- 모달창1 -->
					<script>
                  function extras(cnick) {
                    let nick = cnick;
                    console.log(nick);

                    $('#vModal').on('show.bs.modal', function () {
                      // $(".modal-body #reported_name").val(cnick);
                    })
                  }

                </script>


					<div class="modalbox">
						<button class="btn btn-sm btn-success modalbtn"
							onclick="extras('${aaaaaa}')" data-toggle="modal"
							data-target="#vModal">부가영상</button>
					</div>


					<div class="modal fade" id="vModal" role="dialog">
						<div class="modal-dialog vModaldialog">

							<!-- Modal content-->
							<div class="modal-content vModalbody">
								<div class="modal-header">
									<!-- <h2 class="modal-title">신고</h2>
                        <button type="button" class="close" data-dismiss="modal">&times;</button> -->
								</div>

								<div class="modal-body">
									<div id="container">
										<section>
											<hr>
											<!-- <form id="form" action="reportInsert.do" method="post">
                              <input type="hidden" class="form-control" id="reported_name" name="reported_name">
                              <h4>신고 사유를 선택하세요.</h4>
                              <hr>
                              <ul>
                                <li><label><input type="radio" name="report" value="스팸홍보/도배글입니다."> 스팸홍보/도배글입니다.</label>
                                <li><label><input type="radio" name="report" value="음란물입니다."> 음란물입니다.</label>
                                <li><label><input type="radio" name="report" value="욕설/생명경시/혐오/차별적 표현입니다."> 욕설/생명경시/혐오/차별적
                                    표현입니다.</label>
                                <li><label><input type="radio" name="report" value="개인정보 노출 게시물입니다."> 개인정보 노출
                                    게시물입니다.</label>
                              </ul>
                              <h4>신고내용</h4>
                              <hr>
                              <textarea id="content" name="content" cols="70" rows="5"></textarea>
                              <br> <input type="submit" value="신고"> <input type="reset" value="다시입력">
                            </form> -->
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





					<!-- 모달창2 -->
					<!-- <div class="modal2">
                  <div class="modal fade show">Modal
                    <p>
                      jwe;fjwofjwefi
                    </p>
                  </div>
                </div>
                <div class="modalbox">
                  <button class="modalbtn">부가영상</button>
                </div>
                <script>
                  const modal = document.querySelector('.modal fade show');
                  const btnOpenPopup = document.querySelector('.modalbtn');

                  btnOpenPopup.addEventListener('click', () => {
                    modal.classList.toggle('show');

                    if (modal.classList.contains('show')) {
                      body.style.overflow = 'hidden';
                    }
                  });

                  modal.addEventListener('click', (event) => {
                    if (event.target === modal) {
                      modal.classList.toggle('show');

                      if (!modal.classList.contains('show')) {
                        body.style.overflow = 'auto';
                      }
                    }
                  });
                </script> -->


					<!-- 포스터 -->
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
                      let likesId = 0;
                      let check_status = false;
                      var like_cnt = $("#like-cnt");
                      var like_parent = $(".like-container");

                      var t1 = new TimelineLite();
                      var t2 = new TimelineLite();

                      // 좋아요 상태
                      let checkOn = function () {
                        t1.set(like_cnt, { scale: 0 });
                        t1.set('.like-btn', { scale: 0 });
                        t1.to(like_cnt, 0.6, { scale: 1, background: '#ddca7e', ease: Expo.easeOut });
                        t2.to('.like-btn', 0.65, { scale: 1, ease: Elastic.easeOut.config(1, 0.3) }, '+=0.2');
                        //    t1.timeScale(5);
                        check_status = true;
                      }


                      // 비좋아요 상태
                      let checkOff = function () {
                        t1.to(like_cnt, 1, { scale: 1 }).
                          to(like_cnt, 1, { scale: 1, background: 'rgba(255,255,255,0.3)', ease: Power4.easeOut });
                        t1.timeScale(7);
                        check_status = false;
                      }


                      // 터짐 효과
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


                      // 좋아요 액션
                      let likeFn = function () {
                        $("#like-cnt").click(function () {
                          if (!check_status) { // 비좋아요 상태면
                            checkOn(); // 좋아요로 전환
                            burst.replay();
                            // 좋아요 DB입력
                            fetch('likes.do', {
                              method: 'post',
                              headers: { 'Content-type': 'application/x-www-form-urlencoded' },
                              body: 'email=' + '<%=uid%>' + '&id=' + getParameter('id')
                            })
                              .catch(err => console.log(err));
                          } else { // 기좋아요 상태면
                            checkOff(); // 비좋아요로 전환
                            // 좋아요 DB삭제
                            fetch('likesDelete.do', {
                              method: 'post',
                              headers: { 'Content-type': 'application/x-www-form-urlencoded' },
                              body: 'likes_Id=' + likesId
                            })
                              .catch(err => console.log(err));
                          }
                        })
                      }



                      // 좋아요 종합
                      // console.log('<%=uid%>');
                      if ('<%=uid%>' != 'null') {
                        fetch('likesSelectList.do', {
                          method: 'post',
                          headers: { 'Content-type': 'application/x-www-form-urlencoded' },
                          body: 'email=' + '<%=uid%>' + '&id=' + getParameter('id')
                        })
                          .then(result => result.json()) // 일단 필수 구문. 콘솔.log 안에 넣는 것만으로는 json()이 작동이 안 됨
                          .then(result => {
                            likesId = result.likes_Id;
                            if (result.likes_Id == 0) {
                              console.log('로그인O 좋아요X');
                              checkOff();
                              likeFn();

                            } else {
                              console.log(' 로그인O 좋아요O');
                              checkOn();
                              likeFn();
                            }
                          })
                          .catch(err => console.log(err));
                      } else {
                        console.log('로그인X')
                        checkOff();
                        $("#like-cnt").click(function () {
                          alert('로그인을 해주세요');
                        })
                      }

                    </script>
							<!-- 좋아요 버튼 end -->



							<!-- 별점 -->
							<div class="anime__details__rating">
								<div class="rating"></div>
								<span class="votesCnt"></span>
							</div>


							<!-- 줄거리 -->
							<p class="overview"></p>

							<!-- 부가정보 -->
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


					<!-- Cast & Crew 카드 섹션 -->
					<section class="panel top_billed scroller">
						<div class="cast-title">
							<h3 dir="auto">Cast & Crew</h3>
						</div>
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


			<!-- comment -->




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
											<!-- 댓글이 한번 신고 되었던 사용자 -->
											<c:if test="${comments.report == 'y' }">
												<button class="btn btn-sm btn-success" onclick="noreport()">신고</button>
											</c:if>

											<!-- 댓글이 한번 신고 안되었던 사용자 -->
											<c:if test="${comments.report != 'y' }">
												<button class="btn btn-sm btn-success"
													data-backdrop="static" data-keyboard="false"
													onclick="report('${comments.email}','${movieid}','${comments.report }')"
													data-toggle="modal" data-target="#myModal">신고</button>
											</c:if>

										</h6>
										<div>
											<p id="p_${comments.cid}">${comments.comments }</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>


					<!-- 차단 되지않은 계정의 comment창 -->
					<c:if test="${blockCheck != 'y'}">
						<div class="anime__details__form">
							<div class="section-title">
								<h5>Your Comment</h5>
							</div>
							<div class="anime__review__item__text">
								<textarea id="comments" name="comments" cols="120" rows="3"
									placeholder="Your Comment.."></textarea>
								<input type="hidden" id="id" name="id" value="${movieid}">
							</div>
							<br>
							<button onclick="replyInsert()" class="btn btn-sm btn-success">등록</button>
							<input type="reset" class="btn btn-sm btn-success" value="취소">
						</div>
					</c:if>

					<!-- 차단 된 계정의 comment창 -->
					<c:if test="${blockCheck == 'y'}">
						<div class="anime__details__form">
							<div class="section-title">
								<h5>Your Comment</h5>
							</div>
							<div class="anime__review__item__text">
								<textarea id="comments" name="comments" cols="120" rows="3"
									placeholder="해당 계정은 차단된 상태입니다.&#10;해당 관련 문제에 대해서는 관리자에게 문의하세요."
									readonly></textarea>
								<input type="hidden" id="id" name="id" value="${movieid}">
							</div>
							<br>
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
								<h3 class="modal-title">신고하기</h3>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<div class="modal-body">
								<div id="container">
									<section>
										<form id="form" action="reportInsert.do" method="post">
											<input type="hidden" class="form-control" id="reported_name"
												name="reported_name"> <input type="hidden"
												class="form-control" id="movie_id" name="movie_id">
											<h4>신고 사유를 선택하세요.</h4>
											<hr>
											<ul id="reportul">
												<li><label><input type="radio" name="report"
														value="스팸홍보/도배글입니다."> 스팸홍보/도배글입니다.</label>
												<li><label><input type="radio" name="report"
														value="음란물입니다."> 음란물입니다.</label>
												<li><label><input type="radio" name="report"
														value="욕설/생명경시/혐오/차별적 표현입니다."> 욕설/생명경시/혐오/차별적
														표현입니다.</label>
												<li><label><input type="radio" name="report"
														value="불법정보를 포함하고 있습니다."> 불법정보를 포함하고 있습니다.</label>
												<li><label><input type="radio" name="report"
														value="청소년에게 유해한 내용입니다."> 청소년에게 유해한 내용입니다.</label>
												<li><label><input type="radio" name="report"
														value="불쾌한 표현이 있습니다."> 불쾌한 표현이 있습니다.</label>
											</ul>
											<hr>
											<h4>신고내용</h4>
											<hr>
											<textarea id="content" name="content" cols="70" rows="5"></textarea>
											<br>
											<div id="modalbutton">
												<input type="submit" class="btn btn-sm btn-success"
													width="130" value="신고">
												<!-- <input type="reset" class="btn btn-sm btn-success" value="다시입력"> -->
											</div>
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


				// 댓글 신고
				// id : 영화 id  email : 신고당한사람 email  report : 신고당한여부
                function report(cnick , movieid, report) {
                  
				  let report2 = report;
				  console.log(report);
				  let nick = cnick;
                  let mid = movieid; 
                  console.log(mid);
                  console.log(nick);
                  
  
              
	                  //modal open시 report name, movie_id 값 전송
	                        $('#myModal').on('show.bs.modal', function () {
	                    $(".modal-body #reported_name").val(cnick);
	                    $(".modal-body #movie_id").val(movieid);
	                  })
				}
				
                function noreport() {
                	alert('이미 신고된 사용자입니다.');
                }
                



                // 댓글 수정 창
                function commentUpdate(cid) {
                  let ww = document.querySelectorAll('#test textarea');

                  ww.forEach(x => {
                    if (x == null) {
                      console.log('ss');
                    } else {
                      document.getElementById('zzz').remove();
                      //document.querySelector('#zzz').remove();
                    }
                  })


                  let br = document.createElement('br');
                  let div = document.createElement('div');
                  div.setAttribute('id', 'zzz')
                  let p = document.getElementById('p_' + cid);
                  let textarea = document.createElement('textarea');
                  textarea.setAttribute('id', 'comments2');
                  textarea.setAttribute('cols', 55);
                  textarea.setAttribute('rows', 3);
                  textarea.setAttribute('placeholder', '수정할 값을 입력하세요');
                  //p.append(br);
                  //p.append(textarea); 
                  p.append(div);
                  div.append(textarea);
                  div.append(br);
                  let input = document.createElement('input');
                  input.setAttribute('type', 'hidden');
                  input.setAttribute('id', 'ids');
                  input.setAttribute('value', cid);
                  /* p.append(input); */
                  div.append(input);



                  let br2 = document.createElement('br');
                  let input2 = document.createElement('input');
                  // div.append(br2);

                  input2.setAttribute('value', '수정');
                  input2.setAttribute('type', 'button');
                  input2.setAttribute('class', 'btn btn-sm btn-success');
                  input2.setAttribute('id', 'changeBtn');

                  /* p.append(br2);
                  p.append(input2); */

                  div.append(input2);
                  const space = document.createTextNode("\u00a0");
                  div.append(space);
                  div.append(space);
                  div.append(space);
                  
                  let button2 = document.createElement('button');
                  button2.setAttribute('class', 'btn btn-sm btn-success');
                  button2.setAttribute('id', 'changeBtn2');
                  button2.innerText = '취소';
                  /* p.append(button2); */
                  div.append(button2);

                  let UpdateBtn = document.getElementById("changeBtn");
                  let UpdateBtn2 = document.getElementById("changeBtn2");

                  // 수정버튼을 클릭하면 실행
                  UpdateBtn.addEventListener("click", function (e) {
                    e.preventDefault();
                    console.log(document.getElementById("ids"));
                    console.log(document.getElementById("ids").value);
                    console.log(document.getElementById("comments2").value);



                    $.ajax({
                      url: "commentUpdate.do",
                      method: "post",
                      data: {
                        // 글의 번호
                        "cid": document.getElementById("ids").value,
                        "comments": document.getElementById("comments2").value
                      },
                      success: function (result) {
                        console.log(result);
                        location.reload();
                      }
                    })
                  });



                  //취소버튼을 클릭하면 실행
                  UpdateBtn2.addEventListener("click", function () {
                	document.getElementById("zzz").remove();
                  /*   document.getElementById("comments2").remove();
                    document.getElementById("changeBtn").remove();
                    document.getElementById("changeBtn2").remove(); */

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
                function replyInsert() {
                  $.ajax({
                    url: "commentInsert.do",
                    method: "post",
                    data: {
                      "id": document.getElementById("id").value,
                      "comments": document.getElementById("comments").value
                    },
                    success: function (result) {
                      location.reload();
                    }
                  })
                }

                var httpRequest = null;
                // httpRequest 객체 생성
                function getXMLHttpRequest() {
                  var httpRequest = null;
                  if (window.ActiveXObject) {
                    try {
                      httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
                    } catch (e) {
                      try {
                        httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                      } catch (e2) {
                        httpRequest = null;
                      }
                    }
                  }
                  else if (window.XMLHttpRequest) {
                    httpRequest = new window.XMLHttpRequest();
                  }
                  return httpRequest;
                }


                //댓글 삭제창
                function commentDelete(cid) {
                  var msg = confirm("댓글을 삭제합니다.");
                  if (msg == true) {
                    deleteCmt(cid);
                  }
                  else {
                    return false;
                  }
                }

                //댓글 삭제
                function deleteCmt(cid) {
                  document.getElementById(cid).remove();
                  var param = "cid=" + cid;
                  httpRequest = getXMLHttpRequest();
                  httpRequest.onreadystatechange = checkFunc;
                  httpRequest.open("POST", "commentDelete.do", true);
                  httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8');
                  httpRequest.send(param);
                }


                function checkFunc() {
                  if (httpRequest.readyState == 4) {
                    // 결과값을 가져온다.   
                    var resultText = httpRequest.responseText;
                    if (resultText == 1) {
                      document.location.reload(); // 상세보기 창 새로고침 
                    }
                  }
                }
              </script>



				<!-- 추천 섹션 -->
				<div class="col-lg-4 col-md-4 rightbar">
					<div class="anime__details__sidebar">
						<div class="section-title">
							<h5>you might like...</h5>
						</div>

						<!-- <div class="product__sidebar__view__item set-bg"
                data-setbg="https://image.tmdb.org/t/p/w300/YfMEwVRe1c5rhFYmL2P8153T8x.jpg">
                <h5><a href="#">매트릭스 2: 리로디드</a></h5>
              </div> -->

						<!-- <div class="product__sidebar__view__item set-bg" data-setbg="img/sidebar/tv-1.jpg">
                <div class="ep">18 / ?</div>
                <div class="view"><i class="fa fa-eye"></i> 9141</div>
                <h5><a href="#">Boruto: Naruto next generations</a></h5>
              </div> -->

					</div>
				</div>



			</div>
		</div>
	</section>
	<!-- Anime Section End -->






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
          // 별점 주기 기능
          // console.log(document.querySelector('.votesCnt'));
          document.querySelector('.votesCnt').addEventListener('click', function () {

            fetch(ratingAPI, {
              method: 'post',
              headers: { 'Content-type': 'application/x-www-form-urlencoded' },
              body: 'value=' + 8.5 // 수정요
            })
              .then(response => console.log(response))
              .catch(err => console.log(err));

          })

        </script>




	<!-- 플레이어 관련 -->
	<script>
          if (getParameter('id') == '479718') {
            let vjs = document.querySelector('#myPlayerID');
            vjs.setAttribute('data-video-id', '6308170123112')
            document.querySelector('.youtube').style.display = 'none';
          } else {
            document.querySelector('.moviePlayer').style.display = 'none';
          }
        </script>
	<!-- <script>
          let vjscon = document.getElementsByClassName('vjs-pip-container')
          console.log(vjscon);
          let vjs = document.createElement('vedeo-js')
          vjs.setAttribute('id', 'myPlayerID')
          vjs.setAttribute('data-account', '6310593610001')
          vjs.setAttribute('data-player', 'mM7pq2WtL')
          vjs.setAttribute('data-embed', 'default')
          vjs.setAttribute('controls', 'a')
          vjs.setAttribute('data-video-id', '6308170123112')
          vjs.setAttribute('width', '960')
          vjs.setAttribute('height', '540')
          vjs.setAttribute('data-playlist-id', 'a')
          vjs.setAttribute('data-application-id', 'a')
          console.log(vjs)
          vjscon[0].append(vjs)
        </script> -->
	<script
		src="https://players.brightcove.net/6310593610001/mM7pq2WtL_default/index.min.js"></script>


</body>

</html>