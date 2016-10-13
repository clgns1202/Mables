<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
		$("#sign-in").load("/Mables/signIn");
		$("#sign-up").load("/Mables/signUp");

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
			if(index == 4 ){
				if (!$(this).hasClass("active")) {
					$("#sign-up").slideDown();
					$(this).addClass("active");
					$("#menubar").fadeOut();
				} else {
					$(this).parents().find("li").removeClass("active");
					$("#sign-up").slideUp();
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
			<c:if test="${empty sessionScope._USER_INFO_}">
				<li><label>sign-in</label></li>
				<li><label>sign-up</label></li>			
			</c:if>
			<c:if test="${not empty sessionScope._USER_INFO_}">
				 <li><li>
				 <li><label>${sessionScope._USER_INFO_.userNickname}</label><li>
				 <li><a href="/Mables/doLogout" ><label>log-out</label></a><li>
			</c:if>
			

		</ul>


	</div>

	<div class="sign-in" id="sign-in" style="display: none">
		
	</div>
	<div class="sign-up" id="sign-up" style="display: none">
		
	</div>

<jsp:include page="/WEB-INF/view/play/menu.jsp" />

	<div id="wrapper">