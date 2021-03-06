<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp" %>

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="pannel-heading">글 수정</div>
				
				<div class="pannel-body">
					
					<form role="form" action="/board/updateposts" method="post">
						<div class="form-group">
							<label>글타입(공통)</label>
							<select name="boardType">
								<c:forEach items="${menuCode}" var="menuCode" varStatus="status2">
									<option value="<c:out value="${menuCode.codeId}"/>">
										<c:out value="${menuCode.codeName}"/>
									</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>제목</label> <input class="form-control" name='boardTitle' value="${posts.boardTitle}"> <!-- <c:out value="${posts.boardTitle}"/> -->
						</div>
						<div class="form-group">
							<label>내용</label> <input class="form-control" name='boardComment' value="${posts.boardComment}"> <!-- <c:out value="${posts.boardComment}"/> -->
						</div>
						<div>
						<input type="hidden" name="boardNum" value="<c:out value="${posts.boardNum}"/>">
			  			<!-- paging value -->
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.amount}">
						
						<button type="submit" class="btn btn-default">등록</button>
						<a href='/board/list'><button type="button" class="btn btn-primary">목록</button></a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>