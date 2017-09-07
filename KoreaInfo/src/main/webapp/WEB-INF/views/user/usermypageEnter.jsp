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
    <title>mypage enter</title>
    <!-- Bootstrap -->
	<link href="${ctx}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${ctx}/resources/css/style.css" rel="stylesheet" type="text/css">

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
  </head>
  <body>
  <div class="container-fluid" align="center" style="width:60%">

		<%@ include file="/WEB-INF/views/header/header.jspf" %>

  <h1 align="left">마이페이지</h1>
  <h5 align="left">개인정보 보호를 위해 비밀번호를 입력해주세요.</h5>
  <form>
  <table  width="400" border="0" align="center">
  <tbody>
    <tr>
        <td><label for="textfield" >PASSWORD</label></td>
        <td><input type="text" name="textfield" id="password"></td>
        <td><input type="submit" class="btn btn-info" value="확인"></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
  </tbody>
</table>
</form>
</div>
  <footer>&copy;Copyright 2016 TeamName ㅈㄴㅂㄴ</footer>
      	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
	<script src="${ctx}/resources/js/jquery.min.js"></script>

	<!-- Include all compiled plugins (below), or include individual files as needed --> 
	<script src="${ctx}/resources/js/bootstrap.min.js"></script>
  </body>
</html>