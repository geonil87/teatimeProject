<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="../../storyboard/header.jsp" %>
<!DOCTYPE html>
<html>
  <head>
  <title>TEA :: TIME</title>
  	  	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/customcss/button.css">
  	  	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/customcss/insert.css">
  	  	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
  <style type="text/css">
  .btn-default{
     text-shadow: 0 1px 0 #fff;
    background-image: linear-gradient(to bottom,#fff 0,#e0e0e0 100%);
	background-repeat: repeat-x;
    border-color: #ccc;
	box-shadow: inset 0 1px 0 rgba(255,255,255,.15), 0 1px 1px rgba(0,0,0,.075);
	color: #333;
	background-color: #fff;
  }
  .error{
    color: red;
  }
  #postcode, #address{
    color: black;
  }
  
  
  </style> 
  
  </head>
  
  <body>
<div class="container">
	<div class="main-container">
			<div class="container-fluid no-left-padding no-right-padding page-content">
				<!-- container -->	
				<div class="container">
				<h1 class="widget-title" style="font-size: 25px">회원가입</h1>
						<hr style="border: 0; height: 1px; background: #ccc;">
								
					<!-- Row -->
					<div class="row">
						<!-- Content Area -->
						<div class="col-sm-12 content-area">
							<div class="aboute-block">
					
												<!-- 회원가입 페이지 -->
										<form action="${pageContext.request.contextPath}/member.regist" method="post" id="registForm">
								
										  <div class="row"></div>
									
											
												<div class="form_table">
												<table border="1" cellspacing="0" summary="표의 요약을 반드시 넣어 주세요">
												<tbody>
												<tr>
												<th scope="row" style="text-align: center;">아이디</th>
												<td>
													<div class="item">
														<input class="i_text" type="text" name="userId" id="id" maxlength="13" style="width: 300px">
													</div>
												</td>
												</tr>
												<tr>
												<th scope="row" style="text-align: center;">비밀번호</th>
												<td>
													<div class="item">
														<input class="i_text" type="password" name="userPw" id='pw'  maxlength="16" style="width: 300px">
													</div>
												</td>
												</tr>
												<tr>
												<th scope="row" style="text-align: center;">비밀번호 확인</th>
												<td>
													<div class="item">
														<input class="i_text" type="password" name="userPwConfirm" id='pwConfirm'  maxlength="16" style="width: 300px">
													</div>
												</td>
												</tr>
												<tr>
												<th scope="row" style="text-align: center;">닉네임</th>
												<td>
													<div class="item">
														<input class="i_text" name="userNick" id="nick" type="text" style="width: 300px;">
														<p class="i_dsc"></p>
													</div>
												</td>
												</tr>
													<tr>
												<th scope="row" style="text-align: center;">이메일</th>
												<td>
													<div class="item">
														<input class="i_text" name="userEmail" id="email" type="text" style="width: 300px;">
														<button type="button" style="margin-top: -3px" class="btn btn-default btn-sm" onclick="checkEmail()">이메일 인증</button>
														<p class="i_dsc"></p>
													</div>
												</td>
												</tr>
												<tr>
												<th scope="row" style="text-align: center;">이름</th>
												<td>
													<div class="item">
														<input class="i_text" name="userName" id="name" type="text" style="width: 300px">
														<p class="i_dsc"></p>
													</div>
												</td>
												</tr>
												<tr>
												<th scope="row" style="text-align: center;">생년월일</th>
												<td>
													<div class="item">
														<input class="i_text" id="datepicker" name="userBirthday" type="text" readonly="readonly" style="width: 300px">
														<p class="i_dsc"></p>
													</div>
												</td>
												</tr>
												<tr>
												<th scope="row" style="text-align: center;">휴대폰</th>
												<td>
													<div class="item">
														<input class="i_text" name="userPhone" id="phone" type="text" style="width: 300px">
														<p class="i_dsc"></p>
													</div>
												</td>
												</tr>
												<tr>
												<th scope="row" style="text-align: center;">주소</th>
												<td>
													<div class="item">
														<input class="i_text" type="text" name="userPostcode" id='postcode' style="width: 100px" placeholder="우편번호" readonly="readonly" onclick="addressFind()">
														<input class="i_text" type="text" name="userAddress1" id='address' style="width: 300px" placeholder="주소" readonly="readonly" onclick="addressFind()">
														<input class="i_text" type="text" name="userAddress2" id='addressDetail'style="width: 300px" placeholder="상세주소">
														<button type="button" style="margin-top: -3px" class="btn btn-default btn-sm" onclick="addressFind()">주소 찾기</button><br>
														<p class="i_dsc"></p>
													</div>
													
												</td>
												</tr>
												<tr>
												<th scope="row" style="text-align: center;" >성별</th>
												<td>
													<div class="item">
														<input class="i_check" id="genderM" type="radio" name="userGender" value="M" checked="checked"  ><label for="a1">남성</label> <input class="i_check" id="genderF" type="radio" name="userGender" value="F" ><label for="a2">여성</label>
													</div>
												</td>
												</tr>
										
												</tbody>
												</table><br>
												<input type="hidden" value="1" name="userPermission"/>
										             <div align="center"><input type="submit" class="btn btn-default" value="확인" id='regist'/>   <button type="button" onclick="location.href='${pageContext.request.contextPath }/main'" class="btn btn-default">취소</button></div> 
										              </div>
											
										</form>
									</div>
								</div>
							</div>
						</div><!-- Content Area /- -->
					</div><!-- Row /- -->
				</div><!-- container /- -->
			</div><!-- Aboute-me Section /- -->



