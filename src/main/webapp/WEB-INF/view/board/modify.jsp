<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/Mables/css/layout.css" />
<link rel="stylesheet" type="text/css" href="/Mables/css/grid.css" />
<script type="text/javascript" src="/Mables/js/jquery-3.1.1.js"></script>
<script type="text/javascript">
	<c:if test="${sessionScope._USER_INFO_.userId ne }">
		alert("허용되지 않은 접근입니다.");
		location.href = "/Mables/board/list/init";
	</c:if>
	
	$(document).ready(function() {
		$("#goBackBtn").click(function() {
			location.herf = "/Mables/board/detail?boardId=${board.boardId}";
		})
		var errorCode = "${param.errorCode}";
		if ( errorCode == 1 ) {
			alert("글 수정에 실패 하였습니다.");
		}
		$("#goBackBtn").click(function(){
			location.href = "/Mables/board/list";			
		})
		
		$("#boardSubject").keyup(function(){
			if($(this).val() == "") {
				$(this).addClass("warning");
				$(this).removeClass("pass");
			}
			else {
				$(this).addClass("pass");
				$(this).removeClass("warning");
			}
			isVisibleWriteBtn();
		});
		
		$("#boardContent").keyup(function() {
			if($(this).val == ""){
				$(this).addClass("warning");
				$(this).removeClass("pass");
			}
			else {
				$(this).addClass("pass");
				$(this).removeClass("warning");
			}
			isVisibleWriteBtn();
		});
		
		$("#modifyBtn").click(function() {
			$("#modifyForm").attr({
				method : "post",
				action : "/Mables/board/doModify"
			}).submit();
		});
	}){
</script>
<form id="modifyForm" name="modyfyForm" enctype="multipart/form-data">
	<input type="hidden" name="boardId" value="${board.boardId}" />
	<div>
		<input type="text" id="boardSubject" name="boardSubject" value="${board.boardSubject}" 
					placeholder="제목을 입력하세요" value="첫번째 게시물입니다." />
	</div>
	<div>
		<textarea id="boardContent" name="boardContent" placeholder="내용을 입력 하세요.">
		${board.boardContent}
		</textarea>
	</div>
	<c:if test="${not empty article.fileName }">
	<div style="padding-top: 10px; padding-bottom: 10px" >
		<input type="checkbox" id="fileDeleteBtn" name="fileDeleteBtn" value="delete" />
		<img src="/Mables/img/text-file-3-xxl.png" style="width:12px;'" />
		${board.fileName}
	</div>
	</c:if>
	<div>
		<div class="left">
			<input type="file" id="file" name="file" />
		</div>
		<div class ="right">
			<div class="inline">
				<input type="button" id="goBackBtn" value="뒤로가기" />
			</div>
			<div class="inline">
				<input type="button" id="modifyBtn" value="수정하기" /> 
			</div>
		</div>
		<div class="clear"></div>
	</div>
</form>
</head>
<body>

</body>
</html>