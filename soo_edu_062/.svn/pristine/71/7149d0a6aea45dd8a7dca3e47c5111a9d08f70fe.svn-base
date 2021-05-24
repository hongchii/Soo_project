<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link href="../resources/css/edu/edu.css" rel="stylesheet" media="screen">
	<meta charset="UTF-8">
	<title>Soo_Eud_JOIN 화면</title>
	<style>
	</style>
	<script>
//==================== 함수{START} ============================================================
	
	//--------------------null 체크 함수{START}------------------------------------------------------------
	function fn_null(value){
		//=== 형변환 없이 비교
		// null이면 true, null이 아니면 false
	    if (value === null) return true; 
	    if (typeof value === 'string' && value === '') return true;
	    if (typeof value === 'undefined') return true;
	    if (!value) return true;
	    
	    return false;
	}
	//--------------------null 체크 함수{END}------------------------------------------------------------
//==================== 함수{END} ============================================================

	

//==================== 파파고 API{START} ============================================================
	$(document).on('click', '#papago_change', function(e){
		e.preventDefault();
 		var send_type = $("#send_type").val();
		var result_type = $("#result_type").val(); 
		$("#result_type").val(send_type); 
		$("#send_type").val(result_type);
	});
	
	//번역을 위해서 button 이벤트를 위해서 사용하는 것
    $(document).on('click', '#jsonConvertStringSend' ,function (e){
    	e.preventDefault();
        //번역할 object를 생성 
        var test = {
            "original_str": $("#send_text").val() 
            , "send_type": $("#send_type").val()   
            , "result_type": $("#result_type").val()   
        };
        jsonSend(test);
    });
    
    function jsonSend(test) {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/soo_edu/papagoServlet.do",
            data: test, //json을 보내는 방법
            success: function (data) { //서블렛을 통한 결과 값을 받을 수 있습니다.
                console.log(data);
                //alert(data);

                //string의 값을 object 형식으로 변환합니다.
                var resulut_obj = JSON.parse(data);
                
                //결과값을 textarea에 넣기 위해서
                $("#result_text").val(resulut_obj.message.result.translatedText);
            },
            error: function (e) {
                console.log(e);
                alert('실패했습니다.');
            }
        });
    }	
//==================== 파파고 API{END} ============================================================
	</script>
</head>
<body>
테스트테스트테스트!
	<!-- container> -->
	<div class="container">
		<!-- header -->
	
		<!-- body area -->
		<section class="box2">
			<!-- login area -->
			
			<!-- content area -->
			<article class="sub2">
			
				<div class="sub2-content">
				<div class="main-link">
					<form name="updateForm" id="updateForm" role="form" method="post" action="${pageContext.request.contextPath}/soo_edu/boardUpdatePOST.do">
					<div>
						<div>						
							<select name="postParams" id="send_type">
								<option value="ko">한국어</option>
								<option value="en">영어</option>
							</select>
						</div>
						<div>
							<textarea name="send_text" id="send_text"></textarea>
						</div>

					</div>
					
					<div>
						<div><a href="#none" id="papago_change">↑↓↑↓↑↓↑↓↑↓</a></div>
					</div>
					
					<div>
						<div>
							<select name="postParams" id="result_type">
								<option value="en">영어</option>
								<option value="ko">한국어</option>
							</select>
						</div>
						<div>
							<textarea name="send_text" id="result_text"></textarea>
						</div>
					</div>
					
					<div>
						<div><input type="button" value="번역하기" id="jsonConvertStringSend"></div>
					</div>
					
					</form>
				</div>
				</div>
			</article>
		</section>
	</div>

	
</body>
</html>