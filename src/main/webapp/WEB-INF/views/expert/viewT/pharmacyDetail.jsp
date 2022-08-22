<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:set var="pid" value="${pharmacyInfoDetail}" />
<c:set var="pharmacyProductInfo" value="${pharmacyProductInfo}" />

<head>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>

<style type="text/css">
.pb7{
	padding-bottom: 7px;
}
.pb9{
	padding-bottom: 9px;
}
li{
	list-style: disc;
}
ul{
	margin-bottom: 7px;
}

</style>
</head>

<title></title>

<body>
	<div class="content-wrapper">
		<div class="row m-0">
			<div class="card card-primary card-outline mx-auto" style="height: 789px; width: 411px;">
				<div class="card-header">
					<div class="form-inline justify-content-between">
						<div class="form-inline">
							<i class="fas fa-capsules icon-size"></i>
							<h3 class="card-title">약국 상세정보</h3>
						</div>
					</div>
				</div>

				<div class="card-body" style="padding: 10px; font-size: 15px;">
					<div class="info">
						<div class="info-tel pb7">
							<strong style="margin-right: 1px;">대표전화</strong> : 042-222-6007
						</div>
						<div class="info-addr-new pb7">
							<strong>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</strong> : 대전광역시 중구 동서대로 1403, (목동)
						</div>
						<div class="container" style="padding-left: 2px;">
							<div class="form-inline justify-content-between pb9">
								<ul style="list-style-type: disc;">
									<li class="float-left ml-3">월요일 ${fn:substring(pid.piDutytime1s,0,2)}:${fn:substring(pid.piDutytime1s,2,4)}~${fn:substring(pid.piDutytime1c,0,2)}:${fn:substring(pid.piDutytime1c,2,4)}</li>
									<li class="float-left ml-5">화요일 ${fn:substring(pid.piDutytime2s,0,2)}:${fn:substring(pid.piDutytime2s,2,4)}~${fn:substring(pid.piDutytime2c,0,2)}:${fn:substring(pid.piDutytime2c,2,4)}</li>
								</ul>
								<ul style="list-style-type: disc;">
									<li class="float-left ml-3">수요일 ${fn:substring(pid.piDutytime3s,0,2)}:${fn:substring(pid.piDutytime3s,2,4)}~${fn:substring(pid.piDutytime3c,0,2)}:${fn:substring(pid.piDutytime3c,2,4)}</li>
									<li class="float-left ml-5">목요일 ${fn:substring(pid.piDutytime4s,0,2)}:${fn:substring(pid.piDutytime4s,2,4)}~${fn:substring(pid.piDutytime4c,0,2)}:${fn:substring(pid.piDutytime4c,2,4)}</li>
								</ul>
								<ul style="list-style-type: disc;">
									<li class="float-left ml-3">금요일 ${fn:substring(pid.piDutytime5s,0,2)}:${fn:substring(pid.piDutytime5s,2,4)}~${fn:substring(pid.piDutytime5c,0,2)}:${fn:substring(pid.piDutytime5c,2,4)}</li>
									<li class="float-left ml-5">토요일 ${fn:substring(pid.piDutytime6s,0,2)}:${fn:substring(pid.piDutytime6s,2,4)}~${fn:substring(pid.piDutytime6c,0,2)}:${fn:substring(pid.piDutytime6c,2,4)}</li>
								</ul>
							</div>
						
						</div>
						
						<table class="table table-hover table-bordered"
							style="border-top: 1px solid #dee2e6;">
							<colgroup>
								<col width="45%" />
								<col width="16%" />
							</colgroup>
							<thead class="text-center">
								<tr style="background-color: #E8F5FF;">
									<th>약명</th>
									<th>재고수</th>
								</tr>
							</thead>
							<tbody id="searchMedicineList" class="text-left">
							<c:forEach var="productInfo" items="${pharmacyProductInfo}">
								<tr>
									<td>${productInfo.mdName}</td>
									<td>${productInfo.productOwnnum}</td>
								</tr>							
							</c:forEach>
							</tbody>
						</table>

						
					</div>

				</div>

			</div>
		</div>

	</div>


</body>