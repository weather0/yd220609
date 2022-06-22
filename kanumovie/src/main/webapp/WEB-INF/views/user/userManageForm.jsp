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

#check {
    width: 30%;
    margin-left: auto;
    margin-right: auto;
}

#pwCheck2 form h3 {
    margin-bottom: 15px;
}

#pw, #pwChange {
    width: 30%;
    margin-left: auto;
    margin-right: auto;
}


#userManage .userHeader {
	width: 100%;
	padding: 5%;
	background-image: url("./img/user4.jpg");
	background-repeat: no-repeat;
	background-size : cover;
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

#pwCheck1, #pwCheck2, #nickCheck, #tab4 {

}

#pwCheck1Div {
	width: 80%;
	height: 200px;
	margin: 0 auto;
	color: #fff;
	background: rbga(0, 0, 0, 0.5);
	border-radius: 30px;
}

#pwCheck1 h3, #pwCheck2 h3 {
	padding: 3%;
}

#nickCheck h3 {
    padding: 1%;
}

#pwCheck1 h3 {
	padding: 1% 1% 0% 0%;
}

.tabContent {
	display: none;
}

.btnCnt:target .tabContent.user-information-section {
	display: block;
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
	width: 20%;
	margin: 2% auto;
}

.tabContent button {
	marin: 2% auto;
	text-align: center;
}

.fileupload {
	display: none;
}

.filelabel {
	margin: 5% auto 5% auto;
	display: inline-block;
}

#tab1 > div {
	height: 400px;
	background: rgba(0, 0, 0, 0.5);
	padding: 4%;
}
#tab1 > h3 {
	font-weight: bold;
	text-align: center;
}

#tab1 h5, #tab4 h5 {
	color: #fff;
	text-align: left;
	margin: 3%;
}

.userGenre {
	margin: 5%;
	padding: 5%;
}

.userGenre button {
	margin: 3%;
	background: none;
	border: 1px solid #E53637;
	border-radius: 10px;
}

#tab4 {
	height: 600px;
}
#tab4 h5 {
	text-align: center;
}

#tab1 button {
	background: none;
	border: 1px solid #E53637;
	border-radius: 10px;
}

#tab1 button:hover, .userGenre button:hover {
	transform: scale(1.1);
	font-weight: bold;
	background-color: #E53637;
	border: none;
	border-radius: 10px;
	transition-property: transform, font-weight, background-color, border;
	transition-duration: 0.7s;
}

