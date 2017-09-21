<%@ page contentType="text/html; charset=UTF-8"%>
<%
	session.invalidate(); //전체를 지우는 메서드
	//session.removeAttribute("id"); //세션에 저장된 id만 지우고싶을 경우 사용
	
	response.sendRedirect("../index.jsp");
%>

