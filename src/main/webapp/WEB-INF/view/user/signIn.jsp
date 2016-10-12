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
	$(document).ready(function(){
		
		$("#signInBtn").click(function(){
			$.post("/Mables/doSignIn",
			$("#signInForm").serialize(),
			function(data){
				if ( data == "true" ){
					location.href="/Mables/play/index";
				}
				else if( data == "false"){
					alert("로그인이 실패 하였습니다.");
				}
				else{
					alert(data);
				}
			}
			);
			
		});
		
		$("#signUpBtn").click(function(){
			$("#wrapper").load("/Mables/signUp", function(data){
			});
		});
		
		$("#cancleBtn").click(function(){
			location.href="/Mables/play/index";
		});
		
		
		$("#userEmail").blur(function(){
			$("#userEmail").keyup();
		});
		
		$("#userEmail").keyup(function(){
			if( $(this).val()=="" ){
				$(this).addClass("warning");
				$(this).removeClass("pass");
			}
			else{
				$(this).addClass("pass");
				$(this).removeClass("warning");
			}
		});
		
		$("#userPassword").blur(function(){
			$("#userPassword").keyup();
		});
		$("#userPassword").keyup(function(){
			if( $(this).val()=="" ){
				$(this).addClass("warning");
				$(this).removeClass("pass");
			}
			else{
				$(this).addClass("pass");
				$(this).removeClass("warning");
			}
		});
		
		
		
	});
	
</script>
<body>

	<div id="wrapper">
		<form id="signInForm" name="signInForm">
			<div>
				<div><input type="text" id="userEmail" name="userEmail" placeholder="Email 또는 ID를 적어주세요"> </div>
				<div><input type="password" id="userPassword" name="userPassword" placeholder="Password를 적어주세요"/></div>
			</div>
			<div>
				<div><input type="button" id="signInBtn" value="Sign In"/></div>
				<div><input type="button" id="signUpBtn" value="Sign Up"/></div>
				<div><input type="button" id="cancleBtn" value="Cancle"/></div>
			</div>
		</form>
	</div>

</body>
</html>