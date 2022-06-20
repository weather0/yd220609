<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
  
<title>loginForm</title>

<style>
	.logincontainer {
		padding: 0%;
	}
	.loginheader .container, .logincontainer .container {
		width: 100%;
		margin: 0 auto;
		text-align: center;
		padding: 10%;
	} 
	/* 
	.logincontainer .container {
		background: rgba(0, 0, 0, 0.5);
	} */
	
	.login__form {
		padding: 0%;
		text-align: center;
	} 
	.login__form #passwordFind {
		padding: 10%;
		width: 100%;
	}
	
	.login__form #passwordFind a {
		text-align: center;
		width: 100%;
		margin-left: 20%;
		padding-left: 30%;
		margin-bottom: 5%;
	}
	
</style>
</head>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Normal Breadcrumb Begin -->
    <section class="loginheader normal-breadcrumb set-bg" data-setbg="img/normal-breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>Login</h2>
                        <p>Welcome to Kanu Movie</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

    <!-- Login Section Begin -->
    <section class="logincontainer login spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form">
                        <h3>Login</h3>
                        <form action="login.do" method="post">
                            <div class="input__item">
                                <input type="text" id="email" name="email" placeholder="Email address" required>
                                <span class="icon_mail"></span>
                            </div>
                            <div class="input__item">
                                <input type="password" id="pw" name="pw" placeholder="Password" required>
                                <span class="icon_lock"></span>
                            </div>
                            <button type="submit" class="site-btn">Login Now</button>
                        </form>
                        <br><br>
                        <div id="passwordFind"><a href="findPwForm.do" class="forget_pass">Forgot Your Password?</a></div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__register" id="login__register">
                        <h3>Dont’t Have An Account?</h3>
                        <a href="signUpForm.do" class="primary-btn">Register Now</a>
                    </div>
                </div>
            </div>
            <div class="login__social">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-6">
                        <div class="login__social__links">
                            <span>or</span>
                            <ul>
                                <li><a href="#" class="facebook"><i class="fa fa-facebook"></i> Sign in With
                                Facebook</a></li>
                                <li><a href="#" class="google"><i class="fa fa-google"></i> Sign in With Google</a></li>
                                <li><a href="#" class="twitter"><i class="fa fa-twitter"></i> Sign in With Twitter</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="javascript:kakaoLogin();"><img src="./kakao_login.png" alt="카카오계정 로그인" style="height: 100px;"/></a>
    </section>
    <!-- Login Section End -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        window.Kakao.init('f86288f6262962cf240ad63764712370');

        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'profile_nickname, profile_image, account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                    console.log(response) // 로그인 성공하면 받아오는 데이터
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                        url: '/v2/user/me',
                        success: (res) => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account)
                            console.log(kakao_account.email)
                            console.log(kakao_account.profile.nickname)
                            let kakaoEmail = kakao_account.email;
                            let kakaoNick = kakao_account.profile.nickname;
                            // loginKakao.do
                            $.ajax({
			                    type: 'POST',
			                    url : 'loginKakao.do',
			                    data: { 'kakaoEmail' : kakaoEmail,
			                    	    'kakaoNick' : kakaoNick,},
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
                        }
                    });
                    // window.location.href='http://localhost/kanumovie/home.do' //리다이렉트 되는 코드
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
    </script>

</body>
</html>