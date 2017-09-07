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
<title>post Detail</title>
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
</head>

<body>
	<div class="container-fluid" align="center" style="width: 60%">

		<%@ include file="/WEB-INF/views/header/header.jspf"%>

		<h1 align="left">후기 상세 정보</h1>
		<br>

		<table class="table table-striped table-bordered table-hover"
			style="margin: auto;">
			<caption>후기 리스트</caption>
			<thead>
				<tr>
					<th>${post.post_id}</th>
					<th><c:set var="star_point" value="${post.star_point}" /> <c:choose>
							<c:when test="${star_point == 0}">☆☆☆☆☆</c:when>
							<c:when test="${star_point == 1}">★☆☆☆☆</c:when>
							<c:when test="${star_point == 2}">★★☆☆☆</c:when>
							<c:when test="${star_point == 3}">★★★☆☆</c:when>
							<c:when test="${star_point == 4}">★★★★☆</c:when>
							<c:when test="${star_point == 5}">★★★★★</c:when>
						</c:choose></th>
					<th>${post.title }</th>
					<th>${post.writer_id }</th>
					<th><span style='float: right'> <c:set var="writer"
								value="${post.writer_id}" /> <%--        <c:set var="loginedUser" value="${loginedUser.id }"/>  --%>

							<c:if test="${writer eq loginedUser.id}">
								<a href="update?post_id=${post.post_id}" align="right">수정</a>
								<a href="delete?post_id=${post.post_id}" align="right">삭제</a>
							</c:if> <c:if test="${loginedUser.rank eq 'M'.charAt(0)}">
								<a href="delete?post_id=${post.post_id}" align="right">삭제</a>
							</c:if>
					</span></th>
				</tr>
			</thead>
			<tbody align="center">
				<tr>
					<td colspan="5"><img
						src="${ctx}/post/image?post_id=${post.post_id}"
						class="container-fluid" /></td>
				</tr>
				<tr>

					<td colspan="5"><div align="center">
							<div align="justify">${post.content}</div>
						</div></td>
				</tr>
				<tr>
					<td colspan="5">
							<table class="table table-striped table-bordered table-hover"
								style="margin: auto; width: 80%;">
								<caption>댓글(3)</caption>
								<thead style="background-color: #666; color: #CCC">
									<tr>
										<th>No</th>
										<th>작성자</th>
										<th>내용</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${cmtList}" var="comment" varStatus="sts">
										<tr>
											<td>${sts.count}</td>
											<td>${comment.writer_id}</td>
											<td>${comment.content}
											<%-- <span style='float:right'><a href="${ctx}/comment/update?comment_id=${comment.comment_id}" align="right">수정</a> --%>
               								 <span style='float:right'><a href="${ctx}/comment/delete?comment_id=${comment.comment_id}&post_id=${comment.post_id}" align="right">삭제</a></span>
											</td>
										</tr>
									</c:forEach>
									<!-- <tr>
                <td>1</td>
                <td>산악등반가</td>
                <td>잘보고갑니다~^^
                <span style='float:right'><a href="#" align="right">수정</a>
                <a href="#" align="right">삭제</a></span>
                </td>
            </tr> -->
									<tr>
										<td colspan="3">
											<form action="${ctx}/comment/create" method="post">
												<div align="center">
													<input type="text" name="content" id="content" style="width: 60%; height: 35px;">
													<input type="submit" class="btn btn-info" value="등록">
												</div>
													<input id="post_id" name="post_id" type="hidden" value="${post.post_id}">
											</form>
										</td>
									</tr>
								</tbody>
							</table>
					</td>
				</tr>
			</tbody>
		</table>
		<br>
	</div>
	<footer>&copy;Copyright 2016 TeamName ㅈㄴㅂㄴ</footer>
</body>
</html>