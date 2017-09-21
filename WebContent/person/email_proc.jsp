<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/person/ssi.jsp"%>

<%
	String email = request.getParameter("email");
	boolean flag = dao.emailCheck(email);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function use(){ //아이디중복확인 사용을 눌렀을시 그대로 입력받을수있게할수있는 함수
	
	opener.frm.email.value = '<%=email%>'; 
	
	window.close(); //아이디를 보낸후 닫는다
	
}
</script>
</head>
<!-- *********************************************** -->
<body>
	<!-- *********************************************** -->

	<DIV class="title">E-mail 중복 확인</DIV>
<div class="content" >
입력된 E-mail: <%=email %><br><br>
<%
if(flag){
	out.print("중복된 E-mail이므로 사용할 수 없습니다. <br><br>");
	
}else{
	out.print("사용 가능합니다. <br><br>");
	out.print("<button type='button' onclick='use()'>사용</button>");
}
%>

</div>
	
		<DIV class='bottom'>
			<input type='button' value='다시시도'onclick="location.href='email_form.jsp'">
			<input type='button' value='닫기'onclick="window.close()">
		</DIV>


	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
