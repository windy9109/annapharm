<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pageMaker" value="${product.pageMaker }" />
<c:set var="cri" value="${product.pageMaker.cri }" />
<c:set var="productList" value="${product.productList }" />
<c:set var="classficationList" value="${productClass.classficationList}" />
<head>
<style>
input[type="date"] {
	width: 130px;
	height: 22px;
}

input{
	border : 1px solid #ced4da;
}
table {
	table-layout: fixed;
}

td {
	  vertical-align: middle;
	  padding: 5px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.table td, .table th {
	padding: 5px;
	vertical-align: top;
	border-top: 1px solid #dee2e6;
}

.table td, .pagination {
	font-size: 12px;
}

.table th {
	font-size: 12px;
	text-align: center;
	padding-left: 0px;
	padding-right: 0px;
}

.btn-block+.btn-block {
	margin-top: 0px;
}

.btn {
	width: 110px;
}

.btn-lg {
	font-size: 16px;
}
/* .card-body11{ */
/* 	padding:0px; */
/* } */
.card-body.p-0 .table tbody>tr>td:first-of-type, .card-body.p-0 .table tbody>tr>th:first-of-type,
	.card-body.p-0 .table tfoot>tr>td:first-of-type, .card-body.p-0 .table tfoot>tr>th:first-of-type,
	.card-body.p-0 .table thead>tr>td:first-of-type, .card-body.p-0 .table thead>tr>th:first-of-type
	{
	padding-left: 0;
}

.card-body.p-0 .table thead>tr>th:last-of-type {
	padding-right: 0;
}

.tableNum {
	text-align: center;
}

.pro_number {
	position: relative;
	top: -7px;
	right: 12px;
	padding: 0px;
	width: 11px;
	height: 11px;
	margin-right: -10px;
}

.pro_no {
	position: absolute;
}

.proListTr:hover {
	cursor: pointer;
/* 	background-color: red !important; */
	background: red;
}

.header-title {
	font-size: 17px;
	font-weight: bold;
}

select{
	border : 1px solid #ced4da;
}
.dataOption{
	width:100px;
}

</style>
</head>
<div class="card card-primary card-outline" style="margin-bottom: 0px;">
	<div class="card-header">
		<span class="card-title m-0 title"> 
			<i class="far fa-file-alt" style="font-size: 18px" aria-hidden="true"></i> 
			<span class="header-title">재고현황</span>
		</span>
	</div>
	<!-- /.card-header -->
	<div class="card-body" style="padding-top: 10px; padding-bottom: 10px;">
		<div class="row">
			<div class="col-sm-9">
				<div class="input-group input-group-lg" style="width: 340px;">
					<select name="searchType" id="searchType" style="height: 30px;">
						<option value="ALL">전체</option>
						<option value="ETC" ${cri.searchType eq "ETC" ? "selected":"" }>전문</option>
						<option value="OTC" ${cri.searchType eq "OTC" ? "selected":"" }>일반</option>
					</select>
					<input list="classification-code" name="searchType3" placeholder="분류코드" style="width: 92px; height: 30px; margin-left: 3px;" value="${cri.searchType3}">
					<datalist id="classification-code"">
						<c:forEach items="${classficationList }" var="classfication">
							<option class="dataOption" value="${classfication.classNo}">${classfication.className}</option> 
						</c:forEach>
					</datalist>
					<input type="search" class="form-control form-control-lg" name="keyword"
						placeholder="검색어를 입력해주세요" style="height: 30px; font-size: 16px; margin-left:3px; padding:5px;" value="${cri.keyword }">
					<div class="input-group-append" style="width:0px;">
						<button type="submit" class="btn btn-lg btn-default"
							style="height: 30px; font-size: 16px; padding: 0px 10px;" onclick="list_go(1,'ownList');">
							<i class="fa fa-search" aria-hidden="true"></i>
						</button>
					</div>
				</div>

			</div>
			<div class="col-sm-3">
				<button type="button" class="btn btn-block btn-primary btn-sm"
					style="font-weight: bold; float: right; height: 27px; font-size:14px;" onclick="lackProduct()">부족품신청</button>
			</div>
		</div>
	</div>

	<div class="card-body" style="padding: 0px; min-height: 766px;">
		<div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4">
			<div class="row" style="margin-right: 0px;">
				<div class="col-sm-12" style="padding-left: 8.5px; min-height:702px;">
					<table id="example2"
						class="table table-bordered table-hover dataTable dtr-inline"
						style="margin-bottom: 0px;">
						<thead>
							<tr style="background-color:#E8F5FF;">
								<th style="width: 33px;">No</th>
								<th style="width: 90px;">약코드</th>
								<th style="width: 38px;">구분</th>
								<th style="width: 40px;">분류</th>
								<th style="width: 161px;">약명</th>
								<th style="width: 33px;">수량</th>
								<th style="width: 44px;">단위</th>
								<th style="width: 50px;">적정재고</th>
								<th style="width: 80px;">유통기한</th>
								<th style="width: 40px;">약위치</th>
							</tr>
						</thead>
						<tbody class="proList">
							<c:if test="${empty productList }">
								<tr>
									<td colspan="10" style="text-align: center;">
									<strong>해당조건에 맞는 약품이 없습니다!</strong></td>
								</tr>
							</c:if>
							<c:forEach items="${productList }" var="product" varStatus="count">
								<tr class="proListTr"
									style="${product.warnMark eq 'Y'  ? 'background: skyblue;' : ''}"
									onclick="detailGo('${product.mdNo}');">
									<td style="text-align: right;">
											${count.count + ((cri.page - 1)  * 27)} <!-- 페이지가 넘어갈때 약 개수에 따라 번호 넘어가도록... -->
									</td>

									<td class="productNo">${product.mdNo }<c:if
											test="${product.distinctNum gt 1 }">
											<span class="badge badge-danger navbar-badge pro_number"
												style="margin-left: 10px;">${product.distinctNum }</span>
										</c:if>
									</td>
									<td class="productClass">${product.mdClass }</td>
									<td class="productType">${product.miType }</td>
									<td class="productName" data-toggle="tooltip" title="${product.mdName }">${product.mdName }</td>
									<td class="productNum"
										style="${product.productOwnnumStandard gt product.productOwnnum ? 'background: #dc3545; color:white;' : ''}">${product.productOwnnum }</td>
									<td class="productUnit" data-toggle="tooltip" title="${product.productUnit }">${product.productUnit }</td>
									<td class="productSnum" style="text-align: right;">${product.productOwnnumStandard }</td>
									<td class="productDate"
										style="${product.dateOver >= 0 ? 'background:#dc3545; color:white;' : ''}">
										<fmt:formatDate
											value="${product.distinctNum gt 1  ? '' : product.productDate }"
											pattern="yyyy.MM.dd" />
									</td>
									<td class="productPos">${product.productPosition }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="col-sm-12 col-md-7" style="height: 50px;">
			<div class="dataTables_paginate paging_simple_numbers"
				id="example2_paginate" style="margin-top: 14px;">
				<%@ include file="/WEB-INF/views/common/productPagination.jsp"%>
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
<%@include file="./product_js.jsp"%>