<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons" />
<link rel="stylesheet" type="text/css" href="/Mables/css/interface.css" />
<script type="text/javascript" src="/Mables/js/jquery-3.1.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#menubar").hide();
		$("#sign-in").hide();

		$("#nav ul li").click(function() {
			var index = $(this).index();
			if (index == 1) {
				$("#marbleBoard").load("/Mables/setMarbleBoard");
			}
			
			if (index == 2) {
				if (!$(this).hasClass("active")) {
					$("#menubar").fadeIn();
					$(this).addClass("active");

					$("#sign-in").slideUp();
				} else {
					$(this).parents().find("li").removeClass("active");
					$("#sign-in").slideUp();
					$("#menubar").fadeOut();
				}
			}
			if (index == 3) {
				if (!$(this).hasClass("active")) {
					$("#sign-in").slideDown();
					$(this).addClass("active");

					$("#menubar").fadeOut();
				} else {
					$(this).parents().find("li").removeClass("active");
					$("#sign-in").slideUp();
					$("#menubar").fadeOut();
				}

			}

		});

	});
</script>
</head>
<body>

	<div class="nav" id="nav">
		<ul>
			<li><label>주루마블</label></li>
			<li><label>Game Start</label></li>

			<li><label><i class="material-icons">subject</i></label></li>
			<li><label>sign-in</label></li>
			<li><label>sign-up</label></li>

		</ul>


	</div>

	<div class="sign-in" id="sign-in">
		<form id="loginForm" name="loginForm">
			Id : <input type="text" name="userId" id="userId" /> pwd : <input
				type="password" name="userPwd" id="userPwd" />
		</form>
	</div>

<jsp:include page="/WEB-INF/view/play/menu.jsp" />

	<div id="wrapper">