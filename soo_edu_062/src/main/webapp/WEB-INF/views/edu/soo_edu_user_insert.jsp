<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SOO EDU</title>
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

var chkPhone = "(01[016789])-(\\d{3,4})-(\\d{4})";
var chkEmail = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,}$/;
var chkBirth = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
var isEmpty = function(val) {
    if (val === "" || val === null || val === undefined || (val !== null && typeof val === "object" && !Object.keys(val).length)){
            return true // 빈객체, null, "", undefined 등등 값을 읽어올수 없으면 true 반환
          } else {
            return false // 값이 있으면 false
          }
    }
    
	// 주소 검색 팝업
	function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/user/jusoPopup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}
	// 선택한 주소 callback
	function jusoCallBack(roadFullAddr,zipNo, addrDetail){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		console.log("roadFullAddr=" + roadFullAddr);
		console.log("zipNo=" + zipNo);
		console.log("addrDetail=" + addrDetail);
		
		document.registerForm.soo_user_zipcode.value= zipNo;
		document.registerForm.soo_user_addr1.value= roadFullAddr;
		document.registerForm.soo_user_addr2.value= addrDetail;
		
	}
	    
	
	
	function chkForm(){
		
			var chkCnt = 0;
		
			//이름
			if (isEmpty(document.registerForm.soo_user_name.value)) {
				alert("이름을 입력해주세요.")
				document.registerForm.soo_user_name.value == ""
				document.registerForm.soo_user_name.focus();
				chkCnt++;
				return false;
			}
			
			//생일
			if (isEmpty(document.registerForm.soo_user_birth.value)) {
				alert("생년월일을 입력해주세요.")
				document.registerForm.soo_user_birth.value == ""
				document.registerForm.soo_user_birth.focus();
				chkCnt++;
				return false;
			}else{
				var birth = document.registerForm.soo_user_birth.value;
				console.log(birth)
				var reg = new RegExp(chkBirth);
				console.log("reg" + reg);
				var check = reg.test(birth);
			
				if(!check){
					alert("생년월일을 다시 확인해주세요")
					document.registerForm.soo_user_birth.value = ""
					document.registerForm.soo_user_birth.focus();
					chkCnt++;
					return false;
				}
			}
			
			//핸드폰번호
			if (isEmpty($("#soo_user_phone").val())) {
				alert("핸드폰번호를 입력해주세요.")
				//$("#soo_user_phone").val()
				//$("#soo_user_phone").val() == ""
				//$("#soo_user_phone").val().focus();
				document.registerForm.soo_user_phone.value;
				//document.registerForm.soo_user_phone.focus();
				$("#soo_user_phone").on(focus);
				chkCnt++;
				return false;
			}else{
				//var phone = document.registerForm.soo_user_phone.value;
				var phone = $("#soo_user_phone").val();
				var reg = new RegExp(chkPhone);
				var check = reg.test(phone);
				
				if(!check){
					alert("핸드폰번호를 다시 확인해주세요")
					$("#soo_user_phone").val() = ""
					$("#soo_user_phone").val().focus();
					chkCnt++;
					return false;
				}else {
					var regex = /[^0-9]/g; //숫자만
					var user_phone = $("#soo_user_phone").val().replace(regex, ""); //하이픈 제거
					$("#soo_user_phone2").val(user_phone);  
					console.log("핸드폰!!!!")
				  $.ajax({
				         url : '/user/getPhone.do',
				         type:"post",
				         data : {'user_phone' : user_phone},
				         async : false,
				         success : function(data){
				        	console.log(data)
				            if(data == 'phone exists'){
				            	
				            	alert('이미 가입된 핸드폰 번호입니다.');
				            	
				            	 
						         $("#soo_user_phone").val("");
						         $("#soo_user_phone").focus();

									chkCnt++;
						         return false;
						         
				            }else{
				            	
				            	alert('사용가능한 핸드폰 번호입니다.');
				            	
				            	//$('#registerForm').submit();
				            	
				            }
				         }, 
				         error : function(){
				            alert('핸드폰 중복체크 통신 실패')
							chkCnt++;
				         }
				      }) // ajax end
				}			
			}
			
			//이메일주소
			if ( isEmpty(document.registerForm.soo_user_mail1.value) || isEmpty(document.registerForm.select.value) ) {
				alert("이메일주소를 입력해주세요.")
				//document.registerForm.soo_user_mail1.value == ""
				document.registerForm.soo_user_mail1.focus();
				chkCnt++;
				return false;
			} else {
				var user_mail1 = $("#soo_user_mail1").val();	
    			var user_mail2 = $("#select").val();
				
    			var user_mail = user_mail1+user_mail2;
    			$("#soo_user_mail").val(user_mail);
    			
    			console.log("user_mail========" + user_mail)
    			
    			  $.ajax({
   			         url : '/user/getMail.do',
   			      	 type:"post",
   			      	 async : false,
   			         data : {'user_mail' : user_mail},
   			         success : function(data){
   			        	if(data == 'mail exists'){
			            	
			            	alert('이미 가입된 메일 주소입니다.');
			            	
			            	 
					         $("#soo_user_mail1").val("");
					         $("#soo_user_mail1").focus();

								chkCnt++;
					         return false;
					         
			            }else{
			            	
			            	alert('사용가능한 메일주소 입니다.');
			            	
			            	//$('#registerForm').submit();
			            	
			            }
   			         }, 
   			         error : function(){
   			         	   alert('이멜통신 실패');
   			         	   chkCnt++;
   			         }
   			      }) // ajax end
    			
			}
			
			//주소
			if (isEmpty(document.registerForm.soo_user_zipcode.value) || isEmpty(document.registerForm.soo_user_addr1.value) || isEmpty(document.registerForm.soo_user_addr2.value) ) {
	            alert("주소를 입력해주세요.")
	            //document.registerForm.soo_user_pw2.focus();
				chkCnt++;
	            return false;
	        }else if(isEmpty(document.registerForm.soo_user_addr2.value)){
	        	alert("상세주소를 입력해주세요.")
	        	chkCnt++;
	        	return false;
	        }
			
			//닉네임
			if (isEmpty(document.registerForm.soo_user_nick.value)) {
	            alert("닉네임을 입력해주세요.")
	            document.registerForm.soo_user_nick.focus();
				chkCnt++;
	            return false;
	        }
			
			//비밀번호
			if(isEmpty(document.registerForm.soo_user_pw.value)){
				alert("비밀번호를 입력하지 않았습니다.")
	            document.registerForm.soo_user_pw.focus();
				chkCnt++;
	            return false;
			} else if (isEmpty(document.registerForm.soo_user_pw2.value)){
				alert("비밀번호를 다시 한번 확인을 해주세요.")				
				chkCnt++;
				return false;
			} else if(document.registerForm.soo_user_pw.value != document.registerForm.soo_user_pw2.value) {
		        alert("비밀번호가 일치하지 않습니다.")
		        document.registerForm.soo_user_pw2.value = ""
		        document.registerForm.soo_user_pw2.focus();
				chkCnt++;
		        return false;
		    } else {
		    
				var pw = document.registerForm.soo_user_pw.value;
				var pwd = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
				
				if ( pwd > 0 ){
					alert("특수문자를 사용할수 없습니다.")
					document.registerForm.soo_user_pw.value = ""
					document.registerForm.soo_user_pw.focus();
					chkCnt++;
					return false;
				}
		    	
		    }
			
		if ( chkCnt == 0 ) {
			registerForm.submit();
			alert("회원가입성공!")
		}
		

		
		
	} // chkForm end
	
	
	$(document).ready(function(){
	
		//이메일 직접입력
        $('#select').change(function() {
            if ($('#select').val() == '1') {
                $('#select1').attr("disabled", false);
                $('#select1').val("");
                $('#select1').focus();
            } else {
                $('#select').val($('#select').val());
            }
        })
    
	}) //document.ready end
	
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

				<form action="/user/registers.do" name="registerForm" method="post" >
					<h1 class="title">회원가입</h1>
 
					<div class="table_detail_wrap"> 
						<table>
							<tbody>
								<tr>
									<th>이름</th>
									<td colspan="1">
										<input type="text" name="soo_user_name" />
									</td>

									<th>생년월일</th>
									<td colspan="3">
									
									
		
										<input type="text" name="soo_user_birth" placeholder="ex)19990901" />
									</td> 
										
								</tr>
								
								<tr>
									<th>핸드폰번호</th>
									<td colspan="1">
										<input type="tel" id="soo_user_phone" placeholder="ex)010-0000-0000" />
										<input type="hidden" name="soo_user_phone" id="soo_user_phone2" />
									</td>
									<th>이메일주소</th>
									<td colspan="1">
										<input type="text" id="soo_user_mail1"  /> 
										<input type="hidden" id="soo_user_mail" name="soo_user_mail"/> 
									</td>
									<td colspan="1">	
										<select  id="select" name="soo_user_mail2">
											<option value="" disabled selected>선택</option>
								            <option value="@naver.com" id="select">@naver.com</option>
								            <option value="@google.com" id="select">@google.com</option>
								            <option value="1" >직접 입력하기</option>
								            
								            <!-- 
											<option value="">선택</option>
											<option value="@naver.com">@naver.com</option>
											<option value="@google.com">@google.com</option> 
											<option value="1">직접입력</option>
											 -->
										</select>
									</td>
									
									<td colspan="1">
										<input type="text" id="select1" placeholder="직접입력" disabled  />
									</td>
									
								</tr>
							
								<tr>
									<th>주소</th>
									<td colspan="1">
										<input type="text" name="soo_user_zipcode" id="soo_user_zipcode" placeholder="우편번호"  readonly/>
									</td>
									<td colspan="3" >
										<input type="text" name="soo_user_addr1" id="soo_user_addr1" placeholder="검색주소"  readonly/>
									</td>
									
									<td>
										<input type="button" onClick="goPopup();" value="우편번호검색"/>
									</td>
								</tr>
								
								<tr>
									<th></th>
									<td colspan="5">
										<input type="text" name="soo_user_addr2" placeholder="나머지주소" />
									</td>
								</tr>
								
								<tr>
									<th>닉네임</th>
									<td colspan="5">
										<input type="text" name="soo_user_nick" />
									</td>
								</tr>
								
								<tr>
									<th>비밀번호</th>
									<td colspan="5">
										<input type="password" id="soo_user_pw" name="soo_user_pw" autocomplete="false"  />
									</td>
								</tr>
								
								<tr>
									<th>비밀번호확인</th>
									<td colspan="5">
										<input type="password" id="soo_user_pw2" name="soo_user_pw2" autocomplete="false" />
									</td>
								</tr>
								
								<tr>
									<th></th>
									<td colspan="5"><input type="text" /></td>
								</tr>
								
								<tr>
							</tbody>
						</table>
						
				</form>
					<div class="btn_wrap right">
						<a href="#none" class="btn">목록으로</a>
						<a href="javascript:void(0)" class="btn" onClick="chkForm();">회원가입</a>
						
						<!-- <a href="javascript:void(0);" class="btn">목록으로</a> -->
						<!-- 	<button type="button" class="btn write" onclick="chkForm()">저장</button> -->
						<!-- <input type="button" class="btn write" value="회원가입" onclick="chkForm();" >회원가입</button> -->
						<!-- <input type='button' value='저장' onclick="chkForm()"/> -->
						<!-- <input type="button" value="button으로전송" onclick="chkForm()"> -->
						<!-- <input type="submit" class="btn write">저장  -->
					</div>
					
			</div>
		</div>
	</div>
</body>
</html>