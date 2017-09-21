<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/person/ssi.jsp"%>
<%
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	String id = upload.getParameter("id");
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	
	FileItem fileItem = upload.getFileItem("filename");
	int size = (int)fileItem.getSize();
	String filename = null;
	if(size>0){
		 if(oldfile != null && !oldfile.equals("member.jpg")){
			 UploadSave.deleteFile(upDir, oldfile);
			 filename = UploadSave.saveFile(fileItem, upDir);
		 }
		
	}
	
	Map map = new HashMap();
	map.put("id", id);
	map.put("filename", filename);
	boolean flag = dao.updateFile(map);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<script type="text/javascript">
function bread() {
	
	var url = "read.jsp";
	url +=	"?id=<%=id%>";
	
	location.href=url;
	
}

</script>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" />
	<!-- *********************************************** -->

	<DIV class="title">사진 변경</DIV>
	
	<div class="content">
	<%
		if(flag){
			out.print("사진변경에 성공하였습니다.");
		}else{
			out.print("사진변경에 실패하였습니다.");
		}
	
	%>
	
	</div>


		<DIV class='bottom'>
		
		<%
			if(flag){%>
			<button type="button" onclick="location.href='../index.jsp'">Home</button>
			<button type="button" onclick="bread()">Myinfo</button>
			<%}else{ %>
			<button type="button" onclick="history.back()">다시시도</button>
			<%} %>
		</DIV>
	

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" />
</body>
<!-- *********************************************** -->
</html>
