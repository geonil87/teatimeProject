<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
						  <button class="btn" onclick="location.href='${pageContext.request.contextPath}/management.blackList'">목록</button>
					</p>
			</div>
			
			<div class="row-fluid">
			
				<div class="box black span12" style="color: black">
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
													<button type="button" class="btn btn-small btn-primary" onclick="changeMemberStatus($('#memberStatus').val(),$('#statusUserId').val())" >변경</button></p>
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
								
							 
							   <div class="span9">
								 	<label><b>신고 현황</b></label>
									<legend style="margin-top: auto; border-color: gray;"></legend>
										
										<div class="box-content" style="margin-bottom: auto;">
						
											<a class="quick-button span2" onclick="location.href='${pageContext.request.contextPath}/management.blackListInfo?userId=${memberInfo.userId}&reportMenu=storyBoard'">
												<i class="icon-list-alt"></i>
												<p>Story Board</p>
												<span class="notification black">${reportCount.sbrCount }</span>
											</a>
											<a class="quick-button span2" onclick="location.href='${pageContext.request.contextPath}/management.blackListInfo?userId=${memberInfo.userId}&reportMenu=storyBoardComment'">
												<i class="icon-thumbs-up"></i>
												<p>Story Comment</p>
												<span class="notification black">${reportCount.scrCount }</span>
											</a>
											<a class="quick-button span2" onclick="location.href='${pageContext.request.contextPath}/management.blackListInfo?userId=${memberInfo.userId}&reportMenu=photoBoard'">
												<i class="icon-camera"></i>
												<p>Photo Board</p>
												<span class="notification black">${reportCount.pbrCount }</span>
											</a>
											<a class="quick-button span2" onclick="location.href='${pageContext.request.contextPath}/management.blackListInfo?userId=${memberInfo.userId}&reportMenu=photoBoardComment'">
												<i class="icon-thumbs-up"></i>
												<span class="notification black">${reportCount.pcrCount }</span>
												<p>Photo Comment</p>
											</a>
											<a class="quick-button span2" onclick="location.href='${pageContext.request.contextPath}/management.blackListInfo?userId=${memberInfo.userId}&reportMenu=mediaBoard'">
												<i class="icon-facetime-video"></i>
												<p>Media Board</p>
												<span class="notification black">${reportCount.mbrCount }</span>
											</a>
											<a class="quick-button span2" onclick="location.href='${pageContext.request.contextPath}/management.blackListInfo?userId=${memberInfo.userId}&reportMenu=mediaBoardComment'">
												<i class="icon-thumbs-up"></i>
												<p>Media Comment</p>
												<span class="notification black">${reportCount.mcrCount }</span>
											</a>
											<div class="clearfix"></div>



									</div>
							  </div>
							  
														  							 
						  </div><!--/row --> 
						
						</div><!--/row -->                           
					  </div>
				</div>
				
				
				<div class="row-fluid">
			
				<div class="box black span12" style="color: black;">
					<div class="box-header">
						<h2>
						<i class="halflings-icon white exclamation-sign"></i>
						<span class="break"></span>
						<c:choose>
							<c:when test="${reportMenu == null }">storyBoard 신고 내역</c:when>
							<c:otherwise>${reportMenu} 신고 내역</c:otherwise>
						</c:choose>
						</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
						</div>
					</div>
					
							<div class="box-content">
						<table class="table table-bordered table-condensed">
							  <thead>
								  <tr>
								  <th style="text-align: center;" width="30px">번호</th>
										<c:choose>
												<c:when test="${fn:contains(reportMenu, 'Comment')}">
													<th style="text-align: center;" width="300px">덧글 내용</th>
												</c:when>
												<c:otherwise>
													<th style="text-align: center;" width="300px">제목</th>
												</c:otherwise>
										</c:choose>
									  <th style="text-align: center;">신고 내용</th>
									  <th style="text-align: center;" width="100px">신고자</th>
									  <th style="text-align: center;" width="150px">신고 시간</th>
								  </tr>
							  </thead>   
							  <tbody>
							    <c:forEach items="${reportList}" var="reportList" varStatus="status">
									<tr>
										<td style="text-align: center;">${status.count }</td>
										<td style="text-align: center;">
											<c:choose>
												<c:when test="${fn:contains(reportMenu, 'Comment')}">
													${reportList.reportTarget }
												</c:when>
												<c:otherwise>
													<a onclick="checkContent('${reportList.targetIdx}','${reportMenu}')">${reportList.reportTarget }</a>
												</c:otherwise>
											</c:choose>
										</td>
										<td style="text-align: center;">${reportList.reportContent }</td>
										<td style="text-align: center;">${reportList.reporter }</td>
										<td style="text-align: center;">${reportList.reportTime }</td>
									</tr>
								</c:forEach>        
								                                  
							  </tbody>
						 </table>  
						
						<div class="pagination pagination-centered">
						  <ul>
						  	<li><a href='${pageContext.request.contextPath}/management.blackListInfo?pageNum=1&userId=${memberInfo.userId}&reportMenu=${reportMenu}'>맨앞</a></li>
							<li><a href='${pageContext.request.contextPath}/management.blackListInfo?pageNum=${paging.startPage-5}&userId=${memberInfo.userId}&reportMenu=${reportMenu}'>이전</a></li>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" varStatus="i">
									<c:choose>
										<c:when test="${paging.pageNum == i.index && i.index != 0}">
											<li class="active"><a href='${pageContext.request.contextPath}/management.blackListInfo?pageNum=${i.index}&userId=${memberInfo.userId}&reportMenu=${reportMenu}'>${i.index}</a></li>
										</c:when>
										<c:when test="${paging.pagNum != i.index && i.index != 0}">
											<li><a href='${pageContext.request.contextPath}/management.blackListInfo?pageNum=${i.index}&userId=${memberInfo.userId}&reportMenu=${reportMenu}'>${i.index}</a></li>	
										</c:when>
									</c:choose>
								</c:forEach>
							<li><a href='${pageContext.request.contextPath}/management.blackListInfo?pageNum=${paging.startPage+5}&userId=${memberInfo.userId}&reportMenu=${reportMenu}'>다음</a></li>
							<li><a href='${pageContext.request.contextPath}/management.blackListInfo?pageNum=${paging.totalPage}&userId=${memberInfo.userId}&reportMenu=${reportMenu}'>맨뒤</a></li>
						  </ul>
						  
						</div>
						
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
	
	function checkContent(targetIdx,reportMenu){
		var openWin;
		openWin = window.open("${pageContext.request.contextPath}/management.blackListContent?targetIdx="+targetIdx+"&reportMenu="+reportMenu,
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
