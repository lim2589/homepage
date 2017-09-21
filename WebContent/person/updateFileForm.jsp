<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/person/ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function incheck(f) {
	if(f.filename.value == ""){
		alert("파일을 선택해주세요");
		f.filename.focus();
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

	<DIV class="title">사진변경</DIV>

	<FORM 
		name='frm' 
		method='POST' 
		action='./updateFileProc.jsp' 
		enctype="multipart/form-data"
		onsubmit="return incheck(this)">
	<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
	<input type="hidden" name="oldfile" value="<%=request.getParameter("oldfile")%>">
  <TABLE>
    <TR>
      <TH>원본파일</TH>
      <TD>
      <p style="text-align: center;"> <!-- p태그로 감싸 사진 중앙위치 -->
      <img src="./storage/<%=request.getParameter("oldfile")%>"><br>
      	원본파일명 : <%=request.getParameter("oldfile") %></p>
      </TD>
    </TR>
    <TR>
      <TH>변경파일</TH>
      <TD>
      	<input type="file" name="filename" accept=".png, .jpg, .gif">
      </TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='변경'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" />
</body>
<!-- *********************************************** -->
</html>
