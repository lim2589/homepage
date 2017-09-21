<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/memo2/ssi.jsp"%>
<%
	
	int memono = Integer.parseInt(request.getParameter("memono"));
	boolean flag = dao.getRefnum(memono);


%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
<script type="text/javascript">

function blist() {
	var url = "./list.jsp";
	url += "?col<%=request.getParameter("col")%>";
	url += "&word<%=request.getParameter("word")%>";
	location.href = url;
}

</script>


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
	<div class="title">Delete</div>
	
	<%
		if(flag){
	%>
	<div class="content">답변글이 있어 삭제 할 수 없습니다.</div>
		<div class="bottom">
			<button type="button" onclick="blist()">목록</button>
			<button type="button" onclick="history.back()">뒤로가기</button>
		</div>
		
	<%}else{ %>
	
	<form action="./deleteProc.jsp" method="post" name="frm">
		<input type="hidden" name="memono" value="<%=memono%>">
		<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
		<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
	<div class="content">
		삭제하면 복구할 수 없습니다.<br>
		정말로 삭제 하시겠습니까?<br>
	</div>
	<div class="bottom">
		<button>삭제</button>
		<button type="button" onclick="history.back()">취소</button>
	</div>
	</form>
	<%} %>

	
	<jsp:include page="/menu/bottom.jsp" />

</body>
</html>