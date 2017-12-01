<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../storyboard/header.jsp" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title> TEA :: TIME </title>
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
</style>
</head>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/customcss/button.css">
  	  	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/customcss/insert.css">
  	  	
<body>

<div class="container">
	<div class="main-container">
			<div class="container-fluid no-left-padding no-right-padding page-content">
				<!-- container -->	
				<div class="container">
					<!-- Row -->
					<div class="row">
						<!-- Content Area -->
						<div class="col-sm-12 content-area">
							<div class="aboute-block">
					
		<!-- 회원가입 페이지 -->
<form action="${pageContext.request.contextPath}/member.modifyUserInfo" method="post" id="modifyForm">

<h1 class="widget-title" style="font-size: 25px">회원정보 수정</h1>
						<hr style="border: 0; height: 1px; background: #ccc;">

  <div class="row"></div>

		<div class="form_table">
		<table border="1" cellspacing="0" summary="표의 요약을 반드시 넣어 주세요">
		<tbody>
		<tr>
		<th scope="row" style="text-align: center;">아이디</th>
		<td>
			<div class="item">
				 <div id='userId' style="display: inline;">${memberDTO.userId }</div><br>
			</div>
		</td>
		</tr>
		<tr>
		<th scope="row" style="text-align: center;">비밀번호</th>
		<td>
			<div class="item">
				<input title="레이블 텍스트" class="i_text" type="password" name="userPw" id='pw1'  maxlength="16" required="required"><div id='pwSameCheck' style="display: inline;"></div>
			</div>
		</td>
		</tr>
		<tr>
		<th scope="row" style="text-align: center;">비밀번호 확인</th>
		<td>
			<div class="item">
				<input title="레이블 텍스트" class="i_text" type="password" id='pw2' name="userPwConfirm" maxlength="16" required="required">
			</div>
		</td>
		</tr>
		<tr>
		<th scope="row" style="text-align: center;">닉네임</th>
		<td>
			<div class="item">
				<div id='userNick' style="display: inline;">${memberDTO.userNick }</div>
				<p class="i_dsc"></p>
			</div>
		</td>
		</tr>
			<tr>
		<th scope="row" style="text-align: center;">이메일</th>
		<td>
			<div class="item">
				<div id='userEmail' style="display: inline;">${memberDTO.userEmail }</div>
				<p class="i_dsc"></p>
			</div>
		</td>
		</tr>
		<tr>
		<th scope="row" style="text-align: center;">이름</th>
		<td>
			<div class="item">
				<div id='userName' style="display: inline;">${memberDTO.userName }</div>
				<p class="i_dsc"></p>
			</div>
		</td>
		</tr>
		<tr>
		<th scope="row" style="text-align: center;">생년월일</th>
		<td>
			<div class="item">
				<div id='userBirthday' style="display: inline;">${memberDTO.userBirthday }</div>
				<p class="i_dsc"></p>
			</div>
		</td>
		</tr>
		<tr>
		<th scope="row" style="text-align: center;">휴대폰</th>
		<td>
			<div class="item">
				<input title="레이블 텍스트" class="i_text" name="userPhone" type="text" required="required" value="${memberDTO.userPhone }" >
				<p class="i_dsc"></p>
			</div>
		</td>
		</tr>
		<tr>
		<th scope="row" style="text-align: center;">주소</th>
		<td>
			<div class="item">
				<input title="레이블 텍스트" class="i_text" type="text" name="userPostcode" id='postcode' required="required" value="${memberDTO.userPostcode }"><input title="레이블 텍스트" class="i_text" type="text" name="userAddress1" id='address' required="required" value="${memberDTO.userAddress1 }" ><input title="레이블 텍스트" class="i_text" type="text" name="userAddress2" id='addressDetail' required="required" value="${memberDTO.userAddress2 }" ><button type="button" style="margin-top: -3px" class="btn btn-default btn-sm" onclick="addressFind()" value="">주소찾기</button><br>
				<p class="i_dsc"></p>
			</div>
			
		</td>
		</tr>
		<tr>
		<th scope="row" style="text-align: center;">성별</th>
		<td>
			<div class="item">
				<input class="i_check" id="a1" type="radio" name="userGender" value="M" <c:out value="${memberDTO.userGender == 'M'?'checked':''}"/> disabled="disabled" ><label for="a1">남성</label> <input class="i_check" id="a2" type="radio" name="userGender" value="F" <c:out value="${memberDTO.userGender == 'F'?'checked':''}"/> disabled="disabled"><label for="a2">여성</label>
				<input type="hidden" name="userGender" value="${memberDTO.userGender }"/>
			</div>
		</td>
		</tr>

		</tbody>
		</table><br>
		<input type="hidden" name="userId" value="${memberDTO.userId }"/>
		<input type="hidden" name="userPermission" value="${memberDTO.userPermission }"/>
			 <div align="right">
				 <input type="button" class="btn btn-default"  value="회원 탈퇴" onclick="location.href='${pageContext.request.contextPath}/member.deleteUser'">
			 </div>
             <div align="center"><input type="submit" class="btn btn-default"  value="확인" id='regist'/>   <input type="button" class="btn btn-default" value="취소" onclick="document.location.replace('${pageContext.request.contextPath}/main')" /></div> 
              </div>
	
