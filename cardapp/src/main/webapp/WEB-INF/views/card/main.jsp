<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../includes/header.jsp" %>

<div class="container">
	<div class="card-signup-form">
		<form class="row g-3" role="form" id="frm" name="frm" action="/card/signup" method="post">
			<div class="main-buttons">
				<a href='/card/signup'><button type="button" class="btn btn-primary">입회신청서</button></a>
			</div>
			<div class="main-buttons">
				<a href='/card/rcvapplbyperiod'><button type="button" class="btn btn-primary">기간별 조회</button></a>
			</div>
			<!--
			<div class="buttons">
				<a href='/card/signup'><button type="button" class="btn btn-primary">뒤로</button></a>
			</div>
			 -->
		</form>
	</div>
</div>

<script>
 
 
 
</script>

<style>
	.card-signup-form {
		margin: 50px auto;
		border: 5px solid #EEE;
		border-radius: 10px;
		padding: 2em;
	}
	
	.main-buttons {
		margin-left: 450px;
		margin-top: 30px;
	}
	
	.horizon {
		border-top: 1px solid #EEE;
		height: 3px;
		width: 800px;
		
	}
</style>