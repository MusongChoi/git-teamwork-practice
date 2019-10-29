<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ include file="/WEB-INF/jspf/head.jspf"%>

 
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="org.springframework.ui.Model" %>


<head>
	<style type="text/css">
		
		input::placeholder{
			font-style: italic;
			font-size: 11px;
			font-weight: 500;
		}
		html>body {
			width: 100%;
		}
		
	</style>

</head>

<!-- body -->

<div style="position: absolute; left: 0px; top: 0px;">
	<img src="/building.jpg" width="1540" height="420">
</div>

<div style="position: relative; left: 480px; top: 260px; width: 600px; height: 70px; border: 3px solid gray; text-align: center; display: table-cell; vertical-align: middle; background-color:white" >
	<form method="get" action="">
		<label for="Search">자기소개서 검색&nbsp;&nbsp;&nbsp;</label>
		<input type="text" name="searchText" id="Search" placeholder=" 검색어를 입력해주세요 .">&nbsp;&nbsp;
		<button type="submit" class="btn btn-primary resume-submit">검색</button>
	</form>
</div>
<br>
<br>
<div style="position: absolute; left: 550px; top: 440px;">
	<table border="2" width="450" height="10" style="table-layout:fixed">
		<colgroup>
			<col width="50px" />
			<col width="60px" />
			<col width="100px" />
		</colgroup>
		<tr align="center" bgcolor="yellow" height="10">
			<th>기업명</th><th>직무</th><th>스펙</th>
		</tr>
		<c:set var="bg" value = "${5*(nowPage-1)}"/>
		<c:set var="st" value = "4"/>
		<%-- <c:set var="rs" value = "0"/>
		<c:set var="searchData" value = "0"/> --%> 
		<c:forEach var="item" begin="${bg}" end="${bg + st}" items="${searchLists}" step="1" varStatus="status">
		<c:choose>
		<c:when test="${fn:contains(item.companyName,param.searchText) or fn:contains(item.jobName,param.searchText) or fn:contains(item.spec,param.searchText) or param.searchText==null or fn:trim(param.searchText)==''}">
			<tr align="center">
				<td>${item.companyName}</td><td>${item.jobName}</td><td>${item.spec}</td>
			</tr>
		</c:when>
		<c:otherwise>
		
		<%-- rs : ${rs} // 여기 구간에서 반복 횟수 늘릴 것 --%>
		
		</c:otherwise>
		</c:choose>
	</c:forEach>
	</table>
	
        <c:if test="${ nowPage > 5 }">
            <a href="${ startBlock - 1 }?searchText=${ param.searchText }">◀</a>
        </c:if>
        
        <c:forEach var="i" begin="${ startBlock }" end="${ lastBlock }">
        	<c:if test = "${ lastPage >= i }">
	        	<a href="${ i }?searchText=${ param.searchText }">${ i }</a>
    	    </c:if>
        </c:forEach>
        
        <c:if test="${ lastPage > lastBlock }">
            <a href="${ lastPage }?searchText=${ param.searchText }">▶</a>
        </c:if>
    
</div>

<%-- 시작 블록 : ${requestScope.startBlock}<br> 
현재 페이지 : ${requestScope.nowPage}<br>
마지막 페이지 : ${requestScope.lastPage}<br>
마지막 블록 : ${requestScope.lastBlock}<br>
총 자료 수 : ${requestScope.total}<br> --%>

<%@ include file="/WEB-INF/jspf/footer.jspf"%>
