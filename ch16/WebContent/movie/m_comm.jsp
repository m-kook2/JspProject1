<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
		if(!starChk){
			alert("평점");
			return false;
		}
		if (document.getElementById('c_content').value=="") {
			alert("글을 쓰시오");
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
	
	function replySubmit(id, mIdx, cIdx){
		var contentIdx="content"+cIdx;
		var frm= document.sfrm;
		frm.s_id.value=id;
		frm.s_m_idx.value=mIdx;
		frm.s_step.value=cIdx;
		frm.s_content.value=document.getElementById(contentIdx).value;
		frm.action="scommWritePro.do";
		frm.submit();
	}
</script>
</head>
<body>
<!-- 댓글 부분 -->
<div class="container">
	<div style="float: left">	
	<button type="button" class="btn btn-secondary btn-sm dropdown-toggle dropdown-toggle" data-toggle="dropdown" >정렬</button>
		<div class="dropdown-menu">
			<a class="dropdown-item" href="movieInfo.do?str=1&m_idx=${m_idx }&pageNum=${pageNum }">최신순</a>
			<a class="dropdown-item" href="movieInfo.do?str=2&m_idx=${m_idx }&pageNum=${pageNum }">공감순</a>
			<a class="dropdown-item" href="movieInfo.do?str=3&m_idx=${m_idx }&pageNum=${pageNum }">비공감순</a>
		</div>
	</div>
	<form name="write" method="post">
		<input type="hidden" name="m_idx" id="m_idx" value="${m_idx }"/> 
		<input type="hidden" name="id" id="id" value="${id }"/>
		<input type="hidden" name="start" id="start" value=""/>
		<table class="table" border="1" bordercolor="lightgray" >
		<!-- 로그인 했을 경우만 댓글 작성가능 -->
		<c:if test="${sessionScope.id !=null}">
			<tr>
				<!-- 아이디-->
				<td width="250">
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
				<td width="450">
					<div>
						<textarea id="c_content" name="c_content" rows="4" cols="100"></textarea>
					</div>
				</td>
				<!-- 댓글 등록 버튼 -->
				<td width="100">
					<div id="btn" style="text-align: center;">
							<input type="hidden" name="s_m_idx" id="s_m_idx" value=""/>
							<input type="hidden" name="c_grade" id="c_grade" value=""/>
							<input type="hidden" name="c_content" id="c_content" value=""/>
						<input type="button" class="btn m-2 btn-primary mx-auto" onclick="chek();" value="작성">
					</div>
				</td>
			</tr>
		</c:if>

		<!-- 댓글 목록 -->
		<c:forEach var="comm" items="${list }">
			<tr>
				<!-- 아이디, 작성날짜 -->
				<td width="250px">
					<div>
						${comm.id}<br>
					</div>
					<div>
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
						
					</div>
					<div>
						${comm.c_date }
					</div>
				</td>
				<!-- 본문내용 -->
				<td width="800px">
					<div class="text_wrapper">
						<c:if test="${comm.del_yn == 'Y'}">
							삭제된글
						</c:if>
						<c:if test="${comm.del_yn == 'N'}">
							${comm.c_content}<br/>
							<a style="margin-right: 5px" href="commidchek.do?&pageNum=${pageNum}&c_idx=${comm.c_idx}&m_idx=${comm.m_idx}&id=${comm.id }">
							<img alt="" src="images/UpDown/Up.png" width="30"></a>
							<a  style="margin-right: 5px">${comm.c_sympathy}</a>
							<a  style="margin-right: 5px" href="commidchekunsym.do?&pageNum=${pageNum}&c_idx=${comm.c_idx}&m_idx=${comm.m_idx}&id=${comm.id }">
							<img alt="" src="images/UpDown/Down.png" width="30"></a>
							<a style="margin-right: 100px">${comm.c_unsympathy}</a>
							<br/>
							<input type="button" onclick="reply('${comm.c_idx }');" value="답글"/>
						</c:if>
					</div>
				</td>
				<td width="300px">
					<c:if test="${sessionScope.status eq '2' }">
								<button class="btn m-2 btn-primary mx-auto"
								onclick="location.href='commdeletePro.do?&pageNum=${pageNum}&m_idx=${comm.m_idx}&c_idx=${comm.c_idx}'">삭제</button>
					</c:if>			
				</td>
			</tr>
			<!-- 답글 부분 -->
			<tr>
				<td colspan="5">
					<div id="reply${comm.c_idx }" style="display:none;">
						<c:forEach var="result" items="${slist }">
							<c:if test="${comm.c_idx eq result.step}">
								<table class="table">
									<tr>
										<td width="100px">
											
										</td>	
				
										<td width="140px">
											<img src='images/next.png'>
										</td>	
										<td width="100px" align="center" style="padding-top:50px ">
											${sessionScope.id }
										</td>	
										<td width="450px" align="center" style="padding-top:50px ">
											${result.c_content}
										</td>
										<td style="padding-top:50px ">
											${result.c_date}
										</td>
										<td style="padding-top:50px ">
											<c:if test="${sessionScope.status eq '2' }">
											<button class="btn m-2 btn-primary mx-auto"
								onclick="location.href='scommdeletePro.do?&pageNum=${pageNum}&m_idx=${result.m_idx}&c_idx=${result.c_idx}'">삭제</button>
											</c:if>
										</td>
										<td width="80px">
											
										</td>
									</tr>
								</table>
							</c:if>
						</c:forEach>
							<!-- 답글 작성란  -->
							<table class = table style="margin-top:10;" >
							<tr>
								<td colspan="2">
									<img src='images/next.png'>
								</td>
								<td colspan="3">
									${sessionScope.id }
								</td>
								<td>
									<textarea id='content${comm.c_idx}' name='content${comm.c_idx}' rows='4' cols='50'></textarea>
								</td>
								<td colspan="1">
									<input type="button" onclick="replySubmit('${comm.id}','${comm.m_idx }','${comm.c_idx}');" value="답글"/>
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
						<a href='movieInfo.do?pageNum2=${i }&m_idx=${m_idx}'>[${i}]</a>
					</c:forEach>
					<c:if test="${endPage > pageCnt }">
						<a href='movieInfo.do?pageNum2=${startPage+blockSize }&m_idx=${m_idx}'>[다음]</a>
					</c:if>

		</div>		
</body>
</html>