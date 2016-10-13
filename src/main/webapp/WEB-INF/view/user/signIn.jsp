<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="/Mables/js/jquery-3.1.1.js"></script>
<link rel="stylesheet" type="text/css" href="/Mables/css/login.css"/>
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
		
		
		
		$("#signUserEmail").blur(function(){
			$("#signUserEmail").keyup();
		});
		
		$("#signUserEmail").keyup(function(){
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

<style>

#logInGroup{
	border: 1px solid black;
	height:80px;
	width:330px;
}
#signUserEmail, #signUserPassword{
	margin-top:0px;
	height:28px;
	width:200px;
}
#signInBtn{
	float:right;
	padding:4px;
	margin-top:3px;
	height:65px;
	width:100px;
}
.container{
	margin:0px;
}

.clear{
	clear: right;
}
</style>

		<div class="login">
			<form id="signInForm" name="signInForm">
				<div id="logInGroup">
				<div class="inline">
					<div><input type="text" id="signUserEmail" name="userEmail" placeholder="Email/ID"> </div>
					<div><input type="password" id="signUserPassword" name="userPassword" placeholder="Password"/></div>
				</div>
					<div class="container inline"><input type="button" id="signInBtn" value="Sign In"/></div>
				</div>
				<div class="clear"></div>
			</form >
		</div>

