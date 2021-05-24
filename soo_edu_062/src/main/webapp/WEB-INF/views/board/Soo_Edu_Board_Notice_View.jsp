<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>SOO EDUㅣ공지사항</title>
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-ui.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
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
				</div>
				<div class="contents">
					
					<div class="table_detail_wrap" style="width: 1000px; margin-left: 200px;">
					<h1 class="title">공지사항</h1>
						<table>
							<caption>게시판 목록</caption>
							<colgroup>
								<col style="width:20%;" />
								<col style="width:30%;" />
								<col style="width:20%;" />
								<col style="width:30%;" />
							</colgroup>
							<tbody>
							<%-- 	<input type="text" value="${boardview.board_seq }"/> --%>
								<tr>
									<th>게시판 타입</th>
									<td>공지사항</td>
									<th>공지여부</th>
									
									<td><input type="checkbox" checked disabled /></td>
								</tr>
								
								<tr>
									<th>작성자</th>
									<td colspan="3">${boardview.board_writer_name }</td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="3">${boardview.board_title }</td>
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="3">
										<textarea value="" disabled>${boardview.board_content_text }</textarea>
									</td>
								</tr>
								<tr>
									<th>파일</th>
									<td colspan="3">
										<p>이미지.png</p>
										<div class="thumb">
											<img src="text.png" />
										</div>
									</td>
								</tr>
								
							</tbody>
						</table>
					</div>
					<div class="btn_wrap right" style="margin-right: 340px;">
						<a href="/soo_project_board/Soo_Edu_Board_Notice_List.do" class="btn">목록으로</a>
						<a href="/soo_project_board/soo_project1_notice_details.do?board_seq=${boardview.board_seq }" class="btn write">수정</a>
						<a href="#none" class="btn del">삭제</a>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
