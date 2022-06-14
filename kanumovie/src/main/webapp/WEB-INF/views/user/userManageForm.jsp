<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userManageForm</title>
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
                        <form action="userManage.do" method="post">
                            <div class="input__item">
                                <input type="hidden" id="email" name="email" value="${email}">
                            </div> 
                            <div class="input__item">
                                <input type="text" id="nick" name="nick" placeholder="닉네임 변경!!!">
                                <span class="icon_profile"></span>
                            </div>
                            <div class="input__item">
                                <input type="password" id="pw" name="pw" placeholder="패스워드 변경!!!">
                                <span class="icon_lock"></span>
                            </div>
                            <div class="input__item">
                                <input type="text" id="preference1" name="preference1" placeholder="${preference1}">
                                <span class="icon_lock"></span>
                            </div>
                            <div class="input__item">
                                <input type="text" id="preference2" name="preference2" placeholder="${preference2}">
                                <span class="icon_lock"></span>
                            </div>
                            <div class="input__item">
                                <input type="text" id="preference3" name="preference3" placeholder="${preference3}">
                                <span class="icon_lock"></span>
                            </div>
                            <button type="submit" class="site-btn">Change</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Signup Section End -->
</body>
</html>