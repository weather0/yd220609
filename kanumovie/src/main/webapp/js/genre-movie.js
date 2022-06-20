const BASE_URL = "https://api.themoviedb.org/3/discover/movie?api_key=e51d70c65b46eb8bd60cafccc9325e8b&language=ko-KO&with_genres="
let genreId = parseInt(document.querySelector('#genreId').getAttribute('value'));
let genreURL = genreId + "&page=";
let sessionId = document.querySelector('#sessionId').value;

let count;
let list = document.querySelectorAll('div.movie-card-container');
list.forEach(container => {
	console.log(window.sessionStorage);
	let number = container.getAttribute('data-value');
	movieList(number);
	count = parseInt(number) + 1;
})

function movieList(num) {
	let API_URL = BASE_URL + genreURL + num;
	if (num > 2) {
		let div = document.createElement('div');
		div.setAttribute('class', 'movie-card-container');
		div.setAttribute('data-value', num);
		document.querySelector('div.infinite').append(div);

	}
	getData(API_URL, num);
}

function getData(url, num) {
	fetch(url)
		.then(response => response.json())
		.then(data => data.results)
		.then(arr => {
			console.log(arr);
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
			rating();
			getLikes();
		})
}

let param = {email: sessionId};
function getLikes() {
	if (sessionId) {
		fetch('userLikesSelectList.do', {
			method: 'POST',
			headers: { 'Content-Type': 'application/json' },
			body: JSON.stringify(param)
		})
			.then(response => response.json())
			.then(data => {
				console.log(data);
				let movieData = document.querySelectorAll('.movie-card input');
				console.log(movieData);
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






