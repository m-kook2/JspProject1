<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 댓글 부분 -->
	<div id="comment">
		<table class="table" border="1" bordercolor="lightgray">
		
		<!-- 로그인 했을 경우만 댓글 작성가능 -->
			<c:if test="${sessionScope.id !=null}"> 
			<tr bgcolor="#F5F5F5">
			<form id="writeCommentForm" action="commwritePro.do">
				<%-- <input type="hidden" name="m_idx" value="1"> ${board.board_num} --%>
				<input type="hidden" name="m_idx" value="${m_idx }">
				<input type="hidden" name="id" value="${id }">
			
				 <%-- ${sessionScope.sessionID} --%>
				<!-- 아이디-->
				<td width="150">
					<div>
						${id}
					</div>
				</td>
				<!-- 본문 작성-->
				<td width="550">
					<div>
						<textarea name="c_content" rows="4" cols="200" ></textarea>
					</div>
				</td>
				<!-- 댓글 등록 버튼 -->
				<td width="100">
					<div id="btn" style="text-align:center;">
						<button class="btn m-2 btn-primary mx-auto" onclick="location.href='commwritePro.do?&pageNum=${pageNum}&id=${id }&c_content=${c_content }&m_idx=${m_idx }'">등록</button>
					</div>
				</td>
			</form>
			</tr>
			</c:if>
		
	<!-- 댓글 목록 -->	
	<%-- <c:if test="${requestScope.commentList != null}">--%>
		<c:forEach var="comm" items="${list }">
		
			<tr>
				<!-- 아이디, 작성날짜 -->
				<td width="150">
					<div>
						${comm.id}<br>
						<%-- <font size="2" color="lightgray">${comment.comment_date}</font> --%>
					</div>
				</td>
				<!-- 본문내용 -->
				<td width="550">
					<div class="text_wrapper">
					<c:if test="${comm.del_yn == 'y'}">
						삭제된글
					</c:if>
					<c:if test="${comm.del_yn == 'n'}">
						${comm.c_content}
					</c:if>
						
					</div>
				</td>
				<!-- 버튼 -->
				<td width="100">
					<div id="btn" style="text-align:center;">
					<c:if test="${sessionScope.status eq '2'}">
						<a href="#">[답변]</a><br>
					</c:if>
					<c:if test="${sessionScope.status eq '1'}">
						<a href="#">[답변]</a><br>
					</c:if>
					<!-- 댓글 작성자만 수정, 삭제 가능하도록 -->	
					<c:if test="${sessionScope.id == comm.id}">
					<%-- <c:if test="${comment.comment_id == sessionScope.sessionID}"> --%>
						<button class="btn m-2 btn-primary mx-auto" onclick="location.href='commdeletePro.do?&pageNum=${pageNum}&m_idx=${comm.m_idx}&c_idx=${comm.c_idx}'">삭제</button><br>	
						<a href="#">[삭제]</a>
					</c:if>
					<%-- </c:if> --%>
					</div>
				</td>
			</tr>
			
		</c:forEach>
	<%-- </c:if>  --%>
			
			
	
		</table>
	</div>
	<%@ include file="/inc/footer.jsp" %>
</body>
</html>