<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/memo2/ssi.jsp"%>

<%
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	if(col.equals("total"))
		word = "";
	
	int nowPage = 1;
	int recordPerPage = 5;
	
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	int sno = ((nowPage-1) * recordPerPage) +1;
	int eno = nowPage * recordPerPage;
	
	Map map = new HashMap();
	
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);	
	
	int total = dao.total(map);
	List<Memo2DTO> list = dao.list(map);

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
.search{
	width: 100%;
	text-align: center;
}
*{
	 font: 400 15px/1.8 Lato, sans-serif;
      color: #777;
	text-align:center;
}

th,td{
height: 30px;
text-align:center;
}

</style>
<script type="text/javascript">
	function read(memono) {
		var url = "./read.jsp";
		url += "?memono=" + memono;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		//alert(url); //확인
		location.href = url;
	}
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp" />
	<div class="title">List</div>
	
	<div class="search">
	<form action="./list.jsp" method="post">
		<select name="col">
			<option value="wname"
			<%if(col.equals("wname"))out.print("selected='selected'"); %>
			>이름</option>
			
			<option value="title"
			<%if(col.equals("title"))out.print("selected='selected'"); %>
			>제목</option>
			
			<option value="content"
			<%if(col.equals("content"))out.print("selected='selected'"); %>
			>내용</option>
			
			<option value="total">전체출력</option>
		
		</select>
		
		<input type="text" name="word" value="<%=word%>">
		<button>검색</button>
		<button type="button" onclick="location.href='./createForm.jsp'">등록</button>
	
	
	
	</form>
	
	
	
	</div>

	<div class="content">
		<table style="width: 500px">
			<tr>
			<th style="text-align: center;">번호</th>
			<th style="text-align: center;">제목</th>
			<th style="text-align: center;">이름</th>
			<th style="text-align: center;">날짜</th>
			<th style="text-align: center;">조회수</th>
			</tr>
			
			<% if(list.size() == 0){ %>
			<tr>
				<td colspan="5">
					등록된 메모가 없습니다. 등록해주세요.
				</td>
			</tr>
			<%
			}else{
				for(int i = 0; i<list.size(); i++){
					Memo2DTO dto = list.get(i);
			%>
			<tr>
				<td><%=dto.getMemono()%></td>
				<td style="text-align: left; width: 150px">
				<%
				 for(int j=0; j < dto.getIndent();j++){
					 out.print("&nbsp;&nbsp;&nbsp;");
				 }
				
				if(dto.getIndent()>0){
					out.print("<img src='../images/re.jpg'>");
				}
				%>
				<a href="javascript:read('<%=dto.getMemono()%>')"><%=dto.getTitle()%></a>
				<% if(Utility.compareDay(dto.getWdate().substring(0, 10))){ %>
				<img src="<%=root%>/images/new.gif">
				<% } %>
				
				</td>
				<td><%=dto.getWname()%></td>
				<td><%=dto.getWdate()%></td>
				<td><%=dto.getViewcnt()%></td>
			</tr>
			
			<%
				} 
			}
			
			%>
			
		</table>
		</div>


	<div class="bottom">
	
	<%=Utility.paging3(total, nowPage, recordPerPage, col, word) %>
	</div>
	
	<jsp:include page="/menu/bottom.jsp" />

</body>
</html>