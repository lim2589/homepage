<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/img_hp/ssi.jsp"%>
<jsp:useBean id="dto" class="img_hp.Img_hpDTO" />
<%
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(upload.getParameter("passwd"));

	FileItem fileItem = upload.getFileItem("fname");
	int size = (int) fileItem.getSize();

	if (size > 0) { // size가 0보다 크면 upDir경로에 fileItem을 넣는다
		dto.setFname(UploadSave.saveFile(fileItem, upDir));
	} else {
		dto.setFname("member.jpg");
	}

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

<script type="text/javascript">
function blist() {
	var url = "list.jsp";
	
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
	<DIV class="title">등록 확인</DIV>

	<div class="content">

		<%
			if (flag) {
				out.print("등록 되었습니다.");

			} else {
				out.print("등록에 실패하였습니다.");
			}
		%>
	</div>

	<div class="bottom">


		<%
			if (flag) {
		%>

		<input type='button' value='계속등록'
			onclick="location.href='createForm.jsp'">
		<%
			} else {
		%>
		<input type='button' value='다시시도' onclick="history.back()">
		<%
			}
		%>
		<input type='button' value='목록' onclick="blist()">
	</div>


	<jsp:include page="/menu/bottom.jsp" />

</body>
</html>