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
<c:if test="${result > 1 }">
<script>
alert("투표에 참여해주셔서 감사합니다.")
location.href = "surveyContent.do?s_idx=${s_idx}&pageNum=${s_pageNum}"
</script>
</c:if>

<c:if test="${result == 0 }">
<script>
alert("비정상적인 접근입니다..")
window.history.back();
</script>
</c:if>
</body>
</html>