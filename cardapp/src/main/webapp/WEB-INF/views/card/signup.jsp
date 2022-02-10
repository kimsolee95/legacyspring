<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../includes/header.jsp" %>

<div class="container">
	<div class="card-signup-form">
		
		
		
		<form class="row g-3" id="operForm"> <!-- operForm  action="/card/recentrcvappl" method="get" -->
		  <div class="col-md-4">
		    <label for="inputEmail4" class="form-label">주민번호</label>
		    <input type="text" class="form-control" id="ssn" name="ssn">
		  </div>
		  <div class="col-md-3">
		    <label for="inputPassword4" class="form-label">접수일자</label>
		    <input type="text" class="form-control" id="rcvD" name="rcvD">
		  </div>
		  <div class="col-md-3">
		    <label for="inputAddress" class="form-label">접수 일련번호</label>
		    <input type="text" class="form-control" id="rcvSeqNo" name="rcvSeqNo">
		  </div>
		  <div class="col-md-2">
			<!--<button data-oper='search' class="btn btn-info">검색</button> -->
			<button type="submit" formaction="/card/recentrcvappl" formmethod="get" class="btn btn-info">검색</button>
		  </div>
		<!-- 
		</form>


		<form class="row g-3" role="form" id="frm" name="frm" action="/card/signup" method="post">
		-->
		  <div class="col-md-4">
		    <label for="inputEmail4" class="form-label">신청일자</label>
		    <input type="text" class="form-control" id="applD" name="applD">
		  </div>
		  <div class="col-md-4">
		    <label for="inputPassword4" class="form-label">신청구분</label>
			<select name="applClas">
			<c:forEach items="${applClasCode}" var="applClasCode" varStatus="status2">
				<option value="<c:out value="${applClasCode.code}"/>">
					<c:out value="${applClasCode.codeNm}"/>
				</option>
			</c:forEach>
			</select>
		  </div>
		  <div class="col-md-4">
		    <label for="inputAddress" class="form-label">브랜드</label>
		    
			<select name="brd">
			<c:forEach items="${brdCode}" var="brdCode" varStatus="status2">
				<option value="<c:out value="${brdCode.code}"/>">
					<c:out value="${brdCode.codeNm}"/>
				</option>
			</c:forEach>
			</select>
			
		  </div>


		  
		  <div class="col-md-4">
		    <label for="inputEmail4" class="form-label">성명(한글)</label>
		    <input type="text" class="form-control" id="hgNm" name="hgNm">
		  </div>
		  <div class="col-md-4">
		    <label for="inputPassword4" class="form-label">성명(영문)</label>
		    <input type="text" class="form-control" id="engNm" name="engNm">
		  </div>
		  <div class="col-md-4">
		    <label for="inputAddress" class="form-label">생년월일</label>
		    <input type="text" class="form-control" id="birthD" name="birthD" placeholder="1234 Main St">
		  </div>



		  <div class="col-md-4">
		    <label for="inputEmail4" class="form-label">결제일자</label>

			<select name=stlDd>
			<c:forEach items="${stlDdCode}" var="stlDdCode" varStatus="status2">
				<option value="<c:out value="${stlDdCode.code}"/>">
					<c:out value="${stlDdCode.codeNm}"/>
				</option>
			</c:forEach>
			</select>
		    
		  </div>
		  <div class="col-md-4">
		    <label for="inputPassword4" class="form-label">결제방법</label>
		    
			<select name="stlMtd">
			<c:forEach items="${stlMtdCode}" var="stlMtdCode" varStatus="status2">
				<option value="<c:out value="${stlMtdCode.code}"/>">
					<c:out value="${stlMtdCode.codeNm}"/>
				</option>
			</c:forEach>
			</select>
		    
		  </div>
		  <div class="col-md-4">
		    <label for="inputAddress" class="form-label">결제은행</label>
		    
			<select name="bnkCd">
			<c:forEach items="${bnkCdCode}" var="bnkCdCode" varStatus="status2">
				<option value="<c:out value="${bnkCdCode.code}"/>">
					<c:out value="${bnkCdCode.codeNm}"/>
				</option>
			</c:forEach>
			</select>
		    
		  </div>



			<div class="row col-md-6">
		    	<label for="inputAddress" class="form-label">결제계좌</label>
		    	<input type="text" class="form-control" id="stlAct" name="stlAct" placeholder="1234 Main St">
			</div>
			<div class="row col-md-6">
		    	<label for="inputAddress" class="form-label">결제계좌 확인여부</label>
		    	<input type="text" class="form-control" placeholder="1234 Main St">
			</div>


			
			<div class="row col-md-5">
		    	<label for="inputAddress" class="form-label">청구서 발송방법</label>
			
				<select name="stmtSndMtd">
				<c:forEach items="${stmtSndMtdCode}" var="stmtSndMtdCode" varStatus="status2">
					<option value="<c:out value="${stmtSndMtdCode.code}"/>">
						<c:out value="${stmtSndMtdCode.codeNm}"/>
					</option>
				</c:forEach>
				</select>
			
			</div>
			<div class="row col-md-6">
		    	<label for="inputAddress" class="form-label">우편번호</label>
		    	<input type="text" class="form-control" id="billadrZip" name="billadrZip" placeholder="1234 Main St">
			</div>	
			

			
			<div class="row col-md-12">
		    	<label for="inputAddress" class="form-label">??상세주소</label>
		    	<input type="text" class="form-control" id="billadrAdr2" name="billadrAdr2" placeholder="1234 Main St">
			</div>
			

		  
		  <div class="col-md-6">
		    <label for="inputCity" class="form-label">이메일</label>
		    <input type="text" class="form-control" id="emailAdr" name="emailAdr">
		  </div>
		  <div class="col-md-4">
		    <label for="inputState" class="form-label">핸드폰번호</label>
		    <input type="text" class="form-control" id="hdpNo" name="hdpNo">
		  </div>
		  <div class="col-md-2">
		    <label for="inputZip" class="form-label">비밀번호</label>
		    <input type="text" class="form-control" id="scrtNo" name="scrtNo">
		  </div>


		  
			<div class="col-md-3">
		    	<label for="inputAddress" class="form-label">불능 구분</label>
		    	<input type="text" class="form-control" placeholder="1234 Main St">
			</div>
			<div class="col-md-7">
		    	<label for="inputAddress" class="form-label">불능 사유명</label>
		    	<input type="text" class="form-control" placeholder="1234 Main St">
			</div>	

		  <div class="buttons">
		  <!-- data-oper='insert'  -->
		    <button type="submit" formaction="/card/signup" formmethod="post"  class="btn btn-primary">등록</button>
		    <button type="button" class="btn btn-primary">수정</button>
		    <button type="button" class="btn btn-primary">초기화</button>
		  </div>
		</form>
	</div>
</div>

<script>
/* 
$(document).ready(function() {
	
	var operForm = $("#operForm");
	
	$("button[data-oper='insert']").on("click", function(e) { //등록 버튼 클릭 이벤트 발생시,
		operForm.attr("action", "/card/signup").attr.("method", "get");
		operForm.submit();
	});
	
	$("button[data-oper='search']").on("click", function(e) { //검색 버튼 클릭 이벤트 발생시,
		operForm.attr("action", "/card/recentrcvappl");
		operForm.submit();
	})
	
});
 */
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