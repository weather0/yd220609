// API_URL에 필요한 전역 변수들 선언
const BASE_URL_C = "https://api.themoviedb.org/3/discover/movie?api_key=e51d70c65b46eb8bd60cafccc9325e8b&language=ko&&with_origin_country=";
let countryId = document.querySelector('#countryId').getAttribute('value');
let countryURL = countryId + "&page=";
let sorting = "&sort_by=vote_count.desc"
let sessionId = document.querySelector("#c_sessionId").value;

// 무한 스크롤 페이지 구현을 위해 페이지 번호 매개값으로 넘기는 함수
let c_count;
let cList = document.querySelectorAll('div.movie-card-container');
cList.forEach(container => {
	let number = container.getAttribute('data-value');
	countryMovieList(number);
	c_count = parseInt(number) + 1;
})

// 2페이지 이상일 경우 새로 컨테이너 생성
function countryMovieList(num) {
	let API_URL = BASE_URL_C + countryURL + num + sorting;
	if (num > 2) {
		let div = document.createElement('div');
		div.setAttribute('class', 'movie-card-container');
		div.setAttribute('data-value', num);
		document.querySelector('div.infinite').append(div);
	}
	getCountryData(API_URL, num);
}

// Ajax 호출하여 API에서 국가별 영화 데이터 출력
function getCountryData(url, num) {
	fetch(url)
		.then(response => response.json())
		.then(data => data.results)
		.then(arr => {
			let pageCnt = num;
			arr.forEach((elem) => {
				let card = makeCard(elem);
				let container = document.querySelectorAll('div.movie-card-container');
				container.forEach((con) => {
					if (con.getAttribute('data-value') == pageCnt) {
						con.append(card);
					}
				})
			})
			// 평점, 좋아요 함수 호출
			rating(); 
			getLikes(); 
		})
}

// 좋아요 함수에 유저 이메일 파라미터 넣어서 전달
let c_param = {email: sessionId};
function getLikes() {
	if (sessionId) {
		fetch('userLikesSelectList.do', {
			method: 'POST',
			headers: { 'Content-Type': 'application/json' },
			body: JSON.stringify(c_param)
		})
			.then(response => response.json())
			.then(data => {
				let movieData = document.querySelectorAll('.movie-card input');
				movieData.forEach((elem) => {
					data.forEach((like) => {
						if (like.id == elem.getAttribute('value')) {
							document.querySelector('#movie-' + like.id).setAttribute('style', 'color:red');
							console.log(document.querySelector('#movie-' + like.id).parentElement);
						} else {
							console.log(false);
						}
					})
				})
			});
	}
}