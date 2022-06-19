
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bannerinputform</title>
<style>
input[type="text"] {
	width: 100% !important;
	display: inline-block !important;
	margin: 0 !important;
	padding: 0 !important;
}

input[type="file"] {
	height: 38px;
	margin: 0;
}

.ainputBox span {
	display: inline;
}

.ainputBoxContainer {
	display: flex !important;
	justify-content: center !important;
	align-items: center !important;
	/* min-height: 45vh !important; */
	flex-direction: column !important;
	gap: 30px !important;
	/*  background: #1d2b3a !important; */
}

.ainputBox {
	position: relative !important;
	width: 650px !important;
}

.ainputBox textarea {
	height: 200px;
}

.ainputBox input, textarea {
	width: 100% !important;
	padding: 10px !important;
	border: 1px solid rgba(255, 255, 255, 0.25) !important;
	background: #070720 !important;
	border-radius: 5px !important;
	outline: none !important;
	color: #fff !important;
	font-size: 1em !important;
	transition: 0.5s !important;
}

.ainputBox span {
	position: absolute !important;
	left: 0 !important;
	padding: 10px !important;
	pointer-events: none !important;
	font-size: 1em !important;
	color: rgba(255, 255, 255, 0.25) !important;
	text-transform: uppercase !important;
	transition: 0.5s !important;
}

.ainputBox input:valid ~span, .ainputBox input:focus ~span, .ainputBox textarea:valid 
	 ~span, .ainputBox textarea:focus ~span {
	color: #00dfc4 !important;
	transform: translateX(10px) translateY(-7px) !important;
	font-size: 0.65em !important;
	padding: 0 10px !important;
	background: #1d2b3a !important;
	border-left: 1px solid #00dfc4 !important;
	border-right: 1px solid #00dfc4 !important;
	letter-spacing: 0.2em !important;
}

.ainputBox:nth-child(2) input:valid ~span, .ainputBox:nth-child(2) input:focus
	 ~span, .ainputBox:nth-child(2) textarea:valid ~span, .ainputBox:nth-child(2) textarea:focus
	 ~span {
	background: #00dfc4 !important;
	color: #1d2b3a !important;
	border-radius: 2px !important;
}

.ainputBox input:valid, .ainputBox input:focus, .ainputBox textarea:valid,
	.ainputBox textarea:focus {
	border: 1px solid rgba(255, 255, 255, 0.25) !important;
}

.selectitems {
	min-height: 9vh;
	margin-top: 150px;
	display: flex;
	justify-content: center !important;
	align-items: center !important;
	gap: 30px !important;
	margin-top: 150px;
}

.btntag {
	margin-top: 3%;
}

.btn-primary {
	background-color: #e53637;
	border-color: #e53637;
}

.btn:hover {
	background-color: black;
	border-color: #e53637;
}
</style>
</head>
<body>
	<!--  -->
	<form action="updatebanner.do" method="POST"
		enctype="multipart/form-data">
		<div class="selectitems">
			<select class="" id="floatingSelect"
				style="width: 300px; height: 100px;"
				aria-label="Floating label select example" name="selectedgenre">
				<option selected>Select genre</option>
				<option value="Action">Action</option>
				<option value="Adventure">Adventure</option>
				<option value="Animation">Animation</option>
				<option value="Comedy">Comedy</option>
				<option value="Crime">Crime</option>
				<option value="Documentary">Documentary</option>
				<option value="Drama">Drama</option>
				<option value="Family">Family</option>
				<option value="Fantasy">Fantasy</option>
				<option value="History">History</option>
				<option value="Horror">Horror</option>
				<option value="Music">Music</option>
				<option value="Mystery">Mystery</option>
				<option value="Romance">Romance</option>
				<option value="Science Fiction">Science Fiction</option>
				<option value="TV Movie">TV Movie</option>
				<option value="Thriller">Thriller</option>
				<option value="War">War</option>
				<option value="Western">Western</option>
			</select>
			<!-- <label for="floatingSelect">Works with selects</label> -->
			<div class="selectfileform">
				<!-- <label for="formFileSm" class="form-label">Small file input example</label> -->
				<input class="form-control form-control-sm bg-dark" id="formFileSm"
					name="file" type="file">
			</div>
		</div>

		<div class="ainputBoxContainer">
			<div class="ainputBox">
				<input type="text" required="required" name="title" id="title"
					value="${banner.btitle}"> <span>title</span>
			</div>

			<div class="ainputBox">
				<textarea required="required" name="content"
					>${banner.bcontent}"</textarea> <span>Content</span>
			</div>
		</div>
		<div class="btntag" align="center">
			<a class="btn btn-sm btn-primary" href="home.do">메인으로</a> <input
				type="hidden" name="bid" id="bid" value="${banner.bid}"> <input
				type="hidden" name="bdirname" id="bdirname"
				value="${banner.bdirname}"> <input type="submit"
				class="btn btn-sm btn-primary" value="수정"> <input
				type="reset" class="btn btn-sm btn-primary" value="취소">
		</div>
	</form>



	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="js/salesadmin.js"></script>
	<script src="js/banner.js"></script>
</body>
</html>