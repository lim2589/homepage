<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/img_hp/ssi.jsp"%>
<jsp:useBean id="dto" class="img_hp.Img_hpDTO"/>
<jsp:setProperty name="dto" property="*"/>

<%

UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	
	
	int imgno = Integer.parseInt(upload.getParameter("imgno"));
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	String passwd = upload.getParameter("passwd");
	FileItem fileItem = upload.getFileItem("fname");
	
	
	Map map = new HashMap();
	map.put("imgno", imgno);
	map.put("passwd", passwd);
	boolean pflag = dao.passwdCheck(map);
	boolean flag = false;
	String filename = null;
	
	if(pflag){
		int size = (int)fileItem.getSize();
		
		if(size > 0){
			if(oldfile != null && !oldfile.equals("member.jpg")){
				UploadSave.deleteFile(upDir, oldfile);
			}
			filename = UploadSave.saveFile(fileItem, upDir);
		}
		
	}
		dto.setTitle(UploadSave.encode(upload.getParameter("title")));
		dto.setWname(UploadSave.encode(upload.getParameter("wname")));
		dto.setContent(UploadSave.encode(upload.getParameter("content")));
		dto.setFname(filename); 
		dto.setImgno(imgno);
		flag = dao.update(dto);


%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
 <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">

<script type="text/javascript">
function blist() {
	var url = "list.jsp";
	
	location.href=url;
}

</script>


<style type="text/css">
* {
	 font: 400 15px/1.8 Lato, sans-serif;
      color: #777;
     text-align: center;
}

</style>

</head>
<body>
	<jsp:include page="../menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title"></DIV>

	<div class="content">
<%
	if(!pflag){
		out.print("패스워드가 일치하지않습니다.<br>다시 입력해주세요");
	}else if(flag){
		out.print("수정에 성공하였습니다.");
	}else{
		out.print("수정에 실패하였습니다");
	}
%>
	</div>

		<DIV class='bottom'>
		<%if(!pflag){%>
		<button type="button" onclick="history.back()">뒤로가기</button>
		<%}else{ %>
		<button type="button" onclick="blist()">목록</button>
		<%}%>
		</DIV>


	<!-- *********************************************** -->
	<jsp:include page="../menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
