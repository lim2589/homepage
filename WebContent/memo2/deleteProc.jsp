<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/memo2/ssi.jsp"%>
<%
	int memono = Integer.parseInt(request.getParameter("memono"));
	boolean flag = dao.delete(memono);
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
<script type="text/javascript">

function blist() {
	var url = "./list.jsp";
	url += "?col=<%=request.getParameter("col")%>"
	url += "&word=<%=request.getParameter("word")%>"

	location.href = url;
	}
</script>


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
	<div class="title">Delete처리</div>
	<div class="content">
		<%
			if (flag) {
				out.print("삭제되었습니다.");
			} else {
				out.print("삭제가 실패되었습니다.");
			}
		%>

	</div>

	<div class="bottom">
		<button type="button" onclick="blist()">목록</button>
	</div>

	<jsp:include page="/menu/bottom.jsp" />

</body>
</html>