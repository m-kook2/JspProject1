<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/inc/top.jsp" %>
</head>
<body>
<%@ include file="/inc/header.jsp" %>
<div class="container" style="margin-top: 50px;">
	<h2 class="text-center">중앙정보처리학원</h2>
	<div id="daumRoughmapContainer1596587706991" class="root_daum_roughmap root_daum_roughmap_landing"></div>
	<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
	
	<!-- 3. 실행 스크립트 -->
	<script charset="UTF-8">
		new daum.roughmap.Lander({
			"timestamp" : "1596587706991",
			"key" : "2zip7",
			"mapWidth" : "1140",
			"mapHeight" : "550"
		}).render();
	</script>
	<p class="font-weight-bold text-center">서울 강남구 테헤란로7길 7 에스코빌딩 6층 (우)06134</p>
	<p class="font-weight-bold text-center">지번역삼동 649-5</p>
</div>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>