const BASE_URL_C = "https://api.themoviedb.org/3/discover/movie?api_key=e51d70c65b46eb8bd60cafccc9325e8b&language=ko&&with_origin_country=";
let countryId = document.querySelector('input').getAttribute('value');
let countryURL = countryId + "&page=";
let sorting = "&sort_by=vote_count.desc"
let sessionId = document.querySelector("#c_sessionId").value;

let c_count;
let cList = document.querySelectorAll('div.movie-card-container');
cList.forEach(container => {
	let number = container.getAttribute('data-value');
	countryMovieList(number);
	c_count = parseInt(number) + 1;
})

function countryMovieList(num) {
	let API_URL = BASE_URL_C + countryURL + num + sorting;
	if (num > 2) {
		let div = document.createElement('div');
		div.setAttribute('class', 'movie-card-container');
		div.setAttribute('data-value', num);
		document.querySelector('div.infinite').append(div);
	}
	console.log("country:" + API_URL)
	getCountryData(API_URL, num);
}

function getCountryData(url, num) {
	fetch(url)
		.then(response => response.json())
		.then(data => data.results)
		.then(arr => {
			let pageCnt = num;
			console.log(arr);
			arr.forEach((elem) => {
				let card = makeCard(elem);
				let container = document.querySelectorAll('div.movie-card-container');
				container.forEach((con) => {
					if (con.getAttribute('data-value') == pageCnt) {
						con.append(card);
					}
				})
			})
			rating(); 
			getLikes(); 
		})
}


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