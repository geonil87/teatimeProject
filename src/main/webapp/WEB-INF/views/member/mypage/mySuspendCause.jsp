<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>TEA :: TIME</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">

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
<body onload='resizeWindow(this)'>
	<div class="container-fluid">
	<hr>
	<div class="row" align="center">
		<h1> TEA::TIME 정지 사유</h1>
	</div>
	<hr>
	<br>
		<div class="container" >
			<div class="term">
				<div class="row" align="center">
					
				</div>
				<table class="table table-bordered" style="border: 1px solid black;">
					<tbody class="termTable" style="text-align: center; vertical-align: middle;">
						<tr>
							<td style="text-align: left;" height="300px">${cause}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<hr>	
	
	<div class="form-group" align="center">
			<input class="btn btn-default" type="button" value="닫기" onclick="javascript:window.close()"/>
	</div>
</div>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript">
	function resizeWindow(win){
		var wid = win.document.body.offsetWidth + 30;
		var hei = win.document.body.offsetHeight + 66;
		win.resizeTo(wid,hei);
		}
	
</script>

</body>
</html>