<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board List</title>
<!--  <link rel="stylesheet" type="text/css" href="/DrinkMable/css/layout.css" /> -->
</head>
<body>
<!-- header -->

<div id ="list">

	<div id = "list1">
		<div>글번호</div>
		<div>제목</div>
		<div>닉네임</div>
		<div>작성일</div>
		<div>조회수</div>
		<div>추천수</div>
	</div>
	<c:forEach items="${boards}" var="board">
		<div id = "list2">
			<c:set var="number" value="${fn:split(board.boardId, '-')[2] }" />
			<fmt:parseNumber var="number" type="number" value="${number }" />
			<div>${number }</div>
			<div><a href="/Mables/board/detail?boardId=${board.boardId }">${board.boardSubject }</a></div>
			<div>${board.userVO.userNickname }</div>
			<div>${board.createdDate }</div>
			<div>${board.hitCount }</div>
			<div>${board.recommendCount }</div>
		</div>
	</c:forEach>
	
	<div id = "paging"> ${paging}
	</div>
	
	<form id = "searchForm" name="searchForm">
	<div style="padding-top: 10px;">
		<div class="left"><a href="/Mables/board/write">글쓰기</a>
		</div>
		<div class="right">
			<select>
				<option value="1" ${searchBoard.searchType eq 1 ? 'selected' : '' }>제목+내용</option>
				<option value="2" ${searchBoard.searchType eq 2 ? 'selected' : '' }>제목</option>
				<option value="3" ${searchBoard.searchType eq 3 ? 'selected' : '' }>내용</option>
				<option value="4" ${searchBoard.searchType eq 4 ? 'selected' : '' }>작성자</option>
			</select>
			<input />
			<input type="button" id="searchBtn" value="검색"/>
			<a>검색 초기화</a>
		</div>
		<div class="clear"></div>	
	</div>
	</form>
	
</div>

<!-- footer -->
</body>
</html>