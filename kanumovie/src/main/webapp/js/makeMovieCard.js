function makeCard(obj) {

	const POSTER_BASE_URL = "https://image.tmdb.org/t/p/w500";

	// Movie Card 틀
	let card = document.createElement('div');
	card.setAttribute('class', 'movie-card');
	card.addEventListener('click', function() {
		insertMovie(obj);
	})
	// 포스터 이미지
	let img = document.createElement('img');
	img.setAttribute('src', POSTER_BASE_URL + obj.poster_path);
	// 영화 제목
	let info = document.createElement('div');
	let title = document.createElement('p');
	title.innerHTML = obj.title;
	info.append(title);
	// 영화 뷰수
	let view = document.createElement('div');
	let viewCnt = document.createElement('span');
	viewCnt.innerHTML = obj.vote_count;
	viewCnt.append(view);
	// 영화 평점 별점 
	let rate = document.createElement('div');
	rate.setAttribute('class', 'star-rate');
	rate.setAttribute('data-rate', obj.vote_average);
	for (let i = 0; i < 5; i++) {
		let star = document.createElement('span');
		star.setAttribute('class', 'fa fa-star');
		rate.append(star);
	}
	//찜하기 버튼 
	let button = makeButton(obj);
	
	// 영화 아이디 저장
	let input = document.createElement('input');
	input.setAttribute('type', 'hidden');
	input.setAttribute('value', obj.id);
	
	// 영화 플레이 버튼
	let play = makePlayButton();
	
	card.append(input);
	card.append(img);
	card.append(button);
	info.append(rate);
	card.append(info);
	card.append(view);
	card.append(play);
	return card;
}

function makeButton(obj) {
	let div = document.createElement('div');
	let button = document.createElement('button');
	button.setAttribute('type', 'button');
	button.setAttribute('class', 'w3-button w3-black w3-round');
	button.addEventListener('click', function(e) {
		e.stopPropagation();
		let heart = this.firstChild;
		let cmd = "";
		if (!!sessionId) {
			if (heart.style.color == 'red') {
				heart.setAttribute('style', 'color:grey');
				cmd = "delete";
			} else if (heart.style.color == 'grey') {
				heart.setAttribute('style', 'color:red');
				cmd = "insert";
			}
		} else if (!sessionId) {
			alert("로그인이 필요한 기능입니다.");
		}
		let param = 'cmd=' + cmd + '&id=' + this.children[0].getAttribute('id').substring(6) + '&email=' + sessionId;
		if (cmd == 'insert') {
			fetch('likes.do', {
				method: 'POST',
				headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
				body: param
			})
				.then(response => response.json())
				.then(message => console.log(message))
				.catch(err => console.log(err))
		} else if (cmd == 'delete') {
			fetch('likesDelete.do', {
				method: 'POST',
				headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
				body: param
			})
				.then(response => response.json())
				.then(message => console.log(message))
				.catch(err => console.log(err))
		}
	})
	button.setAttribute('style', 'background:none;z-index:999;')
	let icon = document.createElement('i');
	icon.setAttribute('class', 'fa fa-heart');
	icon.setAttribute('style', 'color:grey');
	icon.setAttribute('id', 'movie-' + obj.id);
	button.append(icon);
	div.append(button);
	return div;
}

function makePlayButton() {
	let playdiv = document.createElement('div');
	playdiv.setAttribute('class', 'playButtonContainer');
	playdiv.setAttribute('style', 'position: absolute;top:50%;text-align:center;background:none;');
	let playicon = document.createElement('i');
	playicon.setAttribute('class', 'fa fa-solid fa-play');
	playicon.setAttribute('style', 'color:#fff');
	playdiv.append(playicon);
	return playdiv;
} 

function insertMovie(obj) {
	console.log(obj);
  let param = {"adult":obj.adult, "backdropPath":obj.backdrop_path, "genreIds":'\'' + obj.genre_ids + '\'',
	"id":obj.id, "originalLanguage":obj.original_language, "originalTitle":obj.original_title,
	"overview":obj.overview, 'popularity':obj.popularity, 'posterPath':obj.poster_path, 
	'releaseDate':obj.release_date, 'title':obj.title, 'video':obj.video, 'voteAverage':obj.vote_average,
	'voteCount':obj.vote_count}
	fetch('movieInsert.do', {
		method:'POST',
		headers:{'Content-Type':'application/json'},
		body:JSON.stringify(param)
	})
		.then(response => response.json())
		.then(result => {
			location.href="movieInfo.do?id=" + result.id;
		})
}
