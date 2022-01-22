<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../includes/header.jsp" %>

	<div class="container">
	<table class="table">
	  <thead>
	    <tr>
	      <th scope="col">번호</th>
	      <th scope="col">제목</th>
	      <th scope="col">작성자</th>
	      <th scope="col">작성일</th>
	      <th scope="col">수정일</th>
	    </tr>
	  </thead>
	  
	  <c:forEach items="${list}" var="board">
	  	<tr>
	  		<td><c:out value="${board.bno}"></c:out></td>
	  		<td><c:out value="${board.title}"></c:out></td>
	  		<td><c:out value="${board.writer}"></c:out></td>
	  		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
	  		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}" /></td>
	  	</tr>
	  </c:forEach>
	  </table>
	  </div>

