<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find pw</title>
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
        <div>
            <h2 class="n1">요청하신 이메일로 비밀번호 정보를 전송했습니다.</h2>
        </div>
        <div id="buttonContainer">
            <button onclick="location.href='home.do'" class="n">홈으로</button>
        </div>
    </div>
</body>
</html>