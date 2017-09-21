<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/person/ssi.jsp"%>
<%
	String id = request.getParameter("id");
	if (id == null)
		id = (String) session.getAttribute("id");
	String oldfile = request.getParameter("oldfile");//oldfile은 세션에 저장되지 않았음으로 디비에서 작업해줘야한다
	if (oldfile == null)
		oldfile = dao.getFname(id); //파라메터로 보내온 아이디값으로
		

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function inputCheck(f) {
	if (f.passwd.value == "") {
		alert("비밀번호를 입력하세요");
		f.passwd.focus();
		return false;
	}
}


</script>

<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">회원 탈퇴</DIV>

	<FORM name='frm' method='POST' action='./deleteProc.jsp' onsubmit="return inputCheck(this)">
		<input type="hidden" name="id" value="<%=id%>"> 
		<input type="hidden" name="oldfile" value="<%=oldfile%>">

		<div class="content">
			탈퇴를 하시면 더이상 컨텐츠를 제공받을 수 없습니다.<br> 탈퇴를 원하시면 아래 탈퇴버튼을 클릭하세요.
			<TABLE>
			<TR>
				<TH>비밀번호</TH>
				<TD><input type="password" name="passwd"></TD>
			</TR>
		</TABLE>
		</div>

		<DIV class='bottom'>
			<input type='submit' value='탈퇴'> 
			<input type='button' value='취소' onclick="history.back()">
		</DIV>
	</FORM>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
