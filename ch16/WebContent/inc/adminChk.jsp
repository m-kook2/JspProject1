<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<body>
<c:if test="${sessionScope.status != 2 }">
<script>
alert("관리자 전용 페이지입니다.")
location.href = "../main.do"
</script>
</c:if>
</body>
</html>