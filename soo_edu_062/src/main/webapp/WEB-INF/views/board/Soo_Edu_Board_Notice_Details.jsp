<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<a href="/edu/index.do">HOME</a>
				</div>
			</div>
			<div class="content_wrap">
				<div class="sidebar">
					<%@ include file="/WEB-INF/views/edu/menu.jsp" %>
				</div>
				<div class="contents">
					<form name="boardForm" id="form" action="/soo_project_board/soo_project1_notice_update.do?board_seq=${boardview.board_seq }" 
						enctype="multipart/form-data" method="post" style="width: 1000px; margin-left: 200px;">
					
					<h1 class="title">공지사항</h1>
					
					<div class="table_detail_wrap">
						<table>
							<caption>게시판 목록</caption>
							<colgroup>
								<col style="width:20%;" />
								<col style="width:30%;" />
								<col style="width:20%;" />
								<col style="width:30%;" />
							</colgroup>
							<tbody>
								<tr>
									<th>게시판 타입</th>
									<td>공지사항</td>
									<th>공지여부</th>
									<td><input type="checkbox" checked disabled />
									<input type="hidden" name="board_seq" value="${boardview.board_seq }"></td>
								</tr>
								<tr>
									<th>작성자</th>
									<td colspan="3">
									<input type="text" name="board_writer_name" value="${boardview.board_writer_name }" readonly/>
									</td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="3"><input type="text" name="board_title" value="${boardview.board_title }" readonly/></td>
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="3">
										<textarea name="board_content_text" >${boardview.board_content_text }</textarea>
									</td>
								</tr>
								<tr>
									<th>파일</th>
									<td colspan="2">
										<p>이미지.png</p>
										<div class="thumb">
											<img src="text.png" />
										</div>
									</td>
									<td class="center">
										<a href="#none" class="btn del">파일삭제</a>
										<a href="#none" class="btn">파일찾기</a>
										<a href="#none" class="btn write">파일저장</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_wrap right">
						<a href="/soo_project_board/Soo_Edu_Board_Notice_List.do" class="btn">목록으로</a>
						<%-- <a href="/soo_project_board/soo_project1_notice_update.do?board_seq=${boardview.board_seq }" class="btn write">저장</a> --%>
						<button type="submit" class="btn write" style="width: 82px;">저장</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>
