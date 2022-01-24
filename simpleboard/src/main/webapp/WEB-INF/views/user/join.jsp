<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../includes/header.jsp" %>

<div class="container">
	<div class="input-form-background row">
		<div class="inputpfrom col-md-12 mx-auto">
			<h4 class="mb-3">회원가입</h4>
			<form role="form" action="/user/join" method="post">
				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="userId">ID</label>
						<input type="text" class="form-control" id="userId" name='userId' placeholder="id" required>
					</div>
					<div class="col-md-6 mb-3">
						<label for="userPw">PW</label>
						<input type="text" class="form-control" id="userPw" name='userPw' placeholder="pw" required>
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
				<button class="btn btn-primary btn-lg btn-block" type="submit">회원 가입</button>
			</form>
		</div>
	</div>
</div>