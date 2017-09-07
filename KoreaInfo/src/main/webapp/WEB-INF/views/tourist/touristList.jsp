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
    <title>tourist List</title>
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

          <h1 align="left">
          <c:if test="${state_id eq '1'}">경기도</c:if>
          <c:if test="${state_id eq '2'}">강원도</c:if>
          <c:if test="${state_id eq '3'}">충청도</c:if>
          <c:if test="${state_id eq '4'}">전라도</c:if>
          <c:if test="${state_id eq '5'}">경상도</c:if>
          </h1>
      <div align="right">
      	<c:if test="${loginedUser.rank eq 'M'.charAt(0)}">
			<a href="${ctx}/Attraction/regist?state_id=${state_id}"><input type="button" class="btn btn-info" value="등록"></a><br><br>
     	</c:if>
      </div>
          <div align="right">
        <form action="${ctx}/Attraction/searchByName" method="POST">
			<input type="text" name="title" id="title" style="width:50%; height:30px;" value="" placeholder="검색할 관광명소 이름또는 주소를 입력하세요."> 
			<input type="submit" class="btn btn-info" value="Search"><br><br>
        </form>
      </div>
	<table class="table table-striped table-bordered table-hover" style="margin:auto;">
        <caption>관광명소 리스트</caption>
		<thead style="background-color:#666; color:#CCC">
            <tr>
                <th>No</th>
                <th>관광명소</th>
                <th>주소</th>
                <th>별점</th>
            </tr>
        </thead>
  		<tbody>
  		<c:forEach items="${attlist}" var="attlist" varStatus="sts">
            <tr>
                <td>${sts.count}</td>
                <td><a href="${ctx}/Attraction/searchById?attraction_id=${attlist.attraction_id}">${attlist.title}</a></td>
                <td>${attlist.address}</td>
                <td>
                <c:set var="star_point" value="${attlist.star_point }" />
                   <c:choose>
                   <c:when test="${star_point == 0 || star_point<1}">☆☆☆☆☆</c:when>
                   <c:when test="${star_point == 1 || star_point<2}">★☆☆☆☆</c:when>
                   <c:when test="${star_point == 2 || star_point<3}">★★☆☆☆</c:when>
                   <c:when test="${star_point == 3 || star_point<4}">★★★☆☆</c:when>
                   <c:when test="${star_point == 4 || star_point<5}">★★★★☆</c:when>
                   <c:when test="${star_point == 5}">★★★★★</c:when>
                   </c:choose>
					<c:if test="${loginedUser.rank eq 'M'.charAt(0)}">
						<span style='float:right'><a href="${ctx}/Attraction/update?attraction_id=${attlist.attraction_id}" align="right">수정</a>
               			 <a href="${ctx}/Attraction/delete?attraction_id=${attlist.attraction_id}&state_id=${attlist.state_id}" align="right">삭제</a></span>
					</c:if>
                </td>
            </tr>
        </tbody>
        </c:forEach>
</table>

</div>
<footer>&copy;Copyright 2016 TeamName ㅈㄴㅂㄴ</footer>
</body>
</html>
