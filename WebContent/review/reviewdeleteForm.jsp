<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">

var retVal = confirm("정말 삭제하시나요 ?");

if( retVal == true ){
	
   location.href="reviewdeletepro.do?p_idx=${review.p_idx }&pageNum=${pageNum}";

}else{

   alert("삭제 취소!");
   location.href="reivewForm.do?p_idx=${review.p_idx }&pageNum=${pageNum}";
}



</script>

</head>
<body>

</body>
</html>