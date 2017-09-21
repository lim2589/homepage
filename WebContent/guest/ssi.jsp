<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="guest.*"%>
<%@ page import="java.util.*"%>
<%@ page import="utility.*"%>
<jsp:useBean id="dao" class="guest.GuestDAO" />

<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
	//업로드용 파일 저장 공간선언
	
%>

