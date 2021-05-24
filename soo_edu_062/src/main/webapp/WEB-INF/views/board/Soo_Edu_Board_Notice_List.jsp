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

<script>

function check() {
		
	var confirm_val = confirm("정말 삭제하시겠습니까?");
		
		if(confirm_val) {
			
			
			var cnt = $("input[name='board_del_yn']:checked").length; // 체크된것의 갯수를 구함.
			var board_seq = new Array(); // 체크된 것의 seq를  배열에 담기위해. 
			
			$("input[name='board_del_yn']:checked").each(function() {
				
				board_seq.push($(this).attr('id'));
				//each함수를 사용해 체크된 것의 id = seq 를 checkArr 배열에 담아줌.
				
			});
			delSeq(board_seq);
			console.log("체크1=" + board_seq)
			
		} else {
			
			alert("삭제할 게시글을 선택해주세요.");
			
		}
	
}	

function delSeq(board_seq) {
		console.log("delSeq체크2=" + board_seq)
		
		$.ajax({
			  url : '/soo_project_board/soo_project1_notice_delete.do',
			  contentType : 'application/x-www-form-urlencoded;charset=utf-8',
			  data : { "board_seq" : board_seq },
			  type : 'POST',
			  dataType : 'JSON',
			  success : function(data){
				  	console.log("console--" + data);
				 	if(data.RESULT == 'success') {
				 		alert("삭제 성공")
				 		location.href = "/soo_project_board/Soo_Edu_Board_Notice_List.do";
				 	} else {
				 		alert("삭제 실패")
				 	}
			  },//success끝
			  error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			  }
		  }); 
		  
}
</script>

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
				<h1 class="title">공지사항</h1>
				<div class="top_search" >
					<select id="search">
						<option value="">선택</option>
						<option value="title">제목</option>
						<option value="writer">작성자</option>
						<option value="type">게시판 타입</option>
						<option value="date">날짜</option>
					</select> 
					<input type="text" placeholder="검색어를 입해주세요." /> 
					<a href="#none" class="btn">검색</a>
				</div>
				<div class="table_list_wrap" style="margin-left: 200px;">
					<table>
						<caption>게시판 목록</caption>
						<colgroup>
							<col style="width: 5%;" />
							<col style="width: 10%;" />
							<col style="width: 15%;" />
							<col style="width: 10%;" />
							<col style="width: 35%;" />
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
							<c:forEach items="${list }" var="boardlist">
								<tr>
									<td><input type="checkbox" id=${boardlist.board_seq } name="board_del_yn" value="y"></td> 
									<td><c:out value="${boardlist.board_notice }"/></td>
									<td class="left">
										<a href="/soo_project_board/soo_project1_notice_view.do?board_seq=${boardlist.board_seq }">
										<c:out value="${boardlist.board_title }" /></a></td>
									<!-- 기본 가운데 정렬 왼쪽 정렬 하려면 클래스 left 추가 -->
									<td><c:out value="${boardlist.board_writer_name }" /></td>
									<td class="left">
										<a href="/soo_project_board/soo_project1_notice_view.do?board_seq=${boardlist.board_seq }">
										<c:out value="${boardlist.board_content_text }" /></a></td>
									
									<td><c:out value="${boardlist.board_reg_date }" /></td>
									<td></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
		
				<c:if test="${sessionScope.usertype eq '0' }"> 
					<div class="btn_wrap right" style="margin-right: 340px;">
						<!-- <a href="#none" class="btn del">삭제</a>  -->
						<a href="/soo_project_board/soo_project1_notice_board_insert.do" class="btn write" style="margin-right: 5px;">글쓰기</a>
						<input type="button" class="btn del" id="deleteBtn" value="삭제" onclick="check();" style="width: 82px;">
					</div>
				</c:if>
				
				<div class="paging" style="margin-left: 500px;">
					<ul class="btn-group pagination" style = "display : flex;">
					    <c:if test="${pageMaker.prev }">
					    <li>
					        <a href='<c:url value="/soo_project_board/Soo_Edu_Board_Notice_List.do?page=${pageMaker.startPage-1}"/>'><i class="fa fa-chevron-left"></i></a>
					    </li>
					    </c:if>
					    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
					    <li>
					        <a href='<c:url value="/soo_project_board/Soo_Edu_Board_Notice_List.do?page=${pageNum}"/>'><i class="fa">${pageNum }</i></a>
					    </li>
					    </c:forEach>
					    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					    <li>
					        <a href='<c:url value="/soo_project_board/Soo_Edu_Board_Notice_List.do?page=${pageMaker.endPage+1}"/>'><i class="fa fa-chevron-right"></i></a>
					    </li>
					    </c:if>
					</ul>

				</div>
				
			</div>
		</div>
	</div>
</body>
</html>
