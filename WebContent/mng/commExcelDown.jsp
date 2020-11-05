<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%     
    response.setHeader("Content-Disposition", "attachment; filename=comm.xls"); 
    response.setHeader("Content-Description", "JSP Generated Data"); 
    response.setContentType("application/vnd.ms-excel");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글관리 게시판</title>
</head>
<body>
<table class="table table-bordered">
		<thead>
	      <tr>
	        <th>순번</th> 
			<th>회원아이디</th>
			<th>댓글내용</th>
			<th>작성일자</th>	
			<th>삭제여부</th>
	      </tr>
	    </thead>
			<c:forEach var="result" items="${list}" varStatus="i">
				<tr>
					<td>${i.index+1}</td>
					<td>${result.id}</td>
					<td>${result.c_content }</td>
					<td class="left" width=150 >
						${result.date }
					</td>
					<td>
						<c:if test="${result.del_yn eq 'Y'}">
							삭제
						</c:if>
						<c:if test="${result.del_yn eq 'N'}">
							복구
						</c:if>
					</td>
				</tr>
			
			</c:forEach>
	</table>
</body>
</html>