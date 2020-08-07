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
				<dd class="form-inline mx-auto">
					<input class="form-control m-2 mx-auto" type="date" name="s_sdate"
						required="required" style="width: 49%"/>
					<input class="form-control m-2 mx-auto" type="date" name="s_edate"
						required="required" style="width: 49%"/>
				</dd>
				<!-- 
					날짜 입력폼을 한 줄에 2개 넣기 위한 구현을 함 
					
				 -->
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
	
	// 항목 추가 삭제를 위한 자바스크립트 문
	
	var inp_length = 1; // 최초 투표 항목의 길이
	hideForm(); // inp_length에 맞춰 숫자보다 많은 투표 입력폼을 감춰준다.
	document.getElementById("del1").addEventListener("click", del1handler);
	document.getElementById("del2").addEventListener("click", del2handler);
	document.getElementById("del3").addEventListener("click", del3handler);
	document.getElementById("del4").addEventListener("click", del4handler);
	document.getElementById("del5").addEventListener("click", del5handler);
	document.getElementById("add").addEventListener("click", addHandler);
	
	//삭제 버튼과 추가 버튼에 메소드 할당 
	
	function hideForm() { // inp_length가 감소했을 때 이에 맞춰서 인풋 폼을 감춰주는 메소드
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
	function revealForm() { // inp_length가 증가했을 때 그에 맞춰 인풋 폼을 늘려주는 메소드
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
	
	function addHandler() { // 항목 추가 버튼을 눌렀을 때 inp_length를 늘리고 revealform을 호출한다
		if (inp_length < 5){
		inp_length++;
		}
		revealForm();
	}
	
	
	// 항목 삭제를 했을 때 메커니즘은
	// 삭제된 칼럼 밑에 있는 내용을 한 칸씩 위로 올려 받아오고
	// 맨 밑의 칼럼 내용을 비운 뒤
	// inp_length를 1 낮춰 hideform을 호출하는 것이다.
	// 이를 위해 del#handler에는 자신의 밑에 있는 인풋 폼의 값을 받아오고
	// 그 다음 del#+1handler를 연쇄적으로 호출하도록 해두었다.
	// 가장 마지막 del#handler에서는 inp_length를 1 낮추고, hideform을 호출. 
	// 
	
	
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
	
	/* 
		이 del1handler와 del2handler 는 위에 적힌 함수와 정확히 같은 일을 한다.
		
		function del1handler() {
			document.getElementById("s_op1").value = document.getElementById("s_op2").value;
			document.getElementById("s_op2").value = document.getElementById("s_op3").value;
			document.getElementById("s_op3").value = document.getElementById("s_op4").value;
			document.getElementById("s_op4").value = document.getElementById("s_op5").value;
			document.getElementById("s_op5").value = "";
			if(inp_length >= 2){
				inp_length--;
			}
			hideForm();
			return;
		
		function del2handler() {
			document.getElementById("s_op2").value = document.getElementById("s_op3").value;
			document.getElementById("s_op3").value = document.getElementById("s_op4").value;
			document.getElementById("s_op4").value = document.getElementById("s_op5").value;
			document.getElementById("s_op5").value = "";
			if(inp_length >= 2){
				inp_length--;
			}
			hideForm();
			return;
		
	} */
	
	</script>
</body>
</html>