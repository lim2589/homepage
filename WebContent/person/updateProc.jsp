<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/person/ssi.jsp"%>
<jsp:useBean id="dto" class="person.PersonDTO" />
<jsp:setProperty property="*" name="dto" />
<%
	boolean flag = dao.update(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function read() {
	var url = "./read.jsp";
	url += "?id=<%=dto.getId()%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
	
}


</script>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">수정처리</DIV>
	<div class="content">
		<%
			if (flag) {

				out.print("수정에 성공하였습니다.");
			} else {

				out.print("수정에 실패하였습니다.");
			}
		%>

	</div>

<div class="bottom">
 <button type="button" onclick="history.back()">뒤로가기</button>
 <button type="button" onclick="read()">Myinfo</button>

</div>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" />
</body>
<!-- *********************************************** -->
</html>