.userGenre {
    position: absolute;
    left: 50%;
    top: 20%;
    transform: translate(-55%, -15%);
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
			<li><button type="button" class="btnCnt" id="button4">선호
					장르</button></li>
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
		<div id="pwCheck1Div">
			<form id="pwCheck1" method="post" action="#">
				<h3>비밀번호 수정</h3>
				<h5 style="text-align: center;">기존 비밀번호 확인</h5>
				<div class="input__item">
					<input type="hidden" id="email" name="email" value="${email}">
				</div>
				<div class="input__item">
					<input type="password" id="check" name="check"
						placeholder="기존 패스워드를 입력" required size="10"> <span
						class="icon_profile"></span>
				</div>
				<button type="button" onclick="getCheck()">비밀번호 확인</button>
			</form>
		</div>
		<div id="pwCheck2">
			<form id="pwCheck2form" action="pwChange.do" method="post" onsubmit="return false" >
				<h3>비밀번호 수정</h3>
				<div class="input__item">
					<input type="hidden" id="email" name="email" value="${email}">
				</div>
				<div class="input__item">
					<input type="password" id="pwChange" name="pw" required> <span
						class="icon_profile"></span>
				</div>
				<button type="submit" class="site-btn">비밀번호 수정</button>
			</form>
		</div>
	</article>
	<article class="tabContent user-information-section" id="tab2">
		<form action="profileChange.do" method="post"
			enctype="multipart/form-data">
			<div class="anime__review__item__pic" style="
    margin-bottom: 25px;">
				<img alt="${fileName}" src="img/profile/${fileName}">
			</div>
			<br>
			<div class="input__item">
				<input type="hidden" id="email" name="email" value="${email}">
				<input type="hidden" id="pw" name="pw" value="${pw}"> 
				<div>
					<label for="file" id="filelabel"><h3>새 프로필 업로드</h3></label>
				</div>
			    <input type="file" id="file" name="file" class="fileupload" required>
			</div>
			<br>
			<button type="submit" class="site-btn">프로필 사진 수정</button>
		</form>
	</article>

	<article class="tabContent user-information-section" id="tab3">
		<form id="nickCheck" action="userManage.do" method="post">
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
		<form id="preferFrm" action="preferGenreForm.do" method="post">
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
	
	<!-- <div id="userGenre" ></div> -->

	<!-- Signup Section End -->
	<script src="js/rating.js"></script>
	<script type="text/javascript">
	let param = {email:document.querySelector('#preferFrm .input__item #email').value};
	let div = document.createElement('div');
	div.setAttribute('class', 'userGenre');
	fetch('userPreference.do', {
		method:'POST',
		headers: {'Content-Type':'application/json'},
		body: JSON.stringify(param)
	})
		.then(response => response.json())
		.then(data => {
			if (data.length > 0) {
			data.forEach((elem, idx) => {
				if (idx == 0) {
					let h3 = document.createElement('h3');
					h3.innerHTML = "나의 선호 장르";
					div.append(h3);
					let h5 = document.createElement('h5');
					h5.innerHTML = "선호 장르 영화 보러가기 "
					let i = document.createElement('i');
					i.setAttribute('class', 'fa fa-arrow-down');
					h5.append(i);
					div.append(h5);
				}
				let button = document.createElement('button');
				button.innerHTML = elem.name;
				button.addEventListener('click', function() {
					location.href="movieSelectGenreList.do?id=" + elem.id + "&name=" + elem.name;
				})	
				div.append(button);
			})
			} else if (data.length == 0) {
				let h5 = document.createElement('h5');
				let i = document.createElement('i');
				i.setAttribute('class', 'fa fa-times');
				i.setAttribute('style', 'color: red');
				h5.innerHTML = "아직 선호 장르가 없으시네요. 장르를 선택해보세요. ";
				h5.append(i);
				div.append(h5);
			}
			
			document.querySelector('#tab4').append(div);
		})
				function getShow(){
            document.getElementById("pwCheck2").style.display = "block";
            document.getElementById("pwCheck1").style.display = "none";
            document.getElementById("pwCheck1Div").style.display = "none";
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
				secession();
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
	</script>
	 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	 <script>
	   // 카카오 회원탈퇴
	   window.Kakao.init('f86288f6262962cf240ad63764712370');
	   function secession() {
		    Kakao.API.request({
		        url: '/v1/user/unlink',
		        success: function(response) {
		            console.log(response);
		            //callback(); //연결끊기(탈퇴)성공시 서버에서 처리할 함수
		        },
		        fail: function(error) {
		            console.log('탈퇴 미완료')
		            console.log(error);
		        },
		    });
		};
		
		
		// 비밀번호 체크
        // 8 ~ 20자 영문, 숫자, 특수문자를 최소 한가지씩 조합
        function pwCheck() {
			
            var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;
         
            let pwCheck = regExp.test(document.getElementById('pwChange').value); // 형식에 맞는 경우 true 리턴
            console.log('패스워드 체크 : '+pwCheck);
            if(pwCheck==true) {
                return true;
            } else {
                alert('유효하지 않는 비밀번호입니다 ( 8 ~ 20자의 영문, 숫자, 특수문자를 섞은 암호여야합니다 )');
                return false;
            }
            
        }
		
		document.getElementById('pwCheck2form').onsubmit=function(){
			let check = pwCheck();
			if(check==true) {
				return true;
			} else {
				return false;
			}
		}
	 </script>
	 
</body>
</html>