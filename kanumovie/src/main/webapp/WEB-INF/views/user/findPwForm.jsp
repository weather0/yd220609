<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find Password</title>
<style>
    .n1 {
        color:red;
    }
</style>
</head>
<body>
    <div align="center">
        <div><h1 class="n1">비번찾기</h1></div>
        <div>
            <form id="frm" action="findPw.do" method="post">
	            <div>
	                <input type="text" id="email" name="email" placeholder="비밀번호를 찾을 계정을 입력!!!" required>
	            </div>
	            <div>
	               <button type="submit" class="site-btn">비밀번호 찾기</button>
	            </div>
            </form>
        </div>
    </div>
</body>
</html>