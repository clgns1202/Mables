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
<link rel="stylesheet" type="text/css" href="/Mables/css/layout.css" />
<link rel="stylesheet" type="text/css" href="/Mables/css/grid.css" />
<script type="text/javascript" src="/Mables/js/jquery-3.1.1.js"></script>
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/view/common/header.jsp" />

<div id ="list">
	<table class="grid">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>닉네임</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>추천수</th>
		</tr>

		<tr>
			<td>1345</td>
			<td>안녕하세요 처음뵙겠습니다.</td>
			<td>백곰한마리7777</td>
			<td>2016-10-12 10:09:52</td>
			<td>15</td>
			<td>5</td>
		<tr>

		<c:forEach items="${boards}" var="board">
		<tr>
			<c:set var="number" value="${fn:split(board.boardId, '-')[2] }" />
			<fmt:parseNumber var="number" type="number" value="${number }" />
			<td>${number }</td>
			<td><a href="/Mables/board/detail?boardId=${board.boardId }">${board.boardSubject }</a></td>
			<td>${board.userVO.userNickname }</td>
			<td>${board.createdDate }</td>
			<td>${board.hitCount }</td>
			<td>${board.recommendCount }</td>
		</tr>
		</c:forEach>
	</table>
	
	<div id = "paging">
		${paging}
	</div>
	
	<form id = "searchForm" name="searchForm">
	<div style="padding-top: 10px;">
		<div class="left">
			<a href="/Mables/board/write">글쓰기</a>
		</div>
		<div class="right">
			<select id="searchType" name="searchType">
				<option value="1" ${searchBoard.searchType eq 1 ? 'selected' : '' }>제목+내용</option>
				<option value="2" ${searchBoard.searchType eq 2 ? 'selected' : '' }>제목</option>
				<option value="3" ${searchBoard.searchType eq 3 ? 'selected' : '' }>내용</option>
				<option value="4" ${searchBoard.searchType eq 4 ? 'selected' : '' }>작성자</option>
			</select>
			<input type="text" id="searchKeyword" name="searchKeyword" value="${searchBoard.searchKeyword }" />
			<input type="button" id="searchBtn" value="검색"/>
			<a href="/Mables/board/list/init">검색 초기화</a>
		</div>
		<div class="clear"></div>	
	</div>
	</form>
	
</div>

<!-- footer -->
<div>
	<jsp:include page="/WEB-INF/view/common/footer.jsp" />
</div>

</body>
</html>