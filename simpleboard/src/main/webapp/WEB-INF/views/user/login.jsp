<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../includes/header.jsp" %>

	<div class="container">
		<div class="form-signin">
		<form  role="form" id="frm" name="frm" action="/user/login" method="post">
			<input type="text" class="form-control" placeholder="ID" id="userId" name='userId' required autofocus>
			<input type="text" class="form-control" placeholder="pw" id="userPw" name='userPw' required>
			<div>
			<button type="button" id ="checkLogin" class="btn btn-primary btn-lg btn-block">Login</button>
			</div>
		</form>
		</div>
	</div>
	
<script>

	var canLogin = false;
	
	$(function() {
		//idck 버튼을 클릭했을 때 
		$("#checkLogin").click(function() {
			//userid 를 param.
			var userId =  $("#userId").val();
			var userPw = $("#userPw").val();
			
			$.ajax({
			type : 'POST',
			data : JSON.stringify({
					"userId" : userId,
					"userPw" : userPw
					}),
			url : "/user/check-login",
			dataType : "json",
			contentType: "application/json; charset=UTF-8",
			success : function(cnt) {
				if (cnt > 0) {
					canLogin = true;
					$("#frm").submit();
				} else {
						alert("ID 혹은 PW를 확인해주세요");
					}
				},
				error : function(error) {
					alert("error : " + error);
				}
			});
		});
	});	

</script>