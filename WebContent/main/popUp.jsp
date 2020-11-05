<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="style.css" type="text/css">
<title>Insert title here</title>
<script type="text/javascript">
function setCookie(name, value, expiredays){
    var todayDate = new Date();
        todayDate.setDate (todayDate.getDate() + expiredays);
        document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
    }
 
    function closePop(){
        if (document.frm.pop.checked){
        setCookie("popname", "done", 1);
    }
    self.close();
}
</script>
</head>
<body>
<form name="frm" method="post" action="main.do">
<table width="20px;" border="" cellpadding="0" cellspacing="0">
	<tbody>
	<tr>
	    <td><img src="/images/member/img/welcome.png" width="50px;" height="40px;" border="0"></td>
	</tr>
 	<tr>
    	<td height="20" align="right" bgcolor="#000000">
			<table border="0" cellpadding="0" cellspacing="2">
			<tbody>
			      <tr>
			         <td><input class="PopupCheck" type="checkbox" name="pop" onclick="closePop()"></td>
			         <td style="font-size:11px;color:#FFFFFF;">1일동안 이 창을 열지 않음</td>
			         <td style="font-size:20px;"><a href="javascript:self.close();" onfocus="this.blur()">[닫기]</a></td>
			        </tr>
			</tbody>
			</table>
    	</td>
   	</tr>
	</tbody>
</table>
</form>
</body>
</html>