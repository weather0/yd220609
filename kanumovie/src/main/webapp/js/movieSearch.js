// Get방식 파라미터값 추출
let getParameter = function (paramName) {
  paramName = paramName.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
  let regex = new RegExp("[\\?&]" + paramName + "=([^&#]*)");
  let results = regex.exec(location.search);
  return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

let pageNum = 1;
const API_KEY = 'api_key=e51d70c65b46eb8bd60cafccc9325e8b';
const BASE_URL = 'https://api.themoviedb.org/3';
let SEARCH_URL = '/search/movie?query=' + getParameter('query') + '&page=' + pageNum;
const IMG_URL = "https://image.tmdb.org/t/p/w300";
let searchAPI = BASE_URL + SEARCH_URL + '&' + API_KEY + '&language=ko-KR';

let container = document.querySelector('.infinite');
let page = document.createElement('div');
let totalpage;
let currentpage;


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
        card.setAttribute('onclick', "location.href='movieInfo.do?id=" + elem.id + "'");
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
        let rate = document.createElement('div');
        rate.setAttribute('class', 'star-rate');
        rate.setAttribute('data-rate', elem.vote_average);
        for (let i = 0; i < 5; i++) {
          let star = document.createElement('span');
          star.setAttribute('class', 'fa fa-star');
          rate.append(star);
        }
        info.append(rate);
        card.append(info);
        page.append(card);
        page.setAttribute('class', 'movie-card-container');
        // page.setAttribute('id', 'page-' + i);
        container.append(page);
        rating();

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



// 별점표시
function rating() {
  let rating = $('.star-rate');
  rating.each(function () {
    let score = $(this).attr('data-rate');
    score = parseFloat(score) / 2;
    let numScore = Math.trunc(score);
    let floatScore = score - Math.trunc(score);
    if (floatScore < 0.5) {
      $(this).find('span:nth-child(-n+' + numScore + ')')
        .addClass('checked');
    } else if (floatScore >= 0.5) {
      $(this).find('span:nth-child(-n+' + numScore + ')')
        .addClass('checked');
      $(this).find('span:nth-child(' + (numScore + 1) + ')')
        .addClass('fa-star-half-o');
    }
  })
}




