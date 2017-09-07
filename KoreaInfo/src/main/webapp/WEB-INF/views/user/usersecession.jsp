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
    <title>favorite list</title>
    <!-- Bootstrap -->
	<link href="${ctx}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${ctx}/resources/css/style.css" rel="stylesheet" type="text/css">

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
	<!-- <script type="text/javascript">
    	var validate = function() {
    		if(document.getElementById("password").value != document.getElementById("userPassword").value) {
    			alert("비밀번호를 확인해주세요.");
    			document.getElementById("password").value = "";
    			document.getElementById("userPassword").value = "";
    			document.getElementById("password").focus();
    			return false;
    			}
    		return true;
    		};
    		
        	var check = function() {
        		if(validate()) {
        			document.getElementById("userSecession").submit();
        		}
    	};
 
    </script> -->
  </head>
  <body>
  <div class="container-fluid" align="center" style="width:60%">
   
   		<%@ include file="/WEB-INF/views/header/header.jspf" %>
   
  <h1 align="left">탈퇴</h1>
  <h5 align="left">탈퇴를 위한 비밀번호를 입력해주세요.</h5>
  <form id="userSecession" action="${ctx}/user/secession" method="POST" >
  <table  width="400" border="0" align="center">
  <tbody>
    <tr>
        <td><label for="textfield" id="userPassword">PASSWORD</label></td>
        <td><input type="password" name="password" id="password" placeholder="비밀번호"></td>
        <td><input type="submit" class="btn btn-warning" value="탈퇴" ></td>
        <!-- onclick="check(); return false;" -->
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