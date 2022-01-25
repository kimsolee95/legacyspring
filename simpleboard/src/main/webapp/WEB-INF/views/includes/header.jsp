<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>SimpleBoard</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
</head>
<body>

	<div id="header">
		<c:if test="${empty userId}">
		<ul class="nav nav-tabs">
		  <li role="presentation"><a href="/user/login">login</a></li>
		  <li role="presentation"><a href="/user/join">join</a></li>
		</ul>
		</c:if>
		<c:if test="${not empty userId}">
		<p>${userId} 님</p>
		</c:if>
	</div>	

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  -->
</body>
</html>


