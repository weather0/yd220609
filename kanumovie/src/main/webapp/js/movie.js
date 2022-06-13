document.addEventListener('DOMContentLoaded', mainFnc)

function mainFnc() {

	const API_KEY = 'api_key=e51d70c65b46eb8bd60cafccc9325e8b';
	const BASE_URL = 'https://api.themoviedb.org/3';
	let API_URL = BASE_URL + '/trending/movie/week?' + API_KEY + "&language=ko";
	const poster = "https://image.tmdb.org/t/p/w500"

	function getTrendingMovie(url) {

		fetch(url)
			.then(response => response.json())
			.then(data => data.results)
			.then(list => {
				list.forEach((obj, idx) => {
					let num = idx + 1;
					num = num.toString();
					let img = document.getElementById('movie-'+num);
					img.width = "100";
					img.height = "150";
					console.log(img);
					img.setAttribute('src', poster + obj.poster_path);
					let title = document.createElement('h5');
					title.innerHTML = obj.title;
					img.parentElement.append(title);
				})
			})
			.catch(err => console.log(err));
	}

	getTrendingMovie(API_URL);

	API_URL = BASE_URL + '/trending/tv/week?' + API_KEY + "&language=ko";
	

	function getTrendingShow(url) {
		fetch(url)
			.then(response => response.json())
			.then(data => data.results)
			.then(list => {
				list.forEach((obj, idx) => {
					console.log(list);
					let num = idx + 1;
					num = num.toString();
					let img = document.getElementById('show-'+num);
					img.width = "100";
					img.height = "150";
					console.log(img);
					img.setAttribute('src', poster + obj.poster_path);
					let title = document.createElement('h5');
					title.innerHTML = obj.name;
					img.parentElement.append(title);
				})
			})
	}
	getTrendingShow(API_URL);

} 