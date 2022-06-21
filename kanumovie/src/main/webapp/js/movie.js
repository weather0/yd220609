	document.addEventListener('DOMContentLoaded', mainFnc);
	function mainFnc() {
	// 슬라이더 파라미터 지정	
	let owl = $('.owl-carousel');
	owl.owlCarousel({
/*		margin: 20,*/
		nav: true,
		loop: false,
		rewind: true,
		responsive: {
			0: {
				items: 1
			},
			600: {
				items: 3
			},
			1000: {
				items: 4
			}
		}
	})
	
	// API_URL을 위한 전역변수 선언
	const API_KEY = 'api_key=e51d70c65b46eb8bd60cafccc9325e8b';
	const BASE_URL = 'https://api.themoviedb.org/3';
	let API_URL = BASE_URL + '/trending/movie/week?' + API_KEY + "&language=ko";
	const poster = "https://image.tmdb.org/t/p/w500"

	// Trending Movie, Show 호출
	function getTrendingContent(url) {
		fetch(url)
			.then(response => response.json())
			.then(data => data.results)
			.then(arr => {
				let divlist;
				if (url.includes('/movie/')) {
					divlist = document.querySelectorAll('.movie .item');
				} else if (url.includes('/tv/')) {
					divlist = document.querySelectorAll('.show .item');
				}
				arr.forEach((obj, idx) => {
					let rank = document.createElement('h2');
					rank.innerHTML = (idx+1);
					let title = document.createElement('p');
					divlist.forEach((div, dividx) => {
						if (dividx == idx) {
							// 영화 리스트일 경우
							if (url.includes('/movie/')) {
								title.innerHTML = obj.title;
								div.addEventListener('click', () => {
									insertMovie(obj);
								})
							} else if (url.includes('/tv/')) {
								// 티비 리스트일 경우
								title.innerHTML = obj.name;
								div.addEventListener('click', () => {
									location.href="https://www.themoviedb.org/tv/" + obj.id;
								})
							}
							div.append(rank);
							div.setAttribute('style', 'background-image:url('+ poster + obj.poster_path + ')');
							div.append(title);
						}
					})
				})
			})

	}
	
	// TOP 10 무비 호출
	getTrendingContent(API_URL);
	
	API_URL = BASE_URL + '/trending/tv/week?' + API_KEY + "&language=ko";
	
	// TOP 10 쇼 호출
	getTrendingContent(API_URL);
}


	
	
	 