<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="../storyboard/header.jsp" %>
<!DOCTYPE html>


<html>
<head>
 <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/jquery-3.2.1.min.js"></script>
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
<body>
	<div class="container">
	<div class="main-container">
			<div class="container-fluid no-left-padding no-right-padding page-content">
				<!-- container -->	
				<div class="container">
					<!-- Row -->
					<div class="row">
						<!-- Content Area -->
						<div class="col-sm-12 content-area" align="center">
							<div class="aboute-block">
								<hr>
								<div class="block-title">
									<h3>${detail.title}</h3>
								</div>
								<p style="text-align: right;margin-top: -30px" > 조회수 ${detail.hit}</p>
								<hr>
								<p>${detail.content}</p>
								<ul>
									
								</ul>
							</div>
						</div><!-- Content Area /- -->
					</div><!-- Row /- -->
				</div><!-- container /- -->
			</div><!-- Aboute-me Section /- -->
			
<!-- 신고 이미지 -->		
			<div class="entry-footer">
<div class="tags" align="right">
<a href="${pageContext.request.contextPath }/photoBoard.report?idx=${detail.idx}&title=${detail.title}"><img src="${pageContext.request.contextPath}/resources/assets/images/6.PNG" alt="Post Image" /></a>
</div>
</div>
<!-- 신고 이미지 -->
<hr>
							
<!-- About Author -->
<div class="about-author-box">
<h4><i class="fa fa-user-o" aria-hidden="true"></i> by 작성자 ${detail.user_nick}</h4>
	<div class="post-meta">
		<span class="byline"><a title="Indesign">작성시간</a></span>
		<span class="post-date">${detail.wdate }</span>
	</div>
	<div align="center">
		<span id="goodValue" style="font-size:35px">${recommend.good }</span>&nbsp;&nbsp;
		<img id="good" src="${pageContext.request.contextPath}/resources/assets/images/8.PNG" alt="Post Image" />&nbsp;
		<img id="bad" src="${pageContext.request.contextPath}/resources/assets/images/7.PNG" alt="Post Image" />&nbsp;&nbsp;
	<span id="badValue" style="font-size:35px">${recommend.bad }</span>
	</div>
