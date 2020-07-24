<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
%>
<script type="text/javascript">
	var id='<%=id%>';
	if(id != null && id != ''){
		alert("로그인되었습니다.");
		location.href="main.do";
	}else{
		alert("로그인 실패");
		location.href="loginForm.do";
	}
</script>