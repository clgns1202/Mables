<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 말은 좌우로 120px만큼 움직인다. -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/Mables/js/jquery-3.1.1.js"></script>
<script type="text/javascript">
$().ready(function() {
	var move = "x+";
	var cellX = 9;
	var cellY = 6;
	var pointX = 0;
	var pointY = 0;
	var count = 0;
	$(".moveBtn").click(function() {
		if (move == "x+") {
			pointX += 120;
			count += 1;
			if (count == cellX) {
				count = 0;
				move = "y-";
			}
			$(".object").css(
					"transform",
					"translateX(" + pointX
							+ "px) translateY(" + pointY
							+ "px)");
		} else if (move == "y-") {
			pointY -= 110;
			count += 1;
			$(".object").css(
					"transform",
					"translateX(" + pointX
							+ "px) translateY(" + pointY
							+ "px)");
			if (count == cellY) {
				count = 0;
				move = "x-";
			}

		} else if (move == "x-") {
			pointX -= 120;
			count += 1;
			$(".object").css(
					"transform",
					"translateX(" + pointX
							+ "px) translateY(" + pointY
							+ "px)");
			if (count == cellX) {
				count = 0;
				move = "y+";
			}
		} else if (move == "y+") {
			pointY += 110;
			count += 1;
			$(".object").css(
					"transform",
					"translateX(" + pointX
							+ "px) translateY(" + pointY
							+ "px)");
			if (count == cellY) {
				count = 0;
				move = "x+";
			}
		}
	});
});
</script>

<style>
.moveBtn {
  position: absolute;
  display: block;
  background: #ccc;
  width: 200px;
  height: 130px;
  line-height: 130px;
  font-size: 4em;
  text-align: center;
  color: #FFF;
  opacity: 0.9;
  border-radius: 10px;
  box-shadow: 5px 10px 0 #999;
  transition: box-shadow 0.1s, top 0.1s;
}
.object {
  	position: absolute;
	top:680px;
	left:50px;
  	display: block;
  	width: 100px;
  	height: 100px;
  	line-height: 100px;
  	font-size: 1.5em;
  	text-align: center;
  	background: #ccc;
  	color: #FFF;
  	border-radius: 25px;
  	-webkit-transition: 0.6s;
	-webkit-transform-style: preserve-3d;
	-moz-transition: 0.6s;
	-moz-transform-style: preserve-3d;
	-o-transition: 0.6s;
	-o-transform-style: preserve-3d;
	transition: 0.6s;
	transform-style: preserve-3d;
}

.moveBtn:active {

	box-shadow: 0 1px 0 #999;
}
.actionMove{
    -webkit-animation-name: example; /* Chrome, Safari, Opera */
    -webkit-animation-duration: 4s; /* Chrome, Safari, Opera */
    animation-name: example;
    animation-duration: 4s;
}


/* Chrome, Safari, Opera */
@-webkit-keyframes example {
    0%   { left:0px; top:300px;}
    25%  { left:500px; top:300px;}
    50%  { left:500px; top:500px;}
    75%  { left:0px; top:500px;}
    100% { left:0px; top:300px;}
}

/* Standard syntax */
@keyframes example {
    0%   { left:0px; top:300px;}
    25%  { left:500px; top:300px;}
    50%  { left:500px; top:500px;}
    75%  { left:0px; top:500px;}
    100% { left:0px; top:300px;}
}
</style>
</head>
<body>
<style>

body{
margin:0px;
}
img.gamePan{
width:100%;
height:100%
}
.grimFrame{
	width:100%;
	height:800px;
}

</style>
<div class="grimFrame">
<img class="gamePan" src="/DrinkMable/img/pan.png"/>
</div>

<div class="moveBtn">MOVE</div>


<div class="object">PLAYER</div>

</body>
</html>