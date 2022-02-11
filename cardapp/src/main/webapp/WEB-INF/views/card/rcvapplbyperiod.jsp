<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../includes/header.jsp" %>

<div class="container">
	<div class="card-signup-form">

		<form class="row g-3" id="searchForm" action="/card/rcvapplbyperiod" method="post">
		  <div class="col-md-3">
		    <label for="inputEmail4" class="form-label">기간</label>
		    <input type="text" class="form-control" id="startRcvD" name="startRcvD">
		    <input type="text" class="form-control" id="endRcvD" name="endRcvD">
		  </div>

		  <div class="col-md-3">
		    <label for="inputPassword4" class="form-label">신청구분</label>
			<select name="applClas">
			<c:forEach items="${applClasCode}" var="applClasCode" varStatus="status2">
				<option value="<c:out value="${applClasCode.code}"/>">
					<c:out value="${applClasCode.codeNm}"/>
				</option>
			</c:forEach>
			</select>
		  </div>
		  
		  <div class="col-md-3">
		    <label for="inputAddress" class="form-label">주민번호</label>
		    <input type="text" class="form-control" id="ssn" name="ssn">
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
		      <th scope="col">접수일자</th>
		      <th scope="col">접수일련번호</th>
		      <th scope="col">주민번호</th>
		      <th scope="col">성명(한글)</th>
		      <th scope="col">성명(영문)</th>
		      <th scope="col">신청구분</th>
		      <th scope="col">브랜드</th>	
		      <th scope="col">핸드폰번호</th>
		      <th scope="col">불능구분</th>
		      <th scope="col">불능사유명</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${list}" var="list">
		    <tr>
		      <td><c:out value="${list.rcvD}"></c:out></td>
		      <td><c:out value="${list.rcvSeqNo}"></c:out></td>
		      <td><c:out value="${list.ssn}"></c:out></td>
		      <td><c:out value="${list.hgNm}"></c:out></td>
		      <td><c:out value="${list.engNm}"></c:out></td>
		      <td><c:out value="${list.applClas}"></c:out></td>
		      <td><c:out value="${list.brd}"></c:out></td>
		      <td><c:out value="${list.hdpNo}"></c:out></td>
		      <td><c:out value="${list.impsbClas}"></c:out></td>
		      <td><c:out value="${list.impsbCd}"></c:out></td>
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