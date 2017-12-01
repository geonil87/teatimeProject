<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/adminHeader.jsp" %>

	
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
					<a href="#">회원 정보</a>
				</li>
			</ul>
			
			
			<div class="row-fluid">	
					<p class="btn-group">
						<c:choose>
							<c:when test="${memberInfo.userPermission == 99 }">
								  <button class="btn" onclick="location.href='${pageContext.request.contextPath}/management.resignList'">목록</button> 
							</c:when>
							<c:otherwise>
								  <button class="btn" onclick="location.href='${pageContext.request.contextPath}/management.memberList'">목록</button>
							</c:otherwise>
						</c:choose>
					</p>
			</div>
			<div class="row-fluid">
				
				<c:choose>
					<c:when test="${memberInfo.userPermission == 99 }">
						<div class="box red span12" style="color: black"> 
					</c:when>
					<c:otherwise>
						<div class="box span12">
					</c:otherwise>
				</c:choose>
						<div class="box-header">
							<h2><i class="halflings-icon white user"></i><span class="break"></span>회원 상태</h2>
							<div class="box-icon">
								<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
							</div>
						</div>
						
						<div class="box-content" style="text-align: center;">
						
							 <div class="row-fluid">            
							   <div class="span3">
								 	<label><b>회원 상태</b></label>
									<legend style="margin-top: auto; border-color: gray;"></legend>
										<div class="box-content">
											<div class="control-group" style="margin: auto; text-align: center;">
												
											<c:choose>
												<c:when test="${memberInfo.userPermission == 1 }">
													<p>
														<button class="btn btn-large btn-success" style="display: table-row-group;" id="memberStatusButton" ><i class="icon-user"></i>&nbsp;&nbsp;&nbsp;정상&nbsp;&nbsp;</button>
													</p>
												</c:when>
												<c:when test="${memberInfo.userPermission == 2 }">
													<p>
														<button class="btn btn-large btn-warning" style="display: table-row-group;" id="memberStatusButton"><i class="icon-remove"></i>&nbsp;&nbsp;&nbsp;정지&nbsp;&nbsp;</button>
													</p>
												</c:when>
												<c:when test="${memberInfo.userPermission == 99 }">
													<p>
														<button class="btn btn-large btn-danger" style="display: table-row-group;" id="memberStatusButton"><i class="icon-trash"></i>&nbsp;&nbsp;&nbsp;탈퇴&nbsp;&nbsp;</button>
													</p>
												</c:when>
											</c:choose>
											</div>
											<legend style="margin-top: 20px;"></legend>
											<c:if test="${memberInfo.userPermission != 99 }">
												<form action="${pageContext.request.contextPath}/management.modifyMemberStatus" method="post" id="memberStatusForm">
													<div class="control-group">
														<div class="controls">
														  <select id="memberStatus" name="memberStatus" style="width: 100px; border-color: black;">
															<option value="normal" <c:out value="${memberInfo.userPermission == '1'?'selected':''}"/> >정상</option>
															<option value="banned" <c:out value="${memberInfo.userPermission == '2'?'selected':''}"/>>정지</option>
														  </select>
														</div>
													<input type="hidden" name="userId" id="statusUserId" value="${memberInfo.userId }">
														<p>
														<c:if test="${memberInfo.userPermission == 2}">
															<button type="button" class="btn btn-small btn-primary" onclick="checkSuspendCause($('#statusUserId').val())" >정지 사유</button>
														</c:if>
														<button type="button" class="btn btn-small btn-primary" onclick="changeMemberStatus($('#memberStatus').val(),$('#statusUserId').val())" >변경</button>
														</p>
																
													  </div>
												</form>
											</c:if>
											<c:if test="${memberInfo.userPermission == 99 }">
												<div class="control-group" style="margin: auto; text-align: center;">
													<p style="margin-top: 10px">
														<button class="btn btn-large btn-primery" onclick="location.href='${pageContext.request.contextPath}/management.resignMemberInfoCancel?userId=${memberInfo.userId}'">&nbsp;&nbsp;&nbsp;회원 탈퇴 취소&nbsp;&nbsp;&nbsp;</button>
														<br><br>회원가입 취소 시 <br>가입일은 취소를 한 시점으로 변경됩니다.<br>* 가입 일 복구 불가 
													</p>
												</div>
											</c:if>
										</div>
									</div>
								
							 
							   <div class="span6">
								 	<label><b>신고 현황</b></label>
									<legend style="margin-top: auto; border-color: gray;"></legend>
										
										<div class="box-content" style="margin-bottom: auto;">
										<div class="row-fluid">
										<a class="quick-button-small span15" href="${pageContext.request.contextPath}/management.blackListInfo?&userId=${memberInfo.userId}">
											<i class="icon-group"></i>
											<p>Report Total</p>
											<span class="notification red">${reportCount.total }</span>
										</a>
										</div>
										
										<hr style="margin-top: 10px; margin-bottom: 10px;">
										
										<div class="row-fluid">
										<a class="quick-button-small span4" href="${pageContext.request.contextPath}/management.blackListInfo?&userId=${memberInfo.userId}&reportMenu=storyBoard">
											<i class="icon-list-alt"></i>
											<p>Story Board</p>
											<span class="notification red">${reportCount.story}</span>
										</a>
										<a class="quick-button-small span4" href="${pageContext.request.contextPath}/management.blackListInfo?&userId=${memberInfo.userId}&reportMenu=photoBoard">
											<i class="icon-camera"></i>
											<p>Photo Board</p>
											<span class="notification red">${reportCount.photo}</span>
										</a>
										<a class="quick-button-small span4" href="${pageContext.request.contextPath}/management.blackListInfo?&userId=${memberInfo.userId}&reportMenu=mediaBoard">
											<i class="icon-facetime-video"></i>
											<p>Media Board</p>
											<span class="notification red">${reportCount.media}</span>
										</a>
										</div>
										
										<div class="clearfix"></div>


									</div>
							  </div>
							  
							  
							   <div class="span3">
								 	<label><b>QnA</b></label>
									<legend style="margin-top: auto; border-color: gray;"></legend>
										<div class="row-fluid hideInIE8 circleStats">
											<div class="col-md-3">
												<a href="${pageContext.request.contextPath}/qaBoard.listAdminOption?keyword=${memberInfo.userId}&permission=1">
												<c:choose>
													<c:when test="${memberInfo.userPermission == 99 }">
														<div class="circleStatsItemBox red">	
													</c:when>
													<c:otherwise>
														<div class="circleStatsItemBox blue">
													</c:otherwise>
												</c:choose>
												
													<div class="header"> Clear Question / <b>Total Question</b></div>
													<span class="percent">percent</span>
							                    	<div class="circleStat">
							                    		<input type="text" value="${qaBoardCount.percent}" class="whiteCircle" />
													</div>
													<div class="footer">
														<span class="sep">
															<span class="number">${qaBoardCount.clearCount}</span>
															<span class="unit">개</span>
														</span>
														<span class="sep"> / </span>
														<span class="value">
															<span class="number">${qaBoardCount.totalCount}</span>
															<span class="unit">개</span>
														</span>	
													</div>
												</a>
							                	</div>
											</div>
										</div>
							  </div> 
							  							 
						  </div><!--/row --> 
						
						</div><!--/row -->                           
					  </div>
				</div>
			
			
			
			
			
			
			<div class="row-fluid">
			
				<c:choose>
					<c:when test="${memberInfo.userPermission == 99 }">
						<div class="box red span6" style="color: black">
					</c:when>
					<c:otherwise>
						<div class="box span6">
					</c:otherwise>
				</c:choose>
					<div class="box-header">
						<h2><i class="halflings-icon white search"></i><span class="break"></span>회원 정보</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
						 
						<div class="control-group" style="margin: auto;">
							  <div class="controls">
							  <label class="control-label"><b>아이디</b></label>
							  </div>
							  <div class="controls">
								<input type="text" class="span14 typeahead" readonly="readonly" value="${memberInfo.userId}">
							  </div>
						</div>
						
						<legend style="margin-top: auto; margin-bottom: auto;"></legend>
						
						<div class="control-group" style="margin: auto;">
							<label class="control-label"><b>닉네임</b></label>
								<div class="controls">
									<input type="text" class="span14 typeahead" readonly="readonly" value="${memberInfo.userNick}">
								</div>
						</div>		
						
						<legend style="margin-top: auto; margin-bottom: auto;"></legend>
						
						<div class="control-group" style="margin: auto;">
							  <div class="controls">
							  <label class="control-label"><b>이메일</b></label>
							  </div>
							  <div class="controls">
								<input type="text" class="span14 typeahead" readonly="readonly" value="${memberInfo.userEmail}">
							  </div>
						</div>
						
						<legend style="margin-top: auto; margin-bottom: auto;"></legend>
						
						<div class="control-group" style="margin: auto;">
							  <div class="controls">
							  <label class="control-label"><b>이름</b></label>
							  </div>
							  <div class="controls">
								<input type="text" class="span14 typeahead" readonly="readonly" value="${memberInfo.userName}">
							  </div>
						</div>
						
						<legend style="margin-top: auto; margin-bottom: auto;"></legend>
						
						<div class="control-group" style="margin: auto;">
							  <div class="controls">
							  <label class="control-label"><b>생년월일</b></label>
							  </div>
							  <div class="controls">
								<input type="text" class="span14 typeahead" readonly="readonly" value="${memberInfo.userBirthday}">
							  </div>
						</div>
						
						<legend style="margin-top: auto; margin-bottom: auto;"></legend>
						
						<div class="control-group" style="margin: auto;">
							  <div class="controls">
							  <label class="control-label"><b>휴대폰</b></label>
							  </div>
							  <div class="controls">
								<input type="text" class="span14 typeahead" readonly="readonly" value="${memberInfo.userPhone}">
							  </div>
						</div>
							
						<legend style="margin-top: auto; margin-bottom: auto;"></legend>
							
						<div class="control-group" style="margin: auto;">
							  <div class="controls">
								<label class="control-label"><b>주소</b></label>
							  </div>
							  <div class="controls">
								<input type="text" class="span2 typeahead" readonly="readonly" value="${memberInfo.userPostcode}">&nbsp;-
								<input type="text" class="span10 typeahead" readonly="readonly" value="${memberInfo.userAddress1}">
								<input type="text" class="span14 typeahead" readonly="readonly" value="${memberInfo.userAddress2}">
							  </div>
						</div>
							
						<legend style="margin-top: auto; margin-bottom: auto;"></legend>
						
						<div class="control-group" style="margin: auto;">
							<div class="controls">
							<label class="control-label"><b>성별</b></label>
							</div>
							<div class="controls">
							<label class="radio inline">
								<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" disabled="disabled" <c:out value="${memberInfo.userGender == 'M'?'checked':''}"/>>
									남자
							</label>
							<label class="radio inline">
								<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2" disabled="disabled" <c:out value="${memberInfo.userGender == 'F'?'checked':''}"/>>
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
								<input type="text" class="span14 typeahead" readonly="readonly" value="${memberInfo.userIndate}">
							  </div>
						</div>
						
						<legend style="margin-top: auto; margin-bottom: auto;"></legend>
						<c:if test="${memberInfo.userPermission != 99 }">
							<div class="control-group" style="margin: auto; text-align: center;">
								<p style="margin-top: 10px">
									<button class="btn btn-large btn-primary" onclick="location.href='${pageContext.request.contextPath}/management.modifyMemberInfo?userId=${memberInfo.userId}'">회원 정보 수정</button>
									<button class="btn btn-large btn-danger" onclick="resignMember()">&nbsp;&nbsp;&nbsp;&nbsp;회원 탈퇴&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</p>
							</div>
						</c:if>
						
						
						</div>
					</div><!--/row -->                           

				<c:choose>
					<c:when test="${memberInfo.userPermission == 99 }">
						<div class="box red span6" style="color: black">
					</c:when>
					<c:otherwise>
						<div class="box span6">
					</c:otherwise>
				</c:choose>	  
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon white edit"></i><span class="break"></span>로그인 로그 정보</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
						<table class="table table-striped">
							  <thead>
								  <tr>
								   	  <th style="text-align: center;" width="30px">번호</th>
									  <th style="text-align: center;">로그인 정보</th>
									  <th style="text-align: center;">IP</th>
									  <th style="text-align: center;">로그인 시간</th>
								  </tr>
							  </thead>   
							  <tbody>
							    <c:forEach items="${logList}" var="logList">
									<tr>
										<td style="text-align: center;" width="30px">${logList.idx }</td>
										<c:choose>
											<c:when test="${logList.logCondition == \"S\"}">
												<td style="text-align: center; color: blue;"> Success </td>
											</c:when>
											<c:when test="${logList.logCondition == \"F\"}">
												<td style="text-align: center; color: red;"> <b>Fail</b> </td>
											</c:when>
										</c:choose>
										<td style="text-align: center;">${logList.userIp }</td>
										<td style="text-align: center;">${logList.wdate }</td>
									</tr>
								</c:forEach>        
								                                  
							  </tbody>
						 </table>  
						
						<div class="pagination pagination-centered">
						  <ul>
						  	<li><a href='${pageContext.request.contextPath}/management.memberInfo?pageNum=1&userId=${memberInfo.userId}'>맨앞</a></li>
							<li><a href='${pageContext.request.contextPath}/management.memberInfo?pageNum=${paging.startPage-5}&userId=${memberInfo.userId}'>이전</a></li>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" varStatus="i">
									<c:choose>
										<c:when test="${paging.pageNum == i.index && i.index != 0}">
											<li class="active"><a href='${pageContext.request.contextPath}/management.memberInfo?pageNum=${i.index}&userId=${memberInfo.userId}'>${i.index}</a></li>
										</c:when>
										<c:when test="${paging.pagNum != i.index && i.index != 0}">
											<li><a href='${pageContext.request.contextPath}/management.memberInfo?pageNum=${i.index}&userId=${memberInfo.userId}'>${i.index}</a></li>	
										</c:when>
									</c:choose>
								</c:forEach>
							<li><a href='${pageContext.request.contextPath}/management.memberInfo?pageNum=${paging.startPage+5}&userId=${memberInfo.userId}'>다음</a></li>
							<li><a href='${pageContext.request.contextPath}/management.memberInfo?pageNum=${paging.totalPage}&userId=${memberInfo.userId}'>맨뒤</a></li>
						  </ul>
						  
						</div>
						
					</div>
					
					
				</div><!--/span-->	  
					  
				</div>	  
					  
					  
			  </div><!--/span-->
				
								
							
			
			</div><!--/row-->
    

		</div><!--/.fluid-container-->
	
			<!-- end: Content -->
		

			
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->

		
<%@ include file="../include/adminBottom.jsp" %>
<script>
	var resultMsg = "<c:out value='${param.resultMsg}'/>";
	if (resultMsg != "") {
	    alert(resultMsg);
	}
	
	function resignMember(){
		var result = confirm("탈퇴 처리 하시겠습니까?");
		if(result){
			location.href='${pageContext.request.contextPath}/management.resignMemberInfo?userId=${memberInfo.userId}';
		}else{
			
		}
	}
	
	function checkSuspendCause(userId){
		var openWin;
		openWin = window.open("${pageContext.request.contextPath}/management.suspendCauseResult?userId="+userId,
				"신고글","width=680, height=555, resizable = no, scrollbars = no");
	}
	
	function changeMemberStatus(category, userId){
		var userStatus = <c:out value='${memberInfo.userPermission}'/>;
		if(category == 'banned' & userStatus == 2){
			alert("이미 정지된 회원입니다.");
		}else if(category == 'normal' & userStatus == 1){
			alert("정상 상태의 회원입니다.")
		}else{
			if(category=='normal'){
				$('#memberStatusForm').submit();
			}else if(category=='banned'){
				var openWin;
				openWin = window.open("${pageContext.request.contextPath}/management.suspendCause?userId="+userId+"&memberStatus="+category,
							"writeQuestion","width=863, height=800, resizable = no, scrollbars = no");
				
			}
		}
	}
	
	
</script>
</body>
</html>
