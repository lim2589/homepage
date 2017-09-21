<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/guest/ssi.jsp"%>

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
	List<GuestDTO> list = dao.list(map);
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<email>Insert email here</email>
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
	function read(gno) {
		var url = "./read.jsp";
		url += "?gno=" + gno;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		//alert(url); //확인
		location.href = url;
	}
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp" />
	<div class="email">List</div>
	
	<div class="search">
	<form action="./list.jsp" method="post">
		<select name="col">
			<option value="name"
			<%if(col.equals("name"))out.print("selected='selected'"); %>
			>이름</option>
			
			<option value="email"
			<%if(col.equals("email"))out.print("selected='selected'"); %>
			>이메일</option>
			
			<option value="comments"
			<%if(col.equals("comments"))out.print("selected='selected'"); %>
			>내용</option>
			
			<option value="total">전체출력</option>
		
		</select>
		
		<input type="text" name="word" value="<%=word%>">
		<button>검색</button>
		<button type="button" onclick="location.href='./createForm.jsp'">등록</button>
	
	
	
	</form>
	
	
	</div>
	
	<div class="container">
		<h3 class="text-center">Guest_Book</h3>
		<p class="text-center">
			<em>We love our fans!</em>
		</p>
		<div class="row test">
			<div class="col-md-4">
				<p>Fan? Drop a note.</p>
				<p>
					<span class="glyphicon glyphicon-map-marker"></span>Chicago, US
				</p>
				<p>
					<span class="glyphicon glyphicon-phone"></span>Phone: +00
					1515151515
				</p>
				<p>
					<span class="glyphicon glyphicon-envelope"></span>Email:
					mail@mail.com
				</p>
			</div>
			<form action="./createProc.jsp" method="POST" name="frm">
			<div class="col-md-8">
				<div class="row">
					<div class="col-sm-6 form-group">
						<input class="form-control" id="name" name="name"
							placeholder="Name" type="text" required>
					</div>
					<div class="col-sm-6 form-group">
						<input class="form-control" id="email" name="email"
							placeholder="Email" type="email" required>
					</div>
				</div>
				<textarea class="form-control" id="comments" name="comments"
					placeholder="Comment" rows="5"></textarea>
				<div class="row">
					<div class="col-md-12 form-group">
						<button class="btn pull-right" type="submit">Send</button>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
	
	<div class="container">
	
	<% if(list.size() == 0){ %>
			
				<div class="content">
					등록된 내용이 없습니다. 등록해주세요.
				</div>
			<%
				}else{
			%>
				<div class="col-md-8 col-md-offset-4">
				<%
					for(int i = 0; i<list.size(); i++){
						GuestDTO dto = list.get(i);
				%>
				<div class="row">
					<div class="col-sm-6 form-group">
						<input class="form-control"value="<%=dto.getName()%>">
					</div>
					<div class="col-sm-6 form-group">
						<input class="form-control" value="<%=dto.getEmail()%>">
					</div>
					<textarea class="form-control" rows="5"><%=dto.getComments() %></textarea>
				</div>
<%} %>
				<div class="bottom">
					<%=Utility.paging3(total, nowPage, recordPerPage, col, word) %>
				</div>
			</div>
<%}%>
		</div>
			
			
	
	

	<%-- <div class="content">
		<table style="width: 500px">
			<tr>
			<th style="text-align: center;">번호</th>
			<th style="text-align: center;">제목</th>
			<th style="text-align: center;">이름</th>
			<th style="text-align: center;">날짜</th>
			</tr>
			
			<% if(list.size() == 0){ %>
			<tr>
				<td colspan="5">
					등록된 내용이 없습니다. 등록해주세요.
				</td>
			</tr>
			<%
			}else{
				for(int i = 0; i<list.size(); i++){
					GuestDTO dto = list.get(i);
			%>
			<tr>
				<td><%=dto.getGno()%></td>
				<td style="text-align: left; width: 150px">
				<%
				 for(int j=0; j < dto.getIndent();j++){
					 out.print("&nbsp;&nbsp;&nbsp;");
				 }
				
				if(dto.getIndent()>0){
					out.print("<img src='../images/re.jpg'>");
				}
			
				<a href="javascript:read('<%=dto.getGno()%>')"><%=dto.getEmail()%></a>
				<% if(Utility.compareDay(dto.getWdate().substring(0, 10))){ %>
				<img src="<%=root%>/images/new.gif">
				<% } %>
				
				</td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getComments()%></td>
				<td><%=dto.getWdate()%></td>
			</tr>
			
			<%
				} 
			}
			
			
			%>
			
		</table>
		
			<%-- 	<hr>
				<% if(list.size() == 0){ %>
			<tr>
				<td colspan="5">
					등록된 내용이 없습니다. 등록해주세요.
				</td>
			</tr>
			<%
			}else{
				for(int i = 0; i<list.size(); i++){
					GuestDTO dto = list.get(i);
			%>
			<tr>
			</div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-sm-6 form-group">
						<input class="form-control" value="<%=dto.getName() %>" >
					</div>
					<div class="col-sm-6 form-group">
						<input class="form-control" value="<%=dto.getEmail()%>">
					</div>
				</div>
				<textarea class="form-control" id="comments" name="comments"
					placeholder="Comment" rows="5"><%=dto.getComments() %></textarea>
				</div>
			</div>
		</div>
	</div>
		</tr>
		<%}} %>
 --%>
	
	
	<jsp:include page="/menu/bottom.jsp" />

</body>
</html>