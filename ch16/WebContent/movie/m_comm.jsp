<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('images/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p0"]{width:1px;z-index:11;}
.star-input>.input>label[for="p1"]{width:15px;z-index:10;}
.star-input>.input>label[for="p2"]{width:30px;z-index:9;}
.star-input>.input>label[for="p3"]{width:45px;z-index:8;}
.star-input>.input>label[for="p4"]{width:60px;z-index:7;}
.star-input>.input>label[for="p5"]{width:75px;z-index:6;}
.star-input>.input>label[for="p6"]{width:90px;z-index:5;}
.star-input>.input>label[for="p7"]{width:105px;z-index:4;}
.star-input>.input>label[for="p8"]{width:120px;z-index:3;}
.star-input>.input>label[for="p9"]{width:135px;z-index:2;}
.star-input>.input>label[for="p10"]{width:200px;z-index:1;}

.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
.star-output>.input,
.star-output>.input>input:focus+label,
.star-output>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('images/grade_img.png')no-repeat;}
</style>
<style>
.dbtn {
	width: 50px;
	height: 50px;


}
.a{
	text-overflow:ellipsis;
  word-wrap:break-word;
  width:550px;

}
.a1{
	text-overflow:ellipsis;
 	 word-wrap:break-word;
  	width:400px;

}

</style>
<script src="/js/star.js"></script>
<script type="text/javascript">
 function chek() {
		var write = document.write;
		var starChk=false;
		for(var i=0; i < 11; i++){
			var p="p"+i;
			if(document.getElementById(p).checked){
				document.getElementById("start").value=document.getElementById(p).value;
				/* alert(document.getElementById("start").value); */
				starChk=true;
			}
		}
		alert(document.getElementById('c_content').value);
		if(!starChk){
			alert("평점을 선택하세요");
			return false;
		}
		if (document.getElementById('c_content').value=="") {
			alert("댓글을 작성하세요");
			document.getElementById('c_content').focus();
			return false;
		}
		write.action="commWritePro.do";
		write.submit();
		
}
</script>
<script type="text/javascript">
	function reply(idx){
		var chk="reply"+idx;
		if(document.getElementById(chk).style.display=="block"){
			document.getElementById(chk).style.display="none";
		}else{
			document.getElementById(chk).style.display="block";
		}
	}
	
	function replySubmit(id, mIdx, cIdx,test){
		var contentIdx="content"+cIdx;
		if(document.getElementById(test).value==""){
			alert("글을쓰시오.");
			return false;
		}else{
		var frm= document.sfrm;
		frm.s_id.value=id;
		frm.s_m_idx.value=mIdx;
		frm.s_step.value=cIdx;
		frm.s_content.value=document.getElementById(contentIdx).value;
		frm.action="scommWritePro.do";
		frm.submit();
		}
	}
