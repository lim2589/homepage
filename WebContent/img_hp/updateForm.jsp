<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/img_hp/ssi.jsp"%>
<%
	int imgno = Integer.parseInt(request.getParameter("imgno"));
	Img_hpDTO dto = dao.read(imgno);

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
function inputCheck(f) {
	if(f.passwd.value==""){
		alert("비밀번호를 입력하세요.");
		f.passwd.focus();
		return false;
	}
}

</script>


<style type="text/css">
* {
	 font: 400 15px/1.8 Lato, sans-serif;
      color: #777;
     text-align: center;
}

</style>

</head>
<body>
	<jsp:include page="../menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title"></DIV>
	<FORM 
		method='POST' 
		enctype="multipart/form-data"
		action='./updateProc.jsp'
		onsubmit="return inputCheck(this)">
<input type="hidden" name="imgno" value="<%=dto.getImgno() %>">
<input type="hidden" name="oldfile" value="<%=request.getParameter("oldfile") %>">
<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
  <div class="title">수정</div>
  <TABLE>
  	    <TR>
      <TH>원본파일</TH>
      <TD>
      	<img src="./storage/<%=request.getParameter("oldfile")%>" width="">
      	<p>원본 파일명 : <%=request.getParameter("oldfile") %></p>
      </TD>
    </TR>
    <tr>
    	<th>변경파일</th>
    	<td>
    		<input type="file" name="fname" accept=".png, .jpg, .gif">
    	</td>
    </tr>
    <TR>
      <TH>이름</TH>
      <TD>
      	<input type="text" name="wname" value="<%=dto.getWname() %>">
      </TD>
    </TR>
    
      <TR>
      <TH>제목</TH>
      <TD>
      	<input type="text" name="title" value="<%=dto.getTitle() %>">
      </TD>
    </TR>
    
    <TR>
      <TH>내용</TH>
      <TD>
      	<input type="text" name="content" value="<%=dto.getContent() %>">
      </TD>
    </TR>
    <tr>
    <TH>패스워드</TH>
		<TD>
			<input type="password" name="passwd" placeholder="패스워드를 입력하세요.">
		</TD>
	</tr>
	
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='전송'>
    <input type='reset' value='다시입력'>
    <input type="button" value="취소" onclick="history.back()">
  </DIV>
</FORM>

	<!-- *********************************************** -->
	<jsp:include page="../menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
