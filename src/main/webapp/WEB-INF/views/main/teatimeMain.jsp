<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>TEA :: TIME</title>
</head>

<!-- 언어 반응형 -->
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<!-- 언어 반응형 -->

	

	<!-- Standard Favicon -->
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/images/soso.png" />
	<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/resources/assets/images/apple-touch-icon-114x114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/resources/assets/images/apple-touch-icon-72x72-precomposed.html">
	<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/resources/assets/images/apple-touch-icon-57x57-precomposed.png">	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/revolution/css/settings.css">

    <link href="${pageContext.request.contextPath}/resources/assets/css/lib.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/rtl.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/style.css">
<style type="text/css">
.type-post .entry-content p > a {
	color: #717171;
	letter-spacing: 0.225px;
	line-height: 1.7;
	-webkit-hyphens: auto;
	-moz-hyphens: auto;
	hyphens: auto;
}

.type-post .entry-content p > a:last-of-type {
	margin-bottom: 0;
}


</style>
</head>

<body class="singletemplate" data-offset="200" data-spy="scroll" data-target=".ownavigation">
	<!-- Loader -->
	<div id="site-loader" class="load-complete">
		<div class="loader">
			<div class="line-scale"><div></div><div></div><div></div><div></div><div></div></div>
		</div>
	</div><!-- Loader /- -->
		
	<!-- Header Section -->
	<header class="container-fluid no-left-padding no-right-padding header_s header-fix header_s1">
	
		<!-- SidePanel -->
		<div id="slidepanel-1" class="slidepanel">
			<!-- Top Header -->
			<div class="container-fluid no-right-padding no-left-padding top-header">
				<!-- Container -->
				<div class="container">	
					<div class="row">
						<div class="col-lg-4 col-6">
								<aside class="widget widget_social">
					
						
								<ul style="background-color: white;">
									<li><a href="https://ko-kr.facebook.com/" title=""><i class="ion-social-facebook-outline"></i></a></li>
									<li><a href="https://twitter.com/?lang=ko" title=""><i class="ion-social-twitter-outline"></i></a></li>
									<li><a href="https://www.instagram.com/?hl=ko" title=""><i class="ion-social-instagram-outline"></i></a></li>
									<li><a href="https://plus.google.com/?hl=ko" title=""><i class="ion-social-googleplus-outline"></i></a></li>
									<li><a href="https://www.pinterest.co.kr/" title=""><i class="ion-social-pinterest-outline"></i></a></li>
									<li><a href="https://vimeo.com/ko" title=""><i class="ion-social-vimeo-outline"></i></a></li>
								</ul>
							</aside><!-- Widget : Follow Us /- -->
						</div>
						<div class="col-lg-4 logo-block">
							<a href="${pageContext.request.contextPath}/main" title="Logo">TEA :: TIME</a>
						</div>
						<div class="col-lg-4 col-6">
						
							<ul class="top-right user-info">
								
								<li class="dropdown">
									<a class="dropdown-toggle" href="#"><i class="pe-7s-user"></i></a>
									<ul class="dropdown-menu">
										<c:choose>
										<c:when test="${sessionScope.sessionPermission == null}">
											<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member.tos" title="회원가입">회원가입</a></li>
											<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member.login" title="로그인">로그인</a></li>
										</c:when>
										<c:when test="${sessionScope.sessionPermission == 1 || sessionScope.sessionPermission == 2}">
											<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member.checkModifyUserInfo" title="회원정보수정">회원정보수정</a></li>
											<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member.logout" title="로그아웃">로그아웃</a></li>
										</c:when>
										<c:when test="${sessionScope.sessionPermission == 0}">
											<li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin" title="관리자">관리자</a></li>
											<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member.logout" title="로그아웃">로그아웃</a></li>
										</c:when>
										</c:choose>
									</ul>
									${sessionNick}
								</li>
							</ul>
						</div>
					</div>
				</div><!-- Container /- -->
			</div><!-- Top Header /- -->				
		</div><!-- SidePanel /- -->
		
		<!-- Menu Block -->
		<div class="container-fluid no-left-padding no-right-padding menu-block">
			<!-- Container -->
			<div class="container">				
				<nav class="navbar ownavigation navbar-expand-lg">
					<a class="navbar-brand" href="index.html">TEA :: TIME</a>
					<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar1" aria-controls="navbar1" aria-expanded="false" aria-label="Toggle navigation">
						<i class="fa fa-bars"></i>
					</button>
					<div class="collapse navbar-collapse" id="navbar1">
						<ul class="navbar-nav">							
						<li><a class="nav-link" title="home" href="${pageContext.request.contextPath }/main">home</a></li>
							<li><a class="nav-link" title="notices" href="${pageContext.request.contextPath }/noticesBoard.list">notices</a></li>
							<li><a class="nav-link" title="story" href="${pageContext.request.contextPath }/storyBoard.list">story</a></li>
							<li><a class="nav-link" title="photo" href="${pageContext.request.contextPath }/photoBoard.list">photo</a></li>
							<li><a class="nav-link" title="media" href="${pageContext.request.contextPath }/mediaBoard.list">media</a></li>
							<li><a class="nav-link" title="mypage" href="${pageContext.request.contextPath }/member.mycontent?board=story_board">mypage</a></li>
							
						</ul>
					</div>
					<div id="loginpanel-1" class="desktop-hide">
						<div class="right toggle" id="toggle-1">
							<a id="slideit-1" class="slideit" href="#slidepanel"><i class="fo-icons fa fa-inbox"></i></a>
							<a id="closeit-1" class="closeit" href="#slidepanel"><i class="fo-icons fa fa-close"></i></a>
						</div>
					</div>
				</nav>
			</div><!-- Container /- -->
		</div><!-- Menu Block /- -->
		<!-- Search Box -->
		<div class="search-box collapse" id="search-box">
			<div class="container">
			<form>
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search..." required>
					<span class="input-group-btn">
						<button class="btn btn-secondary" type="submit"><i class="pe-7s-search"></i></button>
					</span>
				</div>
			</form>
			</div>
		</div><!-- Search Box /- -->
	</header><!-- Header Section /- -->

	<div class="main-container">
	
		<main class="site-main">

			<!-- Slider Section -->
			<div class="container-fluid no-left-padding no-right-padding slider-section slider-section2">
				<!-- Container -->
				<div class="container">
					<div id="slider-carousel-2" class="carousel slide" data-ride="carousel">
						<div class="carousel-inner" role="listbox">
							<div class="carousel-item active">
							
							
								<div class="row">
									<div class="col-lg-8 col-sm-12 post-block post-big">
										<div class="post-box">
											<img src="${realTime[0].photo }" style="height:500px;width:100%;" alt="Slide" />
											<div class="entry-content">
												<span class="post-category"><a href="#" title="Travel">${realTime[0].title }</a></span>
												<h3><a href="#" title="Best Surfing Spots for Beginners and Advanced"></a></h3>
												<a href="${pageContext.request.contextPath}/photoBoard.sumnail?idx=${realTime[0].idx}" title="Read More">더보기</a>
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-sm-12 post-block post-thumb">
										<div class="post-box">
											<img src="${realTime[1].photo }"  style="height:250px;width:100%;"alt="Slide" />
											<div class="entry-content">
												<span class="post-category"><a href="#" title="Sport">${realTime[1].title }</a></span>
												<h3><a href="#" title="High-Tech Prototype Bike Announced"></a></h3>
												<a href="${pageContext.request.contextPath}/photoBoard.sumnail?idx=${realTime[1].idx}" title="Read More">더보기</a>
											</div>
										</div>
										<div class="post-box">
											<img src="${realTime[2].photo }" style="height:250px;width:100%;" alt="Slide" />
											<div class="entry-content">
												<span class="post-category"><a href="#" title="Nature">${realTime[2].title }</a></span>
												<h3><a href="#" title="White Sand of The Desert Discovery"></a></h3>
												<a href="${pageContext.request.contextPath}/photoBoard.sumnail?idx=${realTime[2].idx}" title="Read More">더보기</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="carousel-item">
								<div class="row">
									<div class="col-lg-8 post-block post-big">
										<div class="post-box">
											<img src="${realTime[2].photo }" style="height:500px;width:100%;" alt="Slide" />
											<div class="entry-content">
												<span class="post-category"><a href="#" title="Travel">${realTime[2].title }</a></span>
												<h3><a href="#" title="Best Surfing Spots for Beginners and Advanced"></a></h3>
												<a href="${pageContext.request.contextPath}/photoBoard.sumnail?idx=${realTime[2].idx}" title="Read More">더보기</a>
											</div>
										</div>
									</div>
									<div class="col-lg-4 post-block post-thumb">
										<div class="post-box">
											<img src="${realTime[0].photo }" style="height:250px;width:100%;" alt="Slide" />
											<div class="entry-content">
												<span class="post-category"><a href="#" title="Sport">${realTime[0].title }</a></span>
												<h3><a href="#" title="High-Tech Prototype Bike Announced"></a></h3>
												<a href="${pageContext.request.contextPath}/photoBoard.sumnail?idx=${realTime[0].idx}" title="Read More">더보기</a>
											</div>
										</div>
										<div class="post-box">
											<img src="${realTime[1].photo }" style="height:250px;width:100%;" alt="Slide" />
											<div class="entry-content">
												<span class="post-category"><a href="#" title="Nature">${realTime[1].title}</a></span>
												<h3><a href="#" title="White Sand of The Desert Discovery"></a></h3>
												<a href="${pageContext.request.contextPath}/photoBoard.sumnail?idx=${realTime[1].idx}" title="Read More">더보기</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							
									<div class="carousel-item">
								<div class="row">
									<div class="col-lg-8 post-block post-big">
										<div class="post-box">
											<img src="${realTime[1].photo }"style="height:500px;width:100%;" alt="Slide" />
											<div class="entry-content">
												<span class="post-category"><a href="#" title="Travel">${realTime[1].title }</a></span>
												<h3><a href="#" title="Best Surfing Spots for Beginners and Advanced"></a></h3>
												<a href="${pageContext.request.contextPath}/photoBoard.sumnail?idx=${realTime[1].idx}" title="Read More">더보기</a>
											</div>
										</div>
									</div>
									<div class="col-lg-4 post-block post-thumb">
										<div class="post-box">
											<img src="${realTime[2].photo }" style="height:250px;width:100%;" alt="Slide" />
											<div class="entry-content">
												<span class="post-category"><a href="#" title="Sport">${realTime[2].title }</a></span>
												<h3><a href="#" title="High-Tech Prototype Bike Announced"></a></h3>
												<a href="${pageContext.request.contextPath}/photoBoard.sumnail?idx=${realTime[2].idx}" title="Read More">더보기</a>
											</div>
										</div>
										<div class="post-box">
											<img src="${realTime[0].photo }" style="height:250px;width:100%;" alt="Slide" />
											<div class="entry-content">
												<span class="post-category"><a href="#" title="Nature">${realTime[0].title }</a></span>
												<h3><a href="#" title="White Sand of The Desert Discovery"></a></h3>
												<a href="${pageContext.request.contextPath}/photoBoard.sumnail?idx=${realTime[0].idx}" title="Read More">더보기</a>
											</div>
										</div>
									</div>
								</div>
							</div>
									
						</div>
					</div>
				</div><!-- Container /- -->
			</div><!-- Slider Section /- -->
			
			<!-- Trending Section -->
			<div class="container-fluid no-left-padding no-right-padding trending-section">
				<!-- Container -->
				<div class="container">
					<!-- Section Header -->
					<div class="section-header">
							<div class="widget widget_latestposts">
								<h3 style="font-size: 20px" class="widget-title">베스트 포토</h3>
									<hr style="border: 0; height: 2px; background: #ccc;">
								</div>
						

					</div><!-- Section Header /- -->
					<div class="trending-carousel">
					<c:forEach items="${photoBest }" var="photo">
						<div class="type-post">
							
							<div class="entry-cover"><a href="${pageContext.request.contextPath}/photoBoard.sumnail?idx=${photo.idx}"><img src="${photo.photo}" style="width:270px; height:220px;" alt="Trending" /></a></div>
							
							<div class="entry-content">
								<div class="entry-header">
									<h3 class="entry-title" style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis"><a href="${pageContext.request.contextPath}/photoBoard.sumnail?idx=${photo.idx}">${photo.title } </a></h3>
									<span class="byline" style="font-size: 13px;">
									<a title="Art" style="text-transform: lowercase;"><i class="fa fa-user-o" aria-hidden="true"></i> by ${photo.user_nick}</a>&nbsp;
									<a title="Lifestyle" style="text-transform: lowercase;"><i class="fa fa-thumbs-up fa-lg" aria-hidden="true"></i> ${photo.good }</a>&nbsp;&nbsp;
									<a title="Lifestyle" style="text-transform: lowercase;"><i class="fa fa-thumbs-down fa-lg" aria-hidden="true"></i> ${photo.bad }</a>&nbsp;&nbsp;
									<a title="Lifestyle" style="text-transform: lowercase;"><i class="fa fa-commenting fa-lg" aria-hidden="true"></i> ${photo.comment_count }</a>
									</span>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- 	<div class="type-post">
							<div class="entry-cover"><a href="#"><img src="http://via.placeholder.com/270x220" alt="Trending" /></a></div>
							<div class="entry-content">
								<div class="entry-header">
									<span><a href="#" title="Travel">TRAVEL</a></span>
									<h3 class="entry-title"><a href="#">There was a legend about the well in the garden</a></h3>
								</div>
							</div>
						</div>
						<div class="type-post">
							<div class="entry-cover"><a href="#"><img src="http://via.placeholder.com/270x220" alt="Trending" /></a></div>
							<div class="entry-content">
								<div class="entry-header">
									<span><a href="#" title="Nature">NATURE</a></span>
									<h3 class="entry-title"><a href="#">The entrance to the tunnel was his only way out</a></h3>
								</div>
							</div>
						</div>
						<div class="type-post">
							<div class="entry-cover"><a href="#"><img src="http://via.placeholder.com/270x220" alt="Trending" /></a></div>
							<div class="entry-content">
								<div class="entry-header">
									<span><a href="#" title="Nature">NATURE</a></span>
									<h3 class="entry-title"><a href="#">He was going back to a place he'd hoped</a></h3>
								</div>
							</div>
						</div> -->
					</div>
				</div><!-- Container /- -->
			</div><!-- Trending Section /- -->
			<!-- Page Content -->
			<div class="container-fluid no-left-padding no-right-padding page-content">
				<!-- Container -->
				<div class="container">
					<div class="row">
						<!-- Content Area -->
						<div class="col-lg-8 col-md-6 content-area" >
						<div class="widget widget_latestposts">
								<h3 style="font-size: 20px" class="widget-title">베스트 스토리</h3>
									<hr style="border: 0; height: 2px; background: #ccc;">
								</div>
								
							<!-- Row -->
							<div class="row" >
							<c:forEach items="${storyBest }" var="story">
								<div class="col-lg-6 col-md-12 col-sm-6" style="border: solid 1px #E6E6E6;">
									<div class="type-post">
										<div class="entry-cover">
											<div class="post-meta">
												
											</div>
											
										</div>
										<div class="entry-content">
											<div class="entry-header">	
												<%-- <span class="post-category"><a href="#" title="Technology">by ${story.user_nick }</a></span> --%>
												<h3 style="font-size: 20px;" class="entry-title" style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis" ><a href="${pageContext.request.contextPath}/storyBoard.detail?idx=${story.idx}" title="글 제목">${story.title }</a></h3>
											</div>
											<p><a href="${pageContext.request.contextPath}/storyBoard.detail?idx=${story.idx}" title="">${story.content }</a></p>
											<div class="entry-header">											
												 <span class="post-category" style="font-size: 13px">
												<a title="Lifestyle" style="text-transform: lowercase;"><i class="fa fa-user-o" aria-hidden="true"></i> by ${story.user_nick }</a>&nbsp;
												<a title="Lifestyle" style="text-transform: lowercase;"><i class="fa fa-thumbs-up fa-lg" aria-hidden="true"></i> ${story.good }</a>&nbsp;&nbsp;
												<a title="Lifestyle" style="text-transform: lowercase;"><i class="fa fa-thumbs-down fa-lg" aria-hidden="true"></i> ${story.bad }</a>&nbsp;&nbsp;
												<a title="Lifestyle" style="text-transform: lowercase;"><i class="fa fa-commenting fa-lg" aria-hidden="true"></i> ${story.comment_count }</a>
												</span>
											</div>
											<a href="${pageContext.request.contextPath}/storyBoard.detail?idx=${story.idx}" title="Read More">더보기</a>
										</div>
									</div>
								</div>									
							</c:forEach>	
								<!-- <div class="col-lg-6 col-md-12 col-sm-6">
									<div class="type-post">
										<div class="entry-cover">
											<div class="post-meta">
												
											</div>
											
										</div>
										<div class="entry-content">
											<div class="entry-header">	
												<span class="post-category"><a href="#" title="Travel">Travel</a></span>
												<h3 class="entry-title"><a href="#" title="Charming Evening Field">Charming Evening Field</a></h3>
											</div>								
											<p>No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely...</p>
											<a href="#" title="Read More">Read More</a>
										</div>
									</div>
								</div> -->	
							</div><!-- Row /- -->
							<!-- Pagination -->
							
						</div><!-- Content Area /- -->
						<!-- Widget Area -->
						<div class="col-lg-4 col-md-6 widget-area" >
							<!-- Widget : Latest Post -->
							<aside class="widget widget_tranding_post" style="line-height:9%">
							<br>
								<h3 class="widget-title" style="font-size: 20px;">베스트 동영상</h3>
									<hr style="border: 0; height: 2px; background: #ccc;">
								<p></p><br>
								<p></p><br>
								<p></p><br><br><br>
								
								
								
								<div id="trending-widget" class="carousel slide" data-ride="carousel" >
									
									<div class="carousel-inner">
									
									<c:forEach items="${mediaBest }" var="media" varStatus="status" >
									<c:if test="${status.index==0 }">	
										<div class="carousel-item active">
									
											<div class="trnd-post-box" style="text-align: center;">
									
												<div class="post-cover" style="font-size: 3px"><a href="${pageContext.request.contextPath}/mediaBoard.detail?idx=${media.idx}"><img src="http://i.ytimg.com/vi/${media.media}/0.jpg" alt="Tranding Post" /></a></div>
												&nbsp;&nbsp;<span class="post-category"><a title="Lifestyle" style="text-transform: lowercase;"><i class="fa fa-user-o" aria-hidden="true"></i> by ${media.user_nick }</a>&nbsp;&nbsp;
												<a title="Lifestyle" style="text-transform: lowercase;"><i class="fa fa-thumbs-up" aria-hidden="true"></i> ${media.good }</a>&nbsp;&nbsp;
												<a title="Lifestyle" style="text-transform: lowercase;"><i class="fa fa-thumbs-down" aria-hidden="true"></i> ${media.bad }</a>&nbsp;&nbsp;
												<a title="Lifestyle" style="text-transform: lowercase;"><i class="fa fa-commenting" aria-hidden="true"></i> ${media.comment_count }</a></span>
												<h3 class="post-title" style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis"><a href="${pageContext.request.contextPath}/mediaBoard.detail?idx=${media.idx}">${media.title }</a></h3>
											</div>
										</div>										
									</c:if>	
									<c:if test="${status.index!=0 }">
										<div class="carousel-item">
											<div class="trnd-post-box" style="text-align: center;">
												<div class="post-cover" style="font-size: 3px"><a href="${pageContext.request.contextPath}/mediaBoard.detail?idx=${media.idx}"><img src="http://i.ytimg.com/vi/${media.media}/0.jpg" alt="Tranding Post" /></a></div>
												&nbsp;&nbsp;<span class="post-category"><a title="Lifestyle" style="text-transform: lowercase;"><i class="fa fa-user-o" aria-hidden="true"></i> by ${media.user_nick }</a>&nbsp;&nbsp;
												<a title="Lifestyle" style="text-transform: lowercase;"><i class="fa fa-thumbs-up" aria-hidden="true"></i> ${media.good }</a>&nbsp;&nbsp;
												<a title="Lifestyle" style="text-transform: lowercase;"><i class="fa fa-thumbs-down" aria-hidden="true"></i> ${media.bad }</a>&nbsp;&nbsp;
												<a title="Lifestyle" style="text-transform: lowercase;"><i class="fa fa-commenting" aria-hidden="true"></i> ${media.comment_count }</a></span>
												<h3 class="post-title" style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis"><a href="${pageContext.request.contextPath}/mediaBoard.detail?idx=${media.idx}">${media.title }</a></h3>
											</div>
										</div>
									</c:if>	
									</c:forEach>											
									</div>
									<ol class="carousel-indicators">
										<li data-target="#trending-widget" data-slide-to="0" class="active"></li>
										<li data-target="#trending-widget" data-slide-to="1"></li>
										<li data-target="#trending-widget" data-slide-to="2"></li>
										<li data-target="#trending-widget" data-slide-to="3"></li>
										<li data-target="#trending-widget" data-slide-to="4"></li>
									</ol>
								</div>
							</aside>
							<aside class="widget widget_latestposts">
								<h3 class="widget-title">스토리 베스트 댓글</h3>								
								<c:forEach items="${storyCommentBest }" var="storyComment" varStatus="status">
									<p style="display: inline-block;overflow: hidden;max-width: 90%;white-space: nowrap;text-overflow: ellipsis;margin-bottom:1px;"><b>${status.index+1 }.</b><a title="${storyComment.content }" href="${pageContext.request.contextPath }/storyBoard.detail?idx=${storyComment.board_idx}">${storyComment.content }</a>
	    							<span style="position: absolute;left: 90%;color: #e9281d;"><i class="fa fa-thumbs-up fa-2g" aria-hidden="true"></i>(${storyComment.good })</span></p><br>
	    						</c:forEach>

							</aside><!-- Widget : Latest Post /- -->
							<!-- Widget : Latest Post -->
							<aside class="widget widget_latestposts">
								<h3 class="widget-title">포토 베스트 댓글</h3>
								<c:forEach items="${photoCommentBest }" var="photoComment" varStatus="status">
									<p style="display: inline-block;overflow: hidden;max-width: 90%;white-space: nowrap;text-overflow: ellipsis;margin-bottom:1px;"><b>${status.index+1 }.</b><a title="${photoComment.content }" href="${pageContext.request.contextPath }/photoBoard.detail?idx=${photoComment.board_idx}">${photoComment.content }</a>
	    							<span style="position: absolute;left: 90%;color: #e9281d;"><i class="fa fa-thumbs-up fa-2g" aria-hidden="true"></i>(${photoComment.good })</span></p><br>
	    						</c:forEach>
					
							</aside><!-- Widget : Latest Post /- -->
							<!-- Widget : Latest Post -->
							<aside class="widget widget_latestposts">
								<h3 class="widget-title">미디어 베스트 댓글</h3>
								<c:forEach items="${mediaCommentBest }" var="mediaComment" varStatus="status">
									<p style="display: inline-block;overflow: hidden;max-width: 90%;white-space: nowrap;text-overflow: ellipsis;margin-bottom:1px;"><b>${status.index+1 }.</b><a title="${mediaComment.content }" href="${pageContext.request.contextPath }/mediaBoard.detail?idx=${mediaComment.board_idx}">${mediaComment.content }</a>
	    							<span style="position: absolute;left: 90%;color: #e9281d;"><i class="fa fa-thumbs-up fa-2g" aria-hidden="true"></i>(${mediaComment.good })</span></p><br>
	    						</c:forEach>
					
							</aside><!-- Widget : Latest Post /- -->
							<!-- Widget : Categories -->
							<!-- <aside class="widget widget_categories text-center">
								<h3 class="widget-title">카테고리</h3>
								<ul>
									<li><a href="#" title="Nature">엔터테인먼트</a></li>
									<li><a href="#" title="Technology">동물사랑</a></li>
									<li><a href="#" title="Travel">사건사고</a></li>
									<li><a href="#" title="Sport">공지사항</a></li>
									<li><a href="#" title="Lifestyle">내가쓴글보기</a></li>
								</ul>
							</aside> --><!-- Widget : Categories /- -->
							<!-- Widget : Tranding Post -->
							
							<!-- Widget : Tranding Post /- -->
							<!-- Widget : Follow Us -->
							
							
					
						</div><!-- Widget Area /- -->
					</div>
				</div><!-- Container /- -->
			</div><!-- Page Content /- -->
			
		</main>
		
	</div>
	
	<!-- Footer Main /- -->
