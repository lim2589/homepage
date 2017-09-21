<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/person/ssi.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function inCheck(p) {
	if(p.passwd.value == ""){
		alert("패스워드를 입력하세요");
		p.passwd.focus();
		return false;
	}
	if(p.repasswd.value == ""){
		alert("패스워드확인을 입력하세요");
		p.repasswd.focus();
		return false;
	}
	if(p.passwd.value != p.repasswd.value){
		alert("비밀번호가 일치하지 않습니다.다시확인해주세요.");
		p.repasswd.value == "";
		p.repasswd.focus();
		return false;
	}
	
}

</script>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" />
	<!-- *********************************************** -->

	<DIV class="title">PASSWORD 변경</DIV>

	<FORM name='frm' method='POST' action='./updatePwProc.jsp' onsubmit="return inCheck(this)">
	
	<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
		<TABLE>
			<TR>
				<TH>PASSWORD</TH>
				<TD><input type="password" name="passwd"></TD>
			</TR>
			
			<TR>
				<TH>PASSWORD확인</TH>
				<TD><input type="password" name="repasswd"></TD>
			</TR>
		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='변경'> 
			<input type='button' value='뒤로가기' onclick="history.back()">
		</DIV>
	</FORM>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" />
</body>
<!-- *********************************************** -->
</html>
