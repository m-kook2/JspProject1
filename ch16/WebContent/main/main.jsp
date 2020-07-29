<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/inc/top.jsp" %>
</head>
<body>
<%@ include file="/inc/header.jsp" %>
<div class="container">
  		<c:forEach var="result" items="${list}" varStatus="i">
  		<%-- <c:if test="${i.index%5==0}">
  			<br/>
  		</c:if> --%>
		<div class="row">
			<div class="col-sm-3">
				<a href="#">
					<img src="./images/main/photo/${result.m_photo}" width="270" height="385"/>
				</a>
			</div>
		</div>
		</c:forEach>
</div>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>