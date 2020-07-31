<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/inc/top.jsp" %>
</head>
<body>
<%@ include file="/inc/header.jsp" %>
<div class="container-fluid" style="background-color: black;z-index:-99999;">
	<div class="container text-center">
	    <div class="row">
	  		<c:forEach var="result" items="${list}" varStatus="i">
			<div class="col-3" style="margin-top:30px;z-index:1;">
				<a href="movieInfo.do?m_idx=${result.m_idx }">
					<img src="./images/main/photo/${result.m_photo}" width="270" height="385"/>
				</a>
				<p class="font-weight-bold text-white">${result.m_name}
					<br/><span class="small text-white">국적: ${result.m_nation}</span>
					<br/><span class="small text-white">장르: ${result.m_genre}</span>
				</p>
				
			</div>
			</c:forEach>
		</div>
	</div>
</div>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>