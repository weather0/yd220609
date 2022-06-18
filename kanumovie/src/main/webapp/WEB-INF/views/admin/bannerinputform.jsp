<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bannerinputform</title>
<style>
.col-sm-12 {
	margin: 0 auto;
	margin-top: 100px;
}

.bg-secondary {
	text-align: center;
	background-color: #191C24 !important;
}


.mb-4 {
	color: white;
}

.nice-select {

margin-top: -1px;
margin-bottom: 30px;

}


.bg-dark {
	color: #4d4d4d !important;
}

input[type="file"] {

	background-color: #fff !important;
	height: 38px;
	width: 100%;

}

.selectform {
	display: inline-block;
}

.form-control {

margin-top: 22px;

}


.btn-primary {
	margin-top: 10px; color : #fff;
	background-color: #EB1616;
	border-color: #EB1616;
	color: #fff;
}

/* 
.ainputBoxContainer {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  flex-direction: column;
  gap: 30px;
 background: #1d2b3a; 
}

.ainputBox {
  position: relative;
  width: 250px;
}

.ainputBox input {
  width: 100%;
  padding: 10px;
  border: 1px solid rgba(255, 255, 255, 0.25);
  background: #1d2b3a;
  border-radius: 5px;
  outline: none;
  color: #fff;
  font-size: 1em;
  transition: 0.5s;
}

.ainputBox span {
  position: absolute;
  left: 0;
  padding: 10px;
  pointer-events: none;
  font-size: 1em;
  color: rgba(255, 255, 255, 0.25);
  text-transform: uppercase;
  transition: 0.5s;
}

.ainputBox input:valid~span,
.ainputBox input:focus~span {
  color: #00dfc4;
  transform: translateX(10px) translateY(-7px);
  font-size: 0.65em;
  padding: 0 10px;
  background: #1d2b3a;
  border-left: 1px solid #00dfc4;
  border-right: 1px solid #00dfc4;
  letter-spacing: 0.2em;

}


.ainputBox:nth-child(2) input:valid~span,
.ainputBox:nth-child(2) input:focus~span {
  background: #00dfc4;
  color: #1d2b3a;
  border-radius: 2px;
}

.ainputBox input:valid,
.ainputBox input:focus {

  border: 1px solid rgba(255, 255, 255, 0.25);
}
  */


</style>
</head>
<body>
					<form action="insertbanner.do" method="POST" enctype="multipart/form-data">
				
					<div class="form-floating mb-3">
					<select class="form-select" id="floatingSelect" style="width:300px;height:100px;"
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
					</div>
					
				<div class="ainputBoxContainer">
					<div class="ainputBox">
						<input type="text" required="required" name="title" id="title"> <span>title</span>
					</div>
					
					<div class="ainputBox">
						<textarea required="required" style="height: 150px;" name="content"></textarea>
						 <span>Content</span>
					</div>
					
					<div class="selectfileform">
					<!-- <label for="formFileSm" class="form-label">Small file input example</label> -->
					<input class="form-control form-control-sm bg-dark" id="formFileSm" name="file"
						type="file">
					</div>
					<a class="btn btn-sm btn-primary" href="home.do">메인으로</a>
					<input type="submit" class="btn btn-sm btn-primary" value="등록">
					<input type="reset" class="btn btn-sm btn-primary" value="취소">
				</div>
				</form>

		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script src="js/salesadmin.js"></script>
</body>
</html>