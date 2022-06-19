<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userManageForm</title>
<link rel="stylesheet" href="css/project-movie.css">
<style>
* {
	color: #fff;
}

#userManage .userHeader {
	width: 100%;
	border: 1px solid #fff;
	padding: 5%;
}

#userManage .userHeader h2, p {
	color: #fff;
	text-align: center;
}

.menutab {
	text-align: center;
}

.menutab ul {
	list-style: none;
	margin: 0;
	padding: 0;
	text-align: center;
}

.menutab ul li {
	display: inline-block;
	background: 1px solid #fff;
	padding: 5%;
}

.menutab ul li button {
	background: none;
}

.menutab li button:hover {
	background: red;
	border-radius: 10px;
	text-decoration: underline;
	font-weight: bold;
	transition: 0.3s;
}

.user-information-section {
	width: 100%;
	height: 100%;
	position: relative;
}

.user-information-section div {
	width: 100%;
}
.user-information-section h3 {
	color: #fff;
}

#pwCheck1 {
	width: 80%;
	height: 200px;
	margin: 0 auto;
	color: #fff;
	background: rbga(0, 0, 0, 0.5);
}

#pwCheck1 h3 {
	padding: 5% 5% 5% 0%;
}

.tabContent {
	display: none;
}

.btnCnt:target .tabContent.user-information-section {
	display:block;
}

.tabContent {
	padding: 5%;
	height: 100%;
	text-align: center;
}
.tabContent h3 {
	display: block;
	text-align: center;
}

.tabContent input[type=text] {
	width: 80%;
	margin: 2% auto;
}

.tabContent button {
	marin: 2% auto;
	text-align: center;
}

.fileupload {
	display : none;
}

