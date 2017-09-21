<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/memo2/ssi.jsp"%>
<jsp:useBean id="dto" class="memo2.Memo2DTO"/> 
<jsp:setProperty property="*" name="dto"/>

<%
	
	boolean flag = dao.update(dto);


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
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
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
	<div class="title">Memo 수정</div>
	<%
	if(flag){
		out.print("메모수정을 성공했습니다.");
	}else{
		out.print("메모수정을 실패했습니다.");
	}
	
	
	%>

	<div class="bottom">
		<button type="button" onclick="blist()">목록</button>
		<button type="button" onclick="history.back()">다시작성</button>
	</div>
	
	<jsp:include page="/menu/bottom.jsp" />

</body>
</html>