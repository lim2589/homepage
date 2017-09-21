<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/guest/ssi.jsp"%>
<jsp:useBean id="dto" class="guest.GuestDTO" />
<jsp:setProperty property="*" name="dto"/>
<%
	boolean flag = dao.create(dto);
%>


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

th, td {
	height: 30px;
}
</style>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="title">처리결과</div>
	<%
		if(flag){
			out.print("등록되었습니다.");
		}else{
			out.print("등록이 실패되었습니다.");
		}
	
	%>
	
	<div class="bottom">
		<button type="button" onclick="location.href='./list.jsp'">목록</button>
		<button type="button" onclick="history.back()">취소</button>
	
	</div>
	

	<jsp:include page="/menu/bottom.jsp" />

</body>
</html>