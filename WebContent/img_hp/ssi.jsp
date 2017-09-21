<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="img_hp.*"%>
<%@ page import="java.util.*"%>
<%@ page import="utility.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<jsp:useBean id="dao" class="img_hp.Img_hpDAO" />

<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
	//업로드용 파일 저장 공간선언
	String upDir = application.getRealPath("/img_hp/storage");
	String tempDir = application.getRealPath("/img_hp/temp");
	
%>

