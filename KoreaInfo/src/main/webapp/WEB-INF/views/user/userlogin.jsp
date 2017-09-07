<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx">${pageContext.request.contextPath}</c:set>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>login</title>
    <!-- Bootstrap -->
	<link href="${ctx}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${ctx}/resources/css/style.css" rel="stylesheet" type="text/css">

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
	<script type="text/javascript">
    var goJoin = function() {
    	location.href="${ctx}/user/joinView";
    }
    
    
    </script>
  </head>
  <body>
<div class="container-fluid" align="center" style="width:60%">
     
		<%@ include file="/WEB-INF/views/header/header.jspf" %>     
     
<p align="center"><img src="${ctx}/resources/image/Main/캘리로고.PNG" width="411" height="72"/></p>
  <form action="${ctx}/user/login" method="post">
  <table width="400" border="0" align="center">
  <tbody>
      <tr>
        <td><label for="textfield" >ID</label></td>
        <td><input type="text" name="loginId" id="textfield"></td>
      </tr>
    <tr>
        <td><label for="textfield" >PASSWORD</label></td>
        <td><input type="password" name="password" id="password"></td>
    </tr>
          <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
  </tbody>
</table>
<div align="center">
<input type="submit" class="btn btn-info" value="로그인">
<a href="${ctx}/user/joinView"><input type="button" class="btn btn-info" value="회원가입" onclick="goJoin(); return false;"></a>
</div>
</form>
</div>
  <footer>&copy;Copyright 2016 TeamName ㅈㄴㅂㄴ</footer>
    	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
	<script src="${ctx}/resources/js/jquery.min.js"></script>

	<!-- Include all compiled plugins (below), or include individual files as needed --> 
	<script src="${ctx}/resources/js/bootstrap.min.js"></script>
  </body>
</html>