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
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
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
});
</script>
</head>
<body>
<header>
  <div class="menu_one">
  	<a href="main.do"><img src="/images/hot.gif" alt="logo"/></a>
  	<div class="serach">
  		<input type="text" id="testText" name="search" value=""/>
  		<input type="button" value="검색"/>
  	</div>
  </div>
  <div class="menu_two">
  	<div class="left_menu">
  		<a href="" class="button">영화 리뷰</a>
  		<a href="" class="button">영화 게시판</a>
	  	<a href="" class="button">설문조사</a>
	  	<a href="" class="button">공지사항</a>
  	</div>
  	<div class="right_menu">
  		<a href="" class="button">로그인</a>
	  	<a href="" class="button">회원가입</a>
	  	<a href="" class="button">로그아웃</a>
  	</div>
  </div>
</header>
</body>
</html>