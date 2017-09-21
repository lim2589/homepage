<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/img_hp/ssi.jsp"%>
<%
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")){
		word="";
	}
	
	int nowPage=1;
	int recordPerPage = 5;
	
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	int sno = ((nowPage-1)*recordPerPage)+1;
	int eno = nowPage*recordPerPage;
	
	Map map = new HashMap();
	map.put("col",col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	int totalRecord = dao.total(map);
	List<Img_hpDTO> list = dao.list(map);
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
	function read(imgno){
		var url = "./read.jsp";
		url += "?imgno="+imgno;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		
		location.href = url;
}
</script>
<style type="text/css">

table tr th{/* 스타일에서도 빈공간을 써주면 부모의 자식요소에게 접근이 가능 */
	text-align: center;
}

* {
	text-align:center;
	 font: 400 15px/1.8 Lato, sans-serif;
      color: #777;
}

.search {
	width: 80%;
	margin: 10px auto;
	text-align: center;
}
</style>
</head>
<body>
<jsp:include page="/menu/top.jsp" />
<DIV class="title">목록</DIV>
<div class="search">
<FORM method='POST' action='./list.jsp'>
<div class="search">
	<select name="col">
	
		<option value = "imgno"
		<%if(col.equals("imgno")) out.print("selected='selected'"); %>>번호</option>
			
		<option value = "wname"
		<%if(col.equals("wname")) out.print("selected='selected'"); %>>이름</option>
		
		<option value = "title"
		<%if(col.equals("title")) out.print("selected='selected'"); %>>제목</option>
		
		<option value = "total"
		<%if(col.equals("total")) out.print("selected='selected'"); %>>전체출력</option>
	</select>
	<input type = "text" name="word" value="<%=word %>">
	<button>검색</button>
	<button type="button" onclick="location.href='./createForm.jsp'">등록</button>
	</div>
	</FORM>
</div>
<div class="content">
  <table width = "600px">
    <tr>
      <th>번호</th>
      <th>사진</th>
      <th>이름</th>
      <th>제목</th>
      <th>등록날짜</th>
    </tr>
    <%
    	if(list.size() == 0){
    %>
    <tr>
    	<td colspan="9"> 등록된 데이터가 없습니다.</td>
    </tr>
    
    <%
    	} else {
			for(int i = 0; i < list.size(); i++){
				Img_hpDTO dto = list.get(i);
    %>
    
    <tr>
    	
    	<td width="50px"><%=dto.getImgno() %></td>
    	<td width="20%"> 
    		<img src="./storage/<%=dto.getFname() %>" width="100%">
    	</td>
    	<td>
    	
    	
    	<a href="javascript:read('<%=dto.getImgno() %>')"><%=dto.getWname() %></a></td>
    	<td><%=dto.getTitle() %></td>
    	<td><%=dto.getWdate().substring(0, 10) %></td>
    </tr>
    
    <%
			}
    	}
    %>
  </table>
  </div>
  
  <DIV class='bottom'>
    <%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
  </DIV>
 
	<jsp:include page="/menu/bottom.jsp" />

</body>
</html>