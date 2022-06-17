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
    #n {
        color:red;
    }
</style>
</head>
<body>
    <div align="center">
        <div>
            <div><p id="n"></p></div>
        </div>
    </div>
    
    <div class="infinite" id="re"></div>


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

        const API_KEY = 'api_key=e51d70c65b46eb8bd60cafccc9325e8b';
        const BASE_URL = 'https://api.themoviedb.org/3';
        const TOPRATE_URL = '/movie/top_rated?';
        const IMG_URL = "https://image.tmdb.org/t/p/w300";
       
        
        let container = document.querySelector('.infinite');
        let page = document.createElement('div');
        let totalpage;
        let currentpage;
        let totalgenre= new Array();
          let cnt = 0;

        let movieSearch = function (pageNum) {
          
          
          let searchAPI = BASE_URL + TOPRATE_URL + '&' + API_KEY + '&language=ko-KR'+ '&page='+pageNum;
	     

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
                    console.log('카운팅'+cnt);
                    cnt++;
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
        movieSearch(1);
        console.log('카운팅'+cnt);
        if(cnt==1) {
        movieSearch(2);        	
        }
        console.log('카운팅'+cnt);
        if(cnt==2) {
        movieSearch(3);
        }
        

        
    </script>
</html>