<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
response.setHeader("Content-Disposition", "attachment; filename=bookMark.xls"); 
response.setHeader("Content-Description", "JSP Generated Data"); 
response.setContentType("application/vnd.ms-excel");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>즐겨찾기 목록</title>
</head>
<body>
<table class="table table-bordered">
 <tr>
 			
	        <td>아이디</td>
			<td>영화제목</td>
			<td>영화장르</td>
			<td>영화 개봉일</td>
	      </tr>
				<c:forEach var="bd" items="${list }" varStatus="i">
					<tr>
					
						<td>${bd.id}</td>
						<td>${bd.m_name }</td>
						<td>${bd.m_genre }</td>
						<td>${bd.m_date }</td>
					</tr>
					
				</c:forEach>
		</table>
</body>
</html>