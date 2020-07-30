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

<div class="container">
        <div class="row">
            <div >

                <div class="carousel slide" data-ride="carousel" id="mycarousel">

                    <ul class="carousel-indicators">
                        <li data-target="#mycarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#mycarousel" data-slide-to="1"></li>
                        <li data-target="#mycarousel" data-slide-to="2"></li>
                        <li data-target="#mycarousel" data-slide-to="3"></li>
                        <li data-target="#mycarousel" data-slide-to="4"></li>
                        <li data-target="#mycarousel" data-slide-to="5"></li>
                        <li data-target="#mycarousel" data-slide-to="6"></li>
                        <li data-target="#mycarousel" data-slide-to="7"></li>
                    </ul>

                    <div class="carousel-inner">
                        <div class="carousel-item active">
                        <img src="images/main/photo/photo1.jpg" alt="0">
                        <img src="images/main/photo/photo2.jpg" alt="0">
                        <img src="images/main/photo/photo3.jpg" alt="0">
                        <img src="images/main/photo/photo4.jpg" alt="0"></div>
                        <div class="carousel-item">
                        <img src="images/main/photo/photo5.jpg" alt="1">
                        <img src="images/main/photo/photo6.jpg" alt="1">
                        <img src="images/main/photo/photo7.jpg" alt="1">
                        <img src="images/main/photo/photo8.jpg" alt="1"></div>
                        <div class="carousel-item">
                        <img src="images/main/photo/photo9.jpg" alt="2">
                        <img src="images/main/photo/photo10.jpg" alt="2">
                        <img src="images/main/photo/photo11.jpg" alt="2">
                        <img src="images/main/photo/photo12.jpg" alt="2"></div>
                        <div class="carousel-item">
                        <img src="images/main/photo/photo13.jpg" alt="3">
                        <img src="images/main/photo/photo14.jpg" alt="3">
                        <img src="images/main/photo/photo15.jpg" alt="3">
                        <img src="images/main/photo/photo16.jpg" alt="3"></div>
                        <div class="carousel-item">
                        <img src="images/main/photo/photo17.jpg" alt="4">
                        <img src="images/main/photo/photo18.jpg" alt="4">
                        <img src="images/main/photo/photo19.jpg" alt="4">
                        <img src="images/main/photo/photo20.jpg" alt="4"></div>
                        <div class="carousel-item">
                        <img src="images/main/photo/photo21.jpg" alt="5">
                        <img src="images/main/photo/photo22.jpg" alt="5">
                        <img src="images/main/photo/photo23.jpg" alt="5">
                        <img src="images/main/photo/photo24.jpg" alt="5"></div>
                        <div class="carousel-item">
                        <img src="images/main/photo/photo25.jpg" alt="6">
                        <img src="images/main/photo/photo26.jpg" alt="6">
                        <img src="images/main/photo/photo27.jpg" alt="6">
                        <img src="images/main/photo/photo28.jpg" alt="6"></div>
                        <div class="carousel-item">
                        <img src="images/main/photo/photo29.jpg" alt="7">
                        <img src="images/main/photo/photo30.jpg" alt="7"></div>
                    

                    <a class="carousel-control-prev" data-slide="prev" href="#mycarousel">
                    <span class="carousel-control-prev-icon"></span>
                    </a>

                    <a class="carousel-control-next" data-slide="next" href="#mycarousel">
                    <span class="carousel-control-next-icon"></span>    
                </a>
                </div>
            </div>
        </div>
    </div>

</div>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
	<a class="navbar-brand" href="main.do"><img alt="POPcorn Review" src="/images/main/logo.png" width="60" height="60"> </a>
  	<div class="collapse navbar-collapse" id="collapsibleNavbar">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" href="r_list.do">영화 리뷰</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="movieList.do">영화 게시판</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="surveyList.do">설문조사</a>
	      </li>    
	    </ul>
	</div>  
  	<form class="form-inline" action="movieList.do">
    	<input class="form-control mr-sm-2" type="text" id="testText" name="testText" placeholder="작품제목, 감독, 장르">
    	<button class="btn btn-success" type="submit">Search</button>
	</form>
	<ul class="navbar-nav">
		<c:choose>
			<c:when test="${sessionScope.id != null and sessionScope.id ne ''}">
				<!-- <li class="nav-item dropdown" id="mem3">
			      <a class="nav-link dropdown-toggle" href="memPage.do" id="navbardrop" data-toggle="dropdown">마이페이지</a>
			      <div class="dropdown-menu">
			        <a class="dropdown-item" href="bookMarkList.do">즐겨찾기</a>
			        <a class="dropdown-item" href="memUpdateForm.do">회원정보수정</a>
			        <a class="dropdown-item" href="memDeleteForm.do">회원탈퇴</a>
			      </div>
			    </li> -->
			    <li class="nav-item" id="mem0">
		        	<a class="nav-link" href="memPageForm.do">마이페이지</a>
		      	</li>
			    
		      	<li class="nav-item" id="mem4">
		       	 <a class="nav-link" href="logout.do">로그아웃</a>
		      	</li>
		      	<c:if test="${sessionScope.status eq '2'}">
			      	<li class="nav-item dropdown" id="mem5">
				      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">관리자</a>
				      <div class="dropdown-menu">
				        <a class="dropdown-item" href="memMng.do">회원 관리</a>
				        <a class="dropdown-item" href="r_list.do">영화 리뷰 관리</a>
				        <a class="dropdown-item" href="movieList.do">영화게시판 관리</a>
				        <a class="dropdown-item" href="surveyList.do">설문조사 관리</a>
				        <a class="dropdown-item" href="commMngList.do">댓글 관리</a>
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