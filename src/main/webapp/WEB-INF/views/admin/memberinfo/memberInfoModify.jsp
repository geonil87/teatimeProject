<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/adminHeader.jsp" %>
  <style type="text/css">
  .error{
    color: red;
  }
  #postcode, #address{
    color: black;
  }
  </style> 
	
			<!-- start: Content -->
			<div id="content" class="span10">
			
						
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="index.html">Home</a> 
					<i class="icon-angle-right"></i>
				</li>
				<li>
					<a href="#">회원 관리</a>
					<i class="icon-angle-right"></i>
				</li>
				<li>
					<a href="#">회원 정보 수정</a>
				</li>
			</ul>
			
			
			<div class="row-fluid">
			
				<div class="box span6">
					<div class="box-header">
						<h2><i class="halflings-icon white question-sign"></i><span class="break"></span>회원 정보</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
						 
						<form class="form" action="${pageContext.request.contextPath}/management.modifyMemberInfo" method="post" id="modifyMemberInfo"> 
							<fieldset>
								<div class="control-group" style="margin: auto;">
									  <div class="controls">
									  <label class="control-label"><b>아이디</b></label>
									  </div>
									  <div class="controls">
										<input type="text" class="span14 typeahead" name="userId" readonly="readonly" value="${memberInfo.userId}">
									  </div>
								</div>
								
								<legend style="margin-top: auto; margin-bottom: auto;"></legend>
								
								<div class="control-group" style="margin: auto;">
									<label class="control-label"><b>비밀번호</b></label>
										<div class="controls">
											<input type="password" name="userPw" id="pw" class="span14 typeahead" value="${memberInfo.userPw }">
										</div>
								</div>	
								
								<legend style="margin-top: auto; margin-bottom: auto;"></legend>
								
								<div class="control-group" style="margin: auto;">
									<label class="control-label"><b>닉네임</b></label>
										<div class="controls">
											<input type="text" id="nick" name="userNick" class="span14 typeahead" value="${memberInfo.userNick}" readonly="readonly">
										</div>
								</div>		
								
								<legend style="margin-top: auto; margin-bottom: auto;"></legend>
								
								<div class="control-group" style="margin: auto;">
									  <div class="controls">
									  <label class="control-label"><b>이메일</b></label>
									  </div>
									  <div class="controls">
										<input type="text" name="userEmail" id="email" class="span14 typeahead" value="${memberInfo.userEmail}">
									  </div>
								</div>
								
								<legend style="margin-top: auto; margin-bottom: auto;"></legend>
								
								<div class="control-group" style="margin: auto;">
									  <div class="controls">
									  <label class="control-label"><b>이름</b></label>
									  </div>
									  <div class="controls">
										<input type="text" name="userName" id="name" class="span14 typeahead" value="${memberInfo.userName}">
									  </div>	
								</div>
								
								<legend style="margin-top: auto; margin-bottom: auto;"></legend>
								
								<div class="control-group" style="margin: auto;">
									  <div class="controls">
									  <label class="control-label"><b>생년월일</b></label>
									  </div>
									  <div class="controls">
										<input id="datepicker" name="userBirthday" type="text" class="span14 typeahead" value="${memberInfo.userBirthday}">
									  </div>
								</div>
								
								<legend style="margin-top: auto; margin-bottom: auto;"></legend>
								
								<div class="control-group" style="margin: auto;">
									  <div class="controls">
									  <label class="control-label"><b>휴대폰</b></label>
									  </div>
									  <div class="controls">
										<input type="text" name="userPhone" id="phone" class="span14 typeahead" value="${memberInfo.userPhone}">
									  </div>
								</div>
									
								<legend style="margin-top: auto; margin-bottom: auto;"></legend>
									
								<div class="control-group" style="margin: auto;">
									  <div class="controls">
										<label class="control-label"><b>주소</b></label>
									  </div>
									  <div class="controls">
										<input type="text" name="userPostcode" id="postcode" class="span2 typeahead" value="${memberInfo.userPostcode}" onclick="addressFind()" readonly="readonly">&nbsp;-
										<input type="text" name="userAddress1" id="address" class="span8 typeahead" value="${memberInfo.userAddress1}" onclick="addressFind()" readonly="readonly">
										<input type="button" class="btn btn-small btn-inverse" style="margin-bottom: 9px; margin-left: 20px;" onclick="addressFind()" value="주소 찾기">
										<input type="text" name="userAddress2" id="addressDetail" class="span14 typeahead" value="${memberInfo.userAddress2}">
									  </div>
								</div>
									
								<legend style="margin-top: auto; margin-bottom: auto;"></legend>
								
								<div class="control-group" style="margin: auto;">
									<div class="controls">
									<label class="control-label"><b>성별</b></label>
									</div>
									<div class="controls">
									<label class="radio inline">
										<input type="radio" name="userGender" id="genderM" value="M" <c:out value="${memberInfo.userGender == 'M'?'checked':''}"/>>
											남자
									</label>
									<label class="radio inline">
										<input type="radio" name="userGender" id="genderF" value="F" <c:out value="${memberInfo.userGender == 'F'?'checked':''}"/>>
											여자
									</label>
									</div>
								</div>
									
								<legend style="margin-top: auto; margin-bottom: auto;"></legend>
									
								<div class="control-group" style="margin: auto;">
									  <div class="controls">
									  <label class="control-label"><b>가입일</b></label>
									  </div>
									  <div class="controls">
										<input type="text" class="span14 typeahead" disabled="disabled" value="${memberInfo.userIndate}">
									  </div>
								</div>
								
								<legend style="margin-top: auto; margin-bottom: auto;"></legend>
								<div class="control-group" style="margin: auto; text-align: center;">
									<p style="margin-top: 10px">
										<button class="btn btn-large btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;수정&nbsp;&nbsp;&nbsp;&nbsp;</button>
										<input type="button" class="btn btn-large btn-inverse" onclick="document.location.replace('${pageContext.request.contextPath}/management.memberInfo?&userId=${memberInfo.userId }')" value="&nbsp;&nbsp;&nbsp;&nbsp;취소&nbsp;&nbsp;&nbsp;&nbsp;">
									</p>
								</div>
							</fieldset>
						</form>
						
						
						</div>
					</div><!--/row -->                           

					  
					  
				</div>	  
					  
					  
			  </div><!--/span-->
				
								
							
			
			</div><!--/row-->
    

		</div><!--/.fluid-container-->
	
			<!-- end: Content -->
		

			
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->

		
<%@ include file="../include/adminBottom.jsp" %>

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
	var resultMsg = "<c:out value='${param.resultMsg}'/>";
	if (resultMsg != "") {
	    alert(resultMsg);
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
	    $("#modifyMemberInfo").validate({
		    


	    	rules: {
											
				userPw: {required: true, minlength: 8, maxlength: 16 , regx : /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&]).*$/	},
								
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
				    			
    			userPw : {
    				required : '비밀번호를 입력해주세요. (영문자,숫자,특수문자[!,@,#,$,%,^,&] 조합 8~16자리)'
    				, minlength : $.validator.format('{0}자 이상 영문자,숫자,특수문자(!,@,#,$,%,^,&) 조합이어야 합니다.')
    				, maxlength : $.validator.format('{0}자 이하 영문자,숫자,특수문자(!,@,#,$,%,^,&) 조합이어야 합니다.')
    				, regx : $.validator.format('영문자,숫자,특수문자(!,@,#,$,%,^,&) 조합으로 8~16글자로 이루어져야 합니다.')
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
    				required : '생년월일을 입력해주세요.'
    				, regx : $.validator.format('생년월일을 올바르게 입력해주십시오.')
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
					if(element.attr("name") == "userPostcode" || element.attr("name") == "userAddress1"){
		          		$(element).next().next().next().after(error);
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

</body>
</html>
