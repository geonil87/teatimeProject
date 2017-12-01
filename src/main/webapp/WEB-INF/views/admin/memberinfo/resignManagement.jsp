<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/adminHeader.jsp" %>


					
			<!-- start: Content -->
			<div id="content" class="span10" >
			
			
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="index.html">Home</a> 
					<i class="icon-angle-right"></i>
				</li>
				<li><a href="#">탈퇴 회원 관리</a></li>
			</ul>
			
						
							
			<div class="row-fluid">
			
				<div class="box red span12">
					<div class="box-header">
						<h2><i class="halflings-icon white align-justify"></i><span class="break"></span>탈퇴 회원 리스트</h2>
						<div class="box-icon">
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
						<br>
						
						<div class="row-fluid">
							<input class="btn btn-small btn-danger" type="submit" value="탈퇴 취소" form="cancel">
							<input class="btn btn-small btn-danger" type="button" value="계정 DB 삭제" onclick="remove()">
						</div>
						<br>
						<form action="${pageContext.request.contextPath}/management.resignMemberInfoCancel" method="post" id="cancel">
						<table class="table table-bordered table-condensed">
							  <thead>
								  <tr>
									  <th style="text-align: center; color: black;" width="30px"><input type="checkbox" id="allCheck"></th>	
									  <th style="text-align: center; color: black;" width="30px">번호</th>
									  <th style="text-align: center; color: black;">아이디</th>
									  <th style="text-align: center; color: black;">닉네임</th>
									  <th style="text-align: center; color: black;">이름</th>
									  <th style="text-align: center; color: black;" width="150px">탈퇴일</th>
									  <th style="text-align: center; color: black;" width="120px">탈퇴 후 경과 일</th>
									  <th style="text-align: center; color: black;" width="100px">회원 상태</th>                                        
								  </tr>
							  </thead>   
							  <tbody>
								
								  <c:forEach items="${resignList}" var="resignList">
										<tr>
											<td style="text-align: center; color: black;" width="30px"><input type="checkbox" class="checkList" id="checkValue" name="checkValue" value="${resignList.userId}" ></td>
											<td style="text-align: center; color: black;" width="30px">${resignList.idx}</td>
											<td style="text-align: center;"><a href='${pageContext.request.contextPath}/management.memberInfo?&userId=${resignList.userId}'>${resignList.userId}</a></td>
											<td style="text-align: center;"><a href='${pageContext.request.contextPath}/management.memberInfo?&userId=${resignList.userId}'>${resignList.userNick}</a></td>
											<td style="text-align: center;"><a href='{pageContext.request.contextPath}/management.memberInfo?&userId=${resignList.userId}'>${resignList.userName}</a></td>
											<td style="text-align: center;"><a href='{pageContext.request.contextPath}/management.memberInfo?&userId=${resignList.userId}'>${resignList.userIndate}</a></td>
											<td style="text-align: center;"><a <c:if test="${resignList.timeOut >= 30}">style='color: red;'</c:if> href='{pageContext.request.contextPath}/management.memberInfo?&userId=${resignList.userId}'>${resignList.timeOut}</a></td>										<td style="text-align: center;">
												<c:choose>
													<c:when test="${resignList.userPermission==1}"><a href='${pageContext.request.contextPath}/management.memberInfo?&userId=${resignList.userId}'><span class="label label-success">정상</span></a></c:when>
													<c:when test="${resignList.userPermission==2}"><a href='${pageContext.request.contextPath}/management.memberInfo?&userId=${resignList.userId}'><span class="label label-warning">정지</span></a></c:when>
													<c:when test="${resignList.userPermission==99}"><a href='${pageContext.request.contextPath}/management.memberInfo?&userId=${resignList.userId}'><span class="label label-important">탈퇴</span></a></c:when>
												</c:choose>
											</td>
										</tr>
									</c:forEach>                          
							  </tbody>
						 </table>  
						 </form>
						 <div class="pagination pagination-centered">
						 	<!-- 닉네임 검색 -->
						 	<div class="input-append">
								<select id="searchOption" name="searchOption" form="search" style="width: 100px;">
									<!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
									<option value="" <c:out value="${searchOption == ''?'selected':''}"/> >전체</option>
									<option value="userId" <c:out value="${searchOption == 'userId'?'selected':''}"/> >아이디</option>
									<option value="userNick" <c:out value="${searchOption == 'userNick'?'selected':''}"/> >닉네임</option>
									<option value="userName" <c:out value="${searchOption == 'userName'?'selected':''}"/> >이름</option>
								</select>
							 	<div class="input-append">
									<form action="${pageContext.request.contextPath}/management.resignList" method="get" id="search">
											<input type="hidden" id="pageNum" name="pageNum" value="${paging.pageNum}">
											<input type="text" id="keyword" name="keyword" value="${keyword}">
											<input class="btn btn-small btn-danger" type="submit" value="검색">
									</form>
							 	</div>
						 	</div>
						 </div>
						 <div class="pagination pagination-centered">
						  <ul>
						  	<li><a href='${pageContext.request.contextPath}/management.resignList?pageNum=1&searchOption=${searchOption}&keyword=${keyword}'>맨앞</a></li>
							<li><a href='${pageContext.request.contextPath}/management.resignList?pageNum=${paging.startPage-5}&searchOption=${searchOption}&keyword=${keyword}'>이전</a></li>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" varStatus="i">
								<c:choose>
									<c:when test="${paging.pageNum == i.index && i.index != 0}">
										<li class="active"><a href='${pageContext.request.contextPath}/management.resignList?pageNum=${i.index}&searchOption=${searchOption}&keyword=${keyword}'>${i.index}</a></li>
									</c:when>
									<c:when test="${paging.pagNum != i.index && i.index != 0}">
										<li><a href='${pageContext.request.contextPath}/management.resignList?pageNum=${i.index}&searchOption=${searchOption}&keyword=${keyword}'>${i.index}</a></li>	
									</c:when>
								</c:choose>
							</c:forEach>
							<li><a href='${pageContext.request.contextPath}/management.resignList?pageNum=${paging.startPage+5}&searchOption=${searchOption}&keyword=${keyword}'>다음</a></li>
							<li><a href='${pageContext.request.contextPath}/management.resignList?pageNum=${paging.totalPage}&searchOption=${searchOption}&keyword=${keyword}'>맨뒤</a></li>
						  </ul>
						  
						</div>
					</div>
				</div><!--/span-->
				
					
 

		</div><!--/.fluid-container-->
		
		
		
		
						
			<!-- end: Content -->

			
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
			
	
<%@ include file="../include/adminBottom.jsp" %>
<script type="text/javascript"> 

	$("#allCheck").click(function(){ 
		if($("#uniform-allCheck > span").hasClass("checked")===false) { 
			$("#uniform-checkValue > span").addClass("checked"); 
			$(".checkList").prop("checked",true);
		}else{ 
			$("#uniform-checkValue > span").removeClass("checked");
			$(".checkList").prop("checked",false);
		}	
	}); 
	
		
	function remove(){
		var result = confirm("DB 삭제를 할 경우 복구가 불가능 합니다.\nDB 삭제 처리 하시겠습니까?");
		if(result){
			$('#cancel').attr('action','${pageContext.request.contextPath}/management.removeMemberInfo').submit();
		}else{
			
		}
		
	}
		
	
</script>
</body>
</html>
