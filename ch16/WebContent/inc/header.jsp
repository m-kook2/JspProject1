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
<div class="text-center jumbotron bg-light" style="margin-bottom:0; background-image: url(../images/main4.jpg); background-repeat: no-repeat; background-size : cover;">
  <h1>""</h1>

<div class="container">
        <div class="row">
         	<div class="col-12">
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
                        <li data-target="#mycarousel" data-slide-to="8"></li>
                    </ul>

                    <div class="carousel-inner">
                        <div class="carousel-item active">
                       <img src="images/main/photo/1.jpg" alt="0" width="800" height="450"></div>
                        <div class="carousel-item">
                        <img src="images/main/photo/2.jpg" alt="2" width="800" height="450"></div>
                        <div class="carousel-item">
                        <img src="images/main/photo/3.png" alt="7" width="800" height="450"></div>
                        <div class="carousel-item">
                        <img src="images/main/photo/4.jpg" alt="3" width="800" height="450"></div>
                        <div class="carousel-item">
                        <img src="images/main/photo/5.jpg" alt="8" width="800" height="450"></div>
                        <div class="carousel-item">
                        <img src="images/main/photo/6.jpg" alt="5" width="800" height="450"></div>
                        <div class="carousel-item">
                        <img src="images/main/photo/7.png" alt="1" width="800" height="450"></div>
                        <div class="carousel-item">
                        <img src="images/main/photo/8.jpg" alt="6" width="800" height="450"></div>
                        <div class="carousel-item">
                        <img src="images/main/photo/9.jpg" alt="4" width="800" height="450"></div>
                        
                    
                
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
</div>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top font-weight-bold">
	<a class="navbar-brand" href="main.do"><img alt="POPcorn Review" src="/images/main/logo.png" width="60" height="60"> </a>
  	<div class="collapse navbar-collapse" id="collapsibleNavbar">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link text-white" href="r_list.do">영화 리뷰</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link text-white" href="movieList.do">영화 게시판</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link text-white" href="surveyList.do">설문조사</a>
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
		        	<a class="nav-link text-white" href="memPageForm.do">마이페이지</a>
		      	</li>
			    
		      	<li class="nav-item" id="mem4">
		       	 <a class="nav-link text-white" href="logout.do">로그아웃</a>
		      	</li>
		      	<c:if test="${sessionScope.status eq '2'}">
			      	<li class="nav-item dropdown" id="mem5">
				      <a class="nav-link dropdown-toggle text-white" href="#" id="navbardrop" data-toggle="dropdown">관리자</a>
				      <div class="dropdown-menu">
				        <a class="dropdown-item" href="memMng.do">회원 관리</a>
				        <a class="dropdown-item" href="r_list.do">영화 리뷰 관리</a>
				        <a class="dropdown-item" href="movieList.do">영화게시판 관리</a>
				        <a class="dropdown-item" href="surveyList.do">설문조사 관리</a>
				        <a class="dropdown-item" href="commMngList.do">댓글 관리</a>
				        <a class="dropdown-item" href="csListForm.do">의견 관리</a>
				      </div>
				    </li>
			    </c:if>
			</c:when>
			<c:otherwise>
				<li class="nav-item" id="mem1">
		        	<a class="nav-link text-white" href="loginForm.do">로그인</a>
		      	</li>
		      	<li class="nav-item" id="mem2">
		       	 <a class="nav-link text-white" href="memWriteForm.do">회원가입</a>
		      	</li>
			</c:otherwise>
		</c:choose>
    </ul>
</nav>