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
  </head>
  <body>
  <div class="container-fluid" align="center" style="width:60%">

		<%@ include file="/WEB-INF/views/header/header.jspf" %>

  <h1 align="left">${user.name}님의 관광명소</h1>
  <table class="table table-striped table-bordered table-hover" style="margin:auto;">
        <caption>즐겨찾기 목록</caption>
      <thead style="background-color:#666; color:#CCC">
            <tr>
                <th>관광명소</th>
                <th>주소</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
         <c:forEach items="${favoriteList}" var="favoriteList" varStatus="sts">
            <tr>
                <td><a href="${ctx}/Attraction/searchById?attraction_id=${favoriteList.attraction_id}">${favoriteList.title}</a></td>
                <td>${favoriteList.address}</td>
                 <td width="50">
                	<a href="${ctx}/deleteFavorite?attraction_id=${favoriteList.attraction_id}"><input type="button"  width="40" height="40" class="btn btn-info" value="삭제"></a>
                </td>
            </tr>
         </c:forEach>
      </tbody>
</table>
    <script>
      var selectAll = document.querySelector(".selectAllMembers");
      selectAll.addEventListener('click', function(){
          var objs = document.querySelectorAll(".memberChk");
          for (var i = 0; i < objs.length; i++) {
            objs[i].checked = selectAll.checked;
          };
      }, false);
       
      var objs = document.querySelectorAll(".memberChk");
      for(var i=0; i<objs.length ; i++){
        objs[i].addEventListener('click', function(){
          var selectAll = document.querySelector(".selectAllMembers");
          for (var j = 0; j < objs.length; j++) {
            if (objs[j].checked === false) {
              selectAll.checked = false;
              return;
            };
          };
          selectAll.checked = true;                                    
      }, false);
      }  
    </script>
    <p>&nbsp;</p>
	
</div>
  <footer>&copy;Copyright 2016 TeamName ㅈㄴㅂㄴ</footer>
  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
	<script src="${ctx}/resources/js/jquery.min.js"></script>

	<!-- Include all compiled plugins (below), or include individual files as needed --> 
	<script src="${ctx}/resources/js/bootstrap.min.js"></script>
  </body>
</html>