<hr>





		
<button type="button"  class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/photoBoard.list'" value="목록">목록</button>
<button type="button" id="modify" class="btn btn-default"  value="수정">수정</button>
<button type="button" id="delete" class="btn btn-default" value="삭제">삭제</button>


						<h2 class="comments-title">${countcomment} Comments</h2>
						
						<hr>
						<c:forEach items="${best }" var="best" varStatus="status">
						<div class="comments-area" style="background-color: #FAFAFA">
						<span class="shadow7" style="font-size: 15px;">${status.index+1 }. 베스트 댓글 <i class="fa fa-diamond" aria-hidden="true"></i></span><b class="fn" style="text-transform:lowercase"> <br><br>
						<i class="fa fa-user-o" aria-hidden="true"></i> by ${best.user_nick }</b>  <a>${best.wdate }</a><br><br>
						<i class="fa fa-volume-up" aria-hidden="true"></i> ${best.content }<br><br>
						<span class="commentGood"><a href='javascript:void(0)' ><i class="fa fa-thumbs-up fa-lg" aria-hidden="true"></i>추천</a> <input type="hidden" value="${best.idx }"></span><span class="commentGoodValue">(${best.good })&nbsp;&nbsp;&nbsp;</span>
						<span class="commentBad"><a href='javascript:void(0)' ><i class="fa fa-thumbs-down fa-lg" aria-hidden="true"></i>비추천</a> <input type="hidden" value="${best.idx }"></span><span class="commentBadValue">(${best.bad })&nbsp;&nbsp;&nbsp;</span>
						<a href="${pageContext.request.contextPath }/photoBoard.commentReport?board_idx=${best.board_idx}&comment_idx=${best.idx}&content=${best.content}"><i class="fa fa-bell-o" aria-hidden="true fa-lg"></i>신고</a>&nbsp;&nbsp;&nbsp;
						
						</div>
						<hr>
						</c:forEach>
							
							<!-- Comment Area -->
							<div class="comments-area">
							
								<c:forEach items="${comment}" var="comment" varStatus="status">
								<ol class="comment-list">
									<li class="comment byuser comment-author-admin bypostauthor even thread-even depth-1 parent">
								<c:if test="${comment.indent==0}">
										<div class="comment-body">
											<footer class="comment-meta">
												<div class="comment-author vcard">
													
													<b class="fn" style="text-transform:lowercase"><i class="fa fa-user-o" aria-hidden="true"></i> by ${comment.user_nick}</b>
												</div>
												<div class="comment-metadata">
													<a>${comment.wdate}</a>											
												</div>
											</footer>
											
											<div class="comment-content">
											<c:if test="${comment.available==0}">
												<p>${comment.content}</p>
											</c:if>
											<c:if test="${comment.available!=0}">
													[삭제된 댓글입니다.]
											</c:if>	
											</div>
											<c:if test="${comment.available==0}">
												<span class="commentGood"><a href='javascript:void(0)' ><i class="fa fa-thumbs-up fa-lg" aria-hidden="true"></i>추천</a> <input type="hidden" value="${comment.idx }"></span><span class="commentGoodValue">(${commentRecommend[status.index].good })&nbsp;&nbsp;&nbsp;</span>
												<span class="commentBad"><a href='javascript:void(0)' ><i class="fa fa-thumbs-down fa-lg" aria-hidden="true"></i>비추천</a> <input type="hidden" value="${comment.idx }"></span><span class="commentBadValue">(${commentRecommend[status.index].bad })&nbsp;&nbsp;&nbsp;</span>
												<a href="${pageContext.request.contextPath }/photoBoard.commentReport?board_idx=${detail.idx}&comment_idx=${comment.idx}&content=${comment.content}"><i class="fa fa-bell-o" aria-hidden="true fa-lg"></i>신고</a>&nbsp;&nbsp;&nbsp;
											</c:if>
									<!-- 삭제 -->
											<c:if test="${comment.available==0}">
											<a class="commentDelete" href="${pageContext.request.contextPath}/photoBoard.commentDelete?idx=${comment.idx}&board_idx=${detail.idx}"><i class="fa fa-trash-o fa-lg" aria-hidden="true"></i>삭제<input type="hidden" value="${comment.idx }"></a>&nbsp;&nbsp;&nbsp;
											</c:if>
									<!-- 삭제 -->	
										<!-- 댓글수정 -->
										<c:if test="${comment.available==0}">
											<i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;<a href='javascript:void(0)' onclick="this.innerHTML=(this.nextSibling.style.display=='none')?'취소':'댓글수정';this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none'">댓글수정</a><DIV style='display:none'>			
												<div class="comment-respond">
													<h2 class="comment-reply-title">댓글 수정하기</h2>
													<form method="post" class="comment-form" action="${pageContext.request.contextPath}/photoBoard.commentModify">
														<p class="comment-form-author">
															<input type="hidden" name="idx" value="${comment.idx}">
															<input type="hidden" name="board_idx" value="${detail.idx}">
															<input type="hidden" name="comment_group" value="${comment.comment_group}">
															
														</p>
														<p class="comment-form-comment">
															<textarea id="comment" name="content" rows="8" required="required" >${comment.content}</textarea>
														</p>
														<p class="form-submit">
															<button type="submit" onclick="checkCommentWriter2(${comment.idx})">수정</button>
														</p>
													</form>
												</div>
											</DIV>
										</c:if>
										<!-- 댓글달기 -->	
							<c:if test="${comment.available==0}">			
							&nbsp;&nbsp;	<i class="fa fa-commenting-o" aria-hidden="true"></i>&nbsp;<a href='javascript:void(0)' onclick="this.innerHTML=(this.nextSibling.style.display=='none')?'취소':'댓글달기';this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none'"> 댓글달기</a><DIV style='display:none'>				
								<div class="comment-respond">
									<h2 class="comment-reply-title">댓글 쓰기</h2>
									<form method="post" class="comment-form" action="${pageContext.request.contextPath}/photoBoard.reCommentInsert">
										<p class="comment-form-author">
											<input type="hidden" name="indent" value="${comment.indent}">
											<input type="hidden" name="comment_group" value="${comment.comment_group}">
											<input type="hidden" name="board_idx" value="${detail.idx }">
											
										</p>
										<p class="comment-form-comment">
											<textarea id="comment" name="content" placeholder="내용을 입력해주세요." rows="8" required="required"></textarea>
										</p>
										<p class="form-submit">
											<button type="submit" class="commentButton">저장</button>
										</p>
									</form>
								</div><!--Comment Form /- -->
											</DIV>
											</c:if>									
										
										</div>											
										</c:if>
										<c:if test="${comment.indent>=1}">						
										<ol class="children">
											<li class="comment byuser comment-author-admin bypostauthor odd alt depth-2 parent">
												<div class="comment-body">
													<footer class="comment-meta">
														<div class="comment-author vcard">
															<img src="${pageContext.request.contextPath}/resources/assets/images/567.PNG">
															<b class="fn" style="text-transform:lowercase"><i class="fa fa-user-o" aria-hidden="true"></i> by ${comment.user_nick}</b>
														</div>
														<div class="comment-metadata">
															<a>${comment.wdate}</a>											
														</div>
													</footer>
													<div class="comment-content">
														<c:if test="${comment.available==0}">
														<p>${comment.content}</p>
														</c:if>
														<c:if test="${comment.available!=0}">
														[삭제된 댓글입니다.]
														</c:if>	
													</div>
														<c:if test="${comment.available==0}">
														<span class="commentGood"><a href='javascript:void(0)' ><i class="fa fa-thumbs-up fa-lg" aria-hidden="true"></i>추천</a> <input type="hidden" value="${comment.idx }"></span><span class="commentGoodValue">(${commentRecommend[status.index].good })&nbsp;&nbsp;&nbsp;</span>
														<span class="commentBad"><a href='javascript:void(0)' ><i class="fa fa-thumbs-down fa-lg" aria-hidden="true"></i>비추천</a> <input type="hidden" value="${comment.idx }"></span><span class="commentBadValue">(${commentRecommend[status.index].bad })&nbsp;&nbsp;&nbsp;</span>
														<a href="${pageContext.request.contextPath }/photoBoard.commentReport?board_idx=${detail.idx}&comment_idx=${comment.idx}&content=${comment.content}"><i class="fa fa-bell-o" aria-hidden="true fa-lg"></i>신고</a>&nbsp;&nbsp;&nbsp;
													</c:if>
															<!-- 											삭제  -->
													<c:if test="${comment.available==0}">
													<a class="commentDelete" href="${pageContext.request.contextPath}/photoBoard.commentDelete?idx=${comment.idx}&board_idx=${detail.idx}"><i class="fa fa-trash-o fa-lg" aria-hidden="true"></i>삭제<input type="hidden" value="${comment.idx }"></a>&nbsp;&nbsp;&nbsp;
													</c:if>
		<!-- 											삭제 -->	
		<!-- 												댓글수정 -->
													<c:if test="${comment.available==0}">
													<i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;<a href='javascript:void(0)' onclick="this.innerHTML=(this.nextSibling.style.display=='none')?'취소':'댓글수정';this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none'">댓글수정</a><DIV style='display:none'>				
														<div class="comment-respond">
															<h2 class="comment-reply-title">댓글 수정하기</h2>
															<form method="post" class="comment-form" action="${pageContext.request.contextPath}/photoBoard.commentModify">
																<p class="comment-form-author">
																	<input type="hidden" name="idx" value="${comment.idx}">
																	<input type="hidden" name="board_idx" value="${detail.idx}">
																	<input type="hidden" name="comment_group" value="${comment.comment_group}">
																	
																</p>
																<p class="comment-form-comment">
																	<textarea id="comment" name="content" rows="8" required="required" >${comment.content}</textarea>
																</p>
																<p class="form-submit">
																<button type="submit" onclick="checkCommentWriter2(${comment.idx})">수정</button>
																</p>
															</form>
														</div>
													</DIV>
													</c:if>
													<div class="reply">
														
													</div>
												</div>
											</li>
										</ol>
										</c:if>
									</li>
								</ol>
								</c:forEach>
								<!-- comment-list /- -->

				
                        <div class="comment-respond">
                           <h2 class="comment-reply-title">댓글 쓰기</h2>
                           <form method="post" class="comment-form" action="${pageContext.request.contextPath}/photoBoard.commentInsert">
                              <p class="comment-form-author">
                                 <input type="hidden" name="board_idx" value="${detail.idx }">                                 
                              </p>
                              <p class="comment-form-comment">
                                 <textarea id="comment" name="content" placeholder="내용을 입력해주세요." rows="8" required="required"></textarea>
                              </p>
                              <p class="form-submit">
                                 <button type="submit" class="commentButton">저장</button>
                              </p>
                           </form>
                        </div><!--Comment Form /- -->
							
							</div><!-- Comment Area /- -->
						
						</div><!-- Content Area /- -->
					</div>
				</div><!-- Container /- -->


