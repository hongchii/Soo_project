<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>SOO EDU</title>
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.5.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/jquery/jquery-ui.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
		<!-- <script>
	
			$(document).ready(function() {
				menuClear();
			});
			
	
		</script> -->
	</head>
	<body>

		<div class="wrap">
			<div class="header_wrap">
				<div class="header">
					<a href="index.do">HOME</a>
				</div>
			</div>
			<div class="content_wrap">
				<div class="sidebar">
						<%@ include file="/WEB-INF/views/edu/menu.jsp" %>
				</div>
				<div class="contents">
				</div>
			</div>
		</div>
	</body>
</html>
