<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"  href="/Mables/bamcoding_css/flip.css"/> 
<script type="text/javascript" src="/Mables/js/jquery-3.1.1.js"></script>
<script type="text/javascript">
$().ready(function(){
	
	var check = 0;
	$("#container").click(function(){
		if(check==0){
			$("#flipper").addClass("clickFlip");
			check =1;
		}
		else if(check==1){
			$("#flipper").removeClass("clickFlip");
			check =0;
		}
	});
	
});
</script>
</head>
<body>
<div id="container" ontouchstart="this.classList.toggle('hover');">
  <div id="flipper">
    <div class="flip_front">
      <span class="name">Post it</span>
    </div>
    <div class="flip_back">
      <div class="back-title">황금열쇠</div>
      <p> 고온다습 직사광선을 피해 보관하시기 바랍니다. </p>
    </div>
  </div>
</div>
</body>
</html>