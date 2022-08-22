<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="pharmacyList" value="${dataMap.pharmacyList }" />

<html>
<head>
<meta charset="UTF-8">
<title>약국찾기</title>
<style>
#divHover:hover{
	background: #dee2e6 !important;
}
</style>
</head>
<body style="font-size: 14px !important;">

		<div class="form-group" style="width: 100%;">
			<div class="input-group input-group-lg">
				<input type="search" class="form-control form-control-lg" name="keyword" placeholder="근무약국을 검색해주세요" value="${param.keyword }" onkeypress="enterkey()">
				<div class="input-group-append">
					<button type="submit" class="btn btn-lg btn-default" onclick="list_go(1)">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
		</div>


	<c:if test="${empty pharmacyList }">

		<div style="padding: 40px 20px; background-color: white; width: 100%;">
			<strong>tip</strong><br> 아래와 같은 조합으로 검색을 하시면 더욱 정확한 결과가 검색됩니다.<br> <br> 약국명 + 주소<br> <br> 예) 새봄약국, 대전<br> 약국명 + 시<br> <br> 예) 새봄약국, 오류동<br> 약국명 + 동<br> <br> 예) 새봄약국, 대전 오류동<br> 약국명 + 시 + 동<br>
		</div>
	</c:if>
	<c:forEach items="${pharmacyList }" var="pharmacy">

		<div style="padding: 20px; padding-bottom: 0px; background-color: white;" id="divHover" class="${pharmacy.piDutyname }" onclick="pharmacyRegist('${pharmacy.piHpid }',this)">
			<strong >${pharmacy.piDutyname }</strong><br> <span >${pharmacy.piDutyaddr }</span>
			<hr>
		</div>


	</c:forEach>

	<div class="card-footer clearfix">
		<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
	</div>

<%@ include file="/WEB-INF/views/common/signUp_js.jsp"%>


</body>
</html>