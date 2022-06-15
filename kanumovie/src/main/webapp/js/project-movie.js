/*document.addEventListener('DOMContentLoaded', mainFnc())
function mainFnc() {*/
	const BASE_URL = "https://api.themoviedb.org/3/discover/movie?api_key=e51d70c65b46eb8bd60cafccc9325e8b&with_genres=28&language=ko-KO&page=";
	let pageNum = 1;
	loadData(pageNum);
	pageNum += 2;

	function loadData(pageNum) {
		for (let i = pageNum; i < (pageNum + 2); i++) {
			let page = document.createElement('div');
			let API_URL = BASE_URL + i;
			fetch(API_URL)
				.then(response => response.json())
				.then(data => data.results)
				.then(arr => {
					let container = document.querySelector('.infinite');
					arr.forEach((elem) => {
						let card = document.createElement('div');
						card.setAttribute('class', 'movie-card');
						card.setAttribute('onclick', "location.href='movieInfo.do?id=" + elem.id + "'");
						let img = document.createElement('img');
						img.setAttribute('src', 'https://image.tmdb.org/t/p/w500' + elem.poster_path);
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
						page.setAttribute('id', 'page-' + i);
						container.append(page);
						rating();
					})
				})
		}
		makeButton(); 
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
	
	function makeButton() {
		if (!document.querySelector('button')) {
			let div = document.createElement('div');
			let button = document.createElement('button');
			button.setAttribute('type', 'button');
			console.log(pageNum);
			console.log(document.querySelector('.infinite'));
			console.log(document.querySelector('div.movie-card-container'));
			console.log(document.querySelector('.movie-card-container'));
			button.addEventListener('click', function() {
				loadData(pageNum);
				pageNum += 2;
			})
			div.append(button);
			document.querySelector('.infinite').append(div);
		}
	}
/*}*/
