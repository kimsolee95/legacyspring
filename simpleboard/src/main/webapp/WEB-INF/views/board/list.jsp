<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../includes/header.jsp" %>

	<div class="container">
	<div>
		Total: ${total}
	</div>
	<table class="table">
	  <thead>
	    <tr>
	      <th scope="col">게시글타입</th>
	      <th scope="col">게시글 번호</th>
	      <th scope="col">게시글 제목</th>
	    </tr>
	  </thead>
	  
	  <c:forEach items="${list}" var="board">
	  	<tr>
	  		<td><c:out value="${board.codeName}"></c:out></td>
	  		<td><c:out value="${board.boardNum}"></c:out></td>
	  		<td><a href='/board/posts?boardNum=<c:out value="${board.boardNum}"/>'><c:out value="${board.boardTitle}"></c:out></a></td>
	  	</tr>
	  </c:forEach>
	  </table>
	  	<div>
		<c:if test="${not empty userId}">
		  <div>
		  <a href='/board/createposts'>글쓰기</a>
		  </div>
		</c:if>
		
		<c:if test="${not empty userId}">
		  <div>
		  <a href='/user/logout'>로그아웃</a>
		  </div>
		</c:if>
	  	</div>
	  	
	  	<div> <!-- 검색 부분 -->
	  		<form action="/board/list" method="get">
	  			<input type="radio" name="searchCode" value="ALL">전체
	  			<input type="radio" name="searchCode" value="a01">일반
	  			<input type="radio" name="searchCode" value="a02">QA
	  			<input type="radio" name="searchCode" value="a03">익명
	  			<input type="radio" name="searchCode" value="a04">자유
	  			<button type="submit" value="전송" class="btn btn-default">검색</button>
	  		</form>
	  	</div>
	  </div>