<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.footerrow {
	max-width: 80rem;
}

footer.footer {
	margin-top: 100px;
} 

</style>
</head>
<body>
<footer class="footer">
    <div class="page-up">
        <a href="#" id="scrollToTopButton"><span class="arrow_carrot-up"></span></a>
    </div>
    <div class="container">
        <div class="row footerrow">
            <div class="col-lg-3">
                <div class="footer__logo">
                    <a href="home.do"><img src="img/kanumovielogo.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="footer__nav">
                    <ul class="MenuList">
                       <li class="hnavlink"><a href="home.do">Homepage</a></li>
								<li class="hnavlink"><a href="genreSelectList.do">Categories</a></li>
								<c:if test="${not empty email}">
								<li class="hnavlink"><a href="userLikesSelectList.do?email=${email}"><i class="fa fa-heart"></i> 보고싶어요</a>
								<li class="hnavlink"><a href="commentSelectList.do?email=${email}"><i class="fa fa-pencil"></i> 리뷰한 작품</a>
								</c:if>
                    </ul>
                </div>
            </div>
              <div class="col-lg-3">
            <p>
              (주)예담직업전문학교 대구광역시 중구 중앙대로 403 (남일동 135-1, 5층)
            </p>
           
            <p>
              <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

              Copyright &copy;
              <script>
                document.write(new Date().getFullYear());
              </script>

              All rights reserved
            </p>
          </div>
          </div>
      </div>
  </footer>
<!--   <script>
  	console.log(document.querySelector('.footer'));
  	console.log(document.querySelector('.infinite').getBoundingClientRect().height);
  	 document.querySelector('.footer').setAttribute('style', 'margin-top: 0%;position:absolute;top:-' + document.querySelector('.infinite').getBoundingClientRect().height + ";");
  	console.log(document.querySelector('.footer').getAttribute('style'));
  </script> -->
</body>
</html>