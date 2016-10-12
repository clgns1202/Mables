<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/Mables/bamcoding_css/carousel.css">
<script type="text/javascript" src="/Mables/js/jquery-3.1.1.js"></script>
<script type="text/javascript">

$().ready(function(){
	
	var result = 0;
	var currdeg = 0;
	result = parseInt(Math.random()*6)+1;
	
	$(".next").click(function(){
		currdeg = currdeg + result*600;
		$(".carousel").css( "animation","spinGoldKey 4s infinite linear");
	});

	
});


</script>

</head>
<body>
<div class="container">
  <div class="carousel">
    <div class="item a">A</div>
    <div class="item b">B</div>
    <div class="item c">C</div>
    <div class="item d">D</div>
    <div class="item e">E</div>
    <div class="item f">F</div>
  </div>
</div>
<div class="next">Next</div>
</body>
</html>