<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="vo" value="${vo}"/>
<c:set var="detail" value="${dataMap}"/>
<c:set var="key" value="${keyList }"/>

<head>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/common.js" ></script>

<style type="text/css">
p{
	font-size: 15px;
	margin-bottom: 5px;
}
</style>
</head>

<title></title>

<body>
	<div class="content-wrapper">
		<div class="row m-0">
			<h4 style="margin-top: 8px; margin-left: 8px; font-weight: bold;">의약품 상세정보</h4>
		</div>
		<div class="row m-0">
			<div class="card w-100 mb-0">
				<div class="card-header text-center">
					<h2><strong>${vo.mdName }</strong></h2>
				</div>
					
				<div class="card-body">
					<div class="row m-0">
						<h2>기본정보</h2>
						<table class="table">
							<tr>
								<th>제품명</th>
								<td>${vo.mdName }</td>
							</tr>
							<tr>
								<th>성상</th>
								<td>${vo.mdNature }</td>
							</tr>
							<tr>
								<th>업체명</th>
								<td>${company }</td>
							</tr>
							<tr>
								<th>전문/일반</th>
								<td>${vo.mdClass }</td>
							</tr>
							<tr>
								<th>품목기준코드</th>
								<td>${vo.mdNo }</td>
							</tr>
						</table>
					</div>
					
					<div>
						<h2>원료약품 및 분량</h2>
						<p>유효성분:${fn:replace(vo.mdComponent,'|','&#44;')}</p>
					</div>
					
					<div class="">
						<h2>효능효과</h2>
						<c:forEach items="${detail['effect'] }" var="effect">
							<p>${effect }</p>
						</c:forEach>
					</div>
					
					<div class="">
						<h2>용법용량<br/></h2>
						<c:forEach items="${detail['use'] }" var="use">
							<p>${use }</p>
						</c:forEach>
					</div>
					
					<div class="">
						<h2>사용상의주의사항</h2>
						<c:forEach items="${keyList }" var="key">
							<p class="font-weight-bold">${key}
								<a href="javascript:void(0);" onclick="Toggle(this);"><i class='fas fa-plus-circle'></i></a>
							</p>
							<div class="pl-3" style="display: none;">
								<c:forEach items="${detail[key]}" var="note">
									<p class="indent0 note">${note }</p>
								</c:forEach>
							</div>
						</c:forEach>
					</div>
					
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
function Toggle(tag) {
	var className = $(tag).children().attr("class");
	
	$(tag).parent().next().toggle();
	
	if(className == 'fas fa-plus-circle'){
		$(tag).children().removeClass("fas fa-plus-circle")
		$(tag).children().addClass("fas fa-minus-circle")
	} else {
		$(tag).children().removeClass("fas fa-minus-circle")
		$(tag).children().addClass("fas fa-plus-circle")
	}
}

</script>
</body>