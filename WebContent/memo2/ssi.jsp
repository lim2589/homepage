<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="memo2.*"%>
<%@ page import="java.util.*"%>
<%@ page import="utility.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<jsp:useBean id="dao" class="memo2.Memo2DAO" />


<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
	
	String tempDir = application.getRealPath("/memo2/temp");
	String upDir = application.getRealPath("/memo2/storage");
	
%>
