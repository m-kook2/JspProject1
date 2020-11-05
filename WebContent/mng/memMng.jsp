<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원 리스트</title>
<%@ include file="/inc/top.jsp" %>
<script>
	function excelDown(){
		document.frm.action="/memExcelDown.do";
		document.frm.method="post";
		document.frm.submit();
	}
</script>
</head>
<body style="background-color: black;">
<%@ include file="/inc/header.jsp" %>
<div class="py-3" style="min-height:800px; width: 100%; background-color: white;">
<div class="container text-center">
<h2 style="margin-top: 50px;">회원관리</h2>
<p><input type="button" value="엑셀 다운로드" onclick="excelDown();" style="float: left; margin-bottom: 10px;" class="btn btn-secondary m-1 btn-sm" /></p>
<form name="frm">
	<table class="table table-hover">
		<thead>
	      <tr>
	      	<th>번호</th> 
			<th>아이디</th>
			<th>이메일</th>
			<th>닉네임</th>
			<th>우편번호</th>
			<th>주소</th>	
			<th>성별</th>
			<th>가입날짜</th>
			<th>회원상태</th>
	      </tr>
	    </thead>
		
		<c:if test="${totCnt > 0 }">
			<c:forEach var="mng" items="${list}">
				<tr>
					<td>${startNum}</td>
					<td>
						<a href="memMngViewForm.do?id=${mng.id}">${mng.id}</a> 
					</td>
					<td>${mng.email }</td>
					<td>${mng.nickname }</td>
					<td>${mng.zip }</td>
					<td>${mng.addr }</td>
					<td>${mng.gender }</td>
					<td>${mng.reg_date }</td>
					<td>
					<c:if test="${mng.status=='1'}">회원</c:if>
					<c:if test="${mng.status=='2'}">관리자</c:if>
					<c:if test="${mng.status=='3'}">정지</c:if>
					</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1 }" />
			</c:forEach>
		</c:if>
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan=9>데이터가 없습니다</td>
			</tr>
		</c:if>
	</table>
</form>	
	<div style="text-align: center; margin-bottom: 50px;">
		<c:if test="${startPage > blockSize }">
			<a href='memMng.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='memMng.do?pageNum=${i}' class="btn btn-dark mx-auto">${i}</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='memMng.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div>
</div>
</div>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>