<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head> 
<title>adminpage</title>
  <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet"> 
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/salesbootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/salesstyle.css" rel="stylesheet">

<style>

.mb-2:hover {
	color:white;
}


</style>

</head>
<body>




<!-- table start -->

<div class="container-fluid pt-4 px-4">
                <div class="bg-secondary text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <h6 class="mb-0">Users List</h6>
                        <a href="">Show All</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-white">
                                    <th scope="col"><input class="form-check-input" type="checkbox"></th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Nick</th>
                                    <th scope="col">SignDate</th>
                                    <th scope="col">preference1</th>
                                    <th scope="col">preference2</th>
                                    <th scope="col">preference3</th>
                                </tr>
                            </thead>
                            <tbody>
                              <!--   <tr>
                                    <td><input class="form-check-input" type="checkbox"></td>
                                    <td>01 Jan 2045</td>
                                    <td>INV-0123</td>
                                    <td>Jhon Doe</td>
                                    <td>$123</td>
                                    <td>Paid</td>
                                    <td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
                                </tr> -->
                               
                               <c:forEach items="${list}" var="l">
                               <tr>
                               	<td>
                               	<input class="form-check-input" type="checkbox">
                               	</td>
                               	<td>${l.email } </td>
                               	<td>${l.nick } </td>
                               	<td> <fmt:formatDate value="${l.signdate}" 
        							pattern="yyyy년 MM월 dd일" /> 
        						</td>
                               	<td>${l.preference1} </td>
                               	<td>${l.preference2} </td>
                               	<td>${l.preference3} </td>
                               </tr> 
                               </c:forEach>
                             
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

<!--  table end -->

     <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>


    <!-- Template Javascript -->
    <script src="js/main.js"></script>

</body>
</html>