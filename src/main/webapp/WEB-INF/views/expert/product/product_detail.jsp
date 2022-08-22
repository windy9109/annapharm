<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="productDetailList" value="${productDetailList }" />
<head>
<style type="text/css">
input[type="date"],[type="text"] {
	font-size: 12px !important;
	
}

.table th, .table td{
	font-size: 12px;
	padding:4px;
}
.form-control.tableInput{
	height: 24px;width: 50px;font-size: 12px;padding: 5px;
}
.form-control:disabled {
	background: white;
	border-color: white;
}
table {
	table-layout: fixed;
}
</style>


</head>

<title>의약품 상세정보</title>

<body>
	<div class="content-wrapper m-0">
		<div class="row m-0">
			<div class="card card-primary" style="width:700px; height:379px; margin:10px;"> 
				<div class="card-header text-center">
					<p style="margin:0px;"><strong>적정재고 및 약위치 설정</strong></p>
				</div>
				
				<div class="card-body">
					<div class="row m-0">
						<table class="table table-bordered">
							<thead>
								<tr style="background-color:#E8F5FF;"> 
									<th class="text-center" style="width:83px">약코드</th>
									<th class="text-center" style="width:63px">분류코드</th>
									<th class="text-center" style="width:197px">약명</th>
									<th class="text-center" style="width:50px">재고수</th>
									<th class="text-center" style="width:62px">적정재고</th>
									<th class="text-center" style="width:121px">유통기한</th>
									<th class="text-center" style="width:50px">약위치</th> 
								</tr> 
							</thead>
							<tbody id="productDetailList">
							<c:forEach items="${productDetailList}" var="productDetail">
								<input type="hidden" class="detailQr" value="${productDetail.productQr }" />
								<tr>
									<td class="detailMdNo" id="${productDetail.mdNo}">${productDetail.mdNo}</td>
									<td>${productDetail.miType}</td>
									<td>${productDetail.mdName}</td>
									<td>${productDetail.productOwnnum}</td>
									<td style="text-align:center;">
									<input type="text" class="detailOwnnumStandard" disabled="disabled" onchange="modifymark(this);" style="width:35px;" value="${productDetail.productOwnnumStandard}">
									</td> 
									<td style="text-align:center;">
										<input type="date" class="detailDate" disabled="disabled" onchange="modifymark(this);" style="width:100px;" value="<fmt:formatDate value="${productDetail.productDate}" pattern="yyyy-MM-dd"/>">
									</td>
									<td style="text-align:center;"> 
										<input type="text" class="detailPosition" disabled="disabled" onchange="modifymark(this);" style="width:40px;" value="${productDetail.productPosition}">
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div> 
					
					<div class="card-footer text-center" style="float: right;">
						<button class="btn btn-primary" id="detailModify" style="font-size: 12px !important; font-weight: bold;" onclick="detailModify();">수정</button>
						<button class="btn btn-primary" id="detailSave" style="font-size: 12px !important; font-weight: bold;" onclick="detailSave();">저장</button>
						<button class="btn btn-danger" id="detailCancel" style="font-size: 12px !important; font-weight: bold;" onclick="detailClose();">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<div>
			<input type="hidden" id="sessionChemistCode" value="${loginUser.chemistCode }">
			<input type="hidden" id="sessionChemistName" value="${loginUser.memName }">
			<input type="hidden" id="sessionPharmacyCode" value="${loginUser.pharmacyCode }">
			<input type="hidden" id="sessionPharmacyName" value="${loginUser.pharmacyName }">
		</div>
	</div>
	<%@include file="./product_js.jsp" %>
	<script>
// 	function detailSave(){
// 		$("form[role='form']").submit();
// 	}
	</script>
</body>