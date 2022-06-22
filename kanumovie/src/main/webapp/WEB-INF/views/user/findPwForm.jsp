<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find Password</title>
<style>
    .n1 {
        color:#fff;
        margin: 3% auto;
        font-weight: bold;
    }
    #formContainer {
    	width: 80%;
    	margin: 5% auto;
    	background: rgba(0, 0, 0, 0.5);
    	padding: 3%;
    }
    #formContainer input[type="text"] {
    	width: 80%;
    	background: #212529; 
    	border: none;
    	border-radius: 10px;
    	color : white;
    }
    #formContainer #buttonContainer {
    	margin-top: 5%;
    }
    #formContainer button[type="submit"]:hover {
    	background: red;
    	transform: scale(1.1);
    	transition: 0.3s;
    }
</style>
</head>
<body>
    <div id="formContainer" align="center">
        <div id="headerTitle"><h2 class="n1">Find Your Password</h2></div>
        <div>
            <form id="frm" action="findPw.do" method="post">
	            <div>
	                <input type="text" id="email" name="email" autofocus placeholder="비밀번호를 전달받을 Gmail을 입력!!!" required>
	            </div>
	            <div id="buttonContainer">
	               <button type="submit" class="site-btn">비밀번호 찾기</button>
	            </div>
            </form>
        </div>
    </div>
</body>
</html>