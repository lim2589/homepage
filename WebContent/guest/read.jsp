<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/guest/ssi.jsp"%>
<%
	int gno = Integer.parseInt(request.getParameter("gno"));

	String col = request.getParameter("col");
	String word = request.getParameter("word");


	GuestDTO dto = dao.read(gno);

	String content = dto.getComments();
	content = content.replaceAll("\r\n", "<br>");
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
	url += "?col=<%=col%>";
	url += "&word=<%=word%>";
	location.href = url;
}
function bupdate(memono) {
	var url = "./updateForm.jsp";
	url += "?memono=" + memono;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	location.href = url;
}
function bdelete(memono) {
	var url = "./deleteForm.jsp";
	url += "?memono=" + memono;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	location.href = url;
}
function breply(memono) {
	var url = "./replyForm.jsp";
	url += "?memono=" + memono;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
		location.href = url;
	}
</script>


<style type="text/css">
* {
	font: 400 15px/1.8 Lato, sans-serif;
	color: #777;
	text-align: center;
}

td {
	height: 30px;
	width: 80%;
}
</style>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="title">메모확인</div>

	<div class="content">
		<table style="width: 500px">
			<tr>
				<th style="text-align: center; width: 100px">이름</th>
				<td><%=dto.getWname()%></td>

			</tr>
			<tr>
				<th style="text-align: center";>제목</th>
				<td><%=dto.getTitle()%></td>

			</tr>

			<tr>
				<th style="text-align: center";>내용</th>
				<td><%=content%></td>
			</tr>


			<tr>
				<th style="text-align: center";>조회수</th>
				<td><%=dto.getViewcnt()%></td>
			</tr>

			<tr>
				<th style="text-align: center;">등록일</th>
				<td><%=dto.getWdate()%></td>
			</tr>

		</table>
	</div>


	<div class="bottom">
		<button type="button" onclick="blist()">목록</button>
		<button type="button" onclick="bupdate('<%=memono%>')">수정</button>
		<button type="button" onclick="bdelete('<%=memono%>')">삭제</button>
		<button type="button" onclick="breply('<%=memono%>')">답변</button>
	</div>

	<jsp:include page="/menu/bottom.jsp" />

</body>
</html>