document.addEventListener('DOMContentLoaded', mainFnc)

function mainFnc() {
	
	const API_KEY = 'api_key=e51d70c65b46eb8bd60cafccc9325e8b';
	const BASE_URL = 'https://api.themoviedb.org/3';
	const API_URL = BASE_URL + '/trending/movie/week?'+API_KEY + "&language=ko";
	const poster = "https://image.tmdb.org/t/p/w200"
	
	function getTrendingMovie(url) {
		let mainhead = document.createElement('h1');
		document.querySelector(".owl-carousel").append(mainhead);
		mainhead.innerHTML = 'Trending Movies';
		fetch(url)
			.then(response => response.json())
			.then(data => data.results)
			.then(list => {
				list.forEach(obj => {
					let div = document.createElement('div');
					div.setAttribute('class', 'item');
					let imgdiv = document.createElement('div');
					let img = document.createElement('img');
					img.setAttribute('src', poster+obj.poster_path);
					imgdiv.append(img);
					let textdiv = document.createElement('div');
					let head = document.createElement('h5');
					head.innerHTML = obj.title;
					textdiv.append(head);
					div.append(imgdiv);
					div.append(textdiv);	
					document.querySelector(".owl-carousel").append(div);
				})
			})
			.catch(err => console.log(err));
	}
	
	getTrendingMovie(API_URL);
	
} 