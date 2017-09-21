<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/memo2/ssi.jsp"%>
<%
	int memono = Integer.parseInt(request.getParameter("memono"));
	Memo2DTO dto = dao.replyRead(memono);

%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">


<style type="text/css">
* {
	 font: 400 15px/1.8 Lato, sans-serif;
      color: #777;
	text-align:center;
}

th,td{
height: 30px;

}

</style>
</head>
<body>
<jsp:include page="/menu/top.jsp" />
	<div class="title">Answer</div>

	<form action="./replyProc.jsp" method="post" name="frm">
	<input type="hidden" name="memono" value="<%=memono%>">
	<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
	<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
	<input type="hidden" name="grpno" value="<%=dto.getGrpno()%>">
	<input type="hidden" name="indent" value="<%=dto.getIndent()%>">
	<input type="hidden" name="ansnum" value="<%=dto.getAnsnum()%>">
	<div class="content">
		<table>
			<tr>
				<th>이름</th>
				<!--value=값을이미가지고있는-->
				<td><input type="text" name="wname" size="30" value="<%=dto.getWname()%>" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<!--value=값을이미가지고있는-->
				<td><input type="text" name="title" size="30" value="<%=dto.getTitle()%>" /></td>
			</tr>

			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="30" name="content"></textarea>
						</td>
			</tr>

		</table>
		</div>


	<div class="bottom">
		<button>답변등록</button>
		<button type="button" onclick="history.back()">취소</button>
	</div>
	</form>
	
	<jsp:include page="/menu/bottom.jsp" />

</body>
</html>