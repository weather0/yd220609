<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <title>Anime | Template</title>


<title>signUpForm</title>
<style>
	#regiBtn {
		display:none;
	}
</style>
</head>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>


    <!-- Normal Breadcrumb Begin -->
    <section class="normal-breadcrumb set-bg" data-setbg="img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>Sign Up</h2>
                        <p>Welcome to Kanu Movie</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

    <!-- Signup Section Begin -->
    <section class="signup spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form">
                        <h3>Sign Up</h3>
                        <form action="signUp.do" method="post">
                            <div class="input__item">
                                <input type="text" id="email" name="email" placeholder="Email address" required>
                                <span class="icon_mail"></span>
                                <button type="button" onclick="idCheck()" class="site-btn">중복 확인</button>
                            </div>
                            <div class="input__item">
                                <input type="text" id="nick" name="nick" placeholder="Your NickName" required>
                                <span class="icon_profile"></span>
                            </div>
                            <div class="input__item">
                                <input type="password" id="pw" name="pw" placeholder="Password" required>
                                <span class="icon_lock"></span>
                            </div>
                            	<button type="submit" class="site-btn" id="regiBtn">Register Now</button>
                        </form>
                        <h5>Already have an account? <a href="loginForm.do">Log In!</a></h5>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__social__links">
                        <h3>Login With:</h3>
                        <ul>
                            <li><a href="loginForm.do" class="google"><i class="fa fa-google"></i> Sign in With Google</a></li>
                            <li><a href="loginForm.do" class="twitter"><i class="fa fa-twitter"></i> Sign in With KaKao</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div><input type="hidden" value="no" id="cango"></div>
    <!-- Signup Section End -->

	<script>
		function idCheck() {

			let isnertEmail = document.getElementById('email').value;
			
			// idCheck.do
            $.ajax({
                type: 'POST',
                url : 'idCheck.do',
                data: { 'email' : isnertEmail,},
                dataType : 'text',
                success: function(data){
                    console.log(data);
                    let a = data.substring(7,8);
                    console.log(a);
                    if(a == 'y') {
                    	alert('이미 가입한 이메일입니다!')
                    } else {
                    	document.getElementById('cango').value = 'yes';
                    	verifyEmail()
                    }
                    cangoCheck();
                },
                error:function(){  
                    alert('id check error 발생!');
                }
            })
		}
		
		$(document).ready(function(){
			if(document.getElementById('cango').value == 'yes') {
				document.getElementById('regiBtn').style.display = "block";
			} else {
				document.getElementById('regiBtn').style.display = "none";
			}
		})
		// 중복체크 확인 여부 > 버튼 보여줌
		function cangoCheck() {
			if(document.getElementById('cango').value == 'yes') {
				document.getElementById('regiBtn').style.display = "block";
				alert('가입 가능한 이메일입니다!')
			} else {
				document.getElementById('regiBtn').style.display = "none";
			}
		}
		
		// 이메일 형식 체크 정규식
		function verifyEmail() {
		  // 이메일 검증 스크립트 작성
		  var emailVal = $("#email").val();
		
		  var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		  // 검증에 사용할 정규식 변수 regExp에 저장
		
		  if (emailVal.match(regExp) != null) {
		    console.log('이메일 형식 Good!');
		    document.getElementById('cango').value = 'yes'
		  }
		  else {
		    console.log('이메일 형식 Error');
		    alert('이메일 형식이 잘못되었습니다!')
		    document.getElementById('cango').value = 'no'
		  }
		}
	</script>
</body>
</html>