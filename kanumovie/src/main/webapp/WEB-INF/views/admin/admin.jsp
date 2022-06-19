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

/* .table {
	background-color: #070720 !important;
	color: #6C7293; 
}

.table thead tr {
	background-color: #070720 !important;
}

.table tbody tr:nth-Child(even) {
	background-color: #070720 !important;
} */

.pageul {
font-size: 20px;
}
.pageul li{
list-style-type: none;
display: inline;
}
 
.pt-4 {
display: flex;
justify-content: space-evenly;
}

.bg-secondary {
	width:83%;
}

.ms-3 {
	text-align: center;
}
</style>

</head>
<body>


<!-- sales start -->
 <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Today Users</p>
                                <h6 class="mb-0">${todayUsersCount}</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-bar fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Total Users</p>
                                <h6 class="mb-0">${allUsersCount}</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-area fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">New Report</p>
                                <h6 class="mb-0">${reportusers}</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-pie fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Today's Count</p>
                                <h6 class="mb-0">${sessionScope.todayCount}</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<!-- sales end -->



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
                                  
                                    <th scope="col">Email</th>
                                    <th scope="col">Nick</th>
                                    <th scope="col">SignDate</th>                               
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
                               	<td>${l.email } </td>
                               	<td>${l.nick } </td>
                               	<td> <fmt:formatDate value="${l.signdate}" 
        							pattern="yyyy년 MM월 dd일" /> 
        						</td>
                             
                               </tr> 
                               </c:forEach>
                             
                            </tbody>
                        </table>
                        
                        <c:if test="${paging.prev}">
                        	<a href="admin.do?page=${paging.begingPage-1}">prev</a>
                        </c:if>
                        
                        
               			<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" step="1" var="index"> 
               				<c:choose>
               					<c:when test="${paging.page==index}">
               						${index}
               					</c:when>
               					<c:otherwise>
               					<a href="admin.do?page=${index}">${index}</a>
               					</c:otherwise>
               				</c:choose>
               			</c:forEach>
               			<c:if test="${paging.next}">
               				<a href="admin.do?page=${paging.endPage+1}">next</a>
               			</c:if>
               	
						<%-- <ul class="pageul">
							<c:forEach var="i" begin="0" end="9">
							<li><a href="?p=${startNum+i}&t=&q=">${startNum+i}</a></li>
							</c:forEach> 
						</ul>--%>
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