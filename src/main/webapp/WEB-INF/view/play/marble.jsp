<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="/Mables/css/marble.css" />
<link rel="stylesheet" type="text/css"	href="/Mables/bamcoding_css/cube.css" />
<link rel="stylesheet" type="text/css"	href="/Mables/bamcoding_css/flip.css" />
<link rel="stylesheet" type="text/css"	href="/Mables/bamcoding_css/gamePan.css" />
<link rel="stylesheet" type="text/css" href="/Mables/bamcoding_css/carousel.css">
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
					//AJAX 처리 파라미터는 없다
					$.post("/Mables/doThrowCube", function(data) {
						
						var showTime = 1000;
						var number = parseInt(data);
						//
						$("#blingEffect").addClass("blingEffect");
						$("#cube").addClass("throwAction");

						setTimeout(function() {
							$("#cube").removeClass("throwAction");
						}, showTime);

						console.log("전꺼:" + preNum + " 지금:" + number);
						$("#cube").removeClass("cube");
						if (preNum != 0) {
							$("#cube").addClass("show" + number);
							$("#cube").queue(function(){
								$("#cube").css("animation", "zoom 0.5s linear");
								$( this ).dequeue();
							});
							$("#cube").removeClass("show" + preNum + "");
						} else {
							$("#cube").addClass("show" + number);						
							$("#cube").queue(function(){
								$("#cube").css("animation", "zoom 0.5s linear");
								$( this ).dequeue();
							});
						}
						 
						preNum = number;
						

						for (var i = 0; i < number; i++) {
							showTime += 400;
							setTimeout(moveUnit, showTime);
						}
						setTimeout(function() {
							$("#blingEffect").removeClass("blingEffect");
							getPenalty();
						}, showTime + 700);
	
					});
				});
				
				//게임판의 좌표를 1~24까지의 정수로 표현하여 저장
				function getPenalty(){
					var x = pointX/pxX;
					var y = pointY/pxY;
					
					var positionIndex = 0;
					
					if(y == 0){
						positionIndex = x;
					}else if(x == 6){
						positionIndex = x - y;
					}else if(y == -6){
						positionIndex = cellX + (cellX- x) - y;
					}else if(x == 0){
						positionIndex = (2 * cellX) + cellY + (cellY + y);
					}
					
					
					//황금 열쇠가 선택 되었을 때의 이벤트 처리
					var result = 0;
					var currdeg = 0;
					var div = $("#cell"+positionIndex+" .gameType").text();
					alert(div);
					if(div == "GOLD_KEY"){
					result = parseInt(Math.random()*6)+1;
					currdeg = currdeg + result*600;
					$("#keyCard").css( "animation","spinGoldKey 4s linear");						
					}
				}

				
				
			});
