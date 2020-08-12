<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>영화 리뷰 : 회원 가입</title>
<%@ include file="/inc/top.jsp"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
	#id{
		width: 65%;
		float: left;
		text-align: reft;
	}
	#chk{
		width: 35%;
		float: right;
		text-align: reft;
	}
	
</style>
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
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = data.roadAddress;
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
<script type="text/javascript">
	function reg() {
		var frm = document.frm;
		var pass = document.frm.password.value;
		var passChk = document.frm.chkpassword.value;
		var idChk = document.getElementById("msg").innerHTML;
		if (frm.id.value == "") {
			alert("아이디를 입력해주세요.");
			frm.id.value = "";
			frm.password.focus();
			return false;
		}
		if (pass == "") {
			alert("비밀번호를 입력해주세요.");
			frm.password.value = "";
			frm.password.focus();
			return false;
		}
		if (passChk == "") {
			alert("비밀번호확인을 입력해주세요.");
			frm.chkpassword.value = "";
			frm.chkpassword.focus();
			return false;
		}
		if (pass != passChk) {
			alert("비밀번호가 일치하지 않습니다.");
			frm.password.value = "";
			frm.chkpassword.value = "";
			frm.password.focus();
			return false;
		}
		if (frm.email.value == "") {
			alert("email을 입력해주세요.");
			frm.email.value = "";
			frm.email.focus();
			return false;
		}
		if (frm.nickname.value == "") {
			alert("닉네임을 입력해주세요.");
			frm.nickname.value = "";
			frm.nickname.focus();
			return false;
		}
		if (idChk == "") {
			alert("아이디 중복체크를 해주세요.");
			frm.id.focus();
			return false;
		}
		if (idChk == "사용불가") {
			alert("사용불가 아이디 입니다.");
			frm.id.focus();
			return false;
		}
		frm.submit();
	}
	$(function() {
		$('#chk').click(function() {
			var id = $('#id').val();
			if (id != "") {
				$.ajax({
					type : "POST",
					url : "idChk.do",
					data : {
						id : id
					},
					dataType : "text",
					success : function(data) {
						$('#msg').html(data);
					}
				});
			} else {
				alert("id를 입력하세요");
			}
		});
	});
</script>
</head>
<body style="background-color: black;">
	<%@ include file="/inc/header.jsp"%>
	<div class="py-3" style="min-height:750px; width: 100%; background-color: white;">
	<div class="container">
		<div class="row justify-content-center">
			<title>영화 리뷰 : 회원 가입</title>
			<form action="memInsert.do" name="frm" method="post" enctype="multipart/form-data">
			<br/>
					<h2>회원가입 </h2>
					<div class="form-group">
							<!-- <label for="id">아이디</label> --><div>
							<input type="text" id="id" class="form-control" name="id" placeholder="아이디"> 
							<input type="button" class="btn btn-secondary" id="chk" value="중복확인" />
							<b id="msg" style=" position: absolute; top: 20.5%; left: 60%; "></b>
						</div>
					</div>
					<p>
					<br/>
					<div class="form-group">
						<!-- <label for="password">비밀번호</label>  -->
						<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호"> 
						<p>
					<br/>
						<!-- <label for="chkpassword">비밀번호 확인</label>  -->
						<input type="password" class="form-control" id="chkpassword" name="chkpassword" placeholder="비밀번호 확인">
					</div>
					<p>
					<div class="form-group">
						<!-- <label for="id">우편번호</label> -->
						<input type="text" id="postcode" name="postcode" placeholder="우편번호">
						<input type="button" onclick="daumPost();" value="우편번호 찾기"><br/>
						<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소">
					</div>
					<div class="form-group">
						<!-- <label for="email">이메일</label>  -->
						<input type="text" class="form-control" id="email" name="email" placeholder="이메일">
					</div>
					<p>
					
					<div class="form-group">
						<!-- <label for="nickname">닉네임</label>  -->
						<input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임">
					</div>
					<p>
					
					<div class="form-group">
								<input type="file" name="fime1" id="fime1" value="fime1" class="form-control-file border">
					</div>
					<div class="form-check-inline">
						<label class="form-check-label" for="gender"> 
							<input type="radio" class="form-check-input" id="gender" name="gender" value="M" checked="checked">남
						</label>
					</div>
				<div class="form-check-inline">
					<label class="form-check-label" for="gender"> 
						<input type="radio" class="form-check-input" id="gender" name="gender" value="W">여
					</label>
					<p>
						<br />
				</div>
						<button type="button" style="margin-left: 95px;" class="btn btn-primary" onclick="reg();">회원가입</button><br/><br/>
						
			</form>
		</div>
	</div>
	</div>
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>