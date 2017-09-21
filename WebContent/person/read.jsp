<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/person/ssi.jsp"%>
<%
	String id = request.getParameter("id");
	if (id == null) {
		id = (String) session.getAttribute("id");
	}

	PersonDTO dto = dao.read(id);

/* 	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage"); */
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">



<script type="text/javascript">
function bdelete() {
	var url = "./deleteForm.jsp";
	
	url+= "?id=<%=id%>";
	url+= "&oldfile=<%=dto.getFilename()%>";
	location.href=url;

	}
function bupdate() {
	var url = "./updateForm.jsp";
	
	url+= "?id=<%=id%>";
	
	location.href=url;

	}
function bupdatePw() {
	var url = "./updatePwForm.jsp";
	
	url+= "?id=<%=id%>";
	location.href=url;

	}
function bupdateFile() {
	var url = "./updateFileForm.jsp";
	
	url+= "?id=<%=id%>";
	url+= "&oldfile=<%=dto.getFilename()%>";
	
	location.href=url;

	}
</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="title">정보</div>

	<div class="content">
		<table>

			<TR>
				<Td colspan="2"><img src="./storage/<%=dto.getFilename()%>" width="350px">
				</Td>
			</TR>
			<TR>
				<TH>ID</TH>
				<TD><%=dto.getId()%></TD>
			</TR>
			<TR>
				<TH>이름</TH>
				<TD><%=dto.getName()%></TD>
			</TR>
			<TR>
				<TH>전화번호</TH>
				<TD><%=Utility.checkNull(dto.getPhone())%></TD>
			</TR>
			<TR>
				<TH>E-mail</TH>
				<TD><%=dto.getEmail()%></TD>
			</TR>
			<TR>
				<TH>우편번호</TH>
				<TD><%=Utility.checkNull(dto.getZipcode())%></TD>
			</TR>
			<TR>
				<TH>주소</TH>
				<TD><%=Utility.checkNull(dto.getAddress1())%><br> <%=Utility.checkNull(dto.getAddress2())%>
				</TD>
			</TR>
			<TR>
				<TH>등록날짜</TH>
				<TD><%=dto.getMdate()%></TD>
			</TR>



		</table>



	</div>



	<div class="bottom">
		<button type="button" onclick="location.href='../index.jsp'">Home</button>
		<button type="button" onclick="bupdate()">수정</button>
		<button type="button" onclick="bupdatePw()">비밀번호변경</button>
		<button type="button" onclick="bupdateFile()">사진변경</button>
		<button type="button" onclick="bdelete()">탈퇴</button>
	</div>

	<jsp:include page="/menu/bottom.jsp" />

</body>
</html>