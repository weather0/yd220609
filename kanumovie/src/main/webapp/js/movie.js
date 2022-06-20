	document.addEventListener('DOMContentLoaded', mainFnc);
	function mainFnc() {
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

	const API_KEY = 'api_key=e51d70c65b46eb8bd60cafccc9325e8b';
	const BASE_URL = 'https://api.themoviedb.org/3';
	let API_URL = BASE_URL + '/trending/movie/week?' + API_KEY + "&language=ko";
	const poster = "https://image.tmdb.org/t/p/w500"

	console.log(API_URL);

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
					console.log(obj);
					let rank = document.createElement('h2');
					rank.innerHTML = (idx+1);
					let title = document.createElement('p');
					divlist.forEach((div, dividx) => {
						div.addEventListener('click', () => {
							insertMovie(obj);
						})
						if (dividx == idx) {
							if (url.includes('/movie/')) {
								title.innerHTML = obj.title;
							} else if (url.includes('/tv/')) {
								title.innerHTML = obj.name;
							}
							div.append(rank);
							div.setAttribute('style', 'background-image:url('+ poster + obj.poster_path + ')');
							div.append(title);
						}
					})
				})
			})

	}

	getTrendingContent(API_URL);
	
	API_URL = BASE_URL + '/trending/tv/week?' + API_KEY + "&language=ko";
	
	getTrendingContent(API_URL);
}


	
	
	 