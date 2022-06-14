<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

	#banner {
		margin: 0 auto;
		width: 90%;	
	}
	#showcontainer {
		width: 90%;
		height: 800px;

	}
	
	#showcontainer .row {
		width: 100%;
		margin: 1% 5%;
		height: 500px;
		box-sizing: border-box;
		float: left;	
	}
	#showcontainer .large-16 columns {
	}
	
	h1 {
		color: white;
	}
	
	#showcontainer h3 {
		height: 100px;
		color: white;
		margin-bottom: 3%;
	}
	
	#showcontainer img {
		width: 100%;
		height: 350px;
	}
	
	div h5 {
		background: none;
		text-align: center;
		color: #fff;	
	}
	
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/movie.js"></script>
</head>
<body>
	<div id="banner">
		<div class="hero__slider owl-carousel">
                <div class="hero__items set-bg" data-setbg="img/hero/hero-1.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Adventure</div>
                                <h2>Fate / Stay Night: Unlimited Blade Works</h2>
                                <p>After 30 days of travel across the world...</p>
                                <a href="#"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="img/hero/hero-1.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Adventure</div>
                                <h2>Fate / Stay Night: Unlimited Blade Works</h2>
                                <p>After 30 days of travel across the world...</p>
                                <a href="#"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__items set-bg" data-setbg="img/hero/hero-1.jpg">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero__text">
                                <div class="label">Adventure</div>
                                <h2>Fate / Stay Night: Unlimited Blade Works</h2>
                                <p>After 30 days of travel across the world...</p>
                                <a href="#"><span>Watch Now</span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
	</div>
	<div id="showcontainer">
		<div class="row">
			<div>
				<h3>Now Trending Movie</h3>
			</div>
			<div class="large-16 columns">
				<div class="owl-carousel owl-theme">
					<div class="item">
						<img id="movie-1">
					</div>
					<div class="item">
						<img id="movie-2">
					</div>
					<div class="item">
						<img id="movie-3">
					</div>
					<div class="item">
						<img id="movie-4">
					</div>
					<div class="item">
						<img id="movie-5">
					</div>
					<div class="item">
						<img id="movie-6">
					</div>
					<div class="item">
						<img id="movie-7">
					</div>
					<div class="item">
						<img id="movie-8">
					</div>
					<div class="item">
						<img id="movie-9">
					</div>
					<div class="item">
						<img id="movie-10">
					</div>
					<div class="item">
						<img id="movie-11">
					</div>
					<div class="item">
						<img id="movie-12">
					</div>
					<div class="item">
						<img id="movie-13">
					</div>
					<div class="item">
						<img id="movie-14">
					</div>
					<div class="item">
						<img id="movie-15">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div>
				<h3>Now Trending Show</h3>
			</div>
			<div class="large-16 columns">
				<div class="owl-carousel owl-theme">
					<div class="item">
						<img id="show-1">
					</div>
					<div class="item">
						<img id="show-2">
					</div>
					<div class="item">
						<img id="show-3">
					</div>
					<div class="item">
						<img id="show-4">
					</div>
					<div class="item">
						<img id="show-5">
					</div>
					<div class="item">
						<img id="show-6">
					</div>
					<div class="item">
						<img id="show-7">
					</div>
					<div class="item">
						<img id="show-8">
					</div>
					<div class="item">
						<img id="show-9">
					</div>
					<div class="item">
						<img id="show-10">
					</div>
					<div class="item">
						<img id="show-11">
					</div>
					<div class="item">
						<img id="show-12">
					</div>
					<div class="item">
						<img id="show-13">
					</div>
					<div class="item">
						<img id="show-14">
					</div>
					<div class="item">
						<img id="show-15">
					</div>
				</div>
				<script type="text/javascript">
					let owl = $('.owl-carousel');
					owl.owlCarousel({
						margin : 30,
						nav : true,
						loop : true,
						responsive : {
							0 : {
								items : 1
							},
							600 : {
								items : 3
							},
							1000 : {
								items : 4
							}
						}
					})
				    let name = "<%= request.getAttribute("message") %>";
				    if(name=='login') {
					    alert('로그인되었습니다.')				    	
				    } else if(name=='logout') {
				    	alert('로그아웃되었습니다')
				    }
				</script>
			</div>
		</div>
	</div>
</body>
</html>