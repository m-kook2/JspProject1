<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${sessionScope.id eq null}">
		<script type="text/javascript">
			alert("로그인을 하세요");
			location.href = "loginForm.do?";
		</script>
</c:if>
<c:if test="${sessionScope.id != null}">
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			location.href = "unsymparthyPro.do?&pageNum=${pageNum}&c_idx=${c_idx}&m_idx=${m_idx}&id=${sessionScope.id }";
		</script>
		<%-- <script type="text/javascript">
			location.href = "unsymparthyPro.do?&pageNum=${pageNum}&c_idx=${c_idx}&m_idx=${m_idx}&id=${sessionScope.id }";
		</script>
		</c:if>
		<c:if test="${result != 0 }">
		<script type="text/javascript">
			alert("중복입니다.");
			location.href = "movieInfo.do?pageNum=${pageNum}&m_idx=${m_idx}";
		</script> --%>
	</c:if>
</c:if>
</body>
</html>