<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약국 매출 현황</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

<style>
label{
	width: 120px;
	margin-left: 10px;
}
form > label{
	margin-bottom: 20px;
}
form > input{
	font-size: 17px !important;
	margin-left: 30px;
}
input{
	text-align: right;
}
input:read-only{
	background-color: #E5E5E5;
}
/* 검색조건 카드 id */
#searchCondition{
	font-size: 15px;
	padding: 10px;
}
#searchCondition select, #searchCondition input, #searchCondition button{
	height: 25px;
	margin: 3px;
}
.total_input{
	border:0px;
}
/* 데이터  input 크기 */
.date_input{
	width:115px;
}
table.dataTable>thead>tr>th:not(.sorting_disabled), table.dataTable>thead>tr>td:not(.sorting_disabled){
	padding-right: 0px;
}
table.dataTable>tfoot>tr>th:not(.sorting_disabled), table.dataTable>tfoot>tr>td:not(.sorting_disabled){
	padding-right: 0px;
}
table{
	text-align:center;
	table-layout: fixed;
}
th{
	background-color: #E8F5FF;
	font-size: 12px;
	height: 25px;
}
td{
	font-size: 12px;
	height: 25px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}
tr:hover{
	background-color: rgba(0,0,0,.075);
}

.number{
	text-align:right;
}
.scrolltbody, .scrolltbody2, .scrolltbody3{
    display: block;
}
.scrolltbody tbody{
    display: block;
    height: 208px;
    max-height: 208px;
    overflow: auto;
}
.scrolltbody2 tbody{
	display: block;
    height: 236px;
    max-height: 236px;
    overflow: auto;
}
.scrolltbody3 tbody{
	display: block;
    height: 335px;
    max-height: 335px;
    overflow: auto;
}

.scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) { width: 255px; }
.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) { width: 81px; }
.scrolltbody th:nth-of-type(3), .scrolltbody td:nth-of-type(3) { width: 61px; }
.scrolltbody th:nth-of-type(4), .scrolltbody td:nth-of-type(4) { width: 61px; }
.scrolltbody th:nth-of-type(5), .scrolltbody td:nth-of-type(5) { width: 61px; }
.scrolltbody th:nth-of-type(6), .scrolltbody td:nth-of-type(6) { width: 61px; }
.scrolltbody th:nth-of-type(7), .scrolltbody td:nth-of-type(7) { width: 61px; }
.scrolltbody th:nth-of-type(8), .scrolltbody td:nth-of-type(8) { width: 81px; }
.scrolltbody th:nth-of-type(9), .scrolltbody td:nth-of-type(9) { width: 81px; }
.scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) { max-width: 255px; }
.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) { max-width: 80px; }
.scrolltbody th:nth-of-type(3), .scrolltbody td:nth-of-type(3) { max-width: 60px; }
.scrolltbody th:nth-of-type(4), .scrolltbody td:nth-of-type(4) { max-width: 60px; }
.scrolltbody th:nth-of-type(5), .scrolltbody td:nth-of-type(5) { max-width: 60px; }
.scrolltbody th:nth-of-type(6), .scrolltbody td:nth-of-type(6) { max-width: 60px; }
.scrolltbody th:nth-of-type(7), .scrolltbody td:nth-of-type(7) { max-width: 60px; }
.scrolltbody th:nth-of-type(8), .scrolltbody td:nth-of-type(8) { max-width: 70px; }
.scrolltbody th:nth-of-type(9), .scrolltbody td:nth-of-type(9) { max-width: 80px; }