</script>
<div id="marble">
	<div id="gamePan">
		<table border="1">
			<tr>
				<td id="cell18">
				<div class="gameName">${plays[18].games.gameName }</div>
				<div class="gameInfo">${plays[18].games.gameInfo }</div>
				<div class="gameType">${plays[18].games.typeId }</div>
				</td>
				<td id="cell17">
				<div class="gameName">${plays[17].games.gameName }</div>
				<div class="gameInfo">${plays[17].games.gameInfo }</div>
				<div class="gameType">${plays[17].games.typeId }</div>
				</td>
				<td id="cell16">
				<div class="gameName">${plays[16].games.gameName }</div>
				<div class="gameInfo">${plays[16].games.gameInfo }</div>
				<div class="gameType">${plays[16].games.typeId }</div>
				</td>
				<td id="cell15">
				<div class="gameName">${plays[15].games.gameName }</div>
				<div class="gameInfo">${plays[15].games.gameInfo }</div>
				<div class="gameType">${plays[15].games.typeId }</div>
				</td>
				<td id="cell14">
				<div class="gameName">${plays[14].games.gameName }</div>
				<div class="gameInfo">${plays[14].games.gameInfo }</div>
				<div class="gameType">${plays[14].games.typeId }</div>
				</td>
				<td id="cell13">
				<div class="gameName">${plays[13].games.gameName }</div>
				<div class="gameInfo">${plays[13].games.gameInfo }</div>
				<div class="gameType">${plays[13].games.typeId }</div>
				</td>
				<td id="cell12">
				<div class="gameName">${plays[12].games.gameName }</div>
				<div class="gameInfo">${plays[12].games.gameInfo }</div>
				<div class="gameType">${plays[12].games.typeId }</div>
				</td>
			</tr>
			<tr>
				<td id="cell19">
				<div class="gameName">${plays[19].games.gameName }</div>
				<div class="gameInfo">${plays[19].games.gameInfo }</div>
				<div class="gameType">${plays[19].games.typeId }</div>
				</td>
				<th colspan="5" rowspan="5"></th>
				<td id="cell11">
				<div class="gameName">${plays[11].games.gameName }</div>
				<div class="gameInfo">${plays[11].games.gameInfo }</div>
				<div class="gameType">${plays[11].games.typeId }</div>
				</td>
			</tr>
			<tr>
				<td id="cell20">
				<div class="gameName">${plays[20].games.gameName }</div>
				<div class="gameInfo">${plays[20].games.gameInfo }</div>
				<div class="gameType">${plays[20].games.typeId }</div>
				</td>
				<td id="cell10">
				<div class="gameName">${plays[10].games.gameName }</div>
				<div class="gameInfo">${plays[10].games.gameInfo }</div>
				<div class="gameType">${plays[10].games.typeId }</div>
				</td>
			</tr>
			<tr>
				<td id="cell21">
				<div class="gameName">${plays[21].games.gameName }</div>
				<div class="gameInfo">${plays[21].games.gameInfo }</div>
				<div class="gameType">${plays[21].games.typeId }</div>
				</td>
				<td id="cell9">
				<div class="gameName">${plays[9].games.gameName }</div>
				<div class="gameInfo">${plays[9].games.gameInfo }</div>
				<div class="gameType">${plays[9].games.typeId }</div>
				</td>
			</tr>
			<tr>
				<td id="cell22">
				<div class="gameName">${plays[22].games.gameName }</div>
				<div class="gameInfo">${plays[22].games.gameInfo }</div>
				<div class="gameType">${plays[22].games.typeId }</div>
				</td>
				<td id="cell8">
				<div class="gameName">${plays[8].games.gameName }</div>
				<div class="gameInfo">${plays[8].games.gameInfo }</div>
				<div class="gameType">${plays[8].games.typeId }</div>
				</td>
			</tr>
			<tr>
				<td id="cell23">
				<div class="gameName">${plays[23].games.gameName }</div>
				<div class="gameInfo">${plays[23].games.gameInfo }</div>
				<div class="gameType">${plays[23].games.typeId }</div>
				</td>
				<td id="cell7">
				<div class="gameName">${plays[7].games.gameName }</div>
				<div class="gameInfo">${plays[7].games.gameInfo }</div>
				<div class="gameType">${plays[7].games.typeId }</div>
				</td>
			</tr>
			<tr>
				<td id="cell0">
				<div class="gameName">${plays[0].games.gameName }</div>
				<div class="gameInfo">${plays[0].games.gameInfo }</div>
				<div class="gameType">${plays[0].games.typeId }</div>
				</td>
				<td id="cell1">
				<div class="gameName">${plays[1].games.gameName }</div>
				<div class="gameInfo">${plays[1].games.gameInfo }</div>
				<div class="gameType">${plays[1].games.typeId }</div>
				</td>
				<td id="cell2">
				<div class="gameName">${plays[2].games.gameName }</div>
				<div class="gameInfo">${plays[2].games.gameInfo }</div>
				<div class="gameType">${plays[2].games.typeId }</div>
				</td>
				<td id="cell3">
				<div class="gameName">${plays[3].games.gameName }</div>
				<div class="gameInfo">${plays[3].games.gameInfo }</div>
				<div class="gameType">${plays[3].games.typeId }</div>
				</td>
				<td id="cell4">
				<div class="gameName">${plays[4].games.gameName }</div>
				<div class="gameInfo">${plays[4].games.gameInfo }</div>
				<div class="gameType">${plays[4].games.typeId }</div>
				</td>
				<td id="cell5">
				<div class="gameName">${plays[5].games.gameName }</div>
				<div class="gameInfo">${plays[5].games.gameInfo }</div>
				<div class="gameType">${plays[5].games.typeId }</div>
				</td>
				<td id="cell6">
				<div class="gameName">${plays[6].games.gameName }</div>
				<div class="gameInfo">${plays[6].games.gameInfo }</div>
				<div class="gameType">${plays[6].games.typeId }</div>
				</td>
			</tr>


		</table>

		<div class="object">PLAYER</div>

		<!-- 큐브 부분 -->
		<div class="cubeFrame">
			<div class="cube" id="cube">
				<div class="front side"></div>
				<div class="back side"></div>
				<div class="left side"></div>
				<div class="right side"></div>
				<div class="top side"></div>
				<div class="bottom side"></div>
			</div>
		</div>
		<div id="blingEffect"></div>
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
		
		<!-- 황금 열쇠 연출 부분 -->
		<div id="keyCardFrame">
		  <div id="keyCard">
		    <div class="item a">A</div>
		    <div class="item b">B</div>
		    <div class="item c">C</div>
		    <div class="item d">D</div>
		    <div class="item e">E</div>
		    <div class="item f">F</div>
		  </div>
		</div>
		

		<div id="viewInfo"></div>
		<div id="goldenCard"></div>
		<div id="drink"></div>
	</div>

</div>


