<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/img_hp/ssi.jsp"%>
<%

	int imgno = Integer.parseInt(request.getParameter("imgno"));
	Img_hpDTO dto = dao.read(imgno);

	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");

%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">


<style type="text/css">
* {
	 font: 400 15px/1.8 Lato, sans-serif;
      color: #777;
	text-align:center;
}

table tr th{
text-align: center;

}

.curImg{
	margin-right:0;
	border-style:solid;
	border-width: 3px;
	border-color: red;
}
.td_padding{
	padding:5px 5px;
}

</style>
<script type="text/javascript">
function ilist(){
	var url = "./list.jsp";
	location.href=url;
}

function iupdate(){
	var url = "./updateForm.jsp";
	url += "?imgno=<%=imgno%>";
	url += "&oldfile=<%=dto.getFname()%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	
	location.href=url;
}

function ireply(){
	var url = "./replyForm.jsp";
	url += "?imgno=<%=imgno%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	 
	location.href = url;
}

function idelete(){
	var url = "./deleteForm.jsp";
	url += "?imgno=<%=imgno%>";
	url += "&oldfile=<%=dto.getFname()%>";
	
	location.href=url;
}

function readGo(imgno){
	var url ="./read.jsp";
	url = url + "?imgno="+imgno;
	
	location.href=url;
}
</script>

</head>
<body>
<jsp:include page="/menu/top.jsp" />
<DIV class="title">상세정보보기</DIV>
  <TABLE style="width: 500px">
  	<tr>
  		<td colspan="2" align="center">
  			<img src="./storage/<%=dto.getFname()%>" width="50%">
  		</td>
  	</tr>
  	
    <TR>
      <TH>이름</TH>
      <TD><%=dto.getWname() %></TD>
    </TR>
    
     <TR>
      <TH>제목</TH>
      <TD><%=dto.getTitle() %></TD>
    </TR>
    
     <TR>
      <TH>내용</TH>
      <TD><%=dto.getContent() %></TD>
    </TR>
    
     <TR>
      <TH>등록날짜</TH>
      <TD><%=dto.getWdate().substring(0, 10) %></TD>
    </TR>
    
     <TR>
      <TH>파일이름</TH>
      <TD><%=dto.getFname() %></TD>
    </TR>
  </TABLE>
  
  <div class="content">
  <table style="width:30%">
	  <%
	  	List list = dao.imgRead(imgno);
	  	String[] files = (String[])list.get(0);
	  	int[] noArr = (int[])list.get(1);
	  	
	  	for(int i = 0; i < 5; i++){
	  		if(files[i]==null){
	  %>
	  <td>
	  	<img src="./images/default.jpg" width="150px">
	  </td>
	  <%
	  		} else {
	  			if(noArr[i]==imgno){
	  %>
	  <td class="td_padding">
	  	<a href="javascript:readGo('<%=noArr[i] %>')">
	  	<img class="curImg" src="./storage/<%=files[i] %>" width="150px" border="0">
	  	</a>
	  </td>
	  <%
	  			}else{
	  %>
	  <td class="td_padding">
	  	<a href="javascript:readGo('<%=noArr[i] %>')">
	  		<img src="./storage/<%=files[i] %>" width="150px" border="0">
	  	</a>
	  </td>
	  <%
	  			}
	  		 }
	  	  }
	  %>
  </table>
  </div>
  
  <DIV class='bottom'>
    <button type='button' onclick="ilist()">목록</button>
    <button type='button' onclick="iupdate()">수정</button>
    <button type='button' onclick="idelete()">삭제</button>
    
  </DIV>
 
 
	<jsp:include page="/menu/bottom.jsp" />

</body>
</html>