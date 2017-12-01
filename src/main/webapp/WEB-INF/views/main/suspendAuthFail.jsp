<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>TEA :: TIME</title>
</head>
<!-- 도걸이양 -->
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
							<li><a class="nav-link" title="mypage" href="${pageContext.request.contextPath }/mycontent?board=story_board">mypage</a></li>
							
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
		
			<!-- Page Content -->
			<div class="container-fluid no-left-padding no-right-padding page-content">
				<!-- Container -->	
				<div class="container">
					<div class="row justify-content-md-center">
						<div class="col-md-8">
							<div class="error-block">
								<span>계정 오류 </span>
								<h2>귀하의 아이디는 계정 정지 상태입니다.</h2>
								<p>정지 사유</p>
								<div class="error-block" style="background-color: #D8D8D8;">
								<p>${cause }</p>
								
								</div>
								<br>
								<p>계정에 대한 문의사항은 문의하기 게시판과 담당자의 이메일로 문의 주시길 바랍니다.</p>
								<p>담당자 E-mail : teatimeprojectmaster@gmail.com</p>
								
								<a href="${pageContext.request.contextPath}/member.mycontent?board=story_board" title="Back Home">마이페이지</a>
							</div>
						</div>
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
	

</body>
</html>