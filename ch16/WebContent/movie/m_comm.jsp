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
.star-input>.input>label[for="p1"]{width:15px;z-index:10;}
.star-input>.input>label[for="p2"]{width:30px;z-index:9;}
.star-input>.input>label[for="p3"]{width:45px;z-index:8;}
.star-input>.input>label[for="p4"]{width:60px;z-index:7;}
.star-input>.input>label[for="p5"]{width:75px;z-index:6;}
.star-input>.input>label[for="p6"]{width:90px;z-index:5;}
.star-input>.input>label[for="p7"]{width:105px;z-index:4;}
.star-input>.input>label[for="p8"]{width:120px;z-index:3;}
.star-input>.input>label[for="p9"]{width:135px;z-index:2;}
.star-input>.input>label[for="p10"]{width:150px;z-index:1;}

.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
.star-output>.input,
.star-output>.input>input:focus+label,
.star-output>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('images/grade_img.png')no-repeat;}
</style>
</head>
<script type="text/javascript">
 function chek() {
		var write = document.write;
		 if (write.star-input.value==null) {
			alert("평점");
			frm.star-input.focus();
			return false;
		}
		if (!write.c_content.value) {
			alert("글을 쓰시오");
			write.c_content.focus();
			return false;
		}/* else{
			document.write.submit();
		} */
		
		
		/* location.href="commwritePro.do"; */
		
}
</script>
<body>

<div style="float: right">
<div>
							
							<c:if test="${comm2.m_grade  == 0 }">
								<img alt="" src="images/grade/grade00_img.png" >
								<b>0점</b>
							</c:if>
							<c:if test="${comm2.m_grade  == 1 }">
								<img alt="" src="images/grade/grade01_img.png" >
								<b>1점</b>
							</c:if>
							<c:if test="${comm2.m_grade  == 2 }">
								<img alt="" src="images/grade/grade02_img.png" >
								<b>2점</b>
							</c:if>
							<c:if test="${comm2.m_grade  == 3 }">
								<img alt="" src="images/grade/grade03_img.png" >
								<b>3점</b>
							</c:if>
							<c:if test="${comm2.m_grade  == 4 }">
								<img alt="" src="images/grade/grade04_img.png">
								<b>4점</b>
							</c:if>
							<c:if test="${comm2.m_grade  == 5 }">
								<img alt="" src="images/grade/grade05_img.png">
								<b>5점</b>
							</c:if>
							<c:if test="${comm2.m_grade  == 6 }">
								<img alt="" src="images/grade/grade06_img.png">
								<b>6점</b>
							</c:if>
							<c:if test="${comm2.m_grade  == 7 }">
								<img alt="" src="images/grade/grade07_img.png">
								<b>7점</b>
							</c:if>
							<c:if test="${comm2.m_grade  == 8 }">
								<img alt="" src="images/grade/grade08_img.png">
								<b>8점</b>
							</c:if>
							<c:if test="${comm2.m_grade  == 9 }">
								<img alt="" src="images/grade/grade09_img.png">
								<b>9점</b>
							</c:if>
							<c:if test="${comm2.m_grade  == 10 }">
								<img alt="" src="images/grade/grade10_img.png">
								<b>10점</b>
							</c:if>
							</div>
<button type="button" class="btn btn-secondary btn-sm dropdown-toggle dropdown-toggle" data-toggle="dropdown" >정렬</button>
<div class="dropdown-menu">
<a class="dropdown-item" href="movieInfo.do?str=1&m_idx=${m_idx }&pageNum=${pageNum }">최신순</a>
<a class="dropdown-item" href="movieInfo.do?str=2&m_idx=${m_idx }&pageNum=${pageNum }">공감순</a>
<a class="dropdown-item" href="movieInfo.do?str=3&m_idx=${m_idx }&pageNum=${pageNum }">비공감순</a>

