<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
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
    
    <!-- Icon Library -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Project Stylesheet -->
    <link rel="stylesheet" href="css/project-movie.css">
    
<title>preferGenreForm.do</title>
<style>
    .n {
        color:red;
    }
</style>
</head>
<body>
    <div align="center">
        <div>
            <div><h1 class="n">선호 장르 페이지</h1></div>
        </div>
    </div>
    
    <div class="infinite"></div>


    <!-- Search model Begin -->
    <div class="search-model">
      <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch"><i class="icon_close"></i></div>
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
    
</body>
    <script>
        /* function genSelect() {
        	let gen = document.querySelector('#genre').innerHTML;
        	console.log(gen);
        } */

        let pageNum = 1;
        const API_KEY = 'api_key=e51d70c65b46eb8bd60cafccc9325e8b';
        const BASE_URL = 'https://api.themoviedb.org/3';
        let TOPRATE_URL = '/movie/top_rated?';
        const IMG_URL = "https://image.tmdb.org/t/p/w300";
        let searchAPI = BASE_URL + TOPRATE_URL + '&' + API_KEY + '&language=ko-KR'+ '&page='+pageNum ;

        let container = document.querySelector('.infinite');
        let page = document.createElement('div');
        let totalpage;
        let currentpage;
        let totalgenre= new Array();

        let movieSearch = function () {

          fetch(searchAPI)
            .then(response => response.json())
            .then(searched => {
              console.log(searched);

              currentpage = searched.page;
              totalpage = searched.total_pages;

              searched.results.forEach((elem) => {
                let card = document.createElement('div');
                card.setAttribute('class', 'movie-card');
                card.addEventListener('click', addGenre);
                function addGenre() {
                	totalgenre = totalgenre.concat(elem.genre_ids);
                    console.log(elem.genre_ids);
                    
                    console.log(totalgenre);
                }
                let img = document.createElement('img');
                if (elem.poster_path == null) {
                  img.src = 'https://www.themoviedb.org/assets/2/v4/glyphicons/basic/glyphicons-basic-38-picture-grey-c2ebdbb057f2a7614185931650f8cee23fa137b93812ccb132b9df511df1cfac.svg';
                } else {
                  img.setAttribute('src', 'https://image.tmdb.org/t/p/w500' + elem.poster_path);
                }
                card.append(img);
                let info = document.createElement('div');
                let title = document.createElement('p');
                title.innerHTML = elem.title;
                info.append(title);
                card.append(info);
                page.append(card);
                page.setAttribute('class', 'movie-card-container');
                // page.setAttribute('id', 'page-' + i);
                container.append(page);

              })


            })
            .catch(err => console.log(err));
        }
        // 최초실행
        movieSearch();



        // 페이지 추가

        let addPage = function () {
          window.addEventListener('scroll', (e) => {
            if (currentpage < totalpage) {

              // 창내부크기 + 스크롤커서위치값(하단으로 갈수록 값 커짐)
              let val = window.innerHeight + window.scrollY;
              // let collection = document.querySelector('.movie-card-container');

              // console.log('스크롤위치:' + window.scrollY + ' 창높이:' + window.innerHeight + ' 문서크기:' + collection.offsetHeight);
              // 참고 velog.io/@sa02045/Scroll-%EC%A0%95%EB%A6%AC

              // offsetHeigt는 태그의 높이(코드라인)
              if (val >= container.offsetHeight + 1000) {
                pageNum++;
                SEARCH_URL = '/search/movie?query=' + getParameter('query') + '&page=' + pageNum;
                searchAPI = BASE_URL + SEARCH_URL + '&' + API_KEY + '&language=ko-KR';

                // 다음 페이지 실행
                movieSearch();
              }
            } else {
              // 이거 반드시 해줘야 함. 
              // 안 할 시, 페이징 다 끝났는데도 스크롤 내리면 무한으로 이벤트가 실행되어 자원 낭비
              e.stopPropagation;
            }
          });
        }



        // if (currentpage < totalpage) {
        addPage();
        // }


        window.onload = function () {
          setTimeout(function () {
            scrollTo(0, 0);
          }, 200)
        }




        
    </script>
</html>