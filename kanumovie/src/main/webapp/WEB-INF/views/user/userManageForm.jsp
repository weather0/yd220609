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
			<li><button type="button" class="btnCnt" id="button4">선호 장르</button></li>
		</ul>
	</div>
	<script>
		for (let i = 1; i < 5; i++) {
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
								<br> <img alt="${fileName}" src="img/profile/${fileName}">
								<br>
							</div>
							<div class="input__item">
								<input type="hidden" id="email" name="email" value="${email}">
								<input type="hidden" id="pw" name="pw" value="${pw}"> <input
									type="file" id="file" name="file" required>
							</div>
							<button type="submit" class="site-btn">프로필 사진 수정</button>
						</form>
	<form action="#" method="post">
							<div class="input__item">
								<input type="hidden" id="email" name="email" value="${email}">
							</div>
							<button type="button" class="site-btn" onclick="deleteUser()">회원
								탈퇴</button>
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
	<form action="preferGenreForm.do" method="post">
							<div class="input__item">
								<input type="hidden" id="email" name="email" value="${email}">
							</div>
							<button type="submit" class="site-btn">선호 영화 수정</button>
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
			if (confirm("이 버튼에 대한 동작을 수행합니다. 계속합니까?")) {
				// 확인 버튼 클릭 시 동작
				alert("동작을 시작합니다.");
			} else {
				// 취소 버튼 클릭 시 동작
				alert("동작을 취소했습니다.");
			}
		}
	</script>
</body>
</html>