</div>
</div>
	
	<!-- 댓글 부분 -->
	<div id="comment" >
		<table class="table" border="1" bordercolor="lightgray">

			<!-- 로그인 했을 경우만 댓글 작성가능 -->
			<c:if test="${sessionScope.id !=null}">
				<tr bgcolor="#F5F5F5">
					<form action="commwritePro.do" name="write">
						<%-- <input type="hidden" name="m_idx" value="1"> ${board.board_num} --%>
						<input type="hidden" name="m_idx" value="${m_idx }"> <input
							type="hidden" name="id" value="${id }">

						<%-- ${sessionScope.sessionID} --%>
						<!-- 아이디-->
						<td>
							<div>${id}</div>
							<div>
							<span class="star-input">
								<span class="input">
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
  								
  							<output for="star-input" namd="star-input" id="grade"><b>0</b>점</output>				
							</span>
							<script src="js/jquery-1.11.3.min.js"></script>
							<script src="js/star.js"></script>
							</div>
						</td>
						<!-- 본문 작성-->
						<td>
							<div>
								<textarea id="content" name="c_content" rows="4" cols="150"></textarea>
							</div>
						</td>
						<!-- 댓글 등록 버튼 -->
						<td>
							<div id="btn" style="text-align: center;">
							<!-- <input type="submit" class="btn btn-primary" value="등록"> -->
							<button class="btn btn-primary" onclick="chek();">작성</button>
								<%-- <button class="btn m-2 btn-primary mx-auto"
									onclick="location.href='commwritePro.do?&pageNum=${pageNum}&id=${id }&c_content=${c_content }&m_idx=${m_idx }&c_grade${grade }'">등록</button> --%>
							</div>
						</td>
					</form>
				</tr>
			</c:if>

			<!-- 댓글 목록 -->
			<c:forEach var="comm" items="${list }">

				<tr>
					<!-- 아이디, 작성날짜 -->
					<td>
						<div>
							${comm.id}<br>
							<%-- ${comm.c_date} --%>
							<%-- <font size="2" color="lightgray">${comment.comment_date}</font> --%>
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
					<td>
						<div class="text_wrapper">
							<c:if test="${comm.del_yn == 'y'}">
						삭제된글
					</c:if>
							<c:if test="${comm.del_yn == 'n'}">
						${comm.c_content}
					</c:if>
						<div>
						
							<button class="btn m-2 btn-primary mx-auto"
									onclick="location.href='commidchek.do?&pageNum=${pageNum}&c_idx=${comm.c_idx}&m_idx=${comm.m_idx}&id=${id }'">공감</button>
							${comm.c_sympathy}
							<button class="btn m-2 btn-primary mx-auto"
									onclick="location.href='commidchekunsym.do?&pageNum=${pageNum}&c_idx=${comm.c_idx}&m_idx=${comm.m_idx}&id=${id }'">비공감</button>
							${comm.c_unsympathy}
							<br>
							<button class="btn m-2 btn-primary mx-auto">
							답글
							</button>
							
							
							
						</div>
						
						</div>
					</td>
					<!-- 버튼 -->
					<td>
						<div id="btn" style="text-align: center;">
							<c:if test="${sessionScope.status eq '2'}">
								<a href="#">[답변]</a>
								<br>
							</c:if>
							<c:if test="${sessionScope.status eq '1'}">
								<a href="#">[답변]</a>
								<br>
							</c:if>
							<!-- 댓글 작성자만 수정, 삭제 가능하도록 -->
							<c:if test="${sessionScope.id == comm.id}">
								<%-- <c:if test="${comment.comment_id == sessionScope.sessionID}"> --%>
								<button class="btn m-2 btn-primary mx-auto"
									onclick="location.href='commdeletePro.do?&pageNum=${pageNum}&m_idx=${comm.m_idx}&c_idx=${comm.c_idx}'">삭제</button>
								<br>
							</c:if>
							<%-- </c:if> --%>
						</div>
					</td>
				</tr>

			</c:forEach>
			<%-- </c:if>  --%>



		</table>
	</div>
	<%@ include file="/inc/footer.jsp"%>
</body>
</html>