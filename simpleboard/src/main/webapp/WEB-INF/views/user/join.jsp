<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../includes/header.jsp" %>

<div class="container">
	<div class="input-form-background row">
		<div class="inputpfrom col-md-12 mx-auto">
			<h4 class="mb-3">회원가입</h4>
			<form role="form" id="frm" name="frm" action="/user/join" method="post">
				<div class="row">
					<div class="col-md-6 mb-5">
						<label for="userId">ID</label>
						<input type="text" class="form-control" id="userId" name='userId' placeholder="id" required>
						<button type="button" class="btn btn-primary" id="userIdCheck">중복확인</button>
						<font id="checkId" size = "2"></font>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 mb-5">
						<label for="userPw">PW</label>
						<input type="text" class="form-control" id="userPw" name='userPw' placeholder="pw" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 mb-5">
						<label for="userPwCheck">PW check</label>
						<input type="text" class="form-control" id="userPwCheck" name='userPwCheck' placeholder="pw" required>
					</div>
				</div>
				
				<div class="mb-3">
					<label for="userName">이름</label>
					<input type="text" class="form-control" id="userName" name='userName' placeholder="이름">
				</div>
				
				<div class="row">

					 <div class="col-md-2 mb-3">
						<label for="userPhone1">연락처1</label>
						<select name="userPhone1">
						<c:forEach items="${phoneCode}" var="phoneCode" varStatus="status2">
							<option value="<c:out value="${phoneCode.codeId}"/>">
								<c:out value="${phoneCode.codeName}"/>
							</option>
						</c:forEach>
						</select>
					 </div>
					 
					<div class="col-md-4 mb-3">
						<label for="userPhone2">연락처2</label>
						<input type="text" class="form-control" id="userPhone2" name='userPhone2' required>
					</div>
					
					<div class="col-md-4 mb-3">
						<label for="userPhone3">연락처3</label>
						<input type="text" class="form-control" id="userPhone3" name='userPhone3' required>
					</div>
					
				</div>

				<div class="row">
					<div class="col-md-6 mb-2">
						<label for="userAddr1">주소1(공통)</label>
						<input type="text" class="form-control" id="userAddr1" name='userAddr1' placeholder="시군구" required>
					</div>
					<div class="col-md-6 mb-4">
						<label for="userPw">상세주소</label>
						<input type="text" class="form-control" id="userAddr2" name='userAddr2' placeholder="상세주소" required>
					</div>
				</div>
				
				<div class="mb-3">
					<label for="userCompany">소속회사</label>
					<input type="text" class="form-control" id="userCompany" name='userCompany' placeholder="소속회사">
				</div>
				<button class="btn btn-primary btn-lg btn-block" type="button" onClick="join();">회원 가입</button>
			</form>
		</div>
	</div>
</div>

<script>
		var canJoin = false;
		var userId;
		
		$(function() {
			
			$("#userIdCheck").click(function() {
				//userid  param setting.
				userId =  $("#userId").val();
				$.ajax({
				type : 'POST',
				data : userId,
				url : "/user/validateId",
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
				success : function(cnt) {
					if (cnt > 0) {
						alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
					} else {
							alert("사용가능한 아이디입니다.");
							canJoin = true;
							userId =  $("#userId").val();
						}
					},
					error : function(error) {
						alert("error : " + error);
					}
				});
			});
		});
		
		
		function join() {
			
			var inputUserId =  $("#userId").val();
			
			if(confirm("회원가입을 하시겠습니까?")) {
				
				if(canJoin) { //1. Id duplication validation
					
					//var isPassValidation;
					var isPassValidation = inputValidation(); //2. 이름, 핸드폰번호, 비밀번호 유효성 test
					console.log("isPassValidation()", isPassValidation);
					
					
					if (isPassValidation) {

						if (userId === inputUserId) { // do inputId value pass duplicate validation?
							alert("회원가입을 완료하였습니다.");
							$("#frm").submit();
						} else {
							alert("ID 중복확인을 다시 진행해주세요");
						}
						
					}
					
				} else {
					alert('아이디 중복체크를 해주세요');
					return false;
				}
			}
		};
		
		function inputValidation() { //아이디 중복값 더블체크를 제외한 나머지 유효성 검사 함수
			
			var isPassValidation = false;
			
			var userPw = document.getElementById("userPw");
			var userPwCheck = document.getElementById("userPwCheck");
			var userName = document.getElementById("userName");
			var userPhone2 = document.getElementById("userPhone2");
			var userPhone3 = document.getElementById("userPhone3");
			var phonePassRule = /[0-9]{4}$/;
			var userAddr1PassRule = /\d{3}-\d{3}/;
			
			if (userPw.value == "") {
				alert("비밀번호를 입력하세요");
				return isPassValidation;
			};
			
			if (userPwCheck.value == "") {
				alert("비밀번호 확인란을 입력하세요");
				return isPassValidation;
			};
			
			if (!(userPw.value === userPwCheck.value)) {
				console.log("userPw.value==>", userPw.value);
				console.log("userPwCheck.value==>", userPwCheck.value);
				alert("비밀번호와 비밀번호 확인란 입력값이 다릅니다.");
				return isPassValidation;
			};
			
			if ((userPw.value.length < 6) || (userPw.value.length >= 12)) {
				
				console.log("userPw.length", userPw.length);
				alert("비밀번호는 6~12자로 지정해야 합니다");
				return isPassValidation;
			};
			
			if (userName.value == "") {
				alert("이름을 입력하세요");
				return isPassValidation;
			};
			
			if (userPhone2.value == "") {
				alert("핸드폰 번호를 입력하세요");
				return isPassValidation;
			};

			if (userPhone3.value == "") {
				alert("핸드폰 마지막 자리 번호를 입력하세요");
				return isPassValidation;
			};
			
			if (!phonePassRule.test(userPhone2.value)) {
				alert("핸드폰 번호는 4자리 숫자로 적어주세요");
				return isPassValidation;
			};
			
			if (!phonePassRule.test(userPhone3.value)) {
				alert("핸드폰 번호는 4자리 숫자로 적어주세요");
				return isPassValidation;
			};
			
			if (!userAddr1PassRule.test(userAddr1.value)) {
				alert("우편번호는 xxx-xxx 의 형식으로 적어주세요");
				return isPassValidation;
			}
			
			isPassValidation = true;
			return isPassValidation;
		}
		 
</script>