<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function addressFind() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addressDetail').focus();
            }
        }).open();
    }
</script>
<script type="text/javascript" src=" ${pageContext.request.contextPath}/resources/jquery-3.2.1.min.js"></script>
<script>

function checkEmail(){
	var openWin;
	openWin = window.open("${pageContext.request.contextPath}/member.checkEmail",
			"emailAuthForm","width=780, height=400, resizable = no, scrollbars = no");
}
</script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
<script>
$(function() {
      $("#datepicker").datepicker({
          dateFormat:'yymmdd',
          monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
          dayNamesMin:['일','월','화','수','목','금','토'],
          maxDate:'0', 
          yearRange: 'c-100:2030',
          changeMonth:true, // 월변경가능
          changeYear:true,  // 년변경가능
          showMonthAfterYear:true, // 년 뒤에 월표시
          constrainInput: false
      });
     });
     
</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/etc/jquery.validate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/etc/additional-methods.min.js"></script>
<script>
	
	$.validator.addMethod("regx", function(value, element, regexpr) {
		
		return regexpr.test(value);
		
	});
	
	

	$(function(){
	    $("#registForm").validate({
		    


	    	rules: {
				userId: {
					required : true, 
					minlength : 6, 
					maxlength : 12 , 
					regx : /^[a-z]{1}[a-z0-9]{5,11}$/,
					remote : {  
						url : "${pageContext.request.contextPath}/member.checkSameId",
				    	type : "post",
				    	data : { id : function() { return $('#id').val();} }
					}
				},
								
				userPw: {required: true, minlength: 8, maxlength: 16 , regx : /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&]).*$/	},
				userPwConfirm: {required: true, equalTo:'#pw'},
				userNick: {
					required: true, 
					minlength: 2, 
					maxlength: 10, 
					regx : /^[\w가-힣]{2,10}$/,
					remote : {  
						url : "${pageContext.request.contextPath}/member.checkSameNick",
					    type : "post",
					    data : { nick : function() { return $('#nick').val();} }
					}
				},
				
				userEmail: {required: true, regx : /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/	},
				userName: {required: true, minlength: 2, maxlength: 5, regx : /^[가-힣]{2,5}$/	},
				userBirthday: {required: true, minlength: 8, maxlength: 8, regx : /^(\d){4}([0][1-9]|[1][0-2])([0][0-9]|[1][0-9]|[2][0-9]|[3][0-1])$/	},
				userPhone: {required: true, minlength: 10, maxlength: 11,	regx : /^(01[0|1|6|8|9])([0-9]{3,4})([0-9]{4})$/	},
				userPostcode: {required: true	},
				userAddress1: {required: true	},
				userAddress2: {required: true	},
				userGender : {required: true	}
				
			},
			
			
			messages : {
				userId : {
    				required : '아이디를 입력해주세요. (소문자, 숫자 조합 6~12자리)'
    				, minlength : $.validator.format('{0}자 이상 소문자와 숫자 조합이어야 합니다.')
    				, maxlength : $.validator.format('{0}자 이하 소문자와 숫자 조합이어야 합니다.')
    				, regx : $.validator.format('소문자와 숫자 조합으로 6~12글자로 이루어져야 합니다.')
    				, remote : $.validator.format('중복된 아이디 입니다.')
    			},
    			
    			userPw : {
    				required : '비밀번호를 입력해주세요. (영문자,숫자,특수문자[!,@,#,$,%,^,&] 조합 8~16자리)'
    				, minlength : $.validator.format('{0}자 이상 영문자,숫자,특수문자(!,@,#,$,%,^,&) 조합이어야 합니다.')
    				, maxlength : $.validator.format('{0}자 이하 영문자,숫자,특수문자(!,@,#,$,%,^,&) 조합이어야 합니다.')
    				, regx : $.validator.format('영문자,숫자,특수문자(!,@,#,$,%,^,&) 조합으로 8~16글자로 이루어져야 합니다.')
    			},
    			userPwConfirm : {
    				required : '비밀번호 확인을 입력해주세요.'
    				,  equalTo: "비밀번호가 일치하지 않습니다. 다시 입력해주세요." 
    			},
    			
    			userNick : {
    				required : '닉네임을 입력해주세요. (특수문자를 제외한 2~10 자리)'
    				, minlength : $.validator.format('{0}자 이상 입력해주세요.')
    				, maxlength : $.validator.format('{0}자 이하 입력해주세요.')
    				, regx : $.validator.format('특수문자를 제외한 2~10글자로 이루어져야 합니다.')
    				, remote : $.validator.format('중복된 닉네임 입니다.')
    			},
    			userEmail : {
    				required : '이메일을 입력해주세요.'
    				, regx : $.validator.format('잘못된 이메일 양식입니다.')
    			},
    			userName : {
    				required : '이름을 입력해주세요.'
    				, minlength : $.validator.format('{0}자 이상 한글을 입력해주세요.')
    				, maxlength : $.validator.format('{0}자 이하 한글을 입력해주세요.')
    				, regx : $.validator.format('한글 2~5글자로 이루어져야 합니다.')
    			},
    			userBirthday : {
    				required : '생년월일을 선택해주세요.'
    				, regx : $.validator.format('생년월일을 올바르게 선택해주십시오.')
    			},
    			userPhone : {
    				required : '핸드폰 번호를 입력해주세요.'
    				, minlength : $.validator.format('{0}자 이상 입력해주세요.')
    				, maxlength : $.validator.format('{0}자 이하 입력해주세요.')
    				, regx : $.validator.format('핸드폰 번호를 올바르게 입력해 주십시오.(ex.01012345678)')
    			},
    			userPostcode : {required : ''},
    			userAddress1 : {required : ''},
    			userAddress2 : {required : '상세주소를 입력해주세요.'},
    			userGender : {required : '성별을 선택해주세요.'}
			},
			
			groups: {
		        addressGroup: "userPostcode userAddress1"
		      
		    },
			
		    errorPlacement: function(error, element) {
					if (element.attr("name") == "userEmail") {
						$(element).next().after(error);
		          	}else if(element.attr("name") == "userPostcode" || element.attr("name") == "userAddress1"){
		          		$(element).next().next().next().after(error);
		          	}else if(element.attr("name") == "userAddress2"){
		          		$(element).next().next().after(error);
		          	}else {
		           		element.after(error);
		          	}
		          	
			},
		    
		    success: function(label) {
		    	//
			}
			
	    	
	    	
	    });
	})

</script>

    
 <%@ include file="../../storyboard/bottom.jsp" %>
  </body>
</html>

