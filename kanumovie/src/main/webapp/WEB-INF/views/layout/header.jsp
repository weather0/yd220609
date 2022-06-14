<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <header class="header">
        <div class="container">
            <div class="salesrow">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="./index.html">
                            <img src="img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="active"><a href="./index.html">Homepage</a></li>
                                <li><a href="./categories.html">Categories <span class="arrow_carrot-down"></span></a>
                                    <ul class="dropdown">
                                        <li><a href="./categories.html">Categories</a></li>
                                        <li><a href="./anime-details.html">Anime Details</a></li>
                                        <li><a href="./anime-watching.html">Anime Watching</a></li>
                                        <li><a href="./blog-details.html">Blog Details</a></li>
                                        <li><a href="./signup.html">Sign Up</a></li>
                                        <li><a href="loginForm.do">Login</a></li>
                                    </ul>
                                </li>
                                <li><a href="./blog.html">Our Blog</a></li>
                                <li><a href="#">Contacts</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="header__right">
                        <a href="#" class="search-switch"><span class="icon_search"></span></a>
                      <!--  <a href="loginForm.do"><span class="icon_profile"></span></a> -->
                      <div>
                        <div><a href="home.do"><span class="icon_profile"></span></a>
                            <ul class="dropdown">
                                <c:choose>
	                                <c:when test="${not empty email}">
		                                <li><a href="userManageForm.do">User Manage</a></li>
		                                <li><a href="logout.do">Logout</a></li>
	                                </c:when>
	                                <c:otherwise>
                                        <li><a href="signUpForm.do">Sign Up</a></li>
                                        <li><a href="loginForm.do">Login</a></li>
	                                </c:otherwise>
	                            </c:choose>
                            </ul>
                        </div> 
                      </div>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
</body>
</html>