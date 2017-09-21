<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/person/ssi.jsp"%>
<%
	String id = request.getParameter("id");
	String oldfile = request.getParameter("oldfile");
	String passwd = request.getParameter("passwd");
	
	Map map = new HashMap();
	map.put("id", id);
	map.put("passwd",passwd);
	
	
	boolean pflag = dao.passwdCheck(map);
	boolean flag = false;
	
	if(pflag){//삭제가되었을경우 
		flag = dao.delete(id);
			if( oldfile != null && !oldfile.equals("member.jpg")){ //flag->true oldfile이null아니고 oldfile이member.jpg가 아닐경우
			UploadSave.deleteFile(upDir, oldfile);
			}
		session.invalidate(); //세션에있는 회원정보를 삭제
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">

</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">회원 탈퇴</DIV>
	<div class="content">
	<%
	if(!pflag){
		out.print("잘못된 패스워드입니다. 다시확인해주세요");
	}else if(flag){
		out.print("탈퇴 되었습니다. 이용해 주셔서 감사합니다.");
	}else{
		out.print("탈퇴가 실패되었습니다.");
	}
	
	%>
	
	
	</div>



	<DIV class='bottom'>
		<%if(!pflag){ %>
		<input type='button' value='다시시도' onclick="history.back()"> 
		<%}else{ %>
		<input type='button' value='Home' onclick="location.href='../index.jsp'">
		<%} %>
	
	</DIV>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
