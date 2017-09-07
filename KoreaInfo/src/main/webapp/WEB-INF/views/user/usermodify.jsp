<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx">${pageContext.request.contextPath}</c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>modify</title>
<!-- Bootstrap -->
<link href="${ctx}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/resources/css/style.css" rel="stylesheet"
	type="text/css">

</head>
<body>
	<div class="container-fluid" align="center" style="width: 60%">

		<%@ include file="/WEB-INF/views/header/header.jspf"%>

		<p align="center">
			<img src="${ctx}/resources/image/Main/캘리로고.PNG" width="411"
				height="72" />
		</p>

		<h3 align="center">개인정보 수정</h3>

		<form action="${ctx}/user/modify" method="post">
			<table width="400" border="0" align="center">
				<tbody>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><label for="textfield">NAME</label></td>
						<td><input type="text" name="name" id="name"
							value="${loginedUser.name }"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><label for="textfield"> <input type="radio"
								value="male" name="sex" id="radio1"> MALE
						</label> <label for="textfield"> <input type="radio"
								value="female" name="sex" id="radio2"> FEMALE
						</label></td>
					</tr>
					<tr>
						<td><label for="textfield">EMAIL</label></td>
						<td><input type="text" name="email" id="email"
							value="${loginedUser.email }"></td>
					</tr>
					<tr>
						<td><label for="textfield">BIRTHDAY</label></td>
						<td><input type="text" name="birth" id="birthday"
							value="${loginedUser.birth }"></td>
					</tr>
					<tr>
						<td><label for="textfield">PHONE</label></td>
						<td><input type="text" name="phoneNum" id="phone"
							value="${loginedUser.phoneNum }"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</tbody>
			</table>
			<br>

			<script src="js/bootstrap.js"></script>
			<div align="center">
				<input type="reset" class="btn btn-info" value="취소"> 
				<input type="submit" class="btn btn-info" value="확인">
				<a href="${ctx}/user/secessionView" ><input type="button" class="btn btn-warning" value="탈퇴" ></a>

			</div>
		</form>
	</div>
	<footer>&copy;Copyright 2016 TeamName ㅈㄴㅂㄴ</footer>
	
	<input type="hidden" id="index"  value="${loginedUser.sex }">

<script type="text/javascript">
	var index = document.getElementById("index").value;
	
	if(index == "male")
		document.getElementById("radio1").checked = true;
	else if(index == "female") 
		document.getElementById("radio2").checked = true;
</script>
</body>
</html>