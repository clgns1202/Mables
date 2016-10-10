<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/Mables/css/interface.css" />
<script type="text/javascript" src="/Mables/js/jquery-3.1.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#menu").hide();

		$("a").click(function() {
			$("#menu").show("fast");
		});
	});
</script>
</head>
<body>

	<div class="nav">
		<form id="loginForm" name="loginForm">
			<ul>
				<li><a href="#home">주루마블</a></li>
				<li><a href="#about">sign-up</a></li>
				<li><a href="#about">sign-in</a></li>
			</ul>
		</form>

	</div>

	<div class="menu" id="menu">
		<ul>
			<li><a class="active" href="#home">Home</a></li>
			<li><a href="#news">News</a></li>
			<li><a href="#contact">Contact</a></li>
			<li><a href="#about">About</a></li>
		</ul>
	</div>

	<div id="wrapper">