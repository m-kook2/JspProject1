<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%     
    response.setHeader("Content-Disposition", "attachment; filename=cs.xls"); 
    response.setHeader("Content-Description", "JSP Generated Data"); 
    response.setContentType("application/vnd.ms-excel");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객의견함</title>
</head>
<body>
<table class="table table-bordered">
	      <tr>
	       <td>번호</td>
			<td>제목</td>
			<td>내용</td>
			<td>작성자</td>
			<td>글 등록일</td>
	      </tr>
				<c:forEach var="cs" items="${list }" varStatus="i">
					<tr>
						<td>${i.index+1}</td>
						<td>${cs.subject}</td>
						<td>${cs.content }</td>
						<td>${cs.writer }</td>
						<td>${cs.reg_date }</td>
					</tr>
					
				</c:forEach>
		</table>
</body>
</html>