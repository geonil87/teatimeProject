<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>TEA :: TIME</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes">
  
  <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans'>

      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customcss/custom.css">
      <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/images/soso.png" />
	<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/resources/assets/images/apple-touch-icon-114x114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/resources/assets/images/apple-touch-icon-72x72-precomposed.html">
	<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/resources/assets/images/apple-touch-icon-57x57-precomposed.png">	
    <link href="${pageContext.request.contextPath}/resources/assets/css/lib.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/hanna.css">
	<!-- Custom - Common CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/rtl.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/style.css">
 <style type="text/css">

#body1 
{ 
background-image : url('${pageContext.request.contextPath}/resources/assets/images/login7.jpg'); 
	background-size : 100%; 
      font-family: Montserrat; 
 }
.logo {
    width: 213px;
    height: 36px;
    background: url('http://i.imgur.com/fd8Lcso.png') no-repeat;
    margin: 30px auto;
}

.login-block {
    width: 320px;
    padding: 20px;
    background: #fff;
    border-radius: 5px;
    border-top: 5px solid #ff656c;
    margin: 0 auto;
    opacity: 0.9;
    border: solid 1px;
}

.login-block h1 {
    text-align: center;
    color: #000;
    font-size: 18px;
    text-transform: uppercase;
    margin-top: 0;
    margin-bottom: 20px;
}

.login-block input {
    width: 100%;
    height: 42px;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-bottom: 20px;
    font-size: 14px;
    font-family: Montserrat;
    padding: 0 20px 0 50px;
    outline: none;
}

.login-block input#username {
    background: #fff url('http://i.imgur.com/u0XmBmv.png') 20px top no-repeat;
    background-size: 16px 80px;
}

.login-block input#username:focus {
    background: #fff url('http://i.imgur.com/u0XmBmv.png') 20px bottom no-repeat;
    background-size: 16px 80px;
}

.login-block input#password {
    background: #fff url('http://i.imgur.com/Qf83FTt.png') 20px top no-repeat;
    background-size: 16px 80px;
}

.login-block input#password:focus {
    background: #fff url('http://i.imgur.com/Qf83FTt.png') 20px bottom no-repeat;
    background-size: 16px 80px;
}

.login-block input:active, .login-block input:focus {
    border: 1px solid #ff656c;
}

.login-block button {
    width: 100%;
    height: 40px;
    background: #ff656c;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #e15960;
    color: #fff;
    font-weight: bold;
    text-transform: uppercase;
    font-size: 14px;
    font-family: Montserrat;
    outline: none;
    cursor: pointer;
}

.login-block button:hover {
    background: #ff7b81;
}

 </style>
	
</head>
<body data-offset="200" data-spy="scroll" data-target=".ownavigation">
			<div id="body1">
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
							<li><a class="nav-link" title="mypage" href="${pageContext.request.contextPath }/mypage">mypage</a></li>
							
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
	<br>
	
   
<div class="logo"></div>
<div class="login-block">
<form action="${pageContext.request.contextPath}/member.login" method="post" id="loginForm">
    <h1>Login</h1>
    <input type="text" id="username"  placeholder="아이디" name="userId" value="${param.userId }" autofocus="autofocus" />
    <input type="password" id="password" value="" placeholder="비밀번호" name="userPw" />
    
    <button type="submit" class="login__submit" value = "로그인">로그인</button>
    </form><br>
    <a type="text" style="cursor:pointer;font-family: Sans-serif " class="login__submit" onclick="location.href='${pageContext.request.contextPath}/member.tos'">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a type="text" style="cursor:pointer;font-family: Sans-serif " class="login__submit" onclick="findId()" >ID찾기 </a>/
    <a type="text" style="cursor:pointer;font-family: Sans-serif " class="login__submit" onclick="findPw()">PW찾기 </a>
    </div>
    
    
    


   
  
 	<!-- Footer Main /- -->
<div class="padding-100"></div>
		<div class="padding-50"></div>
		
		<!-- Footer Main -->
		<footer class="container-fluid no-left-padding no-right-padding footer-main footer-section1">
			<!-- Container -->
			<div class="container">
				<ul class="ftr-social">
					<li><a href="#" title="Facebook"><i class="fa fa-facebook"></i>Facebook</a></li>
					<li><a href="#" title="Twitter"><i class="fa fa-twitter"></i>twitter</a></li>
					<li><a href="#" title="Instagram"><i class="fa fa-instagram"></i>Instagram</a></li>
					<li><a href="#" title="Google Plus"><i class="fa fa-google-plus"></i>Google plus</a></li>
					<li><a href="#" title="Pinterest"><i class="fa fa-pinterest-p"></i>pinterest</a></li>
					<li><a href="#" title="Youtube"><i class="fa fa-youtube"></i>youtube</a></li>
				</ul>
				<div class="copyright">
					<p>Copyright @ 2017 TEATIME</p>
		</div>
	</div><!-- Container /- -->
</footer><!-- Footer Main /- -->




  </div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-3.2.1.min.js"></script>   
<script type="text/javascript">
	
	var resultMsg = "<c:out value='${param.loginResult}'/>";
	if (resultMsg != "") {
	    alert(resultMsg);
	}
	
	
    function findId(){
    	var openWin;
    	openWin = window.open("${pageContext.request.contextPath}/member.findId",
    			"findIdForm","width=570, height=450, resizable = no, scrollbars = no");
    }
    
    function findPw(){
    	var openWin;
    	openWin = window.open("${pageContext.request.contextPath}/member.findPw",
    			"findPwForm","width=570, height=450, resizable = no, scrollbars = no");
    }

</script>

</body>
</html>
