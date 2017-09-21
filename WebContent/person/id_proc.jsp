<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/person/ssi.jsp"%>
<%
	String id = request.getParameter("id");
	System.out.println("id:" + id);
	boolean flag = dao.idCheck(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function use(){ //아이디중복확인 사용을 눌렀을시 그대로 입력받을수있게할수있는 함수
	
	opener.frm.id.value = '<%=id%>';

		window.close(); //아이디를 보낸후 닫는다

	}
</script>
</head>
<!-- *********************************************** -->
<body>
	<!-- *********************************************** -->

	<DIV class="title">ID 중복 확인</DIV>
	<div class="content">
		입력된 ID:
		<%=id%><br>
		<br>
		<%
			if (flag) {
				out.print("중복된 ID이므로 사용할 수 없습니다. <br><br>");

			} else {
				out.print("사용 가능합니다. <br><br>");
				out.print("<button type='button' onclick='use()'> 사용 </button>");
			}
		%>

	</div>

	<div class="bottom">
		<input type='button' value='다시시도'
			onclick="location.href='id_form.jsp'"> <input type='button'
			value='닫기' onclick="window.close()">
	</div>



	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
