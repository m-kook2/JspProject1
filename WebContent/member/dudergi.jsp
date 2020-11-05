<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
html, body {
	box-sizing: border-box;
	background-color: #222222;
	font-family: 'Press Start 2P', cursive;
}

*, *:before, *:after {
	box-sizing: inherit;
}

button {
	font-family: inherit;
	cursor: pointer;
}

h1 {
	color: #f2ecff;
	text-align: center;
	line-height: 1.5;
}

.main {
	position: relative;
	width: 100%;
}

.whack-a-mole {
	background-color: #028f3f;
	margin: 0 auto;
	list-style: none;
	width: 600px;
	border-radius: 20px;
}

.mole {
	float: left;
	width: 160px;
	height: 160px;
	margin: 10px;
	overflow: hidden;
	cursor: pointer;
	border-radius: 20px;
	background: no-repeat center/cover url('../images/hole.jpg');
}

.mole>img {
	position: relative;
	bottom: -5px;
	display: block;
	width: 100%;
	opacity: 0;
	transition: 0.05s ease-out;
}

.whack-a-mole .active {
	bottom: 0;
	opacity: 1;
	animation: shake 0.5s;
	animation-iteration-count: infinite;
}

@
keyframes shake { 0% {
	transform: translate(1px, 1px) rotate(0deg);
}

10%
{
transform


:

 

translate


(-1
px
,
-2
px


)
rotate


(-1
deg
);

 

}
20%
{
transform


:

 

translate


(-3
px
,
0
px


)
rotate


(1
deg
);

 

}
30%
{
transform


:

 

translate


(3
px
,
2
px


)
rotate


(0
deg
);

 

}
40%
{
transform


:

 

translate


(1
px
,
-1
px


)
rotate


(1
deg
);

 

}
50%
{
transform


:

 

translate


(-1
px
,
2
px


)
rotate


(-1
deg
);

 

}
60%
{
transform


:

 

translate


(-3
px
,
1
px


)
rotate


(0
deg
);

 

}
70%
{
transform


:

 

translate


(3
px
,
1
px


)
rotate


(-1
deg
);

 

}
80%
{
transform


:

 

translate


(-1
px
,
-1
px


)
rotate


(1
deg
);

 

}
90%
{
transform


:

 

translate


(1
px
,
2
px


)
rotate


(0
deg
);

 

}
100%
{
transform


:

 

translate


(1
px
,
-2
px


)
rotate


(-1
deg
);

 

}
}
.point-wrap {
	float: left;
	width: 100%;
	height: 60px;
	margin: 20px 0 0 0;
}

.btn-wrap {
	float: right;
	width: 100%;
}

.start-btn {
	width: 50%;
	height: 70px;
	font-size: 20px;
	font-weight: 900;
	margin: 20px 0 30px 0;
	background: #222;
	border: none;
	color: #f2ecff;
	border-radius: 20px;
}

.start-btn:hover {
	opacity: 0.5;
	color: #f9f871;
}

.point-box {
	background-color: #4e4e4e;
	width: 600px;
	margin: 30px auto 0 auto;
	text-align: center;
	border-radius: 20px;
}

#point-text {
	float: left;
	font-size: 24px;
	font-weight: bold;
	color: #f2ecff;
	margin: 15px 0 0 20%;
}

#count-mole {
	float: left;
	font-size: 30px;
	font-weight: bold;
	color: #f9f871;
	margin: 10px 10px 0 60px;
}

#count-mole2 {
	float: left;
	font-size: 24px;
	font-weight: bold;
	color: #f2ecff;
	margin: 15px 0 0 0;
}

.ending {
	display: none;
	position: absolute;
	border-radius: 20px;
	font-size: 20px;
	text-align: center;
	top: 20%;
	left: 30%;
	width: 400px;
	height: 250px;
	margin: 0 auto;
	background: #3d3f43;
	z-index: 2;
}

#ending-box {
	margin: 50px 0 0 0;
	font-size: 30px;
	line-height: 1.8;
	color: #f2ecff;
}

#ending-box .last {
	color: #fbb666;
}

.ending-bg {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.4);
	z-index: 1;
}

