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
		<!-- 
		<div>
			<a href='/board/updateposts?boardNum=<c:out value="${posts.boardNum}"/>'>
				<button type="button" class="btn btn-primary">수정</button>
			</a>
			<a href='/board/list'>
				<button type="button" class="btn btn-primary">목록</button>
			</a>
		</div>
		 -->
		 
		 <div>
		 	<button data-oper='modify' class="btn btn-primary">수정</button>
		 	<button data-oper='list' class="btn btn-primary">목록</button>
		 </div>
		 
		 <form id='operForm' action="/board/updateposts" method="get">
		 	<input type='hidden' id='boardNum' name='boardNum' value='<c:out value="${posts.boardNum}" />'>
		 </form>
		 
	</div>
	
	
<script type="text/javascript">

$(document).ready(function() {
	
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e) {
		operForm.attr("action", "/board/updateposts").submit();
	});
	
	$("button[data-oper='list']").on("click", function(e) {
		
		operForm.find("#boardNum").remove();
		operForm.attr("action", "/board/list");
		operForm.submit();
	})
	
});

</script>