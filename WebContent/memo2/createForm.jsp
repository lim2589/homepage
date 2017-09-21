<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/memo2/ssi.jsp"%>



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
	<div class="title">Memo</div>

	<form action="./createProc.jsp" method="post" name="frm">
	<div class="content">
		<table>
			<tr>
				<th>이름</th>
				<td >
					<input type="text" size="30" placeholder="이름을 입력하세요." required="required" name="wname">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td >
					<input type="text" size="30" placeholder="제목을 입력하세요." required="required" name="title">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td ><textarea rows="10" cols="30" placeholder="내용을 입력하세요." name="content"></textarea></td>
			</tr>
			
		</table>
		</div>


	<div class="bottom">
		<button>등록</button>
		<button type="reset">다시작성</button>
	</div>
	
	</form>
	<jsp:include page="/menu/bottom.jsp" />

</body>
</html>