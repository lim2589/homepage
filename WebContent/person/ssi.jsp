<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="person.*"%>
<%@ page import="java.util.*"%>
<%@ page import="utility.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<jsp:useBean id="dao" class="person.PersonDAO" />


<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
	
	String tempDir = application.getRealPath("/person/temp");
	String upDir = application.getRealPath("/person/storage");
	
%>