</form>
</div>
									</div>
								</div>
							</div>
						</div><!-- Content Area /- -->
					</div><!-- Row /- -->
				</div><!-- container /- -->

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-3.2.1.min.js"></script>

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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/etc/jquery.validate.min.js"></script>
<script>
	
	$.validator.addMethod("regx", function(value, element, regexpr) {
		
		return regexpr.test(value);
		
	});
	
	$.validator.setDefaults({
		onkeyup: false
		, onclick: false
		, onfocusout: false
		, showErrors: function(errorMap, errorList) {
			if(errorList.length < 1)
				return;
					
			alert(errorList[0].message);
		}
	});	

	$(function(){
	    $("#modifyForm").validate({
	    	
	    	rules: {
				userPw: {required: true, minlength: 8, maxlength: 16 , regx : /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/	},
				userPwConfirm: {required: true, equalTo:'#pw1'},
				userPhone: {required: true, minlength: 10, maxlength: 11,	regx : /^(01[0|1|6|8|9])([0-9]{3,4})([0-9]{4})$/	},
				userPostcode: {required: true	},
				userAddress1: {required: true	},
				userAddress2: {required: true	},
				
			},
			
			messages : {
    			
    			userPw : {
    				required : '비밀번호를 입력해주세요.'
    				, minlength : $.validator.format('비밀번호는 {0}자 이상이어야 합니다.')
    				, maxlength : $.validator.format('비밀번호는 {0}자 이이어야 합니다.')
    				, regx : $.validator.format('비밀번호는 소문자,대문자,숫자,특수문자(!,@,#,$,%,^,&,+,=) 조합으로 8~16글자로 이루어져야 합니다.')
    			},
    			userPwConfirm : {
    				required : '비밀번호 확인을 입력해주세요.'
    				,  equalTo: "비밀번호가 일치하지 않습니다. 다시 확인해주세요." 
    			},
    			userBirthday : {
    				required : '생년월일을 입력해주세요.'
    				, regx : $.validator.format('생년월일을 올바르게 선택해주십시오.')
    			},
    			userPhone : {
    				required : '핸드폰 번호를 입력해주세요.'
    				, minlength : $.validator.format('핸드폰 번호를 {10}자 이상이어야 합니다.')
    				, maxlength : $.validator.format('핸드폰 번호를 {11자 이이어야 합니다.')
    				, regx : $.validator.format('핸드폰 번호를 올바르게 입력해 주십시오.(10~11자리) ')
    			},
    			userPostcode : {	required : '우편번호를 입력해주세요.'	},
    			userAddress1 : {	required : '주소를 입력해주세요.'	},
    			userAddress2 : {	required : '상세주소를 입력해주세요.'	},
			}	
	    	
	    	
	    });
	})

</script>

<%@ include file="../../storyboard/bottom.jsp" %>
</body>
</html>