<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="/WEB-INF/jspf/head.jspf"%>
<!-- body -->
<div>

	<div>
	<table>
	<tr>
	<td width="80%">${board.title}</td>
	<td width="20%"> ${board.editDate}</td>
	</tr>
	</table>
	<hr>
	</div>
	
	<div style="height:600px">
	<p class="font-weight-bold">${board.userId}</p>
	${board.text}
	</div>
	
	<div>
	<p align="right">
	<a class="btn btn-primary" href="/boardSJS/communitySJS" role="button">목록</a>
	</p>
	</div>
	
</div>
<%@ include file="/WEB-INF/jspf/footer.jspf"%>	