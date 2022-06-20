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
#ff {
	display:none;
}
#move {
	display:none;
}
.preferMovieHeader {
    width: 100%;
    border: none;
    padding: 5%;
}

.preferMovieHeader h2, p {
    color: #fff;
    text-align: center;
}
</style>
</head>
<body>
	<div id="move"></div>
    <div align="center">
        <div class="preferMovieHeader" id="choiceCnt">
            <h2>선호하는 영화를 고르세요!!!</h2>
            <br>
        </div>
    </div>
    
    <div class="infinite" id="re"></div>


	<div><input type="hidden" value="1" id="count"></div>
	
	<div id="ff">
		<input type="hidden" id="email1" name="email1" value="${email}">
		<input type="hidden" id="pw1" name="pw1" value="${pw }">
	</div>

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
        let cnt = 1;

        let movieSearch = function (pageNum) {
          
          
          let searchAPI = BASE_URL + TOPRATE_URL + '&' + API_KEY + '&language=ko-KR'+ '&page='+pageNum;
	     

          fetch(searchAPI)
            .then(response => response.json())
            .then(searched => {
              console.log(searched);

              currentpage = searched.page;
              totalpage = searched.total_pages;
              
              if(document.getElementById('count').value == 1) {
                choiceCnt();
              } else if(document.getElementById('count').value == 2) {
            	  document.getElementById('newP').remove();
            	  choiceCnt();
              } else if(document.getElementById('count').value == 3) {
                  document.getElementById('newP').remove();
                  choiceCnt();
              }

              searched.results.forEach((elem) => {
                let card = document.createElement('div');
                card.setAttribute('class', 'movie-card');
                card.addEventListener('click', addGenre); 
                function addGenre() {
                    
                	let location = document.querySelector("#move").offsetTop;
                    window.scrollTo({top:location, behavior:'smooth'});
                	
                	totalgenre = totalgenre.concat(elem.genre_ids);
                    cnt++;
                    document.getElementById('count').value = cnt;
                    
                    
                    if(document.getElementById('count').value == 2) {
                    	let removeclass = document.getElementsByClassName('movie-card');
                    	while (removeclass.length > 0) { 
                    		removeclass[0].remove()
                    		};
                        movieSearch(2);
                        let location = document.querySelector("#move").offsetTop;
                        window.scrollTo({top:location, behavior:'smooth'});
                    }
                    
                    if(document.getElementById('count').value == 3) {
                    	let removeclass = document.getElementsByClassName('movie-card');
                    	while (removeclass.length > 0) { 
                    		removeclass[0].remove()
                    		};
                        movieSearch(3);
                        let location = document.querySelector("#move").offsetTop;
                        window.scrollTo({top:location, behavior:'smooth'});
                    }
                    
                    if(document.getElementById('count').value == 4) {
                    	saveGenreId()
                    }
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

        function saveGenreId() {
        	
        	// 선호 장르 배열에서 중복값 걸러내서 선호 장르 아이디값 구하기.
        	const result = {};
        	totalgenre.forEach((x) => { 
        	  result[x] = (result[x] || 0)+1; 
        	});
        	console.log(result)
			
        	const a = [];
        	
        	for (let key in result) {
			  const value = result[key]
			  a.push([value,key])
			}
			// 장르 : 중복횟수 > 형태의 맵으로 저장해서 value 비교 후 소팅.
			bubbleSort(a);
			
			
			// 정렬한 a 배열 k_user 선호 열에 보내기.
			$.ajax({
			    url: 'preferGenre.do',
			    type: 'post',
			    data: {"email": document.getElementById('email1').value,
			    	"pw": document.getElementById('pw1').value,
			    	"preference1": a[0][1],
			        "preference2": a[1][1],
			        "preference3": a[2][1] },
			    success: function (data) {
			            alert("선호 영화 선택 완료");
			            window.location.reload();
			        }
			}); 
			// 대부 사이코 이창
        }
        
        // 최초실행
        movieSearch(1);
        
        function bubbleSort (array) { 
        	for (let i = 0; i < array.length; i++) { 
        		let swap;    
        		for (let j = 0; j < array.length - 1 - i; j++) {   
        			if (array[j][0] < array[j + 1][0]) {     
        				swap = array[j];     
        				array[j] = array[j + 1];     
        				array[j + 1] = swap;    
        				}   
        			}    
        		if (!swap) {     
        			break;    }
        		}  
        	}
        
        function choiceCnt() {
        	
            // create a new div element
			var newP = document.createElement("p");
			newP.id = 'newP';
			// and give it some content
			newP.innerText = document.getElementById('count').value + '번째로 선호하는 영화를 선택해주세요!' ;
			// add the text node to the newly created div
        	
        	document.getElementById('choiceCnt').appendChild(newP);
        }
    </script>
</html>