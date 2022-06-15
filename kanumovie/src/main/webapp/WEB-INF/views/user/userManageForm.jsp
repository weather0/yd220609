<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userManageForm</title>
<style>
    #pwCheck2 {
        display : none;
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
                        <h2>User Management</h2>
                        <p>Change Your Information</p>
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
                        <h3>User Information</h3>
                         <form action="#" method="post" id="pwCheck1">
                            <div>
                                <br> 
                                <br>   
                                <h3>기존 비밀번호 확인</h3>
                            </div>
                            <div class="input__item">
                                <input type="hidden" id="email" name="email" value="${email}">
                            </div> 
                            <div class="input__item">
                                <input type="password" id="check" name="check" placeholder="기존 패스워드를 입력" required>
                                <span class="icon_profile"></span>
                            </div>
                            <button type="button" onclick="getCheck()">비밀번호 확인</button>
                        </form>
                        <%--< c:if test="${pw eq }"></c:if> --%>
                        <div id="pwCheck2" >
	                        <form action="pwChange.do" method="post">
	                            <div>
	                                <br> 
	                                <br>   
	                                <h3>Change Password</h3>
	                            </div>
	                            <div class="input__item">
	                                <input type="hidden" id="email" name="email" value="${email}">
	                            </div> 
	                            <div class="input__item">
	                                <input type="password" id="pw" name="pw" required>
	                                <span class="icon_profile"></span>
	                            </div>
	                            <button type="submit" class="site-btn">비밀번호 수정</button>
	                        </form>
                        </div>
                        <form action="preferGenreForm.do" method="post">
                            <div class="input__item">
                                <input type="hidden" id="email" name="email" value="${email}">
                            </div>
                            <button type="submit" class="site-btn">선호 영화 수정</button>
                        </form>
                        <form action="userManage.do" method="post">
	                        <div>
	                            <br> 
	                            <br>   
	                            <h3>Change Nickname</h3>
	                        </div>
                            <div class="input__item">
                                <input type="hidden" id="email" name="email" value="${email}">
                            </div> 
                            <div class="input__item">
                                <input type="text" id="nick" name="nick" placeholder="${nick}">
                                <span class="icon_profile"></span>
                            </div>
                            
                            <button type="submit" class="site-btn">Change</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Signup Section End -->
    <script type="text/javascript">
        function getShow(){
            document.getElementById("pwCheck2").style.display = "block";
            document.getElementById("pwCheck1").style.display = "none";
        }
        
        function getCheck(){
        	let check = document.getElementById("check").value;
        	if(check == '<%=(String)session.getAttribute("pw")%>') {
        		alert('비밀번호 확인 완료!');
        		getShow();
        	} else {
        		alert('비밀번호가 정확하지 않습니다! 다시 입력하세요!');
        	}
        }
    </script>
</body>
</html>