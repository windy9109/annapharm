<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="medicineDetailTableList" value="${medicineDetailTableList}"/>

<head>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>

<style type="text/css">
p {
	font-size: 15px;
	margin-bottom: 5px;
}

.table td, .table th {
	padding: 5px;
	vertical-align: top;
	border-top: 1px solid #dee2e6;
	font-size: 12px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.table th {
	align-content: center;
}

.card-title{
	font-size: 17px;
	font-weight: bold;
}
.detailTitle{
	font-size: 20px;
	font-weight: bold;
	margin-top: 20px;
}
h2{
	margin-bottom: 0px;
}
</style>
</head>

<title></title>

<body>
	<div class="content-wrapper">
		<div class="row m-0">
			<div class="card card-primary card-outline" style="height: 197px;">
				<div class="card-header">
					<div class="form-inline justify-content-between">
						<div class="form-inline">
							<i class="fas fa-capsules icon-size"></i>
							<h3 class="card-title">의약품 비교</h3>
						</div>
 						<span style="font-weight: bold;">매입가 평균 : <span id="avgPrice"><fmt:formatNumber value="${avgPrice}" pattern="#,###"/> </span>원</span>
					</div>
				</div>

				<div class="card-body" style="padding: 10px;">
					<table class="table table-hover table-bordered"
						style="border-top: 1px solid #dee2e6;table-layout: fixed;">
						<colgroup>
							<col width="39%" />
							<col width="10%" />
							<col width="16%" />
							<col width="25%" />
							<col width="29%" />
							<col width="17%" />
							<col width="16%" />
							<col width="18%" />
						</colgroup>
						<thead class="text-center">
							<tr style="background-color: #E8F5FF;">
								<th>약명</th>
								<th>구분</th>
								<th>성상</th>
								<th>성분명</th>
								<th>제조사</th>
								<th>금액(원)</th>
								<th>분류명</th>
								<th>함량/단위</th>
							</tr>
						</thead>
						<tbody id="searchMedicineList" class="text-left">
						<c:forEach items="${medicineDetailTableList }" var="medicineDetailTable">
							<tr data-detailMdNo="${medicineDetailTable.mdNo}" onclick="getDetail('<%=request.getContextPath()%>/medicinedetail/',${medicineDetailTable.mdNo})">
								<td>${medicineDetailTable.miName}</td>
								<td>${medicineDetailTable.mdClass}</td>
								<td>${medicineDetailTable.mdNature}</td>
								<td>${medicineDetailTable.mdComponent}</td>
								<td>${medicineDetailTable.miCompany}</td>
								
								<c:if test="${medicineDetailTable.miPrice gt avgPrice}">
								<td class="text-right" style="color: red;"><fmt:formatNumber value="${medicineDetailTable.miPrice}" pattern="#,###"/></td>
								</c:if>
								<c:if test="${medicineDetailTable.miPrice lt avgPrice}">
								<td class="text-right" style="color: blue;"><fmt:formatNumber value="${medicineDetailTable.miPrice}" pattern="#,###"/></td>
								</c:if>
								<c:if test="${medicineDetailTable.miPrice eq avgPrice}">
								<td class="text-right" style="color: black;"><fmt:formatNumber value="${medicineDetailTable.miPrice}" pattern="#,###"/></td>
								</c:if>
								
								
								
								<td>${medicineDetailTable.className}</td>
								<td class="text-center">${medicineDetailTable.unit}</td>
							</tr>
						</c:forEach>
						</tbody>

					</table>

				</div>

			</div>
		</div>
		<div class="row m-0">
			<div id="detailCard" class="card w-100 mb-0 card-primary card-outline" style="display: none;">
				<div class="card-header">
					<h2 id="detailTitle" class="detailTitle" style="margin-top: 0px"></h2>
				</div>
					
				<div class="card-body">
					<div class="row m-0">
						<h2 class="detailTitle" style="margin-top: 0px">기본정보</h2>
						<table class="table" id="basicInfo">
							<tr>
								<th>제품명</th>
								<td>제품명${vo.mdName }</td>
							</tr>
							<tr>
								<th>성상</th>
								<td>성상${vo.mdNature }</td>
							</tr>
							<tr>
								<th>업체명</th>
								<td>업체명${company }</td>
							</tr>
							<tr>
								<th>전문/일반</th>
								<td>전문/일반${vo.mdClass }</td>
							</tr>
							<tr>
								<th>품목기준코드</th>
								<td>품목기준코드${vo.mdNo }</td>
							</tr>
						</table>
					</div>
					
					<div>
						<h2 class="detailTitle" style="margin-top: 0px">원료약품 및 분량</h2>
						<p id="mdComponentDetail">유효성분:${fn:replace(vo.mdComponent,'|','&#44;')}</p>
					</div>
					
					<div id="effectDetail">
					
					</div>
					
					<div id="useDetail">
					
					</div>
					
					<div id="Precautions">
					
					</div>
					
				</div>
			</div>
		
		
		</div>
	</div>
	
	
</body>