<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/inc/top.jsp" %>
</head>
<body>
<%@ include file="/inc/header.jsp" %>
<div class="text-center" style="background-color: black; margin-top: 30px;">
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
<div class="container-fluid" style="background-color: black;z-index:-99999;">
	<div class="container text-center">
	    <div class="row">
	  		<c:forEach var="result" items="${list}" varStatus="i">
			<div class="col-3" style="margin-top:30px;z-index:1;">
				<a href="movieInfo.do?m_idx=${result.m_idx }">
					<img src="./images/main/photo/${result.m_photo}" width="270" height="385"/>
				</a>
				<p class="font-weight-bold text-white">${result.m_name}
					<br/><span class="small text-white">국적: ${result.m_nation}</span>
					<br/><span class="small text-white">장르: ${result.m_genre}</span>
				</p>
				
			</div>
			</c:forEach>
		</div>
	</div>
</div>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>