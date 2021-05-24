<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SOO EDUㅣ공지사항</title>
<script
	src="${pageContext.request.contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/jquery/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>

	<div class="wrap">
		<div class="header_wrap">
			<div class="header">
				<a href="/index.do">HOME</a>
			</div>
		</div>
		<div class="content_wrap">
			<div class="sidebar">
				<%@ include file="/WEB-INF/views/edu/menu.jsp" %>
				<!-- //메뉴 -->
			</div>

			<div class="contents">
				<h1 class="title">공지사항</h1>
				<div class="top_search">
					<select>
						<option>선택</option>
					</select> <input type="text" value="검색어를 입력해주세요." /> <a href="#none"
						class="btn">검색</a>
				</div>
				<div class="table_list_wrap">
					<table>
						<caption>게시판 목록</caption>
						<colgroup>
							<col style="width: 10%;" />
							<col style="width: 20%;" />
							<col style="width: 10%;" />
							<col style="width: 40%;" />
							<col style="width: 10%;" />
							<col style="width: 10%;" />
						</colgroup>
						<thead>
							<tr>
								<th></th>
								<th>공지</th>
								<th>제목</th>
								<th>작성자</th>
								<th>내용</th>
								<th>작성일</th>
								<th>파일</th>
							</tr>
						</thead>
						<tbody class="text-center">
							<c:forEach items="${boardlist }" var="boardlist">
								<tr>
									<td><c:out value="${boardlist.board_seq }" /></td>
									<td class="left"><a href="#"><c:out
												value="${boardlist.board_title }" /></a></td>
									<!-- 기본 가운데 정렬 왼쪽 정렬 하려면 클래스 left 추가 -->
									<td><c:out value="${boardlist.board_writer_name }" /></td>
									<td class="left"><a href="#"><c:out
												value="${boardlist.board_content_text }" /></a></td>
									<td><c:out value="${boardlist.board_reg_date }" /></td>
									<td></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
		
				<c:if test="${sessionScope.usertype eq '0' }"> 
					<div class="btn_wrap right">
						<a href="#none" class="btn del">삭제</a> <a
							href="/soo_project_board/soo_project1_notice_board_insert.do"
							class="btn write">글쓰기</a>
					</div>
				</c:if>
				
				<div class="paging">
					
					<a href="#" class="btn_arr first"><span class="hide">처음페이지</span></a>
				
					<a href="soo_project_board/Soo_Edu_Board_Notice_List.do?page='"class="btn_arr prev">
							<span class="hide">이전페이지</span></a> <a
						href="#" class="on">1</a> <a href="#">2</a> <a href="#">3</a> <a
						href="#">4</a> <a href="#">5</a> <a href="#" class="btn_arr next"><span
						class="hide">다음페이지</span></a> <a href="#" class="btn_arr last"><span
						class="hide">마지막페이지</span></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