<script type="text/javascript">
$(document).ready(function(){
	var idx = ${detail.idx};
	var permission = "${sessionPermission}";
	$('#good').on("click",function(){
		var id = "${sessionId}";
		if(id==""){		
			alert("로그인을 해주세요");			
		}else if(permission=="2"){
			alert("정지된 계정입니다.");
		}else{
			recommend("good",idx);
		}
	});
	$('#bad').on("click",function(){
		var id = "${sessionId}";
		var permission = "${sessionPermission}";
		if(id==""){		
			alert("로그인을 해주세요");			
		}else if(permission=="2"){
			alert("정지된 계정입니다.");
		}else{
			recommend("bad",idx);			
		}
	});
	$('.commentGood').on("click",function(){
		var id = "${sessionId}";
		var permission = "${sessionPermission}";
		if(id==""){		
			alert("로그인을 해주세요");			
		}else if(permission=="2"){
			alert("정지된 계정입니다.");
		}else{
			var comment_idx = $(this).children(':hidden').val();
			var goodLocation = $(this).next('.commentGoodValue');
			var badLocation = $(this).nextAll('.commentBadValue');
			commentRecommend("good",comment_idx,goodLocation,badLocation);
		}		
	});		

	$('.commentBad').on("click",function(){
		var id = "${sessionId}";
		var permission = "${sessionPermission}";
		if(id==""){		
			alert("로그인을 해주세요");			
		}else if(permission=="2"){
			alert("정지된 계정입니다.");
		}else{		
			var comment_idx = $(this).children(':hidden').val();		
			var goodLocation = $(this).prev('.commentGoodValue');
			var badLocation = $(this).next('.commentBadValue');
			commentRecommend("bad",comment_idx,goodLocation,badLocation);
		}
	});
	
	$('#modify').on('click',function(){
		var id = "${sessionId}";
		var permission = "${sessionPermission}";
		var idx = "${detail.idx }";
		var locationPath="${pageContext.request.contextPath}/photoBoard.modify?idx=${param.idx}";
		if(id==""){		
			alert("로그인을 해주세요");			
		}else if(permission=="0"){		
			location.href=locationPath;
		}else if(permission=="2"){
			alert("정지된 계정입니다.");
		}else{			
			checkWriter(idx,locationPath);
		} 
	});
	
	$('#delete').on('click',function(){
		var id = "${sessionId}";
		var idx = "${detail.idx }";
		var locationPath = "${pageContext.request.contextPath}/photoBoard.delet?idx=${param.idx}";
		var permission = "${sessionPermission}";
		if(id==""){		
			alert("로그인을 해주세요");			
		}else if(permission=="0"){		
			location.href=locationPath;			
		}else if(permission=="2"){
			alert("정지된 계정입니다.");
		}else{
			checkWriter(idx,locationPath);			
		} 
	});
	
	$('.commentDelete').on('click',function(e){
		e.preventDefault();
		var permission = "${sessionPermission}";
		var comment_idx = $(this).children(':hidden').val();
		var locationPath = "${pageContext.request.contextPath}/photoBoard.commentDelete?idx="+comment_idx+"&board_idx=${detail.idx}";
		var id = "${sessionId}";
		if(id==""){
			alert("로그인을 해주세요");			
		}else if(permission=="0"){
			location.href=locationPath;
		}else if(permission=="2"){
			alert("정지된 계정입니다.");
		}else{			
			checkCommentWriter(comment_idx,locationPath);
		}
		
	});
	
	$('.commentButton').on('click',function(e){		
		var id = "${sessionId}";
		if(id==""){
			alert("로그인을 해주세요.");			
		}
		
	});
});
function recommend(recommend,idx){
	$.ajax({
		type:"post",
		data:{"recommend":recommend,"idx":idx},
		url:"<%= request.getContextPath()%>/photoBoard.recommend",
		success:function(result){			
			$('#goodValue').html(result.good);
			$('#badValue').html(result.bad);
			if(result.check=="already"){
				alert("이미 눌렀어 그만 눌러!");
			}else{
				alert("당신의 의견이 반영되었습니다.")
			}
		}
	});
}

