<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>벽돌꺠기</title>
 <style>
      * {
        padding: 0;
        margin: 0;
      }
      canvas {
        background-color: #eee;
        display: block;
        margin: 0 auto;
      }
    </style>
</head>
<body>
 <canvas id="myCanvas" width="480" height="320"></canvas>
  <script>
      var canvas = document.getElementById("myCanvas");
      var ctx = canvas.getContext("2d");
      var x = canvas.width / 2;
      var y = canvas.height - 30;
      var dx = 2;
      var dy = -2;
      var ballRadius = 10;
      var paddleHeight = 10;
      var paddleWidth = 550;
      var rightPressed = false;
      var leftPressed = false;
      var brickRowCount = 5;
      var brickColumnCount = 5;
      var brickWidth = 75;
      var brickHeight = 20;
      var brickPadding = 10;
      var brickOffsetTop = 30;
      var brickOffsetLeft = 30;
      var score = 0;
      var colorSet = false;
      var lives = 3;

      // 2차원 배열 table 선언 - 열(c) 행(R) 블럭의 행,열에 대한 이차원 배열 삽입 (벽돌만들기)
      var bricks = [];
      for (var c = 0; c < brickColumnCount; c++) {
        bricks[c] = [];
        for (var r = 0; r < brickRowCount; r++) {
          bricks[c][r] = { x: 0, y: 0, status: 1 };
        }
      }
      // 블럭 화면에 그려줌
      function drawBricks() {
        for (var c = 0; c < brickColumnCount; c++) {
          for (var r = 0; r < brickRowCount; r++) {
            //status가 1이면 블럭을 그리고 0이면 그리지 않는다.
            if (bricks[c][r].status === 1) {
              var brickX = c * (brickWidth + brickPadding) + brickOffsetLeft;
              var brickY = r * (brickHeight + brickPadding) + brickOffsetTop;
              bricks[c][r].x = brickX;
              bricks[c][r].y = brickY;
              ctx.beginPath();
              ctx.rect(brickX, brickY, brickWidth, brickHeight);
              //블록색
              ctx.fillStyle = "brown";
              ctx.fill();
              ctx.closePath();
            }
          }
        }
      }

      //x축위 시작 위치
      var paddleX = (canvas.width - paddleWidth) / 2;

      function drawBall() {
        ctx.beginPath();
        ctx.arc(x, y, ballRadius, 0, Math.PI * 2);

        // if (dx > 0 && dy > 0) {
        //   ctx.fillStyle = "#0095DD";
        // } else if (dx < 0 && dy > 0) {
        //   ctx.fillStyle = "yellow";
        // } else if (dx > 0 && dy < 0) {
        //   ctx.fillStyle = "green";
        // } else if (dx < 0 && dy < 0) {
        //   ctx.fillStyle = "pink";
        // }
        if (!colorSet) {
          ctx.fillStyle = "yellow";
        } else {
          var ranColor = Math.floor(Math.random() * 255);
          var ranColor1 = Math.floor(Math.random() * 255);
          var ranColor2 = Math.floor(Math.random() * 255);
          ctx.fillStyle = `rgb(${ranColor},${ranColor1},${ranColor2})`;
        }
        ctx.fill();
        ctx.closePath();
      }

      function drawPaddle() {
        ctx.beginPath();
        ctx.rect(
          paddleX,
          canvas.height - paddleHeight,
          paddleWidth,
          paddleHeight
        );
        // padddle color
        ctx.fillStyle = "purple";
        ctx.fill();
        ctx.closePath();
      }

      function draw() {
        //위치 바뀌기 전 공 삭제
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        drawBall();
        drawPaddle();
        drawBricks();
        drawScore();
        drawLives();
        collisionDetection();
        if (x + dx > canvas.width - ballRadius || x + dx < ballRadius) {
          dx = -dx;
        }
        if (y + dy < ballRadius) {
          dy = -dy;
        } else if (y + dy > canvas.height - ballRadius) {
          if (x > paddleX && x < paddleX + paddleWidth) {
            dy = -dy * 1.1;
          } else {
            lives--;
            if (!lives) {
              alert("GAME OVER");
              document.location.reload();
            } else {
              x = canvas.width / 2;
              y = canvas.height - 30;
              dx = 3;
              dy = -3;
              paddleX = (canvas.width - paddleWidth) / 2;
            }
          }
        }

        if (rightPressed && paddleX < canvas.width - paddleWidth) {
          paddleX += 7;
          //leftPressed 가 투르고 뒤가 0보다 크면
        } else if (leftPressed && paddleX > 0) {
          paddleX -= 7;
        }
        x += dx;
        y += dy;
        requestAnimationFrame(draw);
      }
      draw();
      function keyDownHandler(e) {
        if (e.keyCode === 39) {
          rightPressed = true;
        } else if (e.keyCode === 37) {
          leftPressed = true;
        }
      }
      function keyUpHandler(e) {
        if (e.keyCode === 39) {
          rightPressed = false;
        } else if (e.keyCode === 37) {
          leftPressed = false;
        }
      }
      document.addEventListener("mousemove", mouseMoveHandler, false);
      function mouseMoveHandler(e) {
        var relativeX = e.clientX - canvas.offsetLeft;
        if (relativeX > 0 && relativeX < canvas.width) {
          paddleX = relativeX - paddleWidth / 2;
        }
      }

      // 블럭에 충돌 감지 함수
      // 공이 벽돌안에 존재하려면?
      // 공의 x,y좌표는 벽돌의 x,y좌표보다 커야한다.
      // 공의 x,y좌표는 벽돌의 x,y좌표 + 가로길이, 세로길이 보다 작아야한다.
      function collisionDetection() {
        for (var c = 0; c < brickColumnCount; c++) {
          for (var r = 0; r < brickRowCount; r++) {
            var b = bricks[c][r];
            if (b.status === 1) {
              if (
                x > b.x &&
                x < b.x + brickWidth &&
                y > b.y &&
                y < b.y + brickHeight
              ) {
                colorSet = true;
                dy = -dy;
                //벽돌에 맞으면 status를 0으로 바꾼다.
                b.status = 0;
                score++;
                if (score === brickRowCount * brickColumnCount) {
                  alert("다깸");
                  document.location.reload();
                }
              }
            }
          }
        }
      }

      function drawScore() {
        ctx.font = "16px Arial";
        ctx.fillStyle = "green";
        ctx.fillText("Score: " + score, 8, 20);
      }

      function drawLives() {
        ctx.font = "16px Arial";
        ctx.fillStyle = "#0095DD";
        ctx.fillText("Lives: " + lives, canvas.width - 65, 20);
      }
      document.addEventListener("keydown", keyDownHandler, false);
      document.addEventListener("keyup", keyUpHandler, false);
    </script>
</body>
</html>