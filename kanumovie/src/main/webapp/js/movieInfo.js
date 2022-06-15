// Get방식 파라미터값 추출
let getParameter = function (paramName) {
  paramName = paramName.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
  let regex = new RegExp("[\\?&]" + paramName + "=([^&#]*)");
  let results = regex.exec(location.search);
  return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

const API_KEY = 'api_key=e51d70c65b46eb8bd60cafccc9325e8b';
const BASE_URL = 'https://api.themoviedb.org/3';
const MOVIE_URL = '/movie/' + getParameter('id');
const IMG_URL = "https://image.tmdb.org/t/p/w300";
let movieInfoAPI = BASE_URL + MOVIE_URL + '?' + API_KEY + '&language=ko-KR';
let recomAPI = BASE_URL + MOVIE_URL + '/recommendations?' + API_KEY + '&language=ko-KR';
let creditAPI = BASE_URL + MOVIE_URL + '/credits?' + API_KEY + '&language=ko-KR';
let ratingAPI = BASE_URL + MOVIE_URL + '/rating?' + API_KEY + '&guest_session_id=5667cdad051a40c848b9b34da163b4dc';



fetch(movieInfoAPI)
  .then(response => response.json())
  .then(movie => {
    console.log(movie);
    // 제목
    document.querySelector('.anime__details__title>h3').innerHTML = movie.title;

    // 개봉연도 | 러닝타임
    document.querySelector('.subInfo').innerHTML = movie.release_date.substring(0, 4) + '\u00A0\u00A0\u00A0|\u00A0\u00A0\u00A0' + movie.runtime + ' min';

    // 포스터
    let posterImg = document.querySelector('.posterImg');
    posterImg.src = IMG_URL + movie.poster_path;
    // let pic = document.querySelector('.anime__details__pic');
    // pic.dataset.setbg = IMG_URL + movie.poster_path;
    // pic.style.setProperty('background-image', 'url(' + IMG_URL + movie.poster_path + ')');

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
    console.log('creditAPI요청주소: ' + creditAPI);
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
        // img.loading = 'lazy';
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
      //             img.loading = 'lazy';
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
  })
  .catch(err => console.log(err));



// 추천 섹션
fetch(recomAPI)
  .then(response => response.json())
  .then(recom => {
    console.log('추천영화API요청주소:' + recomAPI);
    let recombar = document.querySelector('.anime__details__sidebar');
    for (let i = 0; i < 4; i++) {
      // console.log(recom.results[i].backdrop_path);
      let recomCard = document.createElement('div');
      recomCard.className = 'product__sidebar__view__item set-bg';
      // recomCard.dataset.setbg = IMG_URL + recom.results[i].backdrop_path;

      let img = document.createElement('img');
      // img.loading = 'lazy';
      img.className = 'recombg';

      // img.style = 'height:175px';

      img.src = IMG_URL + recom.results[i].backdrop_path;
      // img.srcset = 'https://www.themoviedb.org/t/p/w138_and_h175_face' + credit.crew[i].profile_path + ' 1x';

      img.alt = recom.results[i].title;


      let aimgtag = document.createElement('a');
      aimgtag.href = 'movieInfo.do?id=' + recom.results[i].id;

      aimgtag.append(img)

      let h5tag = document.createElement('h5');
      // let atag = document.createElement('a');
      h5tag.innerHTML = recom.results[i].title;

      aimgtag.append(h5tag);

      recomCard.append(aimgtag);
      recombar.append(recomCard);
    }
    console.log(recombar)
  })
  .catch(err => console.log(err));

// console.log('=========');
// credit.crew.forEach(function (obj) {
//   if (obj.job == 'Producer') {
//     console.log(obj.name);
//     console.log(', ');
//   }
// })




