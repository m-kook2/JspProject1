<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	테스트 코드 : ${result }
	페이지 넘버 : ${pageNum }
	설문조사 등록번호 : ${s_idx }
	<c:if test="${result > 0 }">
		<script>
			alert("투표에 참여해주셔서 감사합니다.");
			location.href = "surveyContent.do?s_idx=${s_idx}&pageNum=${s_pageNum}";
		</script>
	</c:if>

	<c:if test="${result == -3 }">
		<script>
			alert("투표 항목을 정해주세요.");
			window.history.back();
		</script>
	</c:if>
	<c:if test="${result == -2 }">
		<script>
			alert("투표 참여 기한이 지났습니다.");
			window.history.back();
		</script>
	</c:if>
		<c:if test="${result == -1 }">
		<script>
			alert("로그인 후 진행해주세요.");
			window.history.back();
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script>
			alert("투표에 실패하였습니다.(DB ERROR)");
			window.history.back();
		</script>
	</c:if>
	

</body>
</html>