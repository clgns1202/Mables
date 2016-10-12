<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board detail</title>
<link rel="stylesheet" type="text/css" href="/DrinkMable/css/layout.css" />
<script type="text/javascript" src="/Mables/js/jquery-3.1.1.js"></script>
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/view/common/header.jsp" />

<div>
	<div>
		<p>${board.boardSubject }</p>
		<div>
			<div><span>${board.userVO.userNickname }</span></div>
			<div>${board.createdDate }</div>
			<div>${board.hitCount }</div>
			<div>${board.recommendCount }</div>
		</div>
		<hr/>
		<div>${board.boardContent }</div>
	</div>
	<div>
		추천
		<a href="">삭제</a>
		<a href="/Mables/board/modify?boardId=${board.boardId }">수정</a>
		<a href="/Mables/board/list">목록보기</a>
	</div>
</div> 

<!-- footer -->
<jsp:include page="/WEB-INF/view/common/footer.jsp" />
</body>
</html>