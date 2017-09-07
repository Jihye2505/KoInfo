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
    <title>tourist Main</title>
    <!-- Bootstrap -->
	<link href="${ctx}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${ctx}/resources/css/style.css" rel="stylesheet" type="text/css">

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		<script type="text/javascript">
			window.onload = function(){
				$('#header_img_1').remove();
				$('#header_img_2').remove();
			}
		</script>
  </head>
  <body>
<div class="container-fluid" align="center" style="width:60%">
	<%@ include file="/WEB-INF/views/header/header.jspf" %>    
  <%-- <nav>
	    <div class="container-fluid">
	      <!-- Brand and toggle get grouped for better mobile display -->
	      <div class="navbar-header">
	        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#defaultNavbar1" aria-expanded="false"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
	        <a class="navbar-brand" href="#">Korea Info</a></div>
	      <!-- Collect the nav links, forms, and other content for toggling -->
	      <div class="collapse navbar-collapse" id="defaultNavbar1">
<ul class="nav navbar-nav navbar-right">
  <li><a href="${ctx}/user/loginView">로그인</a></li>
  <li><a href="#">회원가입</a></li>
</ul>
          </div>
	      <!-- /.navbar-collapse -->
        </div>
	    <!-- /.container-fluid -->
      </nav> --%>
	  <div id="carousel1" class="carousel slide" data-ride="carousel">
	    <ol class="carousel-indicators">
	      <li data-target="#carousel1" data-slide-to="0" class="active"></li>
	      <li data-target="#carousel1" data-slide-to="1"></li>
	      <li data-target="#carousel1" data-slide-to="2"></li>
        </ol>
	    <div class="carousel-inner" role="listbox">
	      <div class="item active"><img src="${ctx}/resources/image/Main/ㅈㄴㅇ.PNG" alt="First slide image" class="center-block">
	        <div class="carousel-caption">
	          <h3>담양 죽농원</h3>
	          <p>담양의 대나무숲에서 산림욕을 줄겨보아요</p>
	        </div>
          </div>
	      <div class="item"><img src="${ctx}/resources/image/Main/ㅅㅊㅁ.PNG" alt="Second slide image" class="center-block">
	        <div class="carousel-caption">
	          <h3>순천 순천만</h3>
	          <p>내 키보다 높게 자란 갈대들의 아름다움</p>
	        </div>
          </div>
	      <div class="item"><img src="${ctx}/resources/image/Main/ㅎㅇㅁㅇ.PNG" alt="Third slide image" class="center-block">
	        <div class="carousel-caption">
	          <h3>전주 한옥마을</h3>
	          <p>한옥마을에서 한국의 멋을 느껴요</p>
	        </div>
          </div>

        </div>
        
        
	    <!-- <a class="left carousel-control" href="#carousel1" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span><span class="sr-only">Previous</span></a>
	    <a class="right carousel-control" href="#carousel1" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><span class="sr-only">Next</span></a> -->
	    
	    <a class="left carousel-control" href="#carousel1" role="button" data-slide="prev"><img src="${ctx}/resources/image/Main/화살표왼.png" class="glyphicon glyphicon-chevron-left" border="0"><span class="sr-only">Previous</span></a>
	    <a class="right carousel-control" href="#carousel1" role="button" data-slide="next"><img src="${ctx}/resources/image/Main/화살표오.png" class="glyphicon glyphicon-chevron-left" border="0"><span class="sr-only">Next</span></a>
  </div>
  


	    <h1>한국의 관광명소</h1>

	  <h3>지역을 선택하세요.</h3>
<div class="container-fluid">
	<p align="center"><img src="${ctx}/resources/image/Main/한국지도.PNG" border="0" usemap="#Map">
      <map name="Map">
      <!-- 경기도 -->
      <area shape="circle" coords="303,222,64" href="${ctx}/Attraction/list?state_id=1">
      <!-- 강원도 -->
      <area shape="circle" coords="509,187,58" href="${ctx}/Attraction/list?state_id=2">
      <!-- 충청도 -->
      <area shape="circle" coords="342,406,68" href="${ctx}/Attraction/list?state_id=3">
      <!-- 전라도 -->
      <area shape="circle" coords="307,656,68" href="${ctx}/Attraction/list?state_id=4">
      <!-- 경상도 -->
      <area shape="circle" coords="583,577,68" href="${ctx}/Attraction/list?state_id=5">
      </map>
  </p>
  </div>
<footer>&copy;Copyright 2016 TeamName ㅈㄴㅂㄴ</footer>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
	<script src="${ctx}/resources/js/jquery.min.js"></script>

	<!-- Include all compiled plugins (below), or include individual files as needed --> 
	<script src="${ctx}/resources/js/bootstrap.min.js"></script>

    </div>
  </body>
</html>