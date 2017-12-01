<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
	
	<!-- start: Meta -->
	<meta charset="utf-8">
	<title>관리자 페이지</title>
	<meta name="description" content="Bootstrap Metro Dashboard">
	<meta name="author" content="Dennis Ji">
	<meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
	<!-- end: Meta -->
	
	<!-- start: Mobile Specific -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- end: Mobile Specific -->
	
	<!-- start: CSS -->
	
	<link id="bootstrap-style" href="${pageContext.request.contextPath}/resources/admin/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/admin/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link id="base-style" href="${pageContext.request.contextPath}/resources/admin/css/style.css" rel="stylesheet">
	<link id="base-style-responsive" href="${pageContext.request.contextPath}/resources/admin/css/style-responsive.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
	<!-- end: CSS -->	
	
</head>

<body>
		
		<!-- start: Header -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand"><span>관리자 페이지</span></a>
								
				<!-- start: Header Menu -->
				<div class="nav-no-collapse header-nav">
					<ul class="nav pull-right">
												
						<!-- start: User Dropdown -->
						<li class="dropdown">
							<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="halflings-icon white user"></i> ${sessionScope.sessionNick }
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li class="dropdown-menu-title">
 									<span>Account Settings</span>
								</li>
								<li><a href="${pageContext.request.contextPath}/main"><i class="halflings-icon off"></i> 메인페이지로 이동</a></li>
							</ul>
						</li>
						<!-- end: User Dropdown -->
					</ul>
				</div>
				<!-- end: Header Menu -->
				
			</div>
		</div>
	</div>
	<!-- start: Header -->
	
		<div class="container-fluid-full">
		<div class="row-fluid">
				
			<!-- start: Main Menu -->
			<div id="sidebar-left" class="span2">
				<div class="nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li><a href="${pageContext.request.contextPath}/admin.dashBoardMain"><i class="icon-edit"></i><span class="hidden-tablet"> 대시 보드 </span></a></li>
						<li>
							<a class="dropmenu" href="#"><i class="icon-user"></i><span class="hidden-tablet"> 회원 관리</span></a>
							<ul>
								<li><a class="submenu" href="${pageContext.request.contextPath}/management.memberList">&nbsp;&nbsp;&nbsp;<i class="icon-group"></i><span class="hidden-tablet"> 회원 관리</span></a></li>
								<li><a class="submenu" href="${pageContext.request.contextPath}/management.blackList">&nbsp;&nbsp;&nbsp;<i class="icon-pause"></i><span class="hidden-tablet"> 블랙리스트 관리</span></a></li>
								<li><a class="submenu" href="${pageContext.request.contextPath}/management.resignList">&nbsp;&nbsp;&nbsp;<i class="icon-remove"></i><span class="hidden-tablet"> 탈퇴 회원 관리</span></a></li>
							</ul>	
						</li>
						<li><a href="${pageContext.request.contextPath}/qaBoard.listAdminOption"><i class="icon-edit"></i><span class="hidden-tablet"> 문의게시판 </span></a></li>

					</ul>
				</div>
			</div>
			<!-- end: Main Menu -->


