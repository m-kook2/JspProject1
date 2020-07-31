<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${sessionScope.id == null || sessionScope.id == '' }">
<script>
alert("회원 로그인 해주세요.");
window.history.back();
</script>
</c:if>
<script>
alert("비정상적인 접근입니다.");
window.history.back();
</script>