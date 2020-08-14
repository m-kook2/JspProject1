<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원 정보 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="style.css" type="text/css">
<style>
#id2{
	width: 80px;
	float: left;
}
.form-group .form-control{
width : 100%;
height : 100px;
background-color: #e9ecef;
border : 1px solid #ced4da;
border-radius : .25rem;
}
</style>
<%@ include file="/inc/top.jsp" %>
<script type="text/javascript">
function reg() {
	var f= document.frm;
	if(f.id.value==""){
		alert("회원정보가 수정되었습니다");
		f.id.focus();
		return false;
	}
	if(f.nickname.value == ""){
		alert("닉네임을 입력하세요");
		f.nickname.focus();
		return false;
	}
	if(f.email.value == ""){
		alert("이메일을 입력하세요");
		f.email.focus();
		return false;
	}
	f.submit();
}
</script>
</head>
<body style="background-color: black;">
<%@ include file="/inc/header.jsp" %>
	<div class="py-3" style="min-height:800px; width: 100%; background-color: white;">
		<div class="container text-center">
			<div class="row justify-content-center">
				<form action="memMngUpdatePro.do" name="frm" method="post"
					enctype="multipart/form-data">
					<div class="form-group">
						<br>
						<h2>
							<strong>회원정보수정</strong>
						</h2>
						</br>
						<img alt="profilPhoto" src="./images/member/img/${result.pic}" width="400"
							class="rounded mx-auto" />
						<p>
							<br>
							<input type="hidden" name="pic" value="${result.pic}" /> <input
								type="file" name="file1">
					</div>
					<div>
						<div>
							<br />
							<label id="id2" for="id"><strong>아이디</strong></label>
						</div>
						<div>
							<input type="text" style="text-align: center" id="id" name="id"
								class="form-control" value="${result.id }" disabled="disabled">
						</div>
					</div>
					<div>
						<div>
							<br />
							<label id="id2" for="nickname"><strong>닉네임</strong></label>
						</div>
						<div>
							<input type="text" style="text-align: center" id="nickname"
								class="form-control" name="nickname" value="${result.nickname }">
						</div>
					</div>
					<div>
						<div>
							<br />
							<label id="id2" for="zip"><strong>우편번호</strong></label>
						</div>
						<div class="col-75">
							<input type="text" style="text-align: center"
								class="form-control" id="zip" name="zip" placeholder="우편번호"
								value="${result.zip }">
						</div>
					</div>
					<div>
						<div>
							<br />
							<label id="id2" for="addr"><strong>주소</strong></label>
						</div>
						<div>
							<input type="text" style="text-align: center"
								class="form-control" id="addr" name="addr" placeholder="도로명주소"
								value="${result.addr }">
						</div>
					</div>
					<div>
						<div>
							<br />
							<label id="id2" for="email"><strong>이메일</strong></label>
						</div>
						<div>
							<input type="text" style="text-align: center"
								class="form-control" id="email" name="email"
								value="${result.email }">
						</div>
					</div>
					<div>
						<div>
							<br /> <br />
							<label for="gender"><strong>성별</strong></label>
						</div>
						<div style="text-align: center">
							<input type="radio" id="gender" name="gender" value="남자"
								${result.gender eq '남자'?"checked='checked'":'' }>남자&nbsp;&nbsp;
							<input type="radio" id="gender" name="gender" value="여자"
								${result.gender eq '여자'?"checked='checked'":'' }>여자
						</div>
					</div>
					<div>
						<div>
							<br />
							<label for="status"><strong>회원구분</strong></label>
						</div>
						<div style="text-align: center">
							<input type="radio" id="status" name="status" value="1"
								${result.status eq '1'?"checked='checked'":'' }>회원&nbsp;&nbsp;
							<input type="radio" id="status" name="status" value="2"
								${result.status eq '2'?"checked='checked'":'' }>관리자&nbsp;&nbsp;
							<input type="radio" id="status" name="status" value="3"
								${result.status eq '3'?"checked='checked'":'' }>정지
						</div>
						<div>
							<div>
								<br />
								<label for="del_yn"><strong>탈퇴여부(Y:탈퇴)</strong></label>
							</div>
							<div style="text-align: center">
								<input type="radio" id="delYn" name="del_yn" value="Y"
									${result.del_yn eq 'Y'?"checked='checked'":'' }>Y&nbsp;&nbsp;
								<input type="radio" id="delYn" name="del_yn" value="N"
									${result.del_yn eq 'N'?"checked='checked'":'' }>N
							</div>
						</div>
						<br /> <br />
						<button type="button" class="btn btn-dark mx-auto"
							onclick="reg();" style="margin-bottom: 50px;">회원정보수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/inc/footer.jsp"%>
</body>

</html>