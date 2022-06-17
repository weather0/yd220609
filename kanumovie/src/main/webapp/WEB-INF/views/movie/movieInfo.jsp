<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <% String uid=(String) session.getAttribute("email"); %>
      <!-- 로그인세션id호출 -->

      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="UTF-8">
        <title>MovieInfo</title>

        <!-- 좋아요아이콘 -->
        <link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
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
                  <a href="./index.html"><i class="fa fa-home"></i> Home</a> <a href="./categories.html">Categories</a>
                  <span>Romance</span>
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



                    <!-- 좋아요 버튼 start -->
                    <div class="like-container">
                      <div class="like-cnt unchecked" id="like-cnt">
                        <i class="like-btn material-icons">thumb_up</i>
                      </div>
                    </div>

                    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
                    <script src='https://cdn.jsdelivr.net/mojs/latest/mo.min.js'></script>
                    <script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/DrawSVGPlugin.min.js'></script>
                    <script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.0/TweenMax.min.js'></script>
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
                          fetch('likes.do', {
                            method: 'post',
                            headers: { 'Content-type': 'application/x-www-form-urlencoded' },
                            body: 'email=' + '<%=uid%>' + '&id=' + getParameter('id')
                          })
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
                  <h3 dir="auto">Cast & Crew</h3>
                  <div id="cast_scroller" class="scroller_wrap should_fade is_fading">
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



            <div class="row">
              <div class="col-lg-8 col-md-8 reviews">
                <div class="anime__details__review">
                  <div class="section-title">
                    <h5>Reviews</h5>
                  </div>
                  <div class="anime__review__item">
                    <div class="anime__review__item__pic">
                      <img src="img/anime/review-1.jpg" alt="">
                    </div>
                    <div class="anime__review__item__text">
                      <h6>
                        Chris Curry - <span>1 Hour ago</span>
                      </h6>
                      <p>whachikan Just noticed that someone categorized this as belonging to the genre "demons" LOL</p>
                    </div>
                  </div>
                  <div class="anime__review__item">
                    <div class="anime__review__item__pic">
                      <img src="img/anime/review-2.jpg" alt="">
                    </div>
                    <div class="anime__review__item__text">
                      <h6>
                        Lewis Mann - <span>5 Hour ago</span>
                      </h6>
                      <p>Finally it came out ages ago</p>
                    </div>
                  </div>
                  <div class="anime__review__item">
                    <div class="anime__review__item__pic">
                      <img src="img/anime/review-3.jpg" alt="">
                    </div>
                    <div class="anime__review__item__text">
                      <h6>
                        Louis Tyler - <span>20 Hour ago</span>
                      </h6>
                      <p>Where is the episode 15 ? Slow update! Tch</p>
                    </div>
                  </div>
                  <div class="anime__review__item">
                    <div class="anime__review__item__pic">
                      <img src="img/anime/review-4.jpg" alt="">
                    </div>
                    <div class="anime__review__item__text">
                      <h6>
                        Chris Curry - <span>1 Hour ago</span>
                      </h6>
                      <p>whachikan Just noticed that someone categorized this as belonging to the genre "demons" LOL</p>
                    </div>
                  </div>
                  <div class="anime__review__item">
                    <div class="anime__review__item__pic">
                      <img src="img/anime/review-5.jpg" alt="">
                    </div>
                    <div class="anime__review__item__text">
                      <h6>
                        Lewis Mann - <span>5 Hour ago</span>
                      </h6>
                      <p>Finally it came out ages ago</p>
                    </div>
                  </div>
                  <div class="anime__review__item">
                    <div class="anime__review__item__pic">
                      <img src="img/anime/review-6.jpg" alt="">
                    </div>
                    <div class="anime__review__item__text">
                      <h6>
                        Louis Tyler - <span>20 Hour ago</span>
                      </h6>
                      <p>Where is the episode 15 ? Slow update! Tch</p>
                    </div>
                  </div>
                </div>
              </div>



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




              <div class="col-lg-8 col-md-8 comment">
                <div class="anime__details__form">
                  <div class="section-title">
                    <h5>Your Comment</h5>
                  </div>
                  <form action="#">
                    <textarea placeholder="Your Comment"></textarea>
                    <button type="submit">
                      <i class="fa fa-location-arrow"></i> Review
                    </button>
                  </form>
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
            <form class="search-model-form" name="searchFn" action="movieSearch.do" method="get">
              <input type="text" id="search-input" name="query" placeholder="Search here.....">
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


      </body>

      </html>