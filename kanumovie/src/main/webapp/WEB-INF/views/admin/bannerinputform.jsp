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
margin-top: 10px;
    color: #fff;
    background-color: #EB1616;
    border-color: #EB1616;
}
</style>
</head>
<body>

<div class="content">
  <div class="col-sm-12 col-xl-6">
                        <div class="bg-secondary rounded h-100 p-4">
                            <h6 class="mb-4">Floating Label</h6>
                            <div class="form-floating mb-3">
                                <select class="form-select" id="floatingSelect"
                                    aria-label="Floating label select example">
                                    <option selected>Select genre</option>
                                    <option value="1">One</option>
                                    <option value="2">Two</option>
                                    <option value="3">Three</option>
                                </select>
                                <!-- <label for="floatingSelect">Works with selects</label> -->
                            </div>
                             <div class="mb-3 selectform">
                                <!-- <label for="formFileSm" class="form-label">Small file input example</label> -->
                                <input class="form-control form-control-sm bg-dark" id="formFileSm" type="file">
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput"
                                    placeholder="제목 입력" required="required">
                              <!--   <label for="floatingInput">Email address</label> -->
                            </div>
                          <!--   <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingPassword"
                                    placeholder="내용 입력" required="required">
                                <label for="floatingPassword">Password</label>
                            </div> -->
                            <div class="form-floating">
                                <textarea class="form-control" placeholder="Leave a content here"
                                    id="bcontent" style="height: 150px;" required="required"></textarea>
                                <!-- <label for="floatingTextarea">Comments</label> -->
                            </div>
                            <input type="submit" class="btn btn-sm btn-primary" value="등록">
                            <input type="reset" class="btn btn-sm btn-primary" value="취소">
                        </div>
                    </div>

</div>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="js/salesadmin.js"></script>

</body>
</html>