.scrolltbody2 th:nth-of-type(1), .scrolltbody2 td:nth-of-type(1) { width: 50px; }
.scrolltbody2 th:nth-of-type(2), .scrolltbody2 td:nth-of-type(2) { width: 67px; }
.scrolltbody2 th:nth-of-type(3), .scrolltbody2 td:nth-of-type(3) { width: 67px; }
.scrolltbody2 th:nth-of-type(4), .scrolltbody2 td:nth-of-type(4) { width: 50px; }
.scrolltbody2 th:nth-of-type(5), .scrolltbody2 td:nth-of-type(5) { width: 67px; }
.scrolltbody2 th:nth-of-type(6), .scrolltbody2 td:nth-of-type(6) { width: 34px; }
.scrolltbody2 th:nth-of-type(7), .scrolltbody2 td:nth-of-type(7) { width: 30px; }
.scrolltbody2 th:nth-of-type(1), .scrolltbody2 td:nth-of-type(1) { max-width: 50px; }
.scrolltbody2 th:nth-of-type(2), .scrolltbody2 td:nth-of-type(2) { max-width: 67px; }
.scrolltbody2 th:nth-of-type(3), .scrolltbody2 td:nth-of-type(3) { max-width: 67px; }
.scrolltbody2 th:nth-of-type(4), .scrolltbody2 td:nth-of-type(4) { max-width: 50px; }
.scrolltbody2 th:nth-of-type(5), .scrolltbody2 td:nth-of-type(5) { max-width: 67px; }
.scrolltbody2 th:nth-of-type(6), .scrolltbody2 td:nth-of-type(6) { max-width: 34px; }
.scrolltbody2 th:nth-of-type(7), .scrolltbody2 td:nth-of-type(7) { max-width: 30px; }

 .scrolltbody3 th:nth-of-type(1), .scrolltbody3 td:nth-of-type(1)   { width: 83px; }
 .scrolltbody3 th:nth-of-type(2), .scrolltbody3 td:nth-of-type(2)   { width: 65px; }
 .scrolltbody3 th:nth-of-type(3), .scrolltbody3 td:nth-of-type(3)   { width: 65px; }
 .scrolltbody3 th:nth-of-type(4), .scrolltbody3 td:nth-of-type(4)   { width: 65px; }
 .scrolltbody3 th:nth-of-type(5), .scrolltbody3 td:nth-of-type(5)   { width: 90px; }
 .scrolltbody3 th:nth-of-type(6), .scrolltbody3 td:nth-of-type(6)   { width: 85px; }
 .scrolltbody3 th:nth-of-type(7), .scrolltbody3 td:nth-of-type(7)   { width: 65px; }
 .scrolltbody3 th:nth-of-type(8), .scrolltbody3 td:nth-of-type(8)   { width: 65px; }
 .scrolltbody3 th:nth-of-type(9), .scrolltbody3 td:nth-of-type(9)   { width: 65px; }
 .scrolltbody3 th:nth-of-type(9), .scrolltbody3 td:nth-of-type(9)   { width: 85px; }
 .scrolltbody3 th:nth-of-type(10), .scrolltbody3 td:nth-of-type(10) { width: 50px; }

 .scrolltbody3 th:nth-of-type(1), .scrolltbody3 td:nth-of-type(1)   { max-width: 83px; }
 .scrolltbody3 th:nth-of-type(2), .scrolltbody3 td:nth-of-type(2)   { max-width: 65px; }
 .scrolltbody3 th:nth-of-type(3), .scrolltbody3 td:nth-of-type(3)   { max-width: 65px; }
 .scrolltbody3 th:nth-of-type(4), .scrolltbody3 td:nth-of-type(4)   { max-width: 65px; }
 .scrolltbody3 th:nth-of-type(5), .scrolltbody3 td:nth-of-type(5)   { max-width: 85px; }
 .scrolltbody3 th:nth-of-type(6), .scrolltbody3 td:nth-of-type(6)   { max-width: 90px; }
 .scrolltbody3 th:nth-of-type(7), .scrolltbody3 td:nth-of-type(7)   { max-width: 65px; }
 .scrolltbody3 th:nth-of-type(8), .scrolltbody3 td:nth-of-type(8)   { max-width: 65px; }
 .scrolltbody3 th:nth-of-type(9), .scrolltbody3 td:nth-of-type(9)   { max-width: 65px; }
 .scrolltbody3 th:nth-of-type(9), .scrolltbody3 td:nth-of-type(9)   { max-width: 85px; }
 .scrolltbody3 th:nth-of-type(10), .scrolltbody3 td:nth-of-type(10) { max-width: 50px; }


/* 제목 span 태그*/
.header-title{
	font-size: 17px;
	font-weight: bold;
}

.check_label{
	width: auto;
    margin-left: 0px;
    margin-right: 30px;
}
#salesTableDiv{
	min-height: 381px;
	max-height: 381px;
}
/* 아이콘 크기 */
.icon-size{
	font-size: 18px;
}
/* 매출 목록 선택 합계 표시*/
#sales_total{
	float:right;
	font-size: 15px;
	font-weight: bold;
}
/* 표에서 글자가 들어가는 곳 */
.stringType{
	text-align: left;
}
/* '임시'일 때 td css */
.temData{
	background-color: #6c757d;
    color: white;
    font-weight: bold;
}
/* '출력'일 때 td css */
.printData{
	background-color: #1478CD;
	color: white;
	font-weight: bold;
}
/* 아이콘에 커서를 주는 css */
.curserIcon{
	cursor: pointer;
}
</style>


