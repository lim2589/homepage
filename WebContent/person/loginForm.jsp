<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/person/ssi.jsp"%>
<%
	/*-----------쿠키 설정 내용 시작 -------------------*/
	String c_id = ""; //아이디 저장 여부를 저장하는 변수 , Y
	String c_id_val = ""; //아이디의 값

	Cookie[] cookies = request.getCookies(); //쿠키를 읽어옴
	Cookie cookie = null;

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			cookie = cookies[i];

			if (cookie.getName().equals("c_id")) {
				c_id = cookie.getValue();
			} else if (cookie.getName().equals("c_id_val")) {

				c_id_val = cookie.getValue(); // user1...
			}
		}
	}
	/*-----------쿠키 설정 내용 끝 -------------------*/
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">


</head>
<body>
<jsp:include page="/menu/top.jsp" />
	<div class="title">Login</div>

	<form action="./loginProc.jsp" method="post" name="frm">
	<div class="content">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" value="<%=c_id_val%>">
					<%
					if (c_id.equals("Y")) {//아이디 저장상태라면
					%> 
						<input type="checkbox" name="c_id" value="Y" checked="checked">ID 저장
					<%
					} else {
					%>
 						<input type="checkbox" name="c_id" value="Y"> ID 저장 
 					<%
 					}
					 %>
				</td>
			</tr>
			
			<tr>
				<th>PASSWORD</th>
			 	<td style="text-align: left;">
			 		<input type="password" name="passwd">
			 	</td>
		    </tr>
		</table>
		</div>


		<div class="bottom">
			<input type="submit" value="login">
			<button type="button" onclick="location.href='../agreement.jsp'">회원가입</button>
		</div>
	</form>
	
	<jsp:include page="/menu/bottom.jsp" />

</body>
</html>