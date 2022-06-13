<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
</head>
<body>
    <div align="center">
        <div><h1>로그인 폼을 만들자</h1></div>
        <div>
        <form id="frm" action="home.do" method="post">
            <table>
                <tr>
                    <th>아이디</th>
                    <td>
                        <input type="text" id="id" name="id" placeholder="id를 적으셈!!" required >
                    </td>
                </tr>
                <tr>
                    <th>패스워드</th>
                    <td>
                        <input type="text" id="pw" name="pw" placeholder="pw를 적으셈!!" required >
                    </td>
                </tr>
            </table>
            </form>
            <div>
                <input type="submit" value="로그인" >
                <input type="reset" value="취소" >
                <input type="button" value="뒤로가기" onclick="location.href='home.do'">
            </div>
        </div>
    </div>
</body>
</html>