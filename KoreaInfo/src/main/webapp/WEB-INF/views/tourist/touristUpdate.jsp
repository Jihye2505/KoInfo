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
    <title>tourist Update</title>
    <!-- Bootstrap -->
	<link href="${ctx}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${ctx}/resources/css/style.css" rel="stylesheet" type="text/css">
    	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
<script>
	window.onload = function() {
		document.getElementById("state_id").value = document.getElementById("getstete_id").value;
	};
</script>
  </head>

<body>
	<div class="container-fluid" align="center" style="width:60%">

		<%@ include file="/WEB-INF/views/header/header.jspf" %>

<h1 align="left">관광명소 수정</h1><br>
<form action="${ctx}/Attraction/update?attraction_id=${attr.attraction_id}" method="post" id="attractionCreate" enctype="multipart/form-data">
	<div align="right"><span style="font-size:18px; font-weight: bold;">지역 :</span>
    	<select  name="state_id" id="state_id">
       	  <option>지역선택</option>
            <option value="1">경기도</option>
            <option value="2">강원도</option>
            <option value="3">충청도</option>
            <option value="4">전라도</option>
            <option value="5">경상도</option>
      </select>
    </div>
  <table style="width:100%" border="0" align="center">
  <tbody>
      <tr>
        <td><label for="textfield" style="font-size:18px;" >제목</label></td>
        <td ><input type="text" name="title" id="title" style="width:80%;" value="${attr.title }"></td>
      </tr>
      <tr><td colspan="2"><HR width="100%" align="center" style="color:black; background-color:black; height:1px; border:none" /></td></tr>
    <tr>
        <td><label for="textfield" style="font-size:18px;">주소</label></td>
        <td><input type="text" name="address" id="address" style="width:80%;" value="${attr.address }"></td>
      
    </tr>
    <tr><td colspan="2"><HR width="100%" align="center" style="color:black; background-color:black; height:1px; border:none" /></td></tr>
          <tr>
        <td><label for="textfield" style="font-size:18px;">내용</label></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2"><textarea type="textarea" name="content" id="content" style="width:100%; height:400px">${attr.content}</textarea></td>
      </tr>
          <tr><td colspan="2"><HR width="100%" align="center" style="color:black; background-color:black; height:1px; border:none" /></td></tr>
          <tr>
        <tr>
        <td colspan="2"><input type="file" name="file" style="width:100%;"></td>
      </tr>
  </tbody>
</table>
<br>
<div align="right">
<input type="reset" class="btn btn-info" value="취소">
<input type="submit" class="btn btn-info" value="저장" onclick="create(); return false;">
<input type="hidden" id="getstete_id" value="${attr.state_id}">
</div>
</form>

</div>
<footer>&copy;Copyright 2016 TeamName ㅈㄴㅂㄴ</footer>
<script type="text/javascript">
   var validate = function() {
	      if (document.getElementById("title").value == "") {
	          alert("제목를 입력하세요");
	          document.getElementById("title").focus();
	          return false;
	       }
	      if (document.getElementById("address").value == "") {
	          alert("주소를 입력하세요");
	          document.getElementById("address").focus();
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
         document.getElementById("attractionCreate").submit();
      }
   };
</script>
</body>
</html>
