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
	<c:if test="${result > 0 }">
		<script>
			alert("글이 정상적으로 삭제되었습니다.")
			location.href = "surveyList.do?pageNum=${pageNum}"
		</script>
	</c:if>
	<c:if test="${result <= 0 }">
		<script>
			alert("글 삭제에 실패했습니다.")
			window.history.back();
		</script>
	</c:if>
삭제 페이지
</body>
</html>