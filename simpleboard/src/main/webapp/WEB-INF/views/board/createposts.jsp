<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp" %>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">글 작성</h1>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="pannel-heading">글 작성</div>
				
				<div class="pannel-body">
					
					<form role="form" action="/board/createposts" method="post">
						<div class="form-group">
							<label>글타입</label> <input class="form-control" name='boardType'>
						</div>					
						<div class="form-group">
							<label>제목</label> <input class="form-control" name='boardTitle'>
						</div>
						<div class="form-group">
							<label>내용</label> <input class="form-control" name='boardComment'>
						</div>
						<!-- 첨부파일란 todo-->
						<button type="submit" class="btn btn-default">등록</button>
						<button type="reset" class="btn btn-default">취소</button>
					</form>
				</div>
			</div>
		</div>
	</div>