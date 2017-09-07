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
    <title>join</title>
    <!-- Bootstrap -->
	<link href="${ctx}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${ctx}/resources/css/style.css" rel="stylesheet" type="text/css">
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	
  </head>
  <body>
<div class="container-fluid" align="center" style="width:60%">

		<%@ include file="/WEB-INF/views/header/header.jspf" %>

<p align="center"><img src="${ctx}/resources/image/Main/캘리로고.PNG" width="411" height="72"/></p>
  <form class="form-horizontal" id="formJoin" action="${ctx}/user/join" method="POST">
  <table width="400" border="0" align="center">
    <tbody>
      <tr>
        <td><label for="textfield" >ID</label></td>
        <td><input type="text" name="id" id="iptLoginId" placeholder="아이디"><div id="dplPrint"></div></td>
      </tr>
      <tr>
        <td><label for="textfield" >PASSWORD</label></td>
        <td><input type="password" name="password" id="iptPassword" placeholder="비밀번호"></td>
      </tr>
      <tr>
        <td><label for="textfield" >PASSWORD CHECK</label></td>
        <td><input type="password" name="rePassword" id="iptRePassword" placeholder="비밀번호 확인"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><label for="textfield" >NAME</label></td>
        <td><input type="text" name="name" id="iptName" placeholder="이름"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><label for="textfield" >
          <input type="radio" value="male" name="sex" id="radio1">MALE</label>          
          <label for="textfield">
          <input type="radio" value="female" name="sex" id="radio2">FEMALE</label></td>
      </tr>
      <tr>
        <td><label for="textfield" >EMAIL</label></td>
        <td><input type="text" name="email" id="iptEmail" placeholder="이메일"></td>
      </tr>
      <tr>
        <td><label for="textfield" >BIRTHDAY</label></td>
        <td><input type="text" name="birth" id="birthday" placeholder="YYYY-MM-DD"></td>
      </tr>
      <tr>
        <td><label for="textfield" >PHONE</label></td>
        <td><input type="text" name="phoneNum" id="phone" placeholder="000-0000-0000"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </tbody>
  </table><br>

  <script src="js/bootstrap.js"></script>
<div align="center">

<input type="reset" class="btn btn-info" value="취소">
<input type="submit" class="btn btn-info" value="확인" onclick="join(); return false;">
</div>
</form>
</div>
  <footer>&copy;Copyright 2016 TeamName ㅈㄴㅂㄴ</footer>
  
  <script type="text/javascript">
    	var validate = function() {
    		if(document.getElementById("iptLoginId").value == "") {
    			alert("아이디를 입력하세요");
    			document.getElementById("iptLoginId").focus();
    			return false;
    		}
    		if(document.getElementById("iptName").value == "") {
    			alert("이름을 입력하세요");
    			document.getElementById("iptName").focus();
    			return false;
    		}
    		
    		if(document.getElementById("iptEmail").value == "") {
    			alert("이메일을 입력하세요");
    			document.getElementById("iptEmail").focus();
    			return false;
    		}
    		
    		if(document.getElementById("iptPassword").value == "") {
    			alert("비밀번호를 입력하세요");
    			document.getElementById("iptPassword").focus();
    			return false;
    		}

    		if(document.getElementById("iptRePassword").value == "") {
    			alert("비밀번호 확인을 입력하세요");
    			document.getElementById("iptRePassword").focus();
    			return false;
    		}
    		
    		//비밀번호, 비밀번호 확인 항목이 일치하는지 비교
    		if(document.getElementById("iptPassword").value != document.getElementById("iptRePassword").value) {
    			alert("비밀번호가 일치하지 않습니다.");
    			document.getElementById("iptPassword").value = "";
    			document.getElementById("iptRePassword").value = "";
    			document.getElementById("iptPassword").focus();
    			return false;
    		}
    		
    		return true;
    	};
    	
    	var join = function() {
    		if(validate()) {
    			document.getElementById("formJoin").submit();
    		}
    	};
    	
    	$("#iptLoginId").keyup(function() {
    		if($(this).val().length < 4) {
    			$("#dplPrint").text("4자 이상 입력하세요.");
    		}
    		else {
    			$.ajax({
    				type: "POST",
    				url: "${pageContext.request.contextPath}/user/idCheck",
    				data: {
    					"loginId" : $("#iptLoginId").val()
    				},
    				success: function(data) {
    					
    					if(data == "true"){
    						$("#dplPrint").text("이미 사용중인 아이디 입니다.");
    					}
    					else {
    						$("#dplPrint").text("사용가능한 아이디 입니다.");
    					}
    				}
    			});
    		}
    		
    	}); 
    </script>
  
</body>
</html>