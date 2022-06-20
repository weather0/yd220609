<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- IONICONS -->
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="css/sidebarstyles.css?ver=1">
<!-- tostr css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
	integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.js"></script>

</head>
<body>

	<!-- side bar  -->
	<div id="body-pd">
		<div class="l-navbar" id="navbar">
			<nav class="nav">
				<div>

					<div class="nav__brand">
						<ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
						<a href="home.do" class="nav__logo">Hello,Admin</a>
					</div>
					<div class="nav__list">
						<a href="admin.do" class="nav__link"> <ion-icon
								name="home-outline" class="nav__icon"></ion-icon> <span
							class="nav_name">Dashboard</span>
						</a> <a href="adminmessage.do" class="nav__link"> <ion-icon
								name="chatbubbles-outline" class="nav__icon"></ion-icon> <span
							class="nav_name">Messenger</span>
						</a>

						<div href="#" class="nav__link collapse">
							<ion-icon name="folder-outline" class="nav__icon"></ion-icon>
							<span class="nav_name">Projects</span>

							<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

							<ul class="collapse__menu">
								<a href="#" class="collapse__sublink">Data</a>
								<a href="#" class="collapse__sublink">Group</a>
								<a href="#" class="collapse__sublink">Members</a>
							</ul>
						</div>

						<a href="analytics.do" class="nav__link"> <ion-icon
								name="pie-chart-outline" class="nav__icon"></ion-icon> <span
							class="nav_name">Analytics</span>
						</a>

						<div href="#" class="nav__link collapse">
							<ion-icon name="people-outline" class="nav__icon"></ion-icon>
							<span class="nav_name">Team</span>

							<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

							<ul class="collapse__menu">
								<a href="#" class="collapse__sublink">Data</a>
								<a href="#" class="collapse__sublink">Group</a>
								<a href="#" class="collapse__sublink">Members</a>
							</ul>
						</div>

						<a href="bannerinputform.do" class="nav__link"> <ion-icon
								name="settings-outline" class="nav__icon"></ion-icon> <span
							class="nav_name">InsertBanner</span>
						</a>
					</div>
					<a href="logout.do" class="nav__link"> <ion-icon
							name="log-out-outline" class="nav__icon"></ion-icon> <span
						class="nav_name">Log out</span>
					</a>
				</div>
			</nav>
		</div>

	</div>
	
	<input type="hidden" name="reportusers" id="reportusers" value="${reportuserlistsize}">
	<!-- sidebar -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<!-- sidebarjs -->
	<!--toastr js-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"
		integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="js/sidebar.js?ver=1"></script>
	
	
<script>
	
	</script>

</body>
</html>