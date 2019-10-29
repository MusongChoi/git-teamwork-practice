<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/WEB-INF/jspf/head.jspf"%>
<!-- body -->
<h2 style="margin-left:5px; margin-top:10px; margin-bottom:15px"><b>글 쓰기</b></h2>
<form method="post" action="/boardSJS/writeSJS">
	<div style="margin-left:10px">
	<label style="margin-right:48px">제목</label>
	<input type="text" name="title" placeholder="제목를 입력해주세요"><br>
	<label>유저아이디</label>
	<input type="text" name="userId" ><br>
	</div>
	<div style="margin-left:10px">
	<label>내용</label><br>
	<textarea name="text" class="form-control" rows="9" style="width:80%; margin-left:20px"></textarea><br>
	</div>
	<p align="right">
	<button  type="submit" class="btn btn-primary resume-submit" style="margin-right:285px" >저장하기</button>
	</p>
</form>

<%@ include file="/WEB-INF/jspf/footer.jspf"%>