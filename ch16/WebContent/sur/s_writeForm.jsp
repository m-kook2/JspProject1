<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/top.jsp"%>
<style>
</style>
</head>
<body>
	<%@ include file="/inc/header.jsp"%>
	<div class="container">
		<form action="writePro.jsp" name="frm" method="post">
			<dl>
				<dt>
					<label for="sub">제목</label>
				</dt>
				<dd>
					<input class="form-control" type="text" name="sub"
						required="required" />
				</dd>
			</dl>
			<dl>
				<dt>
					<label for="date_start">설문조사 시작/종료일</label>
				</dt>
				<dd>
					<input class="form-control" type="date" name="date_start"
						required="required" />
				</dd>
				<dd>
					<input class="form-control" type="date" name="date_end"
						required="required" />
				</dd>
			</dl>
			<dl>
				<dt>
					<label for="content">소개글</label>
				</dt>
				<dd>
					<textarea name="content" id="" cols="30" rows="10" class="form-control"></textarea>
				</dd>
			</dl>
				<dl>
				<dt>
					<label for="sub">투표 항목</label>
				</dt>
				<dd>
					<div class="input-group">
						<input type="text" class="form-control" />
						<div class="input-group-append">
						<input type="button" class="btn btn-danger" value="DEL"/></div>
					</div>
				</dd>
				<dd>
				<button type="button" class="form-control btn btn-primary">항목 추가</button>
				</dd>
			</dl>
			<div class="d-flex justify-content-end">
			<input class="btn btn-success" type="submit" value="작성 완료" /> <input type="reset" class="btn btn-danger" 
				value="작성 취소" />
			</div>
		</form>
	</div>
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>