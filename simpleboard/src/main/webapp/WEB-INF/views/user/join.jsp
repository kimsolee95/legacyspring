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

<!-- <script type="text/javascript" src="/resources/js/jquery-3.6.0.min.js"> -->
<script>
	/*
	$("#userIdCheck").click(function() {
		let userId = $('#userId').val();
		
		$.ajax({
			url: "user/validateId",
			type: "post",
			data: {userId: userId},
			dataType: 'json',
			seccess: function(data) {
				
				if (data.cnt > 0) {
					alert("중복된 ID로 사용 불가합니다.");
					//$("#checkId").html('중복된 ID로 사용 불가합니다.');
					//$("#checkId").attr('color', 'red');
				} else {
					alert("사용 가능항 ID입니다.");
					//$("#checkId").html('사용 가능한 ID입니다.');
					//$("#checkId").attr('color', 'green');
				}
				
			},
			
			error: function() {
				alert("ajax 통신 실패");
			}
			
		})
	})
	*/

$(function() {
    //idck 버튼을 클릭했을 때 
    $("#userIdCheck").click(function() {
        
        //userid 를 param.
        var userId =  $("#userId").val(); 
        
        $.ajax({
            //async: true,
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
                }
            },
            error : function(error) {
                
                alert("error : " + error);
            }
        });
    });
});	
</script>
