<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/img_hp/ssi.jsp"%>



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
     text-align: center;
}
table tr th{
text-align: center;

}
td{
text-align: left;
}

</style>
<script type="text/javascript">

	function inCheck(f) {
		
		if (f.wname.value == "") {
			alert("이름을 입력하세요");
			f.wname.focus();
			return false;
		}
		if (f.title.value == "") {
			alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}
		if (f.content.value == "") {
			alert("내용을 입력하세요");
			f.content.focus();
			return false;
		}
		if (f.passwd.value == "") {
			alert("비밀번호를 입력하세요");
			f.passwd.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<jsp:include page="../menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">이미지 등록</DIV>
	<FORM 
			name='frm' 
			method='POST' 
			enctype="multipart/form-data"
			action='./createProc.jsp' 
			onsubmit="return inCheck(this)">

	<div class="content">
		<TABLE>

			<tr>
				<th>파일</th>
				<td>
				<input type="file" name="fname" accept=".jpg,.png,.gif">
				<spen style="color: red">jpg,png,gif파일만 가능합니다.</spen>
				</td>
			</tr>

			<tr>
				<th>이름</th>
				<td><input type="text" name="wname" placeholder="이름을입력하세요." size="20"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" placeholder="제목을입력하세요." size="40"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="40" name="content" placeholder="내용을입력하세요."></textarea>
				</td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="passwd" placeholder="패스워드를입력하세요."></td>
			</tr>


		</TABLE>
	</div>

		<DIV class='bottom'>
			<input type='submit' value='등록'> 
			<input type="reset" value='재입력' >
		</DIV>
	</FORM>


	<!-- *********************************************** -->
	<jsp:include page="../menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
