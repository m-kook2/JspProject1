<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(document).ready(function() {
	$("#testText").autocomplete({
		source : function(request, response) {
			$.ajax({
				url : "/autocomplete.do",
				type : "post",
				dataType : "json",
				data: {keyWord : $("#testText").val()},
				success : function(data) {
					var result = data;
					response(result);
				},
			     error:function(request,status,error){
			        alert("code = "+ request.status + " error = " + error); // 실패 시 처리
			     },
			     complete : function(data) {
			        //  실패했어도 완료가 되었을 때 처리
			     }
			});
		}
	});
});
</script>
<div class="jumbotron text-center" style="margin-bottom:0">
  <h1>1조 영화리뷰</h1>
  <p>프로젝트!</p> 
</div>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
	<a class="navbar-brand" href="main.do">Logo</a>
  	<div class="collapse navbar-collapse" id="collapsibleNavbar">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" href="reivewForm.do">영화 리뷰</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">영화 게시판</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="surveyList.do">설문조사</a>
	      </li>    
	    </ul>
	</div>  
  	<form class="form-inline" action="">
    	<input class="form-control mr-sm-2" type="text" id="testText" placeholder="작품제목, 감독, 장르">
    	<button class="btn btn-success" type="submit">Search</button>
	</form>
	<ul class="navbar-nav">
		<c:choose>
			<c:when test="${sessionScope.id != null and sessionScope.id ne ''}">
				<li class="nav-item dropdown" id="mem3">
			      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">마이페이지</a>
			      <div class="dropdown-menu">
			        <a class="dropdown-item" href="#section41">즐겨찾기</a>
			        <a class="dropdown-item" href="memUpdateForm.do">회원정보수정</a>
			        <a class="dropdown-item" href="#section43">회원탈퇴</a>
			      </div>
			    </li>
		      	<li class="nav-item" id="mem4">
		       	 <a class="nav-link" href="logout.do">로그아웃</a>
		      	</li>
		      	<c:if test="${sessionScope.status eq '2'}">
			      	<li class="nav-item dropdown" id="mem5">
				      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">관리자</a>
				      <div class="dropdown-menu">
				        <a class="dropdown-item" href="memMng.do">회원관리</a>
				        <a class="dropdown-item" href="#section42">리뷰관리</a>
				        <a class="dropdown-item" href="#section43">영화정보 관리</a>
				      </div>
				    </li>
			    </c:if>
			</c:when>
			<c:otherwise>
				<li class="nav-item" id="mem1">
		        	<a class="nav-link" href="loginForm.do">로그인</a>
		      	</li>
		      	<li class="nav-item" id="mem2">
		       	 <a class="nav-link" href="memWriteForm.do">회원가입</a>
		      	</li>
			</c:otherwise>
		</c:choose>
    </ul>
</nav>