<div class="padding-100"></div>
		<div class="padding-50"></div>
		
		<!-- Footer Main -->
		<footer class="container-fluid no-left-padding no-right-padding footer-main footer-section1">
			<!-- Container -->
			<div class="container">
				<ul class="ftr-social">
					<li><a href="https://ko-kr.facebook.com/" title="Facebook"><i class="fa fa-facebook"></i>Facebook</a></li>
					<li><a href="https://twitter.com/?lang=ko" title="Twitter"><i class="fa fa-twitter"></i>twitter</a></li>
					<li><a href="https://www.instagram.com/?hl=ko" title="Instagram"><i class="fa fa-instagram"></i>Instagram</a></li>
					<li><a href="https://plus.google.com/?hl=ko" title="Google Plus"><i class="fa fa-google-plus"></i>Google plus</a></li>
					<li><a href="https://www.pinterest.co.kr/" title="Pinterest"><i class="fa fa-pinterest-p"></i>pinterest</a></li>
					<li><a href="https://www.youtube.com/?gl=KR&hl=ko" title="Youtube"><i class="fa fa-youtube"></i>youtube</a></li>
				</ul>
				<div class="copyright">
					<p>Copyright @ 2017 MINIBLOG</p>
				</div>
			</div><!-- Container /- -->
		</footer><!-- Footer Main /- -->
	
	<!-- JQuery v1.12.4 -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-1.12.4.min.js"></script>

	<!-- Library - Js -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/lib.js"></script>
	
	<!-- REVOLUTION JS FILES -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/revolution/js/jquery.themepunch.tools.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/revolution/js/jquery.themepunch.revolution.min.js"></script>

	<!-- SLIDER REVOLUTION 5.0 EXTENSIONS  (Load Extensions only on Local File Systems !  The following part can be removed on Server for On Demand Loading) -->	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/revolution/js/extensions/revolution.extension.actions.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/revolution/js/extensions/revolution.extension.migration.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/revolution/js/extensions/revolution.extension.video.min.js"></script>
		
	<!-- Library - Theme JS -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/functions.js"></script>
	
