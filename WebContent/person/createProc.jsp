<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/person/ssi.jsp"%>
<jsp:useBean id="dto" class="person.PersonDTO" />
<%
	UploadSave upload = (UploadSave) request.getAttribute("upload");

	dto.setId(upload.getParameter("id"));
	dto.setName(UploadSave.encode(upload.getParameter("name")));
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
	dto.setPasswd(upload.getParameter("passwd"));
	dto.setPhone(upload.getParameter("phone"));
	dto.setZipcode(upload.getParameter("zipcode"));
	dto.setEmail(upload.getParameter("email"));

	FileItem fileItem = upload.getFileItem("filename");
	int size = (int) fileItem.getSize();

	String filename = "member.jpg";

	if (size > 0) {
		filename = UploadSave.saveFile(fileItem, upDir); //파일명 리턴
	}
	dto.setFilename(filename);

	boolean flag = dao.create(dto);
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
	<div class="title">등록 처리</div>
	<div class="content">
		<%
			if (flag) {
				out.print("등록되었습니다.");
			} else {
				out.print("등록이 실패되었습니다.");
			}
		%>

	</div>
	<div class="bottom">
		<%
			if (flag) {
		%>
		<button type="button" onclick="location.href='./createForm.jsp'">재등록</button>
		<%
			} else {
		%>
		<button type="button" onclick="history.back()">다시시도</button>
		<%
			}
		%>
		<button type="button" onclick="location.href='./loginForm.jsp'">login</button>
	</div>

	<jsp:include page="/menu/bottom.jsp" />

</body>
</html>