.filelabel {
	margin : 5% auto 5% auto;
	display : inline-block;
}
</style>
</head>
<body id="userManage">
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<div class="userHeader">
		<h2>User Management</h2>
		<p>Change Your Information</p>
	</div>

	<div class="menutab">
		<ul>
			<li><button type="button" class="btnCnt" id="button1">비밀번호</button></li>
			<li><button type="button" class="btnCnt" id="button2">프로필</button></li>
			<li><button type="button" class="btnCnt" id="button3">닉네임</button></li>
			<li><button type="button" class="btnCnt" id="button4">보고싶어요</button></li>
			<li><button type="button" class="btnCnt" id="button5">회원탈퇴</button></li>
		</ul>
	</div>
	<script>
		for (let i = 1; i < 6; i++) {
			let btn = document.querySelector('#button' + i);
			btn.addEventListener('click', function() {
				document.querySelectorAll('.tabContent').forEach(elem => {
					if (elem.getAttribute('id') == ('tab' + i)) {
						elem.setAttribute('style', 'display:block');
						if (elem.getAttribute('id') == ('tab1')) {
							elem.children[1].setAttribute('style', 'display:none');
							console.log(elem.children[1]);
						}
					} else {
						elem.setAttribute('style', 'display:hidden');
					}
				})
			})
		}
	</script>

	<article class="tabContent user-information-section" id="tab1">
	<div id="pwCheck1">
		<form id="pwCheck1" method="post" action="#">
			<h3>비밀번호 수정</h3>
			<h3>기존 비밀번호 확인</h3>
			<div class="input__item">
				<input type="hidden" id="email" name="email" value="${email}">
			</div>
			<div class="input__item">
				<input type="password" id="check" name="check"
					placeholder="기존 패스워드를 입력" required> <span
					class="icon_profile"></span>
			</div>
			<button type="button" onclick="getCheck()">비밀번호 확인</button>
		</form>
		</div>
		<div id="pwCheck2">
		<form action="pwChange.do" method="post">
				<h3>비밀번호 수정</h3>
			<div class="input__item">
				<input type="hidden" id="email" name="email" value="${email}">
			</div>
			<div class="input__item">
				<input type="password" id="pw" name="pw" required> <span
					class="icon_profile"></span>
			</div>
			<button type="submit" class="site-btn">비밀번호 수정</button>
		</form>
		</div>
	</article>
	<article class="tabContent user-information-section" id="tab2">
	<form action="profileChange.do" method="post"
							enctype="multipart/form-data">
							<div class="anime__review__item__pic">
								<img alt="${fileName}" src="img/profile/${fileName}">
							</div>
							<br>
							<div class="input__item">
								<input type="hidden" id="email" name="email" value="${email}">
								<input type="hidden" id="pw" name="pw" value="${pw}">
								<label for="file" id="filelabel" ><h3>새 프로필 업로드</h3></label>
								<input type="file" id="file" name="file" class="fileupload" required>
							</div>
							<br>
							<button type="submit" class="site-btn">프로필 사진 수정</button>
						</form>
	</article>
	
	<article class="tabContent user-information-section" id="tab3">
	<form action="userManage.do" method="post">
							<div>
								<br> <br>
								<h3>Change Nickname</h3>
							</div>
							<div class="input__item">
								<input type="hidden" id="email" name="email" value="${email}">
								<input type="hidden" id="pw" name="pw" value="${pw}">
							</div>
							<div class="input__item">
								<input type="text" id="nick" name="nick" placeholder="${nick}"
									required> <span class="icon_profile"></span>
							</div>

							<button type="submit" class="site-btn">Change</button>
						</form>
	</article>
	<article class="tabContent user-information-section" id="tab4">
	<div class="movie-card-container">
		<input type="hidden" id="sessionId" value="${email}">
	</div>
	<form action="preferGenreForm.do" method="post">
							<div class="input__item">
								<input type="hidden" id="email" name="email" value="${email}">
							</div>
							<button type="submit" class="site-btn">선호 영화 수정</button>
						</form>
	</article>
	
	<article class="tabContent user-information-section" id="tab5">
			<form action="#" method="post">
				<div class="input__item">
					<input type="hidden" id="email5" name="email5" value="${email}">
				</div>
				<button type="button" class="site-btn" onclick="deleteUser()">회원탈퇴</button>
			</form>
	</article>
	
	<!-- Signup Section End -->
	<script src="js/rating.js"></script>
	<script type="text/javascript">
				function getShow(){
            document.getElementById("pwCheck2").style.display = "block";
            document.getElementById("pwCheck1").style.display = "none";
        }
        
        function getCheck(){
        	let check = document.getElementById("check").value;
        	if(check == '<%=(String) session.getAttribute("pw")%>') {
				alert('비밀번호 확인 완료!');
				getShow();
			} else {
				alert('비밀번호가 정확하지 않습니다! 다시 입력하세요!');
			}
		}

		function deleteUser() {
			if (confirm("정말로 회원 데이터를 삭제하시겠습니까?")) {
				// 확인 버튼 클릭 시 동작
				alert("회원 데이터를 삭제합니다.");
				// 회원 탈퇴하고 회원 탈퇴 완료 페이지 보여주기.
				let email = '<%=(String) session.getAttribute("email")%>';
				console.log(email);
				$.ajax({
					type: 'POST',
					url : 'userDelete.do',
					data: { 'email' : email },
					dataType : 'text',
					success: function(data){
						//작업이 성공적으로  발생했을 경우
						alert('회원탈퇴가 완료되었습니다!');
						location.replace('/kanumovie/home.do');
					},
					error:function(){  
			            //에러가 났을 경우 실행시킬 코드
			            alert('error 발생!');
					}
				})
			} else {
				// 취소 버튼 클릭 시 동작
				alert("회원탈퇴를 취소했습니다.");
			}
		}
		
		let email = document.querySelector('#email').value;
		let param = {'email':email}
		function getMyMovie() {
			let container = document.querySelector('.movie-card-container');
			fetch('userLikesSelectList.do',{
				method:'post',
				headers:{'Content-Type':'application/json'},
				body: JSON.stringify(param)
			})
				.then(response => response.json())
				.then(data => {
					data.forEach(elem => {
						let param = 
						fetch('https://api.themoviedb.org/3/movie/' + elem.id + '?api_key=e51d70c65b46eb8bd60cafccc9325e8b&language=ko-KR')
							.then(response => response.json())
							.then(data => {
								let card = makeCard(data);
								container.append(card);
								rating(); 
							})
					})
				})
		}
		
		getMyMovie();
		
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
			let button = makeButton(obj);
			let input = document.createElement('input');
			input.setAttribute('type', 'hidden');
			input.setAttribute('value', obj.id);
			card.append(input);
			card.append(button);
			info.append(rate);
			card.append(info);
			return card;
		}
		
		function makeButton(obj) {
			let div = document.createElement('div');
			let button = document.createElement('button');
			button.setAttribute('type', 'button');
			button.setAttribute('class', 'w3-button w3-black w3-round');
			button.addEventListener('click', function(e) {
				console.log("heart");
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
				console.log(this.children[0].getAttribute('id').substring(6));
				let param = 'cmd=' + cmd + '&id=' + this.children[0].getAttribute('id').substring(6) + '&email=' + email;
				if (cmd == 'delete') {
					fetch('likesDelete.do', {
						method:'POST',
						headers:{'Content-Type':'application/x-www-form-urlencoded'},
						body: param
					})
						.then(response => response.json())
						.then(message => {
							if (message.message = "deletesuccess") {
								this.parentElement.parentElement.remove(); 
							}
						})
						.catch(err => console.log(err))
				}
			})
			button.setAttribute('style', 'background:none;z-index:999;')
			let icon = document.createElement('i');
			icon.setAttribute('class', 'fa fa-heart');
			icon.setAttribute('style', 'color:red');
			icon.setAttribute('id', 'movie-' + obj.id);
			button.append(icon);
			div.append(button);
			return div;
		}
	</script>
</body>
</html>