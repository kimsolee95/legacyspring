<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../includes/header.jsp" %>

<div class="container">
	<div class="card-signup-form">

		<form class="row g-3" id="searchForm" action="/card/cardDtlBySsnCrdNo" method="post">
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
		검색결과
		<form class="row g-3">
		
		  <div class="col-md-6">
		    <label for="inputEmail4" class="form-label">성명(한글)</label>
		    <input type="text" class="form-control" id="inputEmail4" value="<c:out value="${list.hgNm}"/>"  disabled>
		  </div>
		  <div class="col-md-6">
		    <label for="inputPassword4" class="form-label">성명(영문)</label>
		    <input type="text" class="form-control" id="inputPassword4" value="<c:out value="${list.engNm}"/>"  disabled>
		  </div>

		  <div class="col-md-6">
		    <label for="inputEmail4" class="form-label">등록일자</label>
		    <input type="text" class="form-control" id="inputEmail4" value="<c:out value="${list.fstRegD}"/>"  disabled>
		  </div>
		  <div class="col-md-6">
		    <label for="inputPassword4" class="form-label">유효기간</label>
		    <input type="text" class="form-control" id="inputPassword4" value="<c:out value="${list.vldDur}"/>" disabled>
		  </div>
		  
		  <div class="col-md-6">
		    <label for="inputEmail4" class="form-label">브랜드</label>
		    <input type="text" class="form-control" id="inputEmail4" value="<c:out value="${list.brdNm}"/>" disabled>
		  </div>
		  <div class="col-md-6">
		    <label for="inputPassword4" class="form-label">카드 등급</label>
		    <input type="text" class="form-control" id="inputPassword4" value="<c:out value="${list.crdGrdNm}"/>" disabled>
		  </div>

		  <div class="col-md-6">
		    <label for="inputEmail4" class="form-label">전 카드번호</label>
		    <input type="text" class="form-control" id="inputEmail4" value="<c:out value="${list.bfCrdNo}"/>" disabled>
		  </div>
		  <div class="col-md-6">
		    <label for="inputPassword4" class="form-label">고객번호</label>
		    <input type="text" class="form-control" id="inputPassword4" value="<c:out value="${list.custNo}"/>" disabled>
		  </div>
		  
		  <div class="col-md-6">
		    <label for="inputEmail4" class="form-label">관리 영업점</label>
		    <input type="text" class="form-control" id="inputPassword4" value="<c:out value="${list.mgtBbrn}"/>" disabled>
		  </div>
		  <div class="col-md-6">
		    <label for="inputPassword4" class="form-label">최종 카드여부</label>
		    <input type="text" class="form-control" id="inputPassword4" value="<c:out value="${list.lstCrdF}"/>" disabled>
		  </div> 
		  
		  <div class="col-md-9">
		    <label for="inputPassword4" class="form-label">최종 등록일자</label>
		    <input type="text" class="form-control" id="inputPassword4" value="<c:out value="${list.regD}"/>" disabled>
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