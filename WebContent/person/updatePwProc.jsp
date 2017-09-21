<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/person/ssi.jsp"%>
<%
	String passwd = request.getParameter("passwd");
	String id = request.getParameter("id");

	Map map = new HashMap();
	map.put("passwd", passwd);
	map.put("id", id);

	boolean flag = dao.updatePw(map);
	
	if(flag){
		session.invalidate();
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" />
	<!-- *********************************************** -->

	<DIV class="title">비밀번호 변경처리</DIV>

	<div class="content">
		<%
			if (flag) {
				out.print("비밀번호 변경에 성공하였습니다.<br>");
				out.print("다시 로그인 하세요.<br>");
			} else {
				out.print("비밀번호 변경에 실패하였습니다.");
			}
		%>


	</div>

	<DIV class='bottom'>
		<%
			if (flag) {
		%>
		<button type="button" onclick="location.href='./loginForm.jsp'">login</button>
		<%
			} else {
		%>
		<button type="button" onclick="history.back()">뒤로가기</button>
		<%
			}
		%>


	</DIV>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" />
</body>
<!-- *********************************************** -->
</html>
