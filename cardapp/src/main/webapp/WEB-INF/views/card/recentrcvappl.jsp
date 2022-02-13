<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../includes/header.jsp" %>

<div class="container">
	<div class="card-signup-form">
		<form class="row g-3" role="form" id="frm" name="frm" action="/card/signup" method="post">
		
		  <div class="col-md-4">
		    <label for="inputEmail4" class="form-label">주민번호</label>
		    <input type="text" class="form-control" id="inputEmail4" value="<c:out value="${selectRecentRcvapplOne.ssn}"></c:out>"  disabled>
		  </div>
		  <div class="col-md-3">
		    <label for="inputPassword4" class="form-label">접수일자</label>
		    <input type="text" class="form-control" id="inputEmail4" value="<c:out value="${selectRecentRcvapplOne.rcvD}"></c:out>"  disabled>
		  </div>
		  <div class="col-md-3">
		    <label for="inputAddress" class="form-label">접수 일련번호</label>
		    <input type="text" class="form-control" id="inputEmail4" value="<c:out value="${selectRecentRcvapplOne.rcvSeqNo}"></c:out>"  disabled>
		  </div>


		  <div class="col-md-4">
		    <label for="inputEmail4" class="form-label">신청일자</label>
		    <input type="text" class="form-control" id="inputEmail4" value="<c:out value="${selectRecentRcvapplOne.applD}"></c:out>"  disabled>
		  </div>
		  <div class="col-md-4">
		    <label for="inputPassword4" class="form-label">신청구분</label>
		    <input type="text" class="form-control" id="inputEmail4" value="<c:out value="${selectRecentRcvapplOne.applClas}"></c:out>"  disabled>
		  </div>
		  <div class="col-md-4">
		    <label for="inputAddress" class="form-label">브랜드</label>
		    <input type="text" class="form-control" id="inputEmail4" value="<c:out value="${selectRecentRcvapplOne.brd}"></c:out>"  disabled>
		  </div>


		  
		  <div class="col-md-4">
		    <label for="inputEmail4" class="form-label">성명(한글)</label>
		    <input type="text" class="form-control" id="inputEmail4" value="<c:out value="${selectRecentRcvapplOne.hgNm}"></c:out>"  disabled>
		  </div>
		  <div class="col-md-4">
		    <label for="inputPassword4" class="form-label">성명(영문)</label>
		    <input type="text" class="form-control" id="inputEmail4" value="<c:out value="${selectRecentRcvapplOne.engNm}"></c:out>"  disabled>
		  </div>
		  <div class="col-md-4">
		    <label for="inputAddress" class="form-label">생년월일</label>
		    <input type="text" class="form-control" id="inputEmail4" value="<c:out value="${selectRecentRcvapplOne.birthD}"></c:out>"  disabled>
		  </div>



		  <div class="col-md-4">
		    <label for="inputEmail4" class="form-label">결제일자</label>
		    <input type="text" class="form-control" id="inputEmail4" value="<c:out value="${selectRecentRcvapplOne.stlDd}"></c:out>"  disabled>
		  </div>
		  <div class="col-md-4">
		    <label for="inputPassword4" class="form-label">결제방법</label>
		    <input type="text" class="form-control" id="inputEmail4" value="<c:out value="${selectRecentRcvapplOne.stlMtd}"></c:out>"  disabled>
		  </div>
		  <div class="col-md-4">
		    <label for="inputAddress" class="form-label">결제은행</label>
		    <input type="text" class="form-control" id="inputEmail4" value="<c:out value="${selectRecentRcvapplOne.bnkCd}"></c:out>"  disabled>
		  </div>



			<div class="row col-md-6">
		    	<label for="inputAddress" class="form-label">결제계좌</label>
		    	<input type="text" class="form-control" id="inputEmail4" value="<c:out value="${selectRecentRcvapplOne.stlAct}"></c:out>"  disabled>
			</div>
			<div class="row col-md-6">
		    	<label for="inputAddress" class="form-label">결제계좌 확인여부</label>
		    	<input type="text" class="form-control">
			</div>


			
			<div class="row col-md-5">
		    	<label for="inputAddress" class="form-label">청구서 발송방법</label>
		    	<input type="text" class="form-control" id="inputEmail4" value="<c:out value="${selectRecentRcvapplOne.stmtSndMtd}"></c:out>"  disabled>

			
			</div>
			<div class="row col-md-6">
		    	<label for="inputAddress" class="form-label">우편번호</label>
		    	<input type="text" class="form-control" id="inputEmail4" value="<c:out value="${selectRecentRcvapplOne.billadrZip}"></c:out>"  disabled>
			</div>	
			

			
			<div class="row col-md-12">
		    	<label for="inputAddress" class="form-label">상세주소</label>
		    	<input type="text" class="form-control" id="billadrAdr2" name="billadrAdr2">
			</div>
			

		  
		  <div class="col-md-6">
		    <label for="inputCity" class="form-label">이메일</label>
		    <input type="text" class="form-control" id="inputEmail4" value="<c:out value="${selectRecentRcvapplOne.emailAdr}"></c:out>"  disabled>
		  </div>
		  <div class="col-md-4">
		    <label for="inputState" class="form-label">핸드폰번호</label>
		    <input type="text" class="form-control" id="inputEmail4" value="<c:out value="${selectRecentRcvapplOne.hdpNo}"></c:out>"  disabled>
		  </div>
		  <div class="col-md-2">
		    <label for="inputZip" class="form-label">비밀번호</label>
		    <input type="text" class="form-control" id="inputEmail4" value="<c:out value="${selectRecentRcvapplOne.scrtNo}"></c:out>"  disabled>
		  </div>


		  
			<div class="col-md-3">
		    	<label for="inputAddress" class="form-label">불능 구분</label>
		    	<input type="text" class="form-control" id="inputEmail4" value="<c:out value="${selectRecentRcvapplOne.impsbClas}"></c:out>"  disabled>
			</div>
			<div class="col-md-7">
		    	<label for="inputAddress" class="form-label">불능 사유명</label>
		    	<input type="text" class="form-control" id="inputEmail4" value="<c:out value="${selectRecentRcvapplOne.impsbCd}"></c:out>"  disabled>
			</div>	

		  <div class="buttons">
		    <a href='/card/signup'><button type="button" class="btn btn-primary">뒤로</button></a>
		  </div>
		</form>
	</div>
</div>

<%@include file="../includes/footer.jsp" %>

<script>
 
 
 
</script>

<style>
	.card-signup-form {
		margin: 50px auto;
		border: 5px solid #EEE;
		border-radius: 10px;
		padding: 2em;
	}
	
	.buttons {
		margin-left: 850px;
		margin-top: 30px;
	}
	
	.horizon {
		border-top: 1px solid #EEE;
		height: 3px;
		width: 800px;
		
	}
</style>