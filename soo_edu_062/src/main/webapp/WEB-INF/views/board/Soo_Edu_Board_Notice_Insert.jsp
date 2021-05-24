<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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
				  	<form name="boardForm" id="form" action="/soo_project_board/soo_project1_notice_board_inserts.do" method="post" enctype="multipart/form-data"
				  		style="width: 1000px; margin-left: 200px;">
						<h1 class="title">공지사항</h1>
						
						<div class="table_detail_wrap">
							<table>
								<caption>게시판 목록</caption>
								<colgroup>
									<col style="width:20%;" />
									<col style="width:20%;" />
									<col style="width:10%;" />
									<col style="width:30%;" />
									
								</colgroup>
								
								<tbody>
									<tr>
										<th>게시판 타입</th>
										<td colspan="2">
											<select>
												<option>공지사항</option>
											</select>
										</td>
										<th>공지여부</th>
										<td colspan="2"><input type="checkbox" name="board_notice" value="공지" checked /></td>
									</tr>
									<tr>
										<th>작성자</th>
										<td colspan="2">
											<input type="text" name="board_writer_name" value="${sessionScope.name }" readonly/>
										</td>
										<!-- <th>비밀번호</th>
										<td colspan="2">
											<input type="password" name="board_writer_pass" />
										</td>	 -->
									</tr>
									<tr>
										<th>제목</th>
										<td colspan="5">
											<input type="text" name="board_title"/>
										</td>
									</tr>
									
									<tr>
										<th>내용</th>
										<td colspan="5">
											<textarea name="board_content_text" ></textarea>
											
										</td>
									</tr>
									
									 <tr>
										<th>파일</th>
										<td colspan="2">
											<input type="file" class="file_input" />
										</td>
										<td class="center">
											<a href="#none" class="btn write">파일저장</a>
										</td>
									</tr> 
								</tbody>
							</table>
						</div>
						<div class="btn_wrap right" style="margin-right: 20px;">
							<a href="/soo_project_board/Soo_Edu_Board_Notice_List.do" class="btn">목록으로</a>
							<button type="submit" style="width: 82px;" class="btn write">저장</button>
							<!-- <a href="/soo_project_board/soo_project1_notice_board_inserts.do" class="btn write">저장</a> -->
						</div>
					</form>	
				</div>
			</div>
		</div>


			</body>
</html>
