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
<title>Post Register</title>
<!-- Bootstrap -->
<link href="${ctx}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/resources/css/style.css" rel="stylesheet"
	type="text/css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

<script type="text/javascript">
	var validate = function() {
		if (document.getElementById("title").value == "") {
			alert("제목를 입력하세요");
			document.getElementById("title").focus();
			return false;
		}
		if (document.getElementById("content").value == "") {
			alert("내용을 입력하세요");
			document.getElementById("content").focus();
			return false;
		}
		return true;
	};
	var create = function() {
		if(validate()) {
			document.getElementById("postCreate").submit();
		}
	};
</script>
</head>

<body>
	<div class="container-fluid" align="center" style="width: 60%">

		<%@ include file="/WEB-INF/views/header/header.jspf"%>

		<h1 align="left">후기 등록</h1>
		<br>
		<form action="${ctx}/post/create?attraction_id=${attraction_id}" method="post" id="postCreate" enctype="multipart/form-data">
			<input id="attraction_id" name="attraction_id" type="hidden"
				value="${attraction_id}">
			<div align="right">
				<span style="font-size: 18px; font-weight: bold;">별점 :</span> <select
					name="star_point">
					<option value="0">☆☆☆☆☆</option>
					<option value="1">★☆☆☆☆</option>
					<option value="2">★★☆☆☆</option>
					<option value="3">★★★☆☆</option>
					<option value="4">★★★★☆</option>
					<option value="5">★★★★★</option>
				</select>
			</div>
			<table style="width: 100%" border="0" align="center">
				<tbody>
					<tr>
						<td><label for="textfield" style="font-size: 18px;">제목</label></td>
						<td><input type="text" name="title" id="title"
							style="width: 80%;"></td>
					</tr>
					<tr>
						<td colspan="2"><HR width="100%" align="center"
								style="color: black; background-color: black; height: 1px; border: none" /></td>
					</tr>
					<tr>
						<td><label for="textfield" style="font-size: 18px;">작성자</label></td>
						<td><input id="writer_id" name="writer_id" type="hidden"
							value="${writer_id}">${writer_id}</td>


					</tr>
					<tr>
						<td colspan="2"><HR width="100%" align="center"
								style="color: black; background-color: black; height: 1px; border: none" /></td>
					</tr>
					<tr>
						<td><label for="textfield" style="font-size: 18px;">내용</label></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2"><textarea type="textarea" name="content"
								id="content" style="width: 100%; height: 400px"></textarea></td>
					</tr>
					<tr>
						<td colspan="2"><HR width="100%" align="center"
								style="color: black; background-color: black; height: 1px; border: none" /></td>
					</tr>
					<tr>
					<tr>
						<td colspan="2"><input type="file" id="image" name="file"
							style="width: 100%;"></td>
					</tr>
				</tbody>
			</table>
			<br>
			<div align="right">
				<input type="reset" class="btn btn-info" value="취소"> <input
					type="submit" class="btn btn-info" value="등록" onclick="create(); return false;">
			</div>
		</form>

	</div>
	<footer>&copy;Copyright 2016 TeamName ㅈㄴㅂㄴ</footer>
</body>
</html>