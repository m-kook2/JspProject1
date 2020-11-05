<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">

//CSDeleteFormAction에서 c_idx, pageNum, cs의 모든 정보를 받아옴

var retVal = confirm("정말 삭제하시나요 ?");

if( retVal == true ){
	
   location.href="csDeletePro.do?c_idx=${cs.c_idx }&pageNum=${pageNum}";

}else{

   alert("삭제 취소!");
   window.history.go(-1);
}

</script>
</head>
<body>
</body>
</html>