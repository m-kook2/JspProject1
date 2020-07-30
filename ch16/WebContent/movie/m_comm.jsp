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
<%@ include file="/movie/movieInfo.jsp" %>
	<!-- 댓글 부분 -->
	<div id="comment">
		<table class="table" border="1" bordercolor="lightgray">
		
		<%-- <!-- 로그인 했을 경우만 댓글 작성가능 -->
			<c:if test="${sessionScope.sessionID !=null}"> --%>
			<tr bgcolor="#F5F5F5">
			<form id="writeCommentForm">
				<input type="hidden" name="m_idx" value="1"> <%-- ${board.board_num} --%>
				<input type="hidden" name="id" value="admin"> <%-- ${sessionScope.sessionID} --%>
				<!-- 아이디-->
				<td width="150">
					<div>
						${sessionScope.sessionID}
					</div>
				</td>
				<!-- 본문 작성-->
				<td width="550">
					<div>
						<textarea name="comment_content" rows="4" cols="200" ></textarea>
					</div>
				</td>
				<!-- 댓글 등록 버튼 -->
				<td width="100">
					<div id="btn" style="text-align:center;">
						<p><a href="#" onclick="writeCmt()">[댓글등록]</a></p>	
					</div>
				</td>
			</form>
			</tr>
			<%-- </c:if> --%>
		
	<!-- 댓글 목록 -->	
	<%-- <c:if test="${requestScope.commentList != null}">
		<c:forEach var="comment" items="${requestScope.commentList}"> --%>
		
			<tr>
				<!-- 아이디, 작성날짜 -->
				<td width="150">
					<div>
						${comment.comment_id}<br>
						<font size="2" color="lightgray">${comment.comment_date}</font>
					</div>
				</td>
				<!-- 본문내용 -->
				<td width="550">
					<div class="text_wrapper">
						${comment.comment_content}
					</div>
				</td>
				<!-- 버튼 -->
				<td width="100">
					<div id="btn" style="text-align:center;">
						<a href="#">[답변]</a><br>
					<!-- 댓글 작성자만 수정, 삭제 가능하도록 -->	
					<%-- <c:if test="${comment.comment_id == sessionScope.sessionID}"> --%>
						<a href="#">[수정]</a><br>	
						<a href="#">[삭제]</a>
					<%-- </c:if>		 --%>
					</div>
				</td>
			</tr>
			
	<%-- 	</c:forEach>
	</c:if> --%>
			
			
	
		</table>
	</div>
	<%@ include file="/inc/footer.jsp" %>
</body>
</html>