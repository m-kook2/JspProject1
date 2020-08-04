<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row{border:none;}
</style>
</head>
<body>
	<%@ include file="/inc/top.jsp"%>
</head>
<body>
	<%@ include file="/inc/header.jsp"%>
	<h2 class="container text-center" style="padding-bottom: 50px; margin-top: 50px;"><strong>Admin Page</strong></h2>
	<div class="container text-center">
		<div class="row">
			<img class="mx-auto" src="images/main/1.png" usemap="#map" style="margin-bottom: 100px;"/>
			<map name="map" id="map">
				<area shape="rect" href="memMng.do" coords="41,20,226,212" />
				<area shape="rect" href="memUpdateForm.do" coords="342,15,505,212" />
				<area shape="rect" href="movieList.do" coords="615,13,792,213" />
				<area shape="rect" href="surveyList.do" coords="63,267,218,481" />
				<area shape="rect" href="commMngList.do" coords="355,266,498,482" />
				<area shape="rect" href="csList.do" coords="631,275,787,480" />
			</map>
		</div>
	</div>
	
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>