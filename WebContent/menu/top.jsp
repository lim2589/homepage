<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String root = request.getContextPath();
	String id = (String) session.getAttribute("id");
	String grade = (String) session.getAttribute("grade");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	min-height: 200px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}

/* Add a dark background color with a little bit see-through */
.navbar {
	margin-bottom: 0;
	background-color: #2d2d30;
	border: 0;
	font-size: 11px !important;
	letter-spacing: 4px;
	opacity: 0.9;
}

/* Add a gray color to all navbar links */
.navbar li a, .navbar .navbar-brand {
	color: #d5d5d5 !important;
}

/* On hover, the links will turn white */
.navbar-nav li a:hover {
	color: #fff !important;
}

/* The active link */
.navbar-nav li.active a {
	color: #fff !important;
	background-color: #29292c !important;
}

/* Remove border color from the collapsible button */
.navbar-default .navbar-toggle {
	border-color: transparent;
}

/* Dropdown */
.open .dropdown-toggle {
	color: #fff;
	background-color: #555 !important;
}

/* Dropdown links */
.dropdown-menu li a {
	color: #000 !important;
}

/* On hover, the dropdown links will turn red */
.dropdown-menu li a:hover {
	background-color: red !important;
}

</style>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Logo</a>
			</div>


			<div class="collapse navbar-collapse" id="myNavbar">

				<ul class="nav navbar-nav">
					<li class="active"><a href="<%=root%>/index.jsp"> <span
							class="glyphicon glyphicon-home"></span><br>Home
					</a></li>
				</ul>


				<ul class="nav navbar-nav">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> <span
							class="glyphicon glyphicon-camera"> </span><br>Image
					</a>
						<ul class="dropdown-menu">
							<li><a href="<%=root%>/img_hp/createForm.jsp">이미지생성</a></li>
							<li><a href="<%=root%>/img_hp/list.jsp">게시판</a></li>
						</ul></li>
				</ul>



				<ul class="nav navbar-nav">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> <span
							class="glyphicon glyphicon-pencil"> </span><br>Memo
					</a>

						<ul class="dropdown-menu">
							<li><a href="<%=root%>/memo2/createForm.jsp">메모장</a></li>
							<li><a href="<%=root%>/memo2/list.jsp">게시판</a></li>
						</ul>
					</li>
				</ul>

				<ul class="nav navbar-nav">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> <span
							class="glyphicon glyphicon-envelope"> </span><br>방명록
					</a>

						<ul class="dropdown-menu">
							<li><a href="<%=root%>/guest/createForm.jsp">방명록작성</a></li>
							<li><a href="<%=root%>/guest/list.jsp">게시판</a></li>
						</ul></li>
				</ul>



				<%
					if (id == null) {
				%>

				<ul class="nav navbar-nav navbar-right">
					<li><a href="<%=root%>/agreement.jsp"> <span
							class="glyphicon glyphicon-pencil"> </span><br>Join
					</a></li>
					<li class="dropdown"><a href="<%=root%>/person/loginForm.jsp"> <span
							class="glyphicon glyphicon-log-in"> </span><br>Login
					</a></li>
				</ul>

				<%
					} else {
				%>

				<ul class="nav navbar-nav navbar-right">
					<li><a href="<%=root%>/person/read.jsp"> <span
							class="glyphicon glyphicon-user"> </span><br>Myinfo
					</a></li>
					<li class="dropdown"><a href="<%=root%>/person/logout.jsp">
							<span class="glyphicon glyphicon-log-out"> </span><br>Logout
					</a></li>
				</ul>

				<%
					}
				%>

			</div>
		</div>
	</nav>




</body>
</html>









