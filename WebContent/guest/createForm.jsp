<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/img_hp/ssi.jsp"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">


<style type="text/css">
* {
	font: 400 15px/1.8 Lato, sans-serif;
	color: #777;
	text-align: center;
}
</style>

</head>
<body>
	<jsp:include page="../menu/top.jsp" flush="false" />
	<!-- *********************************************** -->
	<div class="container">
		<h3 class="text-center">Guest_Book</h3>
		<p class="text-center">
			<em>We love our fans!</em>
		</p>
		<div class="row test">
			<div class="col-md-4">
				<p>Fan? Drop a note.</p>
				<p>
					<span class="glyphicon glyphicon-map-marker"></span>Chicago, US
				</p>
				<p>
					<span class="glyphicon glyphicon-phone"></span>Phone: +00
					1515151515
				</p>
				<p>
					<span class="glyphicon glyphicon-envelope"></span>Email:
					mail@mail.com
				</p>
			</div>
			<form action="./createProc.jsp" method="POST" name="frm">
			<div class="col-md-8">
				<div class="row">
					<div class="col-sm-6 form-group">
						<input class="form-control" id="name" name="name"
							placeholder="Name" type="text" required>
					</div>
					<div class="col-sm-6 form-group">
						<input class="form-control" id="email" name="email"
							placeholder="Email" type="email" required>
					</div>
				</div>
				<textarea class="form-control" id="comments" name="comments"
					placeholder="Comment" rows="5"></textarea>
				<div class="row">
					<div class="col-md-12 form-group">
						<button class="btn pull-right" type="submit">Send</button>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>

	<!-- *********************************************** -->
	<jsp:include page="../menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
