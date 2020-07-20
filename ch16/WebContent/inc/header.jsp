<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.7.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/css/main.css">
<script type="text/javascript">
$(document).ready(function() {
	$("#testText").autocomplete({
		source : function(request, response) {

			$.ajax({

				url : "/autocomplete.do",
				type : "post",
				dataType : "json",
				data: request,

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
	document.getElementById("mem3").style.display="none";
	document.getElementById("mem4").style.display="none";
});
</script>
</head>
<body>
<div class="jumbotron text-center" style="margin-bottom:0">
  <h1>1조 영화리뷰</h1>
  <p>프로젝트!</p> 
</div>
<nav class="navbar navbar-expand-sm bg-info navbar-dark justify-content-left">
	<a class="navbar-brand" href="main.do">Logo</a>
  	<div class="collapse navbar-collapse" id="collapsibleNavbar">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" href="#">영화 리뷰</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">영화 게시판</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">설문조사</a>
	      </li>    
	      <li class="nav-item">
	        <a class="nav-link" href="#">공지사항</a>
	      </li>
	    </ul>
	</div>  
  	<form class="form-inline" action="/action_page.php">
    	<input class="form-control mr-sm-2" type="text" id="testText">
    	<button class="btn btn-success" type="submit">Search</button>
	</form>
	<ul class="navbar-nav">
		<li class="nav-item" id="mem1">
        	<a class="nav-link" href="#">로그인</a>
      	</li>
      	<li class="nav-item" id="mem2">
       	 <a class="nav-link" href="#">회원가입</a>
      	</li>
      	<li class="nav-item" id="mem3">
       	 <a class="nav-link" href="#">마이페이지</a>
      	</li>
      	<li class="nav-item" id="mem4">
       	 <a class="nav-link" href="#">로그아웃</a>
      	</li>
    </ul>
</nav>
</body>
</html>