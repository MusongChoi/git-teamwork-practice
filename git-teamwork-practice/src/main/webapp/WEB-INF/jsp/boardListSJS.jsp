<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/WEB-INF/jspf/head.jspf"%>
<!-- body -->

<h2 style="padding-left:40px; margin-top:10px; margin-bottom:15px"><b>글목록</b></h2>
<table class="table table-hover table-bordered" style="margin:10px">
  <thead>
    <tr>
      <th scope="col" width="10%">번호</th>
      <th scope="col" width="50%">제목</th>
      <th scope="col" width="25%">작성자</th>
      <th scope="col" width="25%">편집일</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="item" items="${boards}">
    <tr>
      <th scope="row">${item.id}</th>
      <td><a href="/boardSJS/contentSJS/${item.id}">${item.title}</a></td>
      <td>${item.userId}</td>
      <td>${item.editDate}</td>
    </tr>
    </c:forEach>
  </tbody>
</table>

    <div align="right">
    <a class="btn btn-primary" href="/boardSJS/writeSJS" role="button" style="margin:10px">글쓰기</a>
    </div>
    
	<div align="center">
    <label for="exampleFormControlSelect1" style="margin:10px; margin-right:20px">분류 : </label>
    <select id="exampleFormControlSelect1" style="margin-right:20px">
      <option>제목</option>
      <option>작성자</option>
      <option>내용</option>
      <option>작성자 + 내용</option>
      <option>제목 + 내용</option>
      <option>모두</option>
    </select>
    <input type="text" placeholder="검색어를 입력해주세요" id="findtext" style="margin:10px">
    <button class="btn btn-primary" type="submit" style="margin:10px; margin-right:20px">검색</button>
	</div>




<%@ include file="/WEB-INF/jspf/footer.jspf"%>	