.finalEnding {
	display: block;
}
</style>
</head>
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="assets/styles/module.css">
<link rel="stylesheet" href="assets/styles/index.css">
<link
	href="https://fonts.googleapis.com/css?family=Press+Start+2P&display=swap"
	rel="stylesheet">
	<script>
	function bling(){
		  if (flag === 0) {
		    document.querySelector('h1').style.color = '#d6806e';
		    flag ++;
		  } else if(flag === 1) {
		    document.querySelector('h1').style.color = '#fbb666';
		    flag ++;
		  }else if(flag === 2){
		    document.querySelector('h1').style.color = '#f9f871';
		    flag ++;
		  }else{
		    document.querySelector('h1').style.color = '#f2ecff';
		    flag = 0;
		  }
		}
		setInterval(bling, 1000);
		
		var moleNumber;
		var randomNum;
		var preNum;

		function randomHole(){
		  randomNum = Math.floor(Math.random() * 20);
		  if (preNum !== randomNum && randomNum > 0) {
		    preNum = randomNum; 
		    return randomNum;
		  }
		  return randomHole();
		 }

		function moleActive(num){
		    num.classList.add('active');
		}
		function moleHide(num){
		    num.classList.remove('active');
		}
		var moleCatch = 0;

		function showingMole(){
		  if(turn < 20){
		    moleNumber = document.getElementById(`${randomHole()}`);
		    moleActive(moleNumber);
		    moleNumber.addEventListener('click', catchMole);
		    moleCatch = setTimeout(seeMOle, 3000);
		    turn++;
		  }else{
		    modalEvent();
		    startBtn.addEventListener('click', startMole);
		    startBtn.textContent = 'PRESS AGAIN';
		    startBtn.style.color = '#f2ecff';
		  }
		}
		
		var startBtn = document.querySelector('.start-btn');

		startBtn.addEventListener('click', startMole);

		function startMole(){
		  startBtn.removeEventListener('click', startMole);
		  startBtn.style.color = '#3d3f43';
		  getPoint = 0;
		  turn = 0;
		  setTimeout(showingMole, 1000);
		}
		
		var cntBox = document.querySelector('#count-mole');
		function seeMOle(){
		  moleNumber.removeEventListener('click', catchMole);
		  moleHide(moleNumber);
		  clearTimeout(moleCatch);
		  setTimeout(showingMole, 1000);
		}

		function catchMole(){
		  seeMOle();
		  clearTimeout(moleCatch);
		  getPoint++;
		  cntBox.innerHTML = getPoint;
		}
		
		var endingBtn = document.querySelector('#ending-bg');
		var finalEnding = "finalEnding";

		endingBtn.addEventListener('click', hideModal); 

		function modalEvent(){
		  let point = (getPoint / 10) * 100;
		  if (point <= 70){
		    ending.children[0].innerHTML = "<span>GAME OVER </span></br>YOUR SCORE IS&nbsp;&nbsp;<span class='last'>" + point + '</span>!';
		  }else{
		    ending.children[0].innerHTML = "<span>YOU WIN</span></br>YOUR SCORE IS&nbsp;&nbsp;<span class='last'>" + point + '</span>!';
		  }
		  ending.classList.add(finalEnding);
		  endingBtn.classList.add(finalEnding);
		}
		function hideModal(){
		  ending.classList.remove(finalEnding);
		  endingBtn.classList.remove(finalEnding);
		}
	</script>
<body>
	<header>
	<h1 class="title">어서오시개</h1>
	</header>
	<div class="main">
		<div id="ending" class="ending">
			<p id="ending-box"></p>
		</div>
		<div id="ending-bg" class="ending-bg"></div>
		<ul class="whack-a-mole clearfix">
			<li class="mole"><img id="1" src="assets/images/mole.jpg">
			</li>
			<li class="mole"><img id="2" src="assets/images/mole.jpg">
			</li>
			<li class="mole"><img id="3" src="assets/images/mole.jpg">
			</li>
			<li class="mole"><img id="4" src="assets/images/mole.jpg">
			</li>
			<li class="mole"><img id="5" src="assets/images/mole.jpg">
			</li>
			<li class="mole"><img id="6" src="assets/images/mole.jpg">
			</li>
			<li class="mole"><img id="7" src="assets/images/mole.jpg">
			</li>
			<li class="mole"><img id="8" src="assets/images/mole.jpg">
			</li>
			<li class="mole"><img id="9" src="assets/images/mole.jpg">
			</li>
		</ul>
		<div class="point-box clearfix">
			<div class="point-wrap">
				<p id="point-text">Point :</p>
				<p id="count-mole">0</p>
				<p id="count-mole2">/10</p>
			</div>
			<div class="btn-wrap">
				<button type="button" class="start-btn">PRESS START</button>
			</div>
		</div>
	</div>
</body>
</html>