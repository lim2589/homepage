<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/person/ssi.jsp"%>
<%
	String id = request.getParameter("id");
	if (id == null)
		id = (String) session.getAttribute("id");
	PersonDTO dto = dao.read(id);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">


<style type="text/css">

td {
	height: 40px;
	text-align: left;
	padding-left: 50px;
}
</style>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
	
</script>
<script type="text/javascript">
function inputCheck(f) {
	
	if(f.id.value == ""){
		alert("아이디를 입력하세요");
		f.id.focus();
		return false;
	}
	if(f.passwd.value == ""){
		alert("비밀번호를 입력하세요");
		f.passwd.focus();
		return false;
	}
	if(f.repasswd.value == ""){
		alert("비밀번호확인을 입력하세요");
		f.repasswd.focus();
		return false;
	}
	if(f.passwd.value != f.repasswd.value){
		alert("비밀번호가 일치하지 않으니 다시입력하세요.");
		f.repasswd.value = ""; //비밀번호확인에 다시 입력할수 있도록 빈공간 생성
		f.repasswd.focus(); 
		return false;
	}
	if(f.name.value == ""){
		alert("이름을 입력하세요");
		f.name.focus();
		return false;
	}
	if(f.email.value == ""){
		alert("E-mail을 입력하세요");
		f.email.focus();
		return false;
	}
	
}

function idCheck(id) {
	if(id == ""){
		alert("ID를 입력하세요");
		document.frm.id.focus();
	}else{
		var url = "id_proc.jsp";
		url += "?id=" + id;
	}
	wr = window.open(url,"ID검색","width=500,height=500");
	wr.moveTo((window.screen.width-500)/2 , (window.screen.height-500)/2);
	
}
function emailCheck(email) { //email 중복확인
	
	if(email==""){
		alert ("E-mail을 입력하세요");
		document.frm.email.focus();
		
	}else{
		var url = "email_proc.jsp";
		url += "?email=" + email;
		
		wr = window.open(url,"E-mail검색","width=500,height=500"); 				
		wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);	
																					
	}
	
}



</script>

</head>
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />

	<div class="title">회원가입</div>

	<form action="./updateProc.jsp" method="post"
		onsubmit="return inputCheck(this)" name="frm">
		<input type="hidden" name="id" value="<%=id%>">
		<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
		<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">


		<table>
			<tr>
				<th>사진</th>
				<td><img src="./storage/<%=dto.getFilename()%>"></td>
			</tr>
			<tr>
				<th>*ID</th>
				<td><%=dto.getId()%></td>
			</tr>
			<tr>
				<th>*이름</th>
				<td><%=dto.getName() %></td>
			</tr>
			<tr>
				<th>*E-mail</th>
				<td><input type="text" name="email" size="20" value="<%=dto.getEmail()%>">
					<button type="button"
						onclick="emailCheck(document.frm.email.value)">E-mail중복확인</button>
					<span style="color: red; font-size: 12px">*필수입력입니다.</span></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" size="20" value="<%=dto.getPhone()%>"></td>
			</tr>
			<TR>
				<TH>우편번호</TH>
				<TD><input type="text" name="zipcode" size="7" value="<%=dto.getZipcode() %>"
					placeholder="우편번호" id="sample6_postcode">
					<button type="button" onclick="sample6_execDaumPostcode()">우편번호
						찾기</button></TD>
				<td></td>
			</TR>
			<TR>
				<TH>주소</TH>
				<TD>
					<!-- readonly="readonly" -> --> <input type="text" name="address1"
					size="30" placeholder="주소" id="sample6_address"
					style="margin-bottom: 5px" value="<%=dto.getAddress1()%>"><br> <input type="text"
					name="address2" size="30" placeholder="상세주소" id="sample6_address2" value="<%=dto.getAddress2()%>">
				</TD>
				<td></td>
			</TR>

		</table>



		<div class="bottom">
			<input type='submit' value='수정'> 
			<button type="button" onclick="history.back()">뒤로가기</button>
		</div>
	</form>

	<jsp:include page="/menu/bottom.jsp" />

</body>
</html>