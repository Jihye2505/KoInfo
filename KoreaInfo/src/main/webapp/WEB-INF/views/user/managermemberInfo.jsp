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
    <title>member info</title>
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

  <h1 align="left">아이디 검색결과</h1>
  <h3 align="left">${searchedUser.id }</h3>
  <form action="${ctx}/user/delete" method="post"><!-- 탈퇴는 지금 로그인된 회원이 탈퇴니까 바꾼 컬트롤러 추가 -->
  <table width="400" border="0" align="center">
    <tbody>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>NAME</td>
        <td>${searchedUser.name}</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>${searchedUser.sex}</td>
      </tr>
      <tr>
        <td>EMAIL</td>
        <td>${searchedUser.email}</td>
      </tr>
       <tr>
        <td>BIRTHDAY</td>
        <td>${searchedUser.birth}</td>
      </tr>
       <tr>
        <td>PHONE</td>
        <td>${searchedUser.phoneNum}</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </tbody>
  </table><br>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
	<script src="${ctx}/resources/js/jquery.min.js"></script>

	<!-- Include all compiled plugins (below), or include individual files as needed --> 
	<script src="${ctx}/resources/js/bootstrap.min.js"></script>
<div align="center">
<input type="submit" class="btn btn-info" value="삭제">
</div>
</form>
   </div>
  </body>
</html>