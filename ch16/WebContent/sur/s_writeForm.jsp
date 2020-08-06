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
	<%@ include file="/inc/adminChk.jsp"%>
	<%@ include file="/inc/header.jsp"%>
	<div class="container">
		<form action="surveyWritePro.do" name="frm" method="post">
		<c:if test="${pageNum == null || pageNum eq '' }">
		<c:set var="pageNum" value="0"></c:set>
		</c:if>
		<input type="hidden" name="pageNum" value="${pageNum }">
			<dl>
				<dt>
					<label for="sub">제목</label>
				</dt>
				<dd>
					<input class="form-control" type="text" name="s_sub"
						required="required" />
				</dd>
			</dl>
			<dl>
				<dt>
					<label for="date_start">설문조사 시작/종료일</label>
				</dt>
				<dd class="form-inline">
					<input class="form-control" type="date" name="s_sdate"
						required="required" style="width: 50%"/>&nbsp;
					<input class="form-control" type="date" name="s_edate"
						required="required" style="width: 50%"/>
				</dd>
			</dl>
			<dl>
				<dt>
					<label for="content">소개글</label>
				</dt>
				<dd>
					<textarea name="s_content" id="" cols="30" rows="10" class="form-control"></textarea>
				</dd>
			</dl>
				<dl>
				<dt>
					<label for="sub">투표 항목</label>
				</dt>
				<dd>
					<div class="input-group" id="ig1">
						<input type="text" class="form-control" name="s_op1" id="s_op1"/>
						<div class="input-group-append">
							<input type="button" class="btn btn-danger" id="del1" value="DEL" />
						</div>
					</div>
				</dd>
				<dd>
					<div class="input-group" id="ig2">
						<input type="text" class="form-control" name="s_op2" id="s_op2"/>
						<div class="input-group-append">
							<input type="button" class="btn btn-danger" id="del2" value="DEL" />
						</div>
					</div>
				</dd>
				<dd>
					<div class="input-group" id="ig3">
						<input type="text" class="form-control" name="s_op3" id="s_op3"/>
						<div class="input-group-append">
							<input type="button" class="btn btn-danger" id="del3" value="DEL" />
						</div>
					</div>
				</dd>
				<dd>
					<div class="input-group" id="ig4" >
						<input type="text" class="form-control" name="s_op4" id="s_op4"/>
						<div class="input-group-append">
							<input type="button" class="btn btn-danger" id="del4" value="DEL" />
						</div>
					</div>
				</dd>
				<dd>
					<div class="input-group" id="ig5">
						<input type="text" class="form-control" name="s_op5" id="s_op5"/>
						<div class="input-group-append">
							<input type="button" class="btn btn-danger" id="del5" value="DEL" />
						</div>
					</div>
				</dd>
				<dd>
				<button type="button" class="form-control btn btn-primary" id="add">항목 추가</button>
				</dd>
			</dl>
			<div class="d-flex justify-content-end">
			<input class="btn btn-success" type="submit" value="작성 완료" /> <input type="reset" class="btn btn-danger" 
				value="작성 취소" />
			</div>
		</form>
	</div>
	<%@ include file="/inc/footer.jsp"%>
	
	<script>
	
	var inp_length = 1;
	hideForm();
	document.getElementById("del1").addEventListener("click", del1handler);
	document.getElementById("del2").addEventListener("click", del2handler);
	document.getElementById("del3").addEventListener("click", del3handler);
	document.getElementById("del4").addEventListener("click", del4handler);
	document.getElementById("del5").addEventListener("click", del5handler);
	document.getElementById("add").addEventListener("click", addHandler);
	
	function hideForm() {
		console.log(inp_length);
		if (inp_length <= 4){
			document.getElementById("ig5").style.display = "none";
		}
		if (inp_length <= 3){
			document.getElementById("ig4").style.display = "none";
		}
		if (inp_length <= 2){
			document.getElementById("ig3").style.display = "none";
		}
		if (inp_length <= 1){
			document.getElementById("ig2").style.display = "none";
		}
		return;
	}
	function revealForm() {
		console.log(inp_length);
		if (inp_length >= 2){
			document.getElementById("ig2").style.display = "flex";
		}
		if (inp_length >= 3){
			document.getElementById("ig3").style.display = "flex";
		}
		if (inp_length >= 4){
			document.getElementById("ig4").style.display = "flex";
		}
		if (inp_length >= 5){
			document.getElementById("ig5").style.display = "flex";
		}
		return;
	}
	function addHandler() {
		if (inp_length < 5){
		inp_length++;
		}
		revealForm();
	}
	
	
	function del1handler() {
		document.getElementById("s_op1").value = document.getElementById("s_op2").value;
		del2handler();
		return;
	}
		
	function del2handler() {
		document.getElementById("s_op2").value = document.getElementById("s_op3").value;
		del3handler();
		return;
	}

	function del3handler() {
		document.getElementById("s_op3").value = document.getElementById("s_op4").value;
		del4handler();
		return;
	}
	function del4handler() {
		document.getElementById("s_op4").value = document.getElementById("s_op5").value;
		del5handler();
		return;
	}
	function del5handler() {
		document.getElementById("s_op5").value = "";
		if(inp_length >= 2){
			inp_length--;
		}
		hideForm();
		return;
	}
	</script>
</body>
</html>