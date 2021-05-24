<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script>

function change(){
	var before = $("#before").val();
	var after = $("#after").val();
	
	$("#before").val(after); 
	$("#after").val(before);
	
	
}
	
	
function papago(){
    var before_lang = before1;
	var before = $("#before").val();
	var after = $("#after").val();
	var before1 =encodeURI(before);
	
    var text = {
    		"before_lang" : before1,
    		"source" : $("#before").val(),
    		"target" : $("#after").val()
    }
    
    console.log("dd" + before_lang + before + after);
	  $.ajax({
		//  console.log("dd" + before_lang);
	         url : '/user/papago',
	         data : JSON.stringify(text),
	         tyep : 'POST',
	         success : function(data){
	          	$("#after_lang").val(data);
	        	 
	         }, 
	         error : function(){
	            alert('통신 실패')
	         }
	      }) // ajax endf
}	
</script>
	</head>
	<body>
		<div class="wrap">
			<div class="header_wrap">
				<div class="header">
					<a href="index.html">HOME</a>
				</div>
			</div>
			<div class="content_wrap">
				<div class="sidebar">
					<div class="logo">
						<a href="/index.do"><img src="${pageContext.request.contextPath}/resources/img/common/logo.png" /></a>
					</div>
					<div class="user">
						<!-- 로그인 -->
						<div class="login_wrap" style="display:none;">
							<div class="input_wrap">
								<input type="text" />
								<input type="password" />
							</div>
							<button>로그인</button>
							<a href="#none">· 회원가입</a>
							<a href="#none">· ID/PW 찾기</a>
						</div>
						<!-- //로그인 -->
						<!-- 접속정보 -->
						<div class="user_status">
							<div class="img">
								<img src="${pageContext.request.contextPath}/resources/img/common/user.png" />	
							</div>
							<div class="info">
								<p>환영합니다!</p>
								<p class="name"><span>홍길동</span>님</p>
								<p>최근접속일 <span>2020.04.30 10:48</span></p>
							</div>
						</div>
						<!-- //접속정보 -->
					</div>
					<!-- 메뉴(활성화시 li태그에 클래스'on' 추가) -->
					<div class="menu">
						<ul>
							<li>
								<a href="/edu/board.do">공지사항</a>
							</li>
							<li>
								<a href="#none">API</a>
								<ul class="depth">
									<li>
										<a href="/edu/papago.do">파파고</a>
									</li>
									<li>
										<a href="/edu/shop.do">카카오페이</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="#none">문의하기</a>
							</li>
							<li>
								<a href="#none">상품보기</a>
							</li>
							<li>
								<a href="#none">마이페이지</a>
							</li>
						</ul>
					</div>
					<!-- //메뉴 -->
				</div>
				<div class="contents">
					<h1 class="title">파파고</h1>
					<div class="papago_wrap">
						<div class="left_box">
							<div class="box_top">
								<select id="before">
									<option value="ko">한국어</option>
									<option value="en">영어</option>
								</select>
								<button class="exchange" onClick="change();"><span class="hide">변경</span></button>
							</div>
							<div class="box">
								<textarea id="before_lang" placeholder="번역할 내용을 입력해주세요."></textarea>
							</div>
						</div>
						<div class="right_box">
							<div class="box_top">
								<select id="after">
									<option value="en">영어</option>
									<option value="ko">한국어</option>
								</select>
							</div>
							<div class="box">
								<textarea id="after_lang" readonly></textarea>
							</div>
						</div>
					</div>
					<div class="btn_wrap right">
						<!-- <a href="#none" class="btn">번역</a> -->
						<input type="button" class="btn" onclick="papago();" value="번역"/>					</div>
				</div>
			</div>
		</div>
	</body>
</html>
