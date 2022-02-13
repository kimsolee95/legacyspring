<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../includes/header.jsp" %>

<div class="container">
	<div class="card-signup-form">
		<form class="row g-3" id="searchForm" action="/card/cardListBySsnCrdNo" method="post">
		  <div class="col-md-3">
		    <label for="inputEmail4" class="form-label">주민번호</label>
		    <input type="text" class="form-control" id="ssn" name="ssn">
		  </div>

		  <div class="col-md-3">
		    <label for="inputPassword4" class="form-label">카드번호</label>
		    <input type="text" class="form-control" id="crdNo" name="crdNo">
		  </div>

		  <div class="col-md-3">
			<button type="submit" class="btn btn-info">검색</button>
		  </div>
		</form>
	</div>
	
	<div class="card-signup-form">
		<h6><button class="maintext badge bg-dark">조회</button></h6>
		<div class="row col-md-12">
			<div class="col-md-4">
				<label for="inputEmail4" class="form-label">성명(한글)</label>
				<input type="text" class="form-control" id="ssn" name="ssn" value="<c:out value="${masterInfo.hgNm}"></c:out>" disabled>
			</div>
			<div class="col-md-4">
				<label for="inputPassword4" class="form-label">핸드폰번호</label>
				<input type="text" class="form-control" id="rcvD" name="rcvD" value="<c:out value="${masterInfo.hdpNo}"></c:out>" disabled>
			</div>
			<div class="col-md-4">
				<label for="inputAddress" class="form-label">등록일자</label>
				<input type="text" class="form-control" id="rcvSeqNo" name="rcvSeqNo" value="<c:out value="${masterInfo.regD}"></c:out>" disabled>
			</div>
		</div>
		
		<div class="row col-md-12">
			<div class="col-md-4">
				<label for="inputEmail4" class="form-label">결제방법</label>
				<input type="text" class="form-control" id="ssn" name="ssn" value="<c:out value="${masterInfo.stlMtd}"></c:out>" disabled>
			</div>
			<div class="col-md-4">
				<label for="inputPassword4" class="form-label">결제은행</label>
				<input type="text" class="form-control" id="rcvD" name="rcvD" value="<c:out value="${masterInfo.bnkCd}"></c:out>" disabled>
			</div>
			<div class="col-md-4">
				<label for="inputAddress" class="form-label">결제계좌</label>
				<input type="text" class="form-control" id="rcvSeqNo" name="rcvSeqNo" value="<c:out value="${masterInfo.stlAct}"></c:out>" disabled>
			</div>
		</div>

		<div class="row col-md-12">
			<div class="col-md-4">
				<label for="inputEmail4" class="form-label">결제일자</label>
				<input type="text" class="form-control" id="ssn" name="ssn" value="<c:out value="${masterInfo.stlDd}"></c:out>" disabled>
			</div>
			<div class="col-md-4">
				<label for="inputPassword4" class="form-label">청구서 발송방법</label>
				<input type="text" class="form-control" id="rcvD" name="rcvD" value="<c:out value="${masterInfo.stmtSndMtd}"></c:out>" disabled>
			</div>
			<div class="col-md-4">
				<label for="inputAddress" class="form-label">E-MAIL</label>
				<input type="text" class="form-control" id="rcvSeqNo" name="rcvSeqNo" value="<c:out value="${masterInfo.emailAdr}"></c:out>" disabled>
			</div>
		</div>
		
		<div class="row col-md-12">
			<div class="col-md-2">
				<label for="inputEmail4" class="form-label">우편번호</label>
				<input type="text" class="form-control" id="ssn" name="ssn" value="<c:out value="${masterInfo.billZip}"></c:out>" disabled>
			</div>
			<div class="col-md-2">
				<label for="inputPassword4" class="form-label">-</label>
				<input type="text" class="form-control" id="rcvD" name="rcvD" disabled>
			</div>
			<div class="col-md-8">
				<label for="inputAddress" class="form-label">-</label>
				<input type="text" class="form-control" id="rcvSeqNo" name="rcvSeqNo" disabled>
			</div>
		</div>		
	</div>
	
	<div class="card-signup-form">
		검색결과
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">카드번호</th>
		      <th scope="col">성명(영문)</th>
		      <th scope="col">유효기간</th>
		      <th scope="col">브랜드</th>
		      <th scope="col">카드등급</th>	
		      <th scope="col">발행일자</th>
		      <th scope="col">전 카드번호</th>
		      <th scope="col">최종카드여부</th>
		      <th scope="col">관리영업점</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${list}" var="list">
		    <tr>
		      <td><c:out value="${list.crdNo}"></c:out></td>
		      <td><c:out value="${list.engNm}"></c:out></td>
		      <td><c:out value="${list.vldDur}"></c:out></td>
		      <td><c:out value="${list.brdNm}"></c:out></td>
		      <td><c:out value="${list.crdGrdNm}"></c:out></td>
		      <td><c:out value="${list.fstRegD}"></c:out></td>
		      <td><c:out value="${list.bfCrdNo}"></c:out></td>
		      <td><c:out value="${list.lstCrdF}"></c:out></td>
		      <td><c:out value="${list.mgtBbrn}"></c:out></td>
		    </tr>
		    </c:forEach>
		  </tbody>
		</table>
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