function commentRecommend(recommend,idx,goodLocation,badLocation){
	$.ajax({
		type:"post",
		data:{"recommend":recommend,"idx":idx},
		url:"<%= request.getContextPath()%>/photoBoard.commentRecommend",
		success:function(result){
 			console.log(result); 			
 			goodLocation.html("("+result.good+")&nbsp;&nbsp;&nbsp;");
 			badLocation.html("("+result.bad+")&nbsp;&nbsp;&nbsp;");
 			if(result.check=="already"){
				alert("이미 눌렀어 그만 눌러!");
			}else{
				alert("당신의 의견이 반영되었습니다.")
			}
		}
	});
}

function checkWriter(idx,locationPath){
	$.ajax({
		type:"post",
		data:{"idx":idx},
		url: "${pageContext.request.contextPath}/photoBoard.checkWriter",
		success:function(result){			
			if(result==1){				
				location.href=locationPath;
			}else{
				alert("해당글의 권한이 없습니다.")
			}
		}
	});
}

function checkCommentWriter(idx,locationPath){
	$.ajax({
		type:"post",
		data:{"idx":idx},
		url:"${pageContext.request.contextPath}/photoBoard.checkCommentWriter",
		success:function(result){			
			if(result==1){
				location.href= locationPath ;
			}else{
				alert("해당 댓글의 권한이 없습니다.");
			}
		}
	});
}

function checkCommentWriter2(idx){
	$.ajax({
		type:"post",
		data:{"idx":idx},
		url:"${pageContext.request.contextPath}/photoBoard.checkCommentWriter",
		success:function(result){
			if(result==1){
				alert("댓글을 수정하였습니다.");
			}else if(result==0){
				alert("로그인을 해주세요.")
			}else{
				alert("해당 댓글의 권한이 없습니다.");
			}
		}
	});
}

</script>

	
	
<%@ include file="../storyboard/bottom.jsp" %>

</body>
