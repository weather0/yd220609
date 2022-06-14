<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find pw</title>
<style>
    .n {
        color:red;
    }
</style>
</head>
<body>
    <div align="center">
        <div>
            <h1 class="n">비밀번호 : ${pw}</h1>
        </div>
        <div>
            <button onclick="location.href='home.do'" class="n">홈으로</button>
        </div>
    </div>
</body>
</html>