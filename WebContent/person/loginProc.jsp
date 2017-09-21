<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/person/ssi.jsp"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	Map map = new HashMap();
	map.put("id", id);
	map.put("passwd", passwd);
	boolean flag = dao.loginCheck(map);

	if (flag) {//flag true이면 회원이기때문에 grade(등급)을 가져올수있다.->그렇기 떄문에 if문 
		String grade = dao.getGrade(id);
		session.setAttribute("id", id); //아이디와 등급을 세션객체에 저장해서 연결을 확인할 수 있다.
		session.setAttribute("grade", grade);

		//cookie 저장, checkbox는 선택하지 않으면 null

		Cookie cookie = null;

		String c_id = request.getParameter("c_id"); //Y,아이디 저장여부

		if (c_id != null) { //처음에는 값이 없음으로 null체크로 처리
			cookie = new Cookie("c_id", "Y"); //아이디 저장 여부 쿠키
			cookie.setMaxAge(120); //2분 유지
			response.addCookie(cookie); //쿠키 기록

			cookie = new Cookie("c_id_val", id); //아이디 값 저장 쿠키
			cookie.setMaxAge(120); //2분 유지
			response.addCookie(cookie); //쿠키 기록

		} else {
			cookie = new Cookie("c_id", ""); //쿠키 삭제
			cookie.setMaxAge(0);
			response.addCookie(cookie);

			cookie = new Cookie("c_id_val", ""); //쿠키삭제
			cookie.setMaxAge(0);
			response.addCookie(cookie);

		}
	}
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
	<div class="title">login처리</div>

	<div class="content">
		<%
			if (flag) {
				out.print("로그인에 성공하셨습니다.");

			} else {
				out.print("로그인에 실패하셨습니다.<br>아이디와 패스워드를 확인하세요");

			}
		%>



	</div>


	<div class="bottom">
		<%
			if (flag) {
		%>
		<button type="button" onclick="location.href='../index.jsp'">Home</button>
		<%
			} else {
		%>
		<button type="button" onclick="history.back()">다시시도</button>
		<%
			}
		%>

	</div>

	<jsp:include page="/menu/bottom.jsp" />

</body>
</html>