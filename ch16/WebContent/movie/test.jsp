<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/inc/top.jsp" %>
</head>
<body>
<%@ include file="/inc/header.jsp" %>
<div class="container text-center" style="margin-top: 10px ">
<form name="frm" action="movieInsertProTest.do" method="post">
	<h2>댓글 관리 게시판<img src="https://img.icons8.com/plasticine/60/000000/delete-chat--v2.png"/></h2>
	<input type="submit" value="확인" style="float: right;"/>
	<br>
	<br>
	<table class="table table-bordered">
		<thead>
	      <tr>
	      	<th>구분</th>
	      </tr>
	    </thead>
				<tr>
					<td><input type="checkbox" id="c_idx" name="c_idx" value="111"/></td>
					<td><input type="checkbox" id="c_idx" name="c_idx" value="222"/></td>
					<td><input type="checkbox" id="c_idx" name="c_idx" value="333"/></td>
				</tr>
	</table>
</form>
</div>	
<%@ include file="/inc/footer.jsp" %>
</body>
</html>