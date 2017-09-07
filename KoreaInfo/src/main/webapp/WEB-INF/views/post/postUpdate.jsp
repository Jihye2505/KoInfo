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
<title>Post Update</title>
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
		if (validate()) {
			document.getElementById("postUpdate").submit();
		}
	};

	window.onload = function() {
		document.getElementById("star_point").value = document
				.getElementById("oldStar_point").value;
	};
</script>
</head>

<body>
	<div class="container-fluid" align="center" style="width: 60%">

		<%@ include file="/WEB-INF/views/header/header.jspf"%>

		<h1 align="left">후기 수정</h1>
		<br>
		<form action="${ctx}/post/update?attraction_id=${post.attraction_id}"
			method="post" id="postUpdate" enctype="multipart/form-data">
			<input id="post_id" name="post_id" type="hidden"
				value="${post.post_id}"> 
				<input id="attraction_id"
				name="attraction_id" type="hidden" value="${post.attraction_id}">
			<input type="hidden" id="oldStar_point" value="${post.star_point}">
			<div align="right">
				<span style="font-size: 18px; font-weight: bold;">별점 :</span> <select
					name="star_point" id="star_point">
					<option value="0.0">☆☆☆☆☆</option>
					<option value="1.0">★☆☆☆☆</option>
					<option value="2.0">★★☆☆☆</option>
					<option value="3.0">★★★☆☆</option>
					<option value="4.0">★★★★☆</option>
					<option value="5.0">★★★★★</option>
				</select>
			</div>
			<table style="width: 100%" border="0" align="center">
				<tbody>
					<tr>
						<td><label for="textfield" style="font-size: 18px;">제목</label></td>
						<td><input type="text" name="title" id="title"
							style="width: 80%;" value="${post.title}"></td>
					</tr>
					<tr>
						<td colspan="2"><HR width="100%" align="center"
								style="color: black; background-color: black; height: 1px; border: none" /></td>
					</tr>
					<tr>
						<td><label for="textfield" style="font-size: 18px;">작성자</label></td>
						<td>
							${post.writer_id}
							<input id="writer_id" name="writer_id" type="hidden" value="${post.writer_id}"> </td>

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
						<td colspan="2"><input type="text" name="content"
							id="content" style="width: 100%; height: 400px"
							value="${post.content}"></td>
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
					type="submit" class="btn btn-info" value="등록"
					onclick="create(); return false;">
			</div>
		</form>

	</div>
	<footer>&copy;Copyright 2016 TeamName ㅈㄴㅂㄴ</footer>
</body>
</html>