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
    <title>tourist Detail</title>
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
	
      <h1 align="left">${attr.title }</h1>
      <div align="right">
        <p style="font-size:36px"><a href="${ctx}/addFavorite?attraction_id=${attr.attraction_id}"><img src="${ctx}/resources/image/Main/즐겨찾기.jpg">즐겨찾기</a></p>
      </div>
      <div align="center">
      <img src="${ctx}/Attraction/image?attraction_id=${attr.attraction_id}" style="width:100%; height:400px;" class="container-fluid"/><br><br><br>
      <div align="justify">${attr.content }</div><br><br>
      </div>
      
      
      <table class="table table-striped table-bordered table-hover" style="margin:auto;">
        <caption>후기 리스트</caption>
		<thead style="background-color:#666; color:#CCC">
            <tr>
                <th>No</th>
                <th>별점</th>
                <th>글제목</th>
                <th>작성자</th>
            </tr>
        </thead>
  		<tbody>
  		<c:forEach items="${postList}" var="post" varStatus="sts">
            <tr>
                <td>${sts.count}</td>
                <td>
                   <c:choose>
                   <c:when test="${post.star_point < 1}">☆☆☆☆☆</c:when>
                   <c:when test="${post.star_point < 2}">★☆☆☆☆</c:when>
                   <c:when test="${post.star_point < 3}">★★☆☆☆</c:when>
                   <c:when test="${post.star_point < 4}">★★★☆☆</c:when>
                   <c:when test="${post.star_point < 5}">★★★★☆</c:when>
                   <c:when test="${post.star_point == 5}">★★★★★</c:when>
                   </c:choose>
            
                </td>
                <td><a href="${ctx}/post/detail?post_id=${post.post_id}">${post.title}</a></td>
                <td>${post.writer_id}</td>

            </tr>
          </c:forEach>
        </tbody>
		</table>
      <br>
      <div align="right">
			<a href="${ctx}/post/create?attraction_id=${attr.attraction_id}"><input type="button" class="btn btn-info" value="후기 등록"></a><br><br>
      </div>
      </div>
      <footer>&copy;Copyright 2016 TeamName ㅈㄴㅂㄴ</footer>
</body>
</html>
