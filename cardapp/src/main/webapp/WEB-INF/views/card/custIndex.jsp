<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../includes/header.jsp" %>

<div class="container">
	<div class="card-signup-form">

		<form class="row g-3" id="searchForm" action="/card/custIndex" method="post">
		  <div class="col-md-3">
		    <label for="inputEmail4" class="form-label">성명</label>
		    <input type="text" class="form-control" id="hgNm" name="hgNm">
		  </div>

		  <div class="col-md-3">
		    <label for="inputPassword4" class="form-label">생년월일</label>
		    <input type="text" class="form-control" id="birthD" name="birthD">
		  </div>
		  
		  <div class="col-md-3">
		    <label for="inputAddress" class="form-label">핸드폰번호</label>
		    <input type="text" class="form-control" id="hdpNo" name="hdpNo">
		  </div>
		  <div class="col-md-3">
			<button type="submit" class="btn btn-info">검색</button>
		  </div>
		</form>
	</div>
	
	<div class="card-signup-form">
		검색결과
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">주민번호</th>
		      <th scope="col">성명(한글)</th>
		      <th scope="col">생년월일</th>
		      <th scope="col">핸드폰 번호</th>
		      <th scope="col">결제 은행</th>	
		      <th scope="col">결제 계좌</th>
		      <th scope="col">주소</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${list}" var="list">
		    <tr>
		      <td><c:out value="${list.ssn}"></c:out></td>
		      <td><c:out value="${list.hgNm}"></c:out></td>
		      <td><c:out value="${list.birthD}"></c:out></td>
		      <td><c:out value="${list.hdpNo}"></c:out></td>
		      <td><c:out value="${list.bnkCdNm}"></c:out></td>
		      <td><c:out value="${list.stlAct}"></c:out></td>
		      <td><c:out value="${list.billAdr1}"></c:out></td>
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