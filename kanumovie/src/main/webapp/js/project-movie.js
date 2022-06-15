const BASE_URL = "https://api.themoviedb.org/3/discover/movie?api_key=e51d70c65b46eb8bd60cafccc9325e8b&language=ko-KO&with_genres="
let genreId = parseInt(document.querySelector('input').getAttribute('value'));
let genreURL = genreId + "&page=";

let count;
let list = document.querySelectorAll('div.movie-card-container');
list.forEach(container => {
	let number = container.getAttribute('data-value');
	movieList(number);
	count = parseInt(number) + 1;
})

function movieList(num) {
	let API_URL = BASE_URL + genreURL + num;
	console.log(API_URL);
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
			let pageCnt = num;
			arr.forEach((elem) => {
				let card = makeCard(elem);
				let container = document.querySelectorAll('div.movie-card-container');
				container.forEach((con) => {
					if (con.getAttribute('data-value') == pageCnt) {
					con.append(card);
				}
				rating(); 
				})
			})
		})
}

function makeCard(obj) {
	let card = document.createElement('div');
	card.setAttribute('class', 'movie-card');
	card.setAttribute('onclick', "location.href='movieInfo.do?id=" + obj.id + "'");
	let img = document.createElement('img');
	img.setAttribute('src', 'https://image.tmdb.org/t/p/w500' + obj.poster_path);
	card.append(img);
	let info = document.createElement('div');
	let title = document.createElement('p');
	title.innerHTML = obj.title;
	info.append(title);
	let rate = document.createElement('div');
	rate.setAttribute('class', 'star-rate');
	rate.setAttribute('data-rate', obj.vote_average);
	for (let i = 0; i < 5; i++) {
		let star = document.createElement('span');
		star.setAttribute('class', 'fa fa-star');
		rate.append(star);
	}
	info.append(rate);
	card.append(info);
	return card;
}

function rating() {
	let rating = $('.star-rate');
	rating.each(function() {
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
