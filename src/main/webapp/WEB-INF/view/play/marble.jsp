<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="/Mables/css/marble.css" />
<link rel="stylesheet" type="text/css"
	href="/Mables/bamcoding_css/cube.css" />
<link rel="stylesheet" type="text/css"
	href="/Mables/bamcoding_css/flip.css" />
<link rel="stylesheet" type="text/css"
	href="/Mables/bamcoding_css/gamePan.css" />

<script type="text/javascript">
	$(document).ready(
			function() {
				var move = "x+";
				var cellX = 6;
				var cellY = 6;
				var pointX = 0;
				var pointY = 0;
				var pxX = 146;
				var pxY = 102;
				var count = 0;

				function moveUnit() {
					if (move == "x+") {
						pointX += pxX;
						count += 1;
						if (count == cellX) {
							count = 0;
							move = "y-";
						}
						$(".object").css(
								"transform",
								"translateX(" + pointX + "px) translateY("
										+ pointY + "px)");
					} else if (move == "y-") {
						pointY -= pxY;
						count += 1;
						$(".object").css(
								"transform",
								"translateX(" + pointX + "px) translateY("
										+ pointY + "px)");
						if (count == cellY) {
							count = 0;
							move = "x-";
						}

					} else if (move == "x-") {
						pointX -= pxX;
						count += 1;
						$(".object").css(
								"transform",
								"translateX(" + pointX + "px) translateY("
										+ pointY + "px)");
						if (count == cellX) {
							count = 0;
							move = "y+";
						}
					} else if (move == "y+") {
						pointY += pxY;
						count += 1;
						$(".object").css(
								"transform",
								"translateX(" + pointX + "px) translateY("
										+ pointY + "px)");
						if (count == cellY) {
							count = 0;
							move = "x+";
						}
					}

					console.log("point { X : " + pointX + ", Y :" + pointY
							+ " }");
				}

				// 카드 플립부분
				var check = 0;
				$("#container").click(function() {
					if (check == 0) {
						$("#flipper").addClass("clickFlip");
						check = 1;
					} else if (check == 1) {
						$("#flipper").removeClass("clickFlip");
						check = 0;
					}
				});

				var preNum = 0;
				//던지기 부분
				$(".cubeFrame").click(function() {

					$.post("/Mables/doThrowCube", function(data) {

						var showTime = 1000;
						var number = parseInt(data);
						$("#bling").addClass("bling");
						$("#cube").addClass("actionMove");

						setTimeout(function() {
							$("#cube").removeClass("actionMove");
						}, showTime);

						console.log("전꺼:" + preNum + " 지금:" + number);
						$("#cube").removeClass("cube");
						if (preNum != 0) {
							$("#cube").addClass("show" + number);
							$("#cube").removeClass("show" + preNum + "");
						} else {
							$("#cube").addClass("show" + number);
						}
						preNum = number;

						for (var i = 0; i < number; i++) {
							showTime += 400;
							setTimeout(moveUnit, showTime);
						}
						setTimeout(function() {
							$("#bling").removeClass("bling");
						}, showTime + 700);

						
						
						
					});

				});

			});
</script>
<div id="marble">
	<div id="gamePan">
		<table border="1">
			<tr>
				<td id="cell0">${plays[0].games.gameName }</td>
				<td id="cell1">${plays[1].games.gameName }</td>
				<td id="cell2">${plays[2].games.gameName }</td>
				<td id="cell3">${plays[3].games.gameName }</td>
				<td id="cell4">${plays[4].games.gameName }</td>
				<td id="cell5">${plays[5].games.gameName }</td>
				<td id="cell6">${plays[6].games.gameName }</td>
			</tr>
			<tr>
				<td id="cell23">${plays[23].games.gameName }</td>
				<th colspan="5" rowspan="5"></th>
				<td id="cell7">${plays[7].games.gameName }</td>
			</tr>
			<tr>
				<td id="cell22">${plays[22].games.gameName }</td>
				<td id="cell8">${plays[8].games.gameName }</td>
			</tr>
			<tr>
				<td id="cell21">${plays[21].games.gameName }</td>
				<td id="cell9">${plays[9].games.gameName }</td>
			</tr>
			<tr>
				<td id="cell20">${plays[20].games.gameName }</td>
				<td id="cell10">${plays[10].games.gameName }</td>
			</tr>
			<tr>
				<td id="cell19">${plays[19].games.gameName }</td>
				<td id="cell11">${plays[11].games.gameName }</td>
			</tr>
			<tr>
				<td id="cell18">${plays[18].games.gameName }</td>
				<td id="cell17">${plays[17].games.gameName }</td>
				<td id="cell16">${plays[16].games.gameName }</td>
				<td id="cell15">${plays[15].games.gameName }</td>
				<td id="cell14">${plays[14].games.gameName }</td>
				<td id="cell13">${plays[13].games.gameName }</td>
				<td id="cell12">${plays[12].games.gameName }</td>
			</tr>


		</table>

		<div class="object">PLAYER</div>

		<!-- 큐브 부분 -->
		<div class="cubeFrame">
			<div class="cube" id="cube">
				<div class="front side item">1</div>
				<div class="back side item">6</div>
				<div class="left side item">3</div>
				<div class="right side item">4</div>
				<div class="top side item">5</div>
				<div class="bottom side item">2</div>
			</div>
		</div>
		<!-- 카드 뒤집기 부분 -->
		<div id="container">
			<div id="flipper">
				<div class="flip_front">
					<span class="name">Post it</span>
				</div>
				<div class="flip_back">
					<div class="back-title">황금열쇠</div>
					<p>고온다습 직사광선을 피해 보관하시기 바랍니다.</p>
				</div>
			</div>
		</div>


		<div id="bling"></div>

	</div>

</div>


