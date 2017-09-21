<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/person/ssi.jsp"%>
<%
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	String id = upload.getParameter("id");
	String email = upload.getParameter("email");

	String str = "";

	if (dao.idCheck(id)) {
		str = "아이디 중복체크를 하세요";
	} else if (dao.emailCheck(email)) {
		str = "e-mail 중복체크를 하세요";
	} else {
		request.setAttribute("upload", upload);
%>
	<jsp:forward page="/person/createProc.jsp" />
<%
	return;
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">


</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="title">ID 및 E-mail 중복체크</div>

	<div class="content">
		
		<%=str%>


	</div>



	<div class="bottom">
		<button type="button" onclick="history.back()">다시시도</button>
	</div>

	<jsp:include page="/menu/bottom.jsp" />

</body>
</html>