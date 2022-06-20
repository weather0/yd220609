<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <!-- google content에 자신의 OAuth2.0 클라이언트ID를 넣습니다. -->
 <meta name ="google-signin-client_id" content="75317610609-40uu6j3mr5jvg3neuo8b3dtidrrkrbd4.apps.googleusercontent.com">
  
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
        <div>
            <ul>
			 <li id="GgCustomLogin">
			  <a href="javascript:void(0)">
			   <span>Login with Google</span>
			  </a>
			 </li>
			</ul>
        </div>
         <a href="#" onclick="signOut();">Sign out</a>
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
    <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
    <script>
	  //처음 실행하는 함수
	    function init() {
	        gapi.load('auth2', function() {
	            gapi.auth2.init();
	            options = new gapi.auth2.SigninOptionsBuilder();
	            options.setPrompt('select_account');
	            // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
	            options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
	            // 인스턴스의 함수 호출 - element에 로그인 기능 추가
	            // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
	            gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
	            
	        })
	    }
	
	    function onSignIn(googleUser) {
	        var access_token = googleUser.getAuthResponse().access_token
	        $.ajax({
	            // people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
	            url: 'https://people.googleapis.com/v1/people/me'
	            // key에 자신의 API 키를 넣습니다.
	            , data: {personFields:'birthdays', key:'AIzaSyAYziY6VgIsaaqZncsp4KfUhoNRmI3IvcM', 'access_token': access_token}
	            , method:'GET'
	        })
	        .done(function(e){
	            //프로필을 가져온다.
	            var profile = googleUser.getBasicProfile();
	            console.log(profile)
	        })
	        .fail(function(e){
	            console.log(e);
	        })
	    }
	    function onSignInFailure(t){        
	        console.log(t);
	    }
    </script>
	<script>
	  function signOut() {
	    var auth2 = gapi.auth2.getAuthInstance();
	    auth2.signOut().then(function () {
	      console.log('User signed out.');
	    });
	  }
	</script>

</body>
</html>