</script>
<script>
 function chk(pageNum,m_idx,c_idx) {
	 var write = document.write;
	 var retVal = confirm("정말 삭제하시나요 ?");
	 if(retVal == true){
		 write.action="commdeletePro.do?&pageNum=${pageNum}&m_idx="+m_idx+"&c_idx="+c_idx+"";
		 write.submit();

	 }else{
	    alert("삭제 취소!");
	    location.href="movieInfo.do?m_idx=${m_idx}";
	 }
	
}
</script>
<script>
 function chk2(m_idx,c_idx) {
	 var write = document.write;
	 var retVal = confirm("정말 삭제하시나요 ?");
	 if(retVal == true){
		 write.action="scommdeletePro.do?&pageNum=${pageNum}&m_idx="+m_idx+"&c_idx="+c_idx+"";
		 write.submit();

	 }else{
	    alert("삭제 취소!");
	    location.href="movieInfo.do?m_idx=${m_idx}";
	 }
	
}
</script>
</head>
<body>
<!-- 댓글 부분 -->
<div class="container">
	<div style="float: left">	
	<button type="button" class="btn btn-secondary btn-sm dropdown-toggle dropdown-toggle" data-toggle="dropdown" >정렬</button>
		<div class="dropdown-menu">
			<a class="dropdown-item" href="movieInfo.do?str=c_date&m_idx=${m_idx }&pageNum=${pageNum }">최신순</a>
			<a class="dropdown-item" href="movieInfo.do?str=c_sympathy&m_idx=${m_idx }&pageNum=${pageNum }">공감순</a>
			<a class="dropdown-item" href="movieInfo.do?str=c_unsympathy&m_idx=${m_idx }&pageNum=${pageNum }">비공감순</a>
		</div>
	</div>
	<form name="write" method="post">
		<input type="hidden" name="m_idx" id="m_idx" value="${m_idx }"/> 
		<input type="hidden" name="id" id="id" value="${id }"/>
		<input type="hidden" name="start" id="start" value=""/>
		<table class="table" border="0" bordercolor="lightgray" >
		<!-- 로그인 했을 경우만 댓글 작성가능 -->
		<c:if test="${sessionScope.id !=null}">
			<tr class="text-center">
				<!-- 아이디-->
				<td width="100px">
					<div>${id}</div>
					<div>
						<span class="star-input">
							<span class="input">
								<input type="radio" name="star-input" value="0" id="p0">
		 						<label for="p0">0</label>
		 						<input type="radio" name="star-input" value="1" id="p1">
		 						<label for="p1">1</label>
		 						<input type="radio" name="star-input" value="2" id="p2">
		 						<label for="p2">2</label>
		 						<input type="radio" name="star-input" value="3" id="p3">
		 						<label for="p3">3</label>
		 						<input type="radio" name="star-input" value="4" id="p4">
		 						<label for="p4">4</label>
		 						<input type="radio" name="star-input" value="5" id="p5">
		 						<label for="p5">5</label>
		 						<input type="radio" name="star-input" value="6" id="p6">
		 						<label for="p6">6</label>
		 						<input type="radio" name="star-input" value="7" id="p7">
		 						<label for="p7">7</label>
		 						<input type="radio" name="star-input" value="8" id="p8">
		 						<label for="p8">8</label>
		 						<input type="radio" name="star-input" value="9" id="p9">
		 						<label for="p9">9</label>
		 						<input type="radio" name="star-input" value="10" id="p10">
		 						<label for="p10">10</label>
							</span>
							<span id="msg">0</span>점
 							<!-- <output for="star-input" name="star-input"><b></b>점</output> -->
						</span>
					</div>
				</td>
				<!-- 본문 작성-->
				<td td width="50px">
					<div>
						<textarea id="c_content" name="c_content" rows="4" cols="70"></textarea>
					</div>
				</td>
				<!-- 댓글 등록 버튼 -->
				<td td width="100px">
					<div id="btn" style="text-align: center;">
							<input type="hidden" name="s_m_idx" id="s_m_idx" value=""/>
							<input type="hidden" name="c_grade" id="c_grade" value=""/>
							<input type="hidden" name="c_content" id="c_content" value=""/>
						<input type="button" class="btn m-2 btn-primary mx-auto" onclick="chek();" value="작성">
					</div>
				</td>
			</tr>
			<c:set var="startNum" value="${startNum-1 }"></c:set>
		</c:if>

		<!-- 댓글 목록 -->
		<c:forEach var="comm" items="${list }">
			<tr>
				<!-- 아이디, 작성날짜 -->
				<td class="text-center" style="padding: 30px">
					<div>
						작성자 : ${comm.id}
					</div><br>
					<div class="text-left" style="margin-left: -1px">
						<c:if test="${comm.c_grade  == 0 }">
							<img alt="" src="images/grade/grade00_img.png" width="150px">
							<b>0점</b>
						</c:if>
						<c:if test="${comm.c_grade  == 1 }">
							<img alt="" src="images/grade/grade01_img.png" width="150px">
							<b>1점</b>
						</c:if>
						<c:if test="${comm.c_grade  == 2 }">
							<img alt="" src="images/grade/grade02_img.png" width="150px">
							<b>2점</b>
						</c:if>
						<c:if test="${comm.c_grade  == 3 }">
							<img alt="" src="images/grade/grade03_img.png" width="150px">
							<b>3점</b>
						</c:if>
						<c:if test="${comm.c_grade  == 4 }">
							<img alt="" src="images/grade/grade04_img.png" width="150px">
							<b>4점</b>
						</c:if>
						<c:if test="${comm.c_grade  == 5 }">
							<img alt="" src="images/grade/grade05_img.png" width="150px">
							<b>5점</b>
						</c:if>
						<c:if test="${comm.c_grade  == 6 }">
							<img alt="" src="images/grade/grade06_img.png" width="150px">
							<b>6점</b>
						</c:if>
						<c:if test="${comm.c_grade  == 7 }">
							<img alt="" src="images/grade/grade07_img.png" width="150px">
							<b>7점</b>
						</c:if>
						<c:if test="${comm.c_grade  == 8 }">
							<img alt="" src="images/grade/grade08_img.png" width="150px">
							<b>8점</b>
						</c:if>
						<c:if test="${comm.c_grade  == 9 }">
							<img alt="" src="images/grade/grade09_img.png" width="150px">
							<b>9점</b>
						</c:if>
						<c:if test="${comm.c_grade  == 10 }">
							<img alt="" src="images/grade/grade10_img.png" width="150px">
							<b>10점</b>
						</c:if>
						
					</div><br>
					<div >
						작성일자 : ${comm.c_date }
					</div>
				</td>
				<!-- 본문내용 -->
				<td>
					<div class="text_wrapper">
						<c:if test="${comm.del_yn == 'Y'}">
							<div>
							<textarea class="form-control" cols="50" rows="3" style="margin-bottom: 20px">삭제된글입니다.</textarea>
							<a style="margin-right: 5px" href="javascript:alert('공감 불가능합니다.');">
							<img alt="" src="images/UpDown/Up.png" width="30"></a>
							<a>${comm.c_sympathy}</a>
							<a href="javascript:alert('비공감 불가능합니다.');">
							<img alt="" src="images/UpDown/Down.png" width="30"></a>
							<a>${comm.c_unsympathy}</a>
							</div>			
						</c:if>
						<c:if test="${comm.del_yn == 'N'}">
						<c:set var="sp" value="N"/>
						<c:forEach var="rs" items="${fn:split(comm.overlap,'|')}" >
							<c:if test="${rs eq sessionScope.id}">
								<c:set var="sp" value="Y"/>
							</c:if>
						</c:forEach>
							<div><%-- <textarea class="form-control" cols="50" rows="3">${comm.c_content}</textarea> --%>
								<%-- <span  class="u_cbox_contents" style="word-wrap:break-word;">${comm.c_content}</span> --%>
								<div class="a">${comm.c_content}</div>
							</div><br/>
								<c:choose>
									<c:when test="${sp eq 'N'}">
										<a href="commidchek.do?&pageNum=${pageNum}&c_idx=${comm.c_idx}&m_idx=${comm.m_idx}&id=${sessionScope.id }">
											<img alt="" src="images/UpDown/Up.png" width="30"></a>
										<a>${comm.c_sympathy}</a>
										<a href="commidchekunsym.do?&pageNum=${pageNum}&c_idx=${comm.c_idx}&m_idx=${comm.m_idx}&id=${sessionScope.id }">
											<img alt="" src="images/UpDown/Down.png" width="30"></a>
										<a>${comm.c_unsympathy}</a>
									</c:when>
									<c:otherwise>
										<a style="margin-right: 5px" href="javascript:alert('중복');">
											<img alt="" src="images/UpDown/Up.png" width="30"></a>
										<a  style="margin-right: 5px">${comm.c_sympathy}</a>
										<a  style="margin-right: 5px" href="javascript:alert('중복');">
											<img alt="" src="images/UpDown/Down.png" width="30"></a>
										<a style="margin-right: 100px">${comm.c_unsympathy}</a>
									</c:otherwise>
								</c:choose>
							
							
							<br/>
							<input class="btn m-2 btn-dark mx-auto" type="button" onclick="reply('${comm.c_idx }');" value="답글"/>
						</c:if>
					</div>
				</td>
				<td style="padding-top:75px; padding-left: 15px ">
					<c:if test="${sessionScope.status eq '2' or sessionScope.id eq comm.id}">
								<!-- 댓글삭제  -->
								
								<button class="btn btn-warning" onclick="chk('${pageNum}','${comm.m_idx}','${comm.c_idx}')"><i class="fa fa-trash"></i></button>
								<%-- <button class="btn btn-warning" onclick="location.href='commdeletePro.do?&pageNum=${pageNum}&m_idx=${comm.m_idx}&c_idx=${comm.c_idx}'" ><i class="fa fa-trash"></i></button> --%>
								<%-- <button class="btn btn-warning" onclick="location.href='commdeletePro.do?&pageNum=${pageNum}&m_idx=${comm.m_idx}&c_idx=${comm.c_idx}'" ><i class="fa fa-trash"></i></button> --%>
					</c:if>			
				</td>
			</tr>
			<!-- 답글 리스트 부분-->
			<tr>
				<td colspan="5">
					<div id="reply${comm.c_idx }" style="display:none;">
						<c:forEach var="result" items="${slist }">
							<c:if test="${comm.c_idx eq result.step}">
								<table class="table" style="padding-top: 20px">
									<tr>
										<td width="150px">
											
										</td>	
				
										<td>
											<img src='images/next.png' width="20px">
										</td>	
										<td align="center">
											<div>
												
												${result.id }
											</div>
										</td>	
										<td>
											<div>
												<c:if test="${result.del_yn == 'N'}">
													<div class="a1">${result.c_content}</div>
												</c:if>
												<c:if test="${result.del_yn == 'Y'}">
													<div class="a1">삭제된글입니다. </div>
												</c:if>
												<%-- <textarea class="form-control" rows='3' cols='50'>${result.c_content}</textarea> --%>
												
											</div>
										</td>
										<td>
											
											${result.c_date}
										</td>
										<td>
											<c:if test="${sessionScope.status eq '2' or sessionScope.id eq result.id  }">
											<!-- 답글 삭제 -->
											<button class="btn btn-warning" onclick="chk2('${result.m_idx}','${result.c_idx}')"><i class="fa fa-trash"></i></button>
											<%-- <button class="btn btn-warning" onclick="location.href='scommdeletePro.do?&pageNum=${pageNum}&m_idx=${result.m_idx}&c_idx=${result.c_idx}'"><i class="fa fa-trash"></i></button> --%>
											</c:if>
										</td>
										<td width="80px">
											
										</td>
									</tr>
								</table>
							</c:if>
						</c:forEach>
							<!-- 답글 작성란  -->
							<table class = "table" style="margin-top:10" >
							<tr>
								<td width="100px">
									
								</td>
								<td>
									<img src='images/next.png' width="20px">
								</td>
								<td>
									${sessionScope.id }
								</td>
								<td>
									<textarea class="form-control" id='content${comm.c_idx}' name='content${comm.c_idx}' rows='2' cols='50'></textarea>
								</td>
								<td style="padding-bottom:0px">
									<input type="hidden" name="content${comm.c_idx}" id="content${comm.c_idx}" value=""/>
									<input class="btn m-2 btn-dark mx-auto" type="button" onclick="replySubmit('${comm.id}','${comm.m_idx }','${comm.c_idx}','content${comm.c_idx}');" value="답글 작성"/>
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			</c:forEach>
		</table>
	</form>	
	<form name="sfrm" method="post">
		<input type="hidden" name="s_id" id="s_id" value=""/>
		<input type="hidden" name="s_m_idx" id="s_m_idx" value=""/>
		<input type="hidden" name="s_step" id="s_step" value=""/>
		<input type="hidden" name="s_content" id="s_content" value=""/>
		<input type="hidden" name="id" id="id" value="${sessionScope.id }"/>
	</form>	
	<div id="s_comm" style="display:none;">
		
	</div>						
</div>
				
		<div class="text-center">
					<c:if test="${startPage > blockSize }">
						<a href='movieInfo.do?pageNum2=${startPage-blockSize}&m_idx=${m_idx}'>[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<a href='movieInfo.do?pageNum2=${i }&m_idx=${m_idx}&str=${str}' class="btn m-2 btn-dark mx-auto">${i}</a>
					</c:forEach>
					<c:if test="${endPage > pageCnt }">
						<a href='movieInfo.do?pageNum2=${startPage+blockSize }&m_idx=${m_idx}'>[다음]</a>
					</c:if>

		</div>		
</body>
</html>