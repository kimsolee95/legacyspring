<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../includes/header.jsp" %>

<div class="container">
	<div class="card-signup-form">
		
		
		
		<form class="row g-3" id="operForm">
		  <div class="row col-md-12">
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
			<button type="submit" formaction="/card/recentrcvappl" formmethod="get" class="btn btn-info">검색</button>
		  </div>
		  </div>

		  <div class="col-md-4">
		    <label for="inputEmail4" class="form-label">신청일자</label>
		    <input type="text" class="form-control" id="applD" name="applD">
		  </div>
		  <div class="col-md-4">
		    <label for="inputPassword4" class="form-label">신청구분</label>
			<select class="form-select" name="applClas"> <!-- select box ui 개선 필요함 -->
			<c:forEach items="${applClasCode}" var="applClasCode" varStatus="status2">
				<option value="<c:out value="${applClasCode.code}"/>">
					<c:out value="${applClasCode.codeNm}"/>
				</option>
			</c:forEach>
			</select>
		  </div>
		  <div class="col-md-4">
		    <label for="inputAddress" class="form-label">브랜드</label>
		    
			<select name="brd" class="form-select">
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
		    <input type="text" class="form-control" id="birthD" name="birthD" placeholder="ex) 19720304">
		  </div>



		  <div class="col-md-4">
		    <label for="inputEmail4" class="form-label">결제일자</label>

			<select class="form-select" name=stlDd>
			<c:forEach items="${stlDdCode}" var="stlDdCode" varStatus="status2">
				<option value="<c:out value="${stlDdCode.code}"/>">
					<c:out value="${stlDdCode.codeNm}"/>
				</option>
			</c:forEach>
			</select>
		    
		  </div>
		  <div class="col-md-4">
		    <label for="inputPassword4" class="form-label">결제방법</label>
		    
			<select class="form-select" name="stlMtd">
			<c:forEach items="${stlMtdCode}" var="stlMtdCode" varStatus="status2">
				<option value="<c:out value="${stlMtdCode.code}"/>">
					<c:out value="${stlMtdCode.codeNm}"/>
				</option>
			</c:forEach>
			</select>
		    
		  </div>
		  <div class="col-md-4">
		    <label for="inputAddress" class="form-label">결제은행</label>
		    
			<select class="form-select" name="bnkCd">
			<c:forEach items="${bnkCdCode}" var="bnkCdCode" varStatus="status2">
				<option value="<c:out value="${bnkCdCode.code}"/>">
					<c:out value="${bnkCdCode.codeNm}"/>
				</option>
			</c:forEach>
			</select>
		    
		  </div>


			<div class="row col-md-12">
			<div class="col-md-6">
		    	<label for="inputAddress" class="form-label">결제계좌</label>
		    	<input type="text" class="form-control" id="stlAct" name="stlAct" placeholder="ex) 1002250716302">
			</div>
			<div class="col-md-6">
		    	<label for="inputAddress" class="form-label">결제계좌 확인여부</label>
		    	<input type="text" class="form-control" disabled>
			</div>
			</div>


			<div class="row col-md-12">
			<div class="col-md-5">
		    	<label for="inputAddress" class="form-label">청구서 발송방법</label>
			
				<select class="form-select" name="stmtSndMtd">
				<c:forEach items="${stmtSndMtdCode}" var="stmtSndMtdCode" varStatus="status2">
					<option value="<c:out value="${stmtSndMtdCode.code}"/>">
						<c:out value="${stmtSndMtdCode.codeNm}"/>
					</option>
				</c:forEach>
				</select>
			
			</div>
			<div class="col-md-6">
		    	<label for="inputAddress" class="form-label">우편번호</label>
		    	<input type="text" class="form-control" id="billadrZip" name="billadrZip">
			</div>
			</div>
			

			
			<div class="row col-md-12">
				<div class="col-md-11">
		    	<label for="inputAddress" class="form-label">상세주소</label>
		    	<input type="text" class="form-control" id="billadrAdr2" name="billadrAdr2">
				</div>
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
		    	<input type="text" class="form-control" disabled>
			</div>
			<div class="col-md-7">
		    	<label for="inputAddress" class="form-label">불능 사유명</label>
		    	<input type="text" class="form-control" disabled>
			</div>	

		  <div class="buttons">
		    <button type="submit" formaction="/card/signup" formmethod="post"  class="btn btn-primary">등록</button>
		    <button type="button" class="btn btn-primary">수정</button>
		    <button type="button" class="btn btn-primary">초기화</button>
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
		background-color: #EEE;
		box-shadow: 2px 2px 2px 2px #999;
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
	
	.form-select {
		padding: 5px;
		margin-top: 20px;
		border: 3px solid #DDD;
		border-radius: 5px;
	}
</style>