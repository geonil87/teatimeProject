<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../storyboard/header.jsp" %>
<!DOCTYPE html>

<html>
<head>
<title>TEA :: TIME</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

</script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/customcss/button.css">
  	  	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/customcss/insert.css">
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
						<div class="col-sm-12 content-area">
							<div class="aboute-block">
							
							
						<h1 class="widget-title" style="font-size: 25px">회원정보 수정</h1>
						<hr style="border: 0; height: 1px; background: #ccc;">
  <div class="row"></div>
					

						
<form action="${pageContext.request.contextPath}/member.checkModifyUserInfo" method="post">
		<div class="form_table">
		<table>
		<tbody>
		<tr>
		<th scope="row">비밀번호 확인</th>
		<td>
			<div class="item">
				<input title="레이블 텍스트" class="i_text" type="password" name="userPw" maxlength="16"  required="required"><div style="display: inline;">${param.checkResult}</div><br>
			</div>
		</td>
		</tr>
		</tbody>
		</table>
		<br>
		<div align="center"><input type="submit" value="확인"/> <input type="button" value="취소" onclick="javascript:history.back()"/></div>
	</div>
	</form>					
	
									</div>
								</div>
							</div>
						</div><!-- Content Area /- -->
					</div><!-- Row /- -->
				</div><!-- container /- -->
			</div><!-- Aboute-me Section /- -->


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
					<li><a href="https://www.instagram.com/?hl=" title="Instagram"><i class="fa fa-instagram"></i>Instagram</a></li>
					<li><a href="https://plus.google.com/?hl=ko" title="Google Plus"><i class="fa fa-google-plus"></i>Google plus</a></li>
					<li><a href="https://www.pinterest.co.kr/" title="Pinterest"><i class="fa fa-pinterest-p"></i>pinterest</a></li>
					<li><a href="https://www.youtube.com/?hl=ko&gl=KR‎" title="Youtube"><i class="fa fa-youtube"></i>youtube</a></li>
				</ul>
				<div class="copyright">
					<p>Copyright @ 2017 MINIBLOG</p>
				</div>
			</div><!-- Container /- -->
		</footer><!-- Footer Main /- -->
</body>
</html>