</head>
<body>
<div class="content-wrapper">
	<div class="content">
		<div class="container" style="max-width:1280px;">
			<div class="row">
				<div class="col-lg-12">
					<div class="card card-outline">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4">
					<div class="card card-primary card-outline">
						<div class="card-header">
							<i class="fa-solid fa-magnifying-glass-arrow-right icon-size"></i>
							<span class="header-title">검색조건</span>
						</div>
						<div class="card-body" id="searchCondition">
							<div>
								<label for="chemistName" style="width: 70px;">조제약사</label>
								<select id="chemistName" name="searchType" id="searchType">
										<option value="A">전체약사</option>
									<c:forEach items="${nameList }" var="name">
										<option value="${name.chemistCode }">${name.memName}</option>
									</c:forEach>
								</select>
								<button type="button" class="btn btn-outline-dark btn-sm" onclick="salesAnalsisSearch()"
										style="padding: 10px; padding-top: 2px; height: 25px; margin-bottom:6px; font-weight: bold">조회</button>
								<br>
								<label for="startDate" style="width: 70px;">기간</label>
								<input class="date_input" id="startDate" name="startDate" type="date" value="${cri.startDate }"> &nbsp;~&nbsp;
								<input class="date_input" id="endDate" name="endDate" type="date" value="${cri.endDate }">
							</div>
						</div>
					</div>
					<div class="card card-primary card-outline">
						<div class="card-header title">
							<i class="fa-solid fa-sack-dollar icon-size"></i>
							<span class="header-title">항목합계</span>
						</div>
						<div class="card-body" style="height: 300px; padding:10px; padding-top:20px;">
							<form action="">
								<label for="total_salesCount">총 매출건</label>
								<input type="text" id="total_salesCount" class="total_input" value="0(건)" readonly><br/>
								<label for="total_salesFee">총 매출 금액</label>
								<input type="text" id="total_salesFee" class="total_input" value="0(￦)" readonly><br/>
								<label for="total_compoundingFee">조제료</label>
								<input type="text" id="total_compoundingFee" class="total_input" value="0(￦)" readonly><br/>
								<label for="total_carge">청구액</label>
								<input type="text" id="total_carge" class="total_input" value="0(￦)" readonly><br/>
								<label for="total_salesDrugFee">약품판매액</label>
								<input type="text" id="total_salesDrugFee" class="total_input" value="0(￦)" readonly><br/>
								<label for="total_copay">본인부담금</label>
								<input type="text" id="total_copay" class="total_input" value="0￦)" readonly><br/>
								<label for="total_deposit">입금액</label>
								<input type="text" id="total_deposit" class="total_input" value="0(￦)" readonly><br/>
							</form>
						</div>
					</div>
					<div class="card card-primary card-outline" style="height: 336px; max-height: 336px;">
						<div class="card-header title">
							<i class="fa-solid fa-folder-open icon-size"></i>
							<span class="header-title">저장/출력 내역</span><span style="font-size:0.7em;">(최근 3개월 내역까지 출력) </span>
						</div>
						<div class="card-body" style="padding: 8px;">
							<table id="example2" class="table-bordered dataTable dtr-inline scrolltbody2"
											role="grid" aria-describedby="example1_info">
								<thead>
									<tr role="row" style="text-align: center;">
										<th class="inquriy_list" style="width: 50px;">구분</th>
										<th class="inquriy_list" style="width: 67px;">
											시작일
											<i class="fa-solid fa-circle-question" data-toggle="tooltip" title="시작일 :저장된 처방전 중  '조제완료' 일자가 가장 과거인 날 "></i>
										</th>
										<th class="inquriy_list" style="width: 67px;">
											종료일
											<i class="fa-solid fa-circle-question" data-toggle="tooltip" title="종료일 :저장된 처방전 중 '조제완료' 일자가 가장 최근인 날"></i>
										</th>
										<th class="inquriy_list" style="width: 50px;">청구건수</th>
										<th class="inquriy_list" style="width: 67px;">출력일</th>
										<th class="inquriy_list" style="width: 34px;">상태</th>
										<th class="inquriy_list" style="width: 30px;"></th>
									</tr>
								</thead>
								<tbody>
								<c:if test="${pslList eq null }">
									<tr>
										<td colspan="7">조회된 데이터가 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach items="${pslList }" var="list">
									<tr class="odd" onclick="saveListRead(${list.pslogNum }, this)">
										<td class="dtr-control sorting_1" data-toggle="tooltip" title="${list.pslogChname }">${list.pslogChname }</td>
										<td>
											<fmt:formatDate value="${list.psCompleteDateStrart }" pattern="yyyy.MM.dd"/>
										</td>
										<td>
											<fmt:formatDate value="${list.psCompleteDateEnd}" pattern="yyyy.MM.dd"/>
										</td>
										<td class="number">${list.pslogCount }</td>
										<c:if test="${list.pslogSaveday eq null }">
											<td>-</td>
										</c:if>
										<c:if test="${list.pslogSaveday ne null }">
											<td>
												<fmt:formatDate value="${list.pslogSaveday }"/>
											</td>
										</c:if>
										<c:if test="${list.pslogStatus eq '임시' }">
											<td class="temData">임시</td>
										</c:if>
										<c:if test="${list.pslogStatus eq '출력' }">
											<td class="printData">출력</td>
										</c:if>
										<td>
											<i class="far fa-minus-square curserIcon" style="color:#007bff;" onclick="saveListDelete(${list.pslogNum })"></i>
										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="col-lg-8">
					<!-- 표가 들어갈 곳 -->
					<div class="card card-primary card-outline" style="height: 497px; max-height: 497px;">
						<div class="card-header title">
							<div class="row">
								<div class="col-sm-6" style="align-self: center;">
									<i class="far fa-file-alt icon-size" aria-hidden="true"></i>
									<span class="header-title">매출 목록</span><span style="font-size:0.7em;">(검색 시 저장/출력 내역이 없는 데이터만 표시됩니다.)</span>
								</div>
								<div class="col-sm-6">
									<div class="dt-buttons btn-group flex-wrap" style="float: right;">
										<!-- <div class="form-check" style="padding-top:5px;">
											<input class="form-check-input" type="checkbox">
											<label class="form-check-label check_label">전체 선택</label>
										</div> -->
										<button class="btn btn-primary buttons-pdf buttons-html5" onclick="excelmaker()"
											tabindex="0" aria-controls="example1" type="button" style="border-radius: 5px; height:30px; padding:8px; padding-top:3px; margin-right:10px;">
											<span style="font-weight: bold;">Excel</span>
										</button>
										<button class="btn btn-primary buttons-pdf buttons-html5" onclick="registBill()"
											tabindex="0" aria-controls="example1" type="button" style="border-radius: 5px; height:30px; padding:8px; padding-top:3px; margin-right:10px;">
											<span style="font-weight: bold;">요양급여신청서</span>
										</button>
										<button class="btn btn-primary buttons-pdf buttons-html5" onclick="temporarilySave()"
											tabindex="0" aria-controls="example1" type="button" style="border-radius: 5px; height:30px; padding:8px; padding-top:3px; background-color:#6c757d; border:#6c757d;">
											<span style="font-weight: bold;">임시저장</span>
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="card-body" style="padding: 8px;">
							<div id="example1_wrapper"
								class="dataTables_wrapper dt-bootstrap4">
								<div class="row">
									<div class="col-sm-12">
									<div class="table-responsive mailbox-messages" id="salesTableDiv">
										<table id="example1" class="table-bordered dataTable dtr-inline scrolltbody3"
											role="grid" aria-describedby="example1_info">
											<thead>
												<tr role="row" style="text-align: center;">
													<th class="inquriy_list" style="width: 83px; max-width: 83px;">작업일자</th>
													<th class="inquriy_list" style="width: 65px; max-width: 65px;">구분</th>
													<th class="inquriy_list" style="width: 65px; max-width: 65px;">환자명</th>
													<th class="inquriy_list" style="width: 65px; max-width: 65px;">조제약사</th>
													<th class="inquriy_list" style="width: 90px; max-width: 90px;">약제비/판매액</th>
													<th class="inquriy_list" style="width: 85px; max-width: 85px;">청구액</th>
													<th class="inquriy_list" style="width: 65px; max-width: 65px;">본인부담금</th>
													<th class="inquriy_list" style="width: 65px; max-width: 65px;">입금액</th>
													<th class="inquriy_list" style="width: 65px; max-width: 65px;">조제료</th>
													<th class="inquriy_list" style="width: 85px; max-width: 85px;">약가</th>
													<th class="inquriy_list" style="width: 50px; max-width: 50px;">
														<button type="button" class="btn btn-default btn-sm checkbox-toggle" onclick="checkboxAll()" id="allButtonCheck">
															<i class="far fa-check-square"></i>
														</button>
													</th>
												</tr>
											</thead>
											<tbody id="salesAnalysisTable">
												<c:forEach items="${salesAnalysisList }" var="sal" varStatus="status">
													<tr onclick="salesAnalysisDetail('${sal.psCode}', this)" psCode="${sal.psCode}" class="salesListTr">
														<td style="width: 83px; max-width: 83px;" class="dtr-control sorting_1" tabindex="0"> ${sal.psCompleteDate } </td>
														<td style="width: 65px; max-width: 65px;">${sal.psType }</td>
														<td style="width: 65px; max-width: 65px;">${sal.patientName }</td>
														<td style="width: 65px; max-width: 65px;">${sal.chemistName }</td>
														<td style="width: 90px; max-width: 90px;" class="number" data-toggle="tooltip" title="${sal.totalMedicienBill }">${sal.totalMedicienBill }</td>
														<td style="width: 85px; max-width: 85px;" class="number" data-toggle="tooltip" title="${sal.charge }">${sal.charge }</td>
														<td style="width: 65px; max-width: 65px;" class="number" data-toggle="tooltip" title="${sal.patientCharge }">${sal.patientCharge }</td>
														<td style="width: 65px; max-width: 65px;" class="number" data-toggle="tooltip" title="${sal.deposit }">${sal.deposit }</td>
														<td style="width: 65px; max-width: 65px;" class="number" data-toggle="tooltip" title="${sal.compoundingFee }">${sal.compoundingFee }</td>
														<td style="width: 85px; max-width: 85px;" class="number" data-toggle="tooltip" title="${sal.medicienBill }">${sal.medicienBill }</td>
														<td style="width: 50px; max-width: 50px;">
															<div class="icheck-primary">
																<input type="checkbox" class="abled" checked="checked" onchange="findListChecked()">
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<div class="dataTables_info" id="sales_total" role="status" aria-live="polite">
											총&nbsp;<span id="checkboxTotal">${salesAnalysisList.size() }</span>개 중 <span id="checkboxCount">0</span>개
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="card card-primary card-outline" style="height: 336px; max-height: 336px;">
						<div class="card-header">
							<i class="far fa-edit icon-size" aria-hidden="true"></i>
							<span class="card-title m-0 header-title" style="float: none; font-weight: bold;">(처 방 조 제) 내 역</span>
						</div>
						<div class="card-body" style="padding: 8px;">
							<table id="example2" class="table-bordered dataTable dtr-inline scrolltbody"
											role="grid" aria-describedby="example1_info">
								<thead>
									<tr role="row" style="text-align: center;">
										<th class="inquriy_list" style="width: 255px;">약명</th>
										<th class="inquriy_list" style="width: 80px;">제조회사</th>
										<th class="inquriy_list" style="width: 60px;">유형</th>
										<th class="inquriy_list" style="width: 60px;">급여</th>
										<th class="inquriy_list" style="width: 60px;">총투약</th>
										<th class="inquriy_list" style="width: 60px;">횟수</th>
										<th class="inquriy_list" style="width: 60px;">일수</th>
										<th class="inquriy_list" style="width: 70px;">단가</th>
										<th class="inquriy_list" style="width: 80px;">금액</th>
									</tr>
								</thead>
								<tbody id="SA-PrescriptionTbody">
								</tbody>
								<tfoot style="min-width: 794px;">
									<tr>
										<th style="width: 255px;"></th>
										<th style="width: 81px;"></th>
										<th style="width: 61px;"></th>
										<th style="width: 61px;"></th>
										<th style="width: 61px;"></th>
										<th style="width: 71px;"></th>
										<th style="width: 81px;">금액 총합 : </th>
										<th class="number" style="width: 151px; max-width: 151px;" colspan="2" id="totalFee"></th>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
				<!-- col-8 end -->
			</div>
			<!-- row end -->
		</div>
	</div>
</div>

<form id="salesForm">
	<input type="hidden" name="startDate" id="startDateInputHidden" value="" />
	<input type="hidden" name="endDate" id="endDateInputHidden" value="" />
	<input type="hidden" name="searchType" id="searchTypeInputHidden" value="" />
</form>


<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jszip/jszip.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/pdfmake/pdfmake.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/pdfmake/vfs_fonts.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js?v=3.2.0"></script>

<%@include file="./sales_js.jsp" %>
</body>
</html>