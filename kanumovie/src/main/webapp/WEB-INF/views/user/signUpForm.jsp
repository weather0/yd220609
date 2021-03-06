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
                                <button type="button" onclick="idCheck()" class="site-btn">Email Check</button>
                            </div>
                            <div class="input__item">
                                <input type="password" id="pw" name="pw" placeholder="Password" required>
                                <span class="icon_lock"></span>
                                <button type="button" onclick="pwCheck()" class="site-btn">PW Check</button>
                            </div>
                            <div class="input__item">
                                <input type="text" id="nick" name="nick" placeholder="Your NickName" required>
                                <span class="icon_profile"></span>
                            </div>
                            	<button type="submit" class="site-btn" id="regiBtn" style="margin-left: 70px;">Register Now</button>
                        </form>
                        <h5>Already have an account? <a href="loginForm.do">Log In!</a></h5>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__social__links">
                        <h3>Login With:</h3>
                        <ul>
                            <li><a href="loginForm.do" class="google"><i class="fa fa-google"></i> Sign in With Google</a></li>
                            <li><a href="loginForm.do" class="twitter" style="background: yellow; color: black;"><i class="fa fa-twitter"></i> Sign in With KaKao</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div><input type="hidden" value="no" id="cango"></div>
    <div><input type="hidden" value="no" id="cangoPw"></div>
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
                    	alert('?????? ????????? ??????????????????!')
                    } else {
                    	document.getElementById('cango').value = 'yes';
                    	verifyEmail()
                    	if(document.getElementById('cango').value == 'yes') {
                    		alert('?????? ????????? ??????????????????!')
                    	}
                    }
                    cangoCheck();
                },
                error:function(){  
                    alert('id check error ??????!');
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
		// ???????????? ?????? ?????? > ?????? ?????????
		function cangoCheck() {
			if(document.getElementById('cango').value == 'yes' && document.getElementById('cangoPw').value == 'yes') {
				document.getElementById('regiBtn').style.display = "block";
			} else {
				document.getElementById('regiBtn').style.display = "none";
			}
		}
		
		// ????????? ?????? ?????? ?????????
		function verifyEmail() {
		  // ????????? ?????? ???????????? ??????
		  var emailVal = $("#email").val();
		
		  var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		  // ????????? ????????? ????????? ?????? regExp??? ??????
		
		  if (emailVal.match(regExp) != null) {
		    console.log('????????? ?????? Good!');
		    document.getElementById('cango').value = 'yes'
		  }
		  else {
		    console.log('????????? ?????? Error');
		    alert('????????? ????????? ?????????????????????!')
		    document.getElementById('cango').value = 'no'
		  }
		}
		
		// ???????????? ??????
		// 8 ~ 20??? ??????, ??????, ??????????????? ?????? ???????????? ??????
		function pwCheck() {
			var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;
		 
			let pwCheck = regExp.test(document.getElementById('pw').value); // ????????? ?????? ?????? true ??????
			console.log('???????????? ??????'+pwCheck);
			if(pwCheck==true) {
				alert('??????????????? ?????????????????????!');
				document.getElementById('cangoPw').value = 'yes';
				cangoCheck();
			} else {
				alert('???????????? ?????? ????????????????????? ( 8 ~ 20?????? ??????, ??????, ??????????????? ?????? ????????????????????? )')
			}
			
		}
	</script>
</body>
</html>