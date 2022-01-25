<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../includes/header.jsp" %>

	<div class="container">
		<table class="table table-bordered">
			<tr>
				<th scope="col">Type</th>
				<td scope="col"><c:out value="${posts.boardType}"></c:out></th>
			</tr>
			<tr>
				<th scope="col">Comment</th>
				<td scope="col"><c:out value="${posts.boardComment}"></c:out></th>
			</tr>
			<tr>
				<th scope="col">Writer</th>
				<td scope="col"><c:out value="${posts.creator}"></c:out></th>
			</tr>			
		</table>
		<div>
			<h3><a href='/board/updateposts?boardNum=<c:out value="${posts.boardNum}"/>'>수정</a></h3>
		</div>
	</div>