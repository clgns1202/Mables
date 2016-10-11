<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="/mables/css/login.css"/>
<script type="text/javascript" src="/Mables/js/jquery-3.1.1.js"></script>
<script type="text/javascript">
	$().ready(function() {
		
		$("#joinBtn").click(function(){
			
			$("registForm").attr( {
				"method": "post",
				"acotion": "/Mables/doSignUp"
			}).submit();
			
		});
		
		$("#userEmail").blur(function(){
			$("#userEmail").keyup();
		});
		
		$("#userEmail").keyup(function(){
			
			$post("/Mables/duplicateUserEmail",
					{"userEmail":$("#userEmail").val()},
					function(data){
						if( data=="false"){
							$("#userEmail").addClass("pass");
							$("#userEmail").removeClass("warning");
						}
						else{
							$("#userEmail").addClass("warning");
							$("#userEmail"),removeClass("pass");
						}
					});
			
		});
		
		
		
	
	
	
	
	
	
	
	});




</script>

<body>
	<div id="wrapper">
			<div id="container">
		<form id="registForm">
					<div><input type="text"/ id="userEmail" placeholder="Email 또는 ID를 적어주세요"> </div>
					<div><input type="text" id="userNickname" placeholder="닉네임을 적어주세요"/>  </div>
					<div><input type="password" id="userPassword1" placeholder="Password를 적어주세요"/></div>
					<div><input type="password" id="userPassword2" placeholder="Password를 한번더 적어주세요"/></div>
			</div>
			<div>
				<div><input type="button" id="joinBtn" value="Sign Up"/></div>
				<div><input type="button" id="CancleBtn" value="Sign In"/></div>
			</div>
		</form>
	</div>
</body>
</html>