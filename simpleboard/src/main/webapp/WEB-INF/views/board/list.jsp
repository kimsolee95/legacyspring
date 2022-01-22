<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../includes/header.jsp" %>

	<div class="container">
	<table class="table">
	  <thead>
	    <tr>
	      <th scope="col">게시글타입</th>
	      <th scope="col">게시글 번호</th>
	      <th scope="col">게시글 제목</th>
	      <th scope="col">게시글 내용</th>
	      <th scope="col">생성자</th>
	      <th scope="col">생성시간</th>
	      <th scope="col">수정자</th>
	      <th scope="col">수정시간</th>
	      <th scope="col">파일여부?..</th>	
	    </tr>
	  </thead>
	  
	  <c:forEach items="${list}" var="board">
	  	<tr>
	  		<td><c:out value="${board.boardType}"></c:out></td>
	  		<td><c:out value="${board.boardNum}"></c:out></td>
	  		<td><c:out value="${board.boardTitle}"></c:out></td>
	  		<td><c:out value="${board.boardComment}"></c:out></td>
	  		<td><c:out value="${board.creator}"></c:out></td>
	  		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.createTime}" /></td>
	  		<td><c:out value="${board.modifier}"></c:out></td>
	  		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.modifiredTime}" /></td>
	  		<td>이모티콘?</td>	  		
	  	</tr>
	  </c:forEach>
	  </table>
	  </div>

