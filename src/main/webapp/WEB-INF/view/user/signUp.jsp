<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="/Mables/css/login.css"/>
<script type="text/javascript" src="/Mables/js/jquery-3.1.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		
	 	$("#joinBtn").click(function(){
	 		$.post("/Mables/doSignUp",
	 				$( "#registForm" ).serialize(), function(data){
	 			console.log(data);
	 			alert(data);
	 		}
	 		);
			
		}); 
		
		
		$("#userEmail").blur(function(){
			$("#userEmail").keyup();
		});
		
		$("#userEmail").keyup(function(){
			
			if($(this).val() == ""){
				$(this).addClass("warning");
				$(this).removeClass("pass")
			}
			else {
				$.post("/Mables/duplicateUserEmail",
						{"userEmail":$("#userEmail").val()},
						function(data){
							if( data=="false"){
								$("#userEmail").addClass("pass");
								$("#userEmail").removeClass("warning");
							}
							else{
								$("#userEmail").addClass("warning");
								$("#userEmail").removeClass("pass");
							}
						});
			}
			
			
		});
		
		
		
		
		$("#userNickname").blur(function(){
			$("#userNickname").keyup();
		});
		
		$("#userNickname").keyup(function(){
			if($(this).val() == ""){
				$(this).addClass("warning");
				$(this).removeClass("pass")
			}
			else{
				$.post("/Mables/duplicateUserNickname",
						{"userNickname":$("#userNickname").val()},
						function(data){
							if ( data == "false"){
								$("#userNickname").addClass("pass");
								$("#userNickname").removeClass("warning");
							}
							else{
								$("#userNickname").addClass("warning");
								$("#userNickname").removeClass("pass");
							}
						}
				)

			}
			
			
		});
		
	
		
		$("#userPassword1").keyup(function(){
			if($(this).val() != $("#userPassword2").val() ){
				$(this).addClass("warning");
				$(this).removeClass("pass")
				$("#userPassword2").addClass("warning");
				$("#userPassword2").removeClass("pass")
			}
			else if($("#userPassword1").val() == "") {
				$(this).addClass("warning");
				$(this).removeClass("pass")
				$("#userPassword2").addClass("warning");
				$("#userPassword2").removeClass("pass")
			}
			else {
				$("#userPassword1").addClass("pass");
				$("#userPassword1").removeClass("warning")
				$("#userPassword2").addClass("pass");
				$("#userPassword2").removeClass("warning")
			}
		});
		
		$("#userPassword2").keyup(function(){
			if($("#userPassword2").val() != $("#userPassword1").val() ){
				$("#userPassword2").addClass("warning");
				$("#userPassword2").removeClass("pass")
				$("#userPassword1").addClass("warning");
				$("#userPassword1").removeClass("pass")
			}
			else if($(this).val() == ""){
				$(this).addClass("warning");
				$(this).removeClass("pass")
				$("#userPassword1").addClass("warning");
				$("#userPassword1").removeClass("pass")
			}
			else {
				$(this).addClass("pass");
				$(this).removeClass("warning")
				$("#userPassword1").addClass("pass");
				$("#userPassword1").removeClass("warning")
			}
		});
		
	
	
	});




</script>

<body>
	<div id="wrapper">
		<form id="registForm">
			<div id="container">
					<div class="warning"></div>
					<div><input type="text" id="userEmail" name="userEmail" placeholder="Email 또는 ID를 적어주세요"> </div>
					<div><input type="text" id="userNickname" name="userNickname" placeholder="닉네임을 적어주세요"/>  </div>
					<div><input type="password" id="userPassword1" name="userPassword1" placeholder="Password를 적어주세요"/></div>
					<div><input type="password" id="userPassword2" name="userPassword2" placeholder="Password를 한번더 적어주세요"/></div>
			</div>
			<div>
				<div><input type="button" id="joinBtn" value="Join"/></div>
				<div><input type="button" id="CancleBtn" value="Cancle"/></div>
			</div>
		</form>
	</div>
</body>
</html>