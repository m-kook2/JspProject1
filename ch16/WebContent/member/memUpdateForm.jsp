<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
#id2{
	width: 140px;
	float: left;
}
.form-control{
	width: 50px; 
	/* float: light; */
}
.form-group .label_container,
.form-group .input_container{
width: 100%;
display: flex;
justify-content: space-between;
align-items: center;
}
.form-group .label,
 .form-group .input_container input{
width: 33%;
}

.form-group .input_content_container{
width: 100%;
}
.form-group .input_content{
width : 100%;
height : 100px;
background-color: #e9ecef;
border : 1px solid #ced4da;
border-radius : .25rem;
}
</style>
<script type="text/javascript">
	function mut() {
		var frm = document.f;
		if (frm.password.value != frm.chkpassword.value) {
			alert("패스워드 확인이 필요합니다.");
			frm.chkpassword.value = "";
			frm.chkpassword.focus();
			return false;
		}
		if (frm.id.value == "") {
			alert("아이디를 입력하세요");
			frm.id.value = "";
			frm.id.focus();
			return false;
		}
		if (frm.email.value == "") {
			alert("이메일을 입력하세요");
			frm.email.value = "";
			frm.email.focus();
			return false;
		}
		if (frm.nickname.value == "") {
			alert("닉네임을 입력하세요");
			frm.nickname.value = "";
			frm.nickname.focus();
			return false;
		}
		frm.submit();
	}
</script>
<%@ include file="/inc/top.jsp"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function daumPost(){
    new daum.Postcode({
        oncomplete: function(data) {
        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            //var roadAddr = data.roadAddress; // 도로명 주소 변수
            //var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            /* if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            } */
            // 건물명이 있고, 공동주택일 경우 추가한다.
            /* if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            } */
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            /* if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            } */

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zip').value = data.zonecode;
            document.getElementById("addr").value = data.roadAddress;
            //document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            /* if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            } */

            //var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            /* if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block'; 
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            } */
        }
    }).open();
}
</script>
</head>
<body style="background-color: black;">
	<%@ include file="/inc/header.jsp"%>
	<div class="py-3" style="min-height:800px; width: 100%; background-color: white;">
	<div class="container text-center">
		<div class="row justify-content-center">
			<form action="memUpdatePro.do" name="f" method="post" enctype="multipart/form-data">
				<div class="form-group">
				<br/>
					<h2><strong>회원정보 수정</strong></h2>
					<br /> <img id="pm" alt="profilPhoto" src="./images/member/img/${sessionScope.pic}">
					<p>
						<br /> <input type="hidden" name="pic" value="${sessionScope.pic}" />
						
						<input type="file" class="btn btn-light" name="file1"><p> <br /> 
						<div>
						<label id="id2" for="id2"><strong>아이디</strong></label>
						<input type="text" style="text-align: center;" class="form-control" id="id" name="id" value="${sessionScope.id }" disabled="disabled">
						</div>
					<p>
						<br /> 
						<div class="label_container">
						<label id="id2" for="password"><strong>비밀번호 </strong></label> 
						<label id="id2" for="chkpassword"><strong>비밀번호 확인</strong></label> 
						</div>
						<div class="input_container">
						<input type="password" style="text-align: center; width: 50%;" class="form-control" id="password" name="psssword" value="${sessionScope.password }" disabled="disabled">
						<input type="password" style="text-align: center; width: 50%;" class="form-control" id="chkpassword" name="chkpassword">
						</div>
					<p>
						<br /> 
					<p>
					<div class="form-group">
						<label for="addr" id="id2"><strong>주소</strong></label>					
					<br/>
					<div class="input_container">
						<input type="text" id="zip" name="zip" placeholder="우편번호" value="${sessionScope.zip }">
						<input type="text" id="addr" name="addr" placeholder="도로명주소" value="${sessionScope.addr }">
						<input type="button" class="btn btn-dark" onclick="daumPost();" value="우편번호 찾기">
						</div>
					</div>
						<p>
						<br /> 
						<label id="id2" for="email"><strong>이메일 </strong></label> 
						<input type="text" style="text-align: center;" class="form-control" id="email" name="email" value="${sessionScope.email }">
					<p>
						<br /> <label id="id2" for="nickname"><strong>닉네임</strong> </label> 
						<input type="text" style="text-align: center;" class="form-control" id="nickname" name="nickname" value="${sessionScope.nickname }">
					<p>
						<br /> <label for="gender"><strong>성별</strong> </label>
					<div class="form-check-inline">
						<label class="form-check-label" for="gender"> 남</label>&nbsp;
						<input type="radio"  class="form-check-input" id="gender" name="gender" value="남자" ${sessionScope.gender eq '남자'?"checked='checked'":'' } disabled="disabled" >
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label class="form-check-label" for="gender"> 여</label>&nbsp;
						<input type="radio" class="form-check-input" id="gender" name="gender" value="여자" ${sessionScope.gender eq '여자'?"checked='checked'":'' } disabled="disabled" >
					</div>
				</div>
				<br />
				<button type="button" class="btn btn-dark" onclick="javascript:mut();">정보수정</button>
				<p>
				<br/>
				<br/>
			</form>
		</div>
	</div>
	</div>
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>