<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<form action="surveyModifyPro.do" name="frm" method="post" onsubmit="ERA()">
		<c:if test="${pageNum == null || pageNum eq '' }">
		<c:set var="pageNum" value="0"></c:set>
		</c:if>
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="s_idx" value="${s_idx }">
		<input type="hidden" name="id" value="${sessionScope.id }">
			<dl>
				<dt>
					<label for="sub">제목</label>
				</dt>
				<dd>
					<input class="form-control" type="text" name="s_sub"
						value="${board.s_sub }" required="required" />
				</dd>
			</dl>
			<dl>
				<dt>
					<label for="date_start">설문조사 시작/종료일</label>
				</dt>
				<dd class="form-inline">
				<fmt:parseDate value="${board.s_sdate }" pattern="yyyy/MM/dd" var="s_sdate"></fmt:parseDate>
				<fmt:formatDate value="${s_sdate }" pattern="yyyy-MM-dd" var="s_sdate"/>
				<fmt:parseDate value="${board.s_edate }" pattern="yyyy/MM/dd" var="s_edate"></fmt:parseDate>
				<fmt:formatDate value="${s_edate }" pattern="yyyy-MM-dd" var="s_edate"/>
					<input class="form-control" type="date" name="s_sdate"
						required="required" value="${s_sdate }" style="width: 50%"/>
					<input class="form-control" type="date" name="s_edate"
						required="required" value="${s_edate }" style="width: 50%"/>
				</dd>
			</dl>
			<dl>
				<dt>
					<label for="content">소개글</label>
				</dt>
				<dd>
					<textarea name="s_content" id="" cols="30" rows="10" class="form-control">${board.s_content }</textarea>
				</dd>
			</dl>
				<dl>
				<dt>
					<label for="sub">투표 항목</label>
				</dt>
				<dd>
					<div class="input-group" id="ig1">
						<input type="text" class="form-control" name="s_op1" id="s_op1" value="${board.s_op1 }"/>
						<div class="input-group-append">
							<input type="button" class="btn btn-outline-danger" id="del1" value="DEL" />
						</div>
					</div>
				</dd>
				<dd>
					<div class="input-group" id="ig2">
						<input type="text" class="form-control" name="s_op2" id="s_op2" value="${board.s_op2 }"/>
						<div class="input-group-append">
							<input type="button" class="btn btn-outline-danger" id="del2" value="DEL" />
						</div>
					</div>
				</dd>
				<dd>
					<div class="input-group" id="ig3">
						<input type="text" class="form-control" name="s_op3" id="s_op3" value="${board.s_op3 }"/>
						<div class="input-group-append">
							<input type="button" class="btn btn-outline-danger" id="del3" value="DEL" />
						</div>
					</div>
				</dd>
				<dd>
					<div class="input-group" id="ig4" >
						<input type="text" class="form-control" name="s_op4" id="s_op4" value="${board.s_op4 }"/>
						<div class="input-group-append">
							<input type="button" class="btn btn-outline-danger" id="del4" value="DEL" />
						</div>
					</div>
				</dd>
				<dd>
					<div class="input-group" id="ig5">
						<input type="text" class="form-control" name="s_op5" id="s_op5" value="${board.s_op5 }"/>
						<div class="input-group-append">
							<input type="button" class="btn btn-outline-danger" id="del5" value="DEL" />
						</div>
					</div>
				</dd>
				<dd>
				<button type="button" class="form-control btn btn-danger " id="add">항목 추가</button>
				</dd>
			</dl>
			<div class="d-flex justify-content-end">
			<input 	class="btn btn-dark" type="submit" value="완료" /> <input type="button" class="btn btn-dark" 
					value="취소" 		onclick="location.href = 'surveyContent.do?pageNum=${pageNum}&s_idx=${s_idx}'"/>
			</div>
		</form>
	</div>
	<%@ include file="/inc/footer.jsp"%>
	
	<script>
		var inp_length = 5;
		hideForm();
		document.getElementById("del1").addEventListener("click", function() {
			delXhandler(1)
		});
		document.getElementById("del2").addEventListener("click", function() {
			delXhandler(2)
		});
		document.getElementById("del3").addEventListener("click", function() {
			delXhandler(3)
		});
		document.getElementById("del4").addEventListener("click", function() {
			delXhandler(4)
		});
		document.getElementById("del5").addEventListener("click", function() {
			delXhandler(5)
		});
		
		document.getElementById("add").addEventListener("click", addHandler);
		ERA();

		function hideForm() {
			console.log("hideForm=>" + inp_length);
			if (inp_length <= 4) {
				document.getElementById("ig5").style.display = "none";
			}
			if (inp_length <= 3) {
				document.getElementById("ig4").style.display = "none";
			}
			if (inp_length <= 2) {
				document.getElementById("ig3").style.display = "none";
			}
			if (inp_length <= 1) {
				document.getElementById("ig2").style.display = "none";
			}
			if (inp_length <= 0) {
				document.getElementById("ig1").style.display = "none";
			}
			return;
		}
		
		function revealForm() {
			console.log("revealForm=>" + inp_length);
			if (inp_length >= 1) {
				document.getElementById("ig1").style.display = "flex";
			}
			if (inp_length >= 2) {
				document.getElementById("ig2").style.display = "flex";
			}
			if (inp_length >= 3) {
				document.getElementById("ig3").style.display = "flex";
			}
			if (inp_length >= 4) {
				document.getElementById("ig4").style.display = "flex";
			}
			if (inp_length >= 5) {
				document.getElementById("ig5").style.display = "flex";
			}
			return;
		}
		
		function addHandler() {
			if (inp_length < 5) {
				inp_length++;
			}
			revealForm();
		}

		function delXhandler(x) {
			console.log("del" + x + "handler")
			if (x < 5) {
				document.getElementById("s_op" + x).value = 
				document.getElementById("s_op" + (x + 1)).value;
				delXhandler(x + 1);
				
			} else {
				document.getElementById("s_op" + x).value = "";
				if (inp_length >= 1) {inp_length--;}
				hideForm();
			}
			return;
		}

		function ERA() {
			emptyRemover(1);
			emptyRemover(2);
			emptyRemover(3);
			emptyRemover(4);
			emptyRemover(5);
			return;
		}
		function emptyRemover(a) {
			console.log("EmptyRemover " + a)
			
			var isEmpty = 
					(document.getElementById("s_op" + a).value == null ||
					document.getElementById("s_op" + a).value == "") &&
					(a <= inp_length);
			
			console.log("isEmpty=>" + isEmpty);
			
			while ((document.getElementById("s_op" + a).value == null ||
					document.getElementById("s_op" + a).value == "") && 
					(a <= inp_length)) 
			{
				console.log("is Empty!");
				delXhandler(a);
			}
			return;
		}
	</script>
</body>
</html>