<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board List</title>
<link rel="stylesheet" type="text/css" href="/DrinkMable/css/layout.css" />
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
	
	<div id = "list2">
		<div>
		</div>
		<div>
		</div>
		<div>
		</div>
		<div>
		</div>
		<div>
		</div>
		<div>
		</div>
	</div>
	
	<div id = "paging"> paging
	</div>
	
	<form id = "searchForm" name="searchForm">
	<div style="padding-top: 10px;">
		<div class="left"><a>글쓰기</a>
		</div>
		<div class="right">
			<select>
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