<script type=text/javascript>
$(document).ready(function(){
        
    $(".return-top").hide(); // 탑 버튼 숨김
    $(function () {
                 
        $(window).scroll(function () {
            if ($(this).scrollTop() > 100) { // 스크롤 내릴 표시
                $('.return-top').fadeIn();
            } else {
                $('.return-top').fadeOut();
            }
        });
                
        $('.return-top').click(function () {
            $('body,html').animate({
                scrollTop: 0
            }, 800);  // 탑 이동 스크롤 속도
            return false;
        });
    });
 
});
</script>
<script type=text/javascript>
$(document).ready(function(){
    $(function () {
                 
        $(window).scroll(function () {
            if ($(this).scrollTop() > 100) { // 스크롤 내릴 표시
                $('.return-bottom').fadeOut();
            } else {
                $('.return-bottom').fadeIn();
            }
        });
                
        $('.return-bottom').click(function () {
            $('body,html').animate({
                scrollTop: '+=2100'
            }, 800);  // 탑 이동 스크롤 속도
            return false;
        });
    });
 
});
</script>

<!-- 스크롤 -->
<a class="return-bottom" href="#" style="right:15px; bottom:15px; position:fixed; z-index:9999;"><img src="${pageContext.request.contextPath}/resources/assets/images/down.png"></a><a class="return-top" href="#" style="right:15px; bottom:15px; position:fixed; z-index:9999;"><img src="${pageContext.request.contextPath}/resources/assets/images/scroll.png"></a>
<!-- 스크롤 -->
	
</body>
</html>