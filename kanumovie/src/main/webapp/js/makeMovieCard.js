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
	if (!!obj.poster_path) {
		img.setAttribute('src', POSTER_BASE_URL + obj.poster_path);
	} else {
		img.setAttribute('src', 'https://www.themoviedb.org/assets/2/v4/glyphicons/basic/glyphicons-basic-38-picture-grey-c2ebdbb057f2a7614185931650f8cee23fa137b93812ccb132b9df511df1cfac.svg');
	}
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

// 하트 버튼 생성 함수
function makeButton(obj) {
	let div = document.createElement('div');
	let button = document.createElement('button');
	button.setAttribute('type', 'button');
	button.setAttribute('class', 'w3-button w3-black w3-round');
	button.addEventListener('click', function(e) {
		e.stopPropagation();
		let heart = this.firstChild;
		let cmd = "";
		// 사용자의 이메일이 Null이 아닐 경우
		if (!!sessionId) {
			if (heart.style.color == 'red') {
				heart.setAttribute('style', 'color:grey');
				cmd = "delete";
			} else if (heart.style.color == 'grey') {
				heart.setAttribute('style', 'color:red');
				cmd = "insert";
			}
		// 사용자의 이메일이 Null일 경우	
		} else if (!sessionId) {
			alert("로그인이 필요한 기능입니다.");
		}
		// Insert 또는 Delete command 포함한 파라미터 생성
		let param = 'cmd=' + cmd + '&id=' + this.children[0].getAttribute('id').substring(6) + '&email=' + sessionId;
		if (cmd == 'insert') {
			// 무비 정보 API에서 호출
			fetch('https://api.themoviedb.org/3/movie/' + obj.id + '?api_key=e51d70c65b46eb8bd60cafccc9325e8b&language=ko-KR')
				.then(response => response.json())
				.then(data => {
					let arr = [];
					data.genres.forEach((elem) => {
						arr.push(elem.id);
					})
					arr = arr.toString(); 
					let dataStr = {"adult":data.adult, "backdrop_path":data.backdrop_path, "genre_ids":arr,
					"id":data.id, "original_language":data.original_language, "original_title":data.original_title,
					"overview":data.overview, "popularity":data.popularity, "poster_path":data.poster_path, 
					"release_date":data.release_date, "title":data.title, "video":data.video, "vote_average":data.vote_average,
					"vote_count":data.vote_count}
					// 무비 데이터 무비 테이블에 삽입
					fetch('movieInsert.do', {
						method: 'POST',
						headers: {'Content-Type':'application/json'},
						body:JSON.stringify(dataStr)
					})
						.then(response => response.json())
						.then(message => {
							// 만약 삽입한 아이디 값이 NULL이 아닐 경우 (성공한 경우)
							if (message.id != null) {
								// 사용자의 좋아요 정보 해당 테이블에 저장
								fetch('likes.do', {
									method: 'POST',
									headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
									body: param
								})
								.then(response => response.json())
								.then(message => console.log(message))
								.catch(err => console.log(err))
							}
						})
				})
		// 사용자가 좋아요를 푼 경우 		
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

// 플레이 버튼 생성
function makePlayButton() {
	let playdiv = document.createElement('p');
	playdiv.setAttribute('class', 'playButtonContainer');
	playdiv.setAttribute('style', 'position: absolute;top:50%;left:50%;text-align:center;background:none;');
	let playicon = document.createElement('i');
	playicon.setAttribute('class', 'fa fa-solid fa-play');
	playicon.setAttribute('style', 'color:#fff');
	playdiv.append(playicon);
	return playdiv;
} 

// 클릭할 경우 무비 테이블에 삽입하는 함수 (장르 아이디가 배열값이 아닌 스트링이라서 위 함수와는 파라미터 차이남)
function insertMovie(obj) {
	console.log(obj);
  let param = {"adult":obj.adult, "backdrop_path":obj.backdrop_path, "genre_ids":'\'' + obj.genre_ids + '\'',
	"id":obj.id, "original_language":obj.original_language, "original_title":obj.original_title,
	"overview":obj.overview, 'popularity':obj.popularity, 'poster_path':obj.poster_path, 
	'release_date':obj.release_date, 'title':obj.title, 'video':obj.video, 'vote_average':obj.vote_average,
	'vote_count':obj.vote_count}
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
