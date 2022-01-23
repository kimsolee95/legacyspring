<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../includes/header.jsp" %>

	<div class="container">
		<div class="form-signin">
		<form  role="form" action="/user/login" method="post">
			<h1>Sign in</h1>
			<input type="text" class="form-control" placeholder="ID" name='userId' required autofocus>
			<input type="password" class="form-control" placeholder="Passward" name='userPw' reqiored>
			<div>
			<button type="submit" class="btn btn-primary btn-lg btn-block">Login</button>
			</div>
		</form>
		</div>
	</div>