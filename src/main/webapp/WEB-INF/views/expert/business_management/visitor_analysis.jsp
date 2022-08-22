<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/common.js" ></script>

<script>
$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
});	
</script>
<style type="text/css">
.hover:hover{
	background-color: #efefef;
	cursor: pointer;
}
.table td, .table th {
	padding: 5px;
	vertical-align: top;
	border-top: 1px solid #dee2e6;
	font-size: 12px;

}
.table td {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.form-control.d-inline-block {
	height: 31px;
	font-size: 12px;
	width: 120px;
}

.table th {
	align-content: center;
}
.card-footer {
	padding: 0.5rem 1.25rem;
	background-color: rgba(0, 0, 0, .03);
	border-top: 0solidrgba(0, 0, 0, .125);
}

/* .table td:hover { */
/* 	overflow: visible; */
/* } */

.card-body {
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	min-height: 1px;
	padding: 0.5rem;
	padding-top: 0px;
}

table {
	table-layout: fixed;
}

.card-title{
	font-size: 17px;
	font-weight: bold;
}

.btn{
	font-weight: bold;
}
.fas.fa-sort-up, .fas.fa-sort-down{
	color: #8080806b;
}
i:hover{
	cursor: pointer;
}
.icon-size{
	font-size: 18px;
}
</style>
</head>

<title>내방환자 분석</title>

<body>
	<div class="content-wrapper">
		<div class="row m-0">
			
			<div class="row m-0">
				<div class="col-6" style="height: 899px; padding-top: 6px; padding-right: 0px;">
					<div class="row m-0">
						<div class="card card-primary card-outline w-100 mb-1" >
							<div class="card-header">
								<div class="form-inline justify-content-between">
									<div class="form-inline">
										<i class="far fa-file-alt icon-size"></i>
										<h3 class="card-title">연령/성별 매출 현황</h3>
									</div>
									<div class="form-inline">
										<input type="date" id="startDate" style="width: 120px;" class="form-control form-control-sm mr-2"> 
										<input type="date" id="endDate" style="width: 120px;" class="form-control form-control-sm mr-2">
										<button onclick="toggleSort(1)" class="btn btn-sm btn-primary">조회</button>
									</div>
								</div>
							</div>
							<div class="card-body" style="height: 200px;;padding-top: 11px;">
								<table class="table table-hover table-bordered"
									style="border-top: 1px solid #dee2e6;">
									<colgroup>
										<col width="13%" />
										<col width="10%" />
										<col width="15%" />
										<col width="28%" />
										<col width="15%" />
										<col width="28%" />
										<col width="15%" />
										<col width="25%" />
									</colgroup>
									<thead class="text-center">
										<tr style="background-color: #E8F5FF;">
											<th class="align-middle" rowspan='2'>연령</th>
											<th class="align-middle" rowspan='2'>성별</th>
											<th colspan='2'>처방조제</th>
											<th colspan='2'>비처방조제</th>
											<th colspan='2'>합계</th>
										</tr>
										<tr id="allth">
											<th id="count" style="padding-right: 12px;">
												조제건
												<div class="non" style="position: relative;display: inline;margin-left: 1px; cursor: pointer" onclick="toggleSort(this);">
													<i style="visibility: visible;position: absolute;top: 1px;" class="fas fa-sort-up"></i>
													<i style="visibility: visible;position: absolute;top: 2px;" class="fas fa-sort-down"></i>
												</div>
												
											</th>
											<th id="price" style="padding-right: 12px;">
												조제금액
												<div class="non" style="position: relative;display: inline;margin-left: 1px;" onclick="toggleSort(this);">
													<i style="visibility: visible;position: absolute;top: 1px;" class="fas fa-sort-up"></i>
													<i style="visibility: visible;position: absolute;top: 2px;" class="fas fa-sort-down"></i>
												</div>
											</th>
											<th id="bicount" style="padding-right: 12px;">
												조제건
												<div class="non" style="position: relative;display: inline;margin-left: 1px;" onclick="toggleSort(this);">
													<i style="visibility: visible;position: absolute;top: 1px;" class="fas fa-sort-up"></i>
													<i style="visibility: visible;position: absolute;top: 2px;" class="fas fa-sort-down"></i>
												</div>
											</th>
											<th id="biprice" style="padding-right: 12px;">
												조제금액
												<div class="non" style="position: relative;display: inline;margin-left: 1px;" onclick="toggleSort(this);">
													<i style="visibility: visible;position: absolute;top: 1px;" class="fas fa-sort-up"></i>
													<i style="visibility: visible;position: absolute;top: 2px;" class="fas fa-sort-down"></i>
												</div>
											</th>
											<th id="totalcount" style="padding-right: 12px;">
												조제건
												<div class="non" id="maintarget" style="position: relative;display: inline;margin-left: 1px;" onclick="toggleSort(this);">
													<i style="visibility: visible;position: absolute;top: 1px;" class="fas fa-sort-up"></i>
													<i style="visibility: visible;position: absolute;top: 2px;" class="fas fa-sort-down"></i>
												</div>
											</th>
											<th id="totalprice" style="padding-right: 12px;">
												조제금액
												<div class="non" style="position: relative;display: inline;margin-left: 1px;" onclick="toggleSort(this);">
													<i style="visibility: visible;position: absolute;top: 1px;" class="fas fa-sort-up"></i>
													<i style="visibility: visible;position: absolute;top: 2px;" class="fas fa-sort-down"></i>
												</div>
											</th>
										</tr>
									</thead>
									<tbody class="text-right">
										<tr id="ageBySexList"></tr>
									</tbody>
								</table>
							</div>
							
							<div class="card-footer" id="ageBySexPagination" style="height: 47px;">
							
							</div>
						</div>
					</div>
					
					<div class="row m-0">
						<div class="card card-primary card-outline mb-1">
							<div class="card-header">
								<div class="form-inline justify-content-between">
									<div class="form-inline">
										<i class="far fa-thumbs-up icon-size"></i>
										<h3 class="card-title">선호 약/건강기능식품</h3>
									</div>
									<div>
										<div class="input-group input-group-sm ml-1">
											<div class="input-group-prepend">
												<span class="input-group-text">제약사</span>
											</div>
											<input class="form-control d-inline-block" list="companylist" id="company" name="company">
										
										</div>
									</div>
									
									<div class="input-group input-group-sm ml-1">
										<div class="input-group-prepend">
											<span class="input-group-text">구분</span>
										</div>
										
										<input class="form-control d-inline-block" list="gubunlist" id="gubun" name="gubun" value='전체'>
										<datalist id="gubunlist">
											<option data-value="ALL">전체</option>
											<option data-value="HTC">건강기능식품</option>
											<option data-value="ETC">전문의약품</option>
											<option data-value="OTC">일반의약품</option>
										</datalist>
										<button class="btn btn-sm btn-primary align-middle ml-1" onclick="getPreferMedicineList(0,1,'filter')">적용</button>
									</div>
								</div>
							</div>
							
							<div class="card-body" style="height: 192px;">
				
								<div class="d-flex flex-row" style="font-size: 12px;">
									<div class="p-1 font-weight-bold">연령 : </div>
									<div class="p-1" id="preferAge"></div>
									<div class="p-1 font-weight-bold">성별 : </div>
									<div class="p-1" id="preferSex"></div>
								</div>
								
								<table class="table table-hover table-bordered text-nowrap">
									<colgroup>
										<col width="10%" />
										<col width="10%" />
										<col width="45%" />
										<col width="29%" />
										<col width="15%" />
										<col width="16%" />
										<col width="25%" />
										<col width="20%" />
									</colgroup>
									<thead class="text-center">
										<tr style="background-color: #E8F5FF;">
											<th>추가</th>
											<th>NO.</th>
											<th>약명</th>
											<th>제조사</th>
											<th id="gubun">구분
											</th>
											<th style="padding-right: 12px;">판매수
												<div style="position: relative;display: inline;margin-left: 1px; cursor: pointer">
													<i style="visibility: visible;position: absolute;top: 1px;" class="fas fa-sort-up"></i>
													<i style="visibility: visible;position: absolute;top: 2px; color: black;" class="fas fa-sort-down"></i>
												</div>
											</th>
											<th>판매가</th>
											<th>재고수</th>
										</tr>
									</thead>
									<tbody class="text-left">
										<tr id="preferMedicineList"></tr>
									</tbody>
								</table>
							</div>
							
							<div class="card-footer" id="preferMedicinePagination" style="height: 47px;">
							
							</div>
						</div>
					</div>
					
					<div class="row m-0">
						<div class="card card-primary card-outline mb-1">
							<div class="card-header form-inline">
								<i class="far fa-file-alt icon-size"></i>
								<h3 class="card-title">선호 약/건강기능식품 재고 현황</h3>
	
							</div>
		
							<div class="card-body table-responsive" style="height: 229px;">
								
								<table class="table table-bordered table-head-fixed text-nowrap" style="margin-top: 10px;">
									<colgroup>
										<col width="9%"/>
										<col width="45%"/>
										<col width="27%"/>
										<col width="12%"/>
										<col width="15%"/>
										<col width="25%"/>
									</colgroup>
									<thead class="text-center" style="font-size: 14px;">
										<tr>
											<th style="background-color: #E8F5FF;">NO.</th>
											<th style="background-color: #E8F5FF;">약명</th>
											<th style="background-color: #E8F5FF;">제조사</th>
											<th style="background-color: #E8F5FF;">구분</th>
											<th style="background-color: #E8F5FF;">재고수</th>
											<th style="background-color: #E8F5FF;">유통기한</th>
										</tr>
									</thead>
									<tbody id="preferProductDetail" class="text-center" style="font-size: 14px;">
									
									</tbody>
								</table>
							</div>
						</div>
					</div>
					
					
					
					
					
				</div>
				
				<div class="col-6" style="height: 899px; padding-top: 6px;">
					
					
					<div class="row m-0">
						<div class="card card-primary card-outline w-100 mb-1">
							<div class="card-header">
								<div class="form-inline justify-content-between">
									<div class="form-inline">
										<i class="far fa-address-card icon-size"></i>
										<h3 class="card-title">장기조제환자 현황</h3>
										<i class="fa-solid fa-circle-question" id="longPrescriptionInfo"></i>
									</div>
									<div>
										<button onclick="longPrescriptionList(1,30)" class="btn btn-sm btn-primary">1개월</button>
										<button onclick="longPrescriptionList(1,60)" class="btn btn-sm btn-primary ml-2">2개월</button>
										<button onclick="longPrescriptionList(1,90)" class="btn btn-sm btn-primary ml-2">3개월 이상</button>
									</div>
								</div>
							</div>
							
							<div class="card-body" style="height: 200px;">
								<table class="table table-hover table-bordered"
									style="border-top: 1px solid #dee2e6; margin-top: 12px;" >
									<colgroup>
										<col width="35%" />
										<col width="20%" />
										<col width="20%" />
										<col width="36%" />
										<col width="20%" />
										<col width="20%" />
										<col width="23%" />
									</colgroup>
									<thead class="text-center">
										<tr style="background-color: #E8F5FF;">
											<th>최근처방일</th>
											<th>이름</th>
											<th>처방일수</th>
											<th>처방기관</th>
											<th>처방의</th>
											<th>약사명</th>
											<th>재고확인</th>
										</tr>
									</thead>
									<tbody id="longPrescription" data-preDay="2" class="text-left">
										
	
									</tbody>
								</table>
							</div>
							
							<div class="card-footer" id="longPrescriptionPagination" style="height: 47px;">
							
							</div>
						</div>
					</div>
					
					<div class="row m-0">
						<div class="card card-primary card-outline w-100 mb-1">
							<div class="card-header form-inline">
								<i class="far fa-edit icon-size"></i>
								<h3 class="card-title">상세처방 내역</h3>
							</div>
							
							<div class="card-body" style="height: 279px;">
								
								<div class="d-flex flex-row" style="font-size: 12px;">
									<div class="p-1 font-weight-bold">교부번호</div>
									<div class="p-1" id="longPsCode"></div>
									<div class="p-1 font-weight-bold">교부일자</div>
									<div class="p-1" id="longPsDate"></div>
									<div class="p-1 font-weight-bold">발행기관</div>
									<div class="p-1" id="longPsHos"></div>
									<div class="p-1 font-weight-bold">의사명</div>
									<div class="p-1" id="longPsDoctor"></div>
									<div class="p-1 font-weight-bold">조제약사</div>
									<div class="p-1" id="longPsChemist"></div>
								</div>
								
								<table class="table table-hover table-bordered"
									style="border-top: 1px solid #dee2e6;">
									<colgroup>
										<col width="10%" />
										<col width="10%" />
										<col width="15%" />
										<col width="28%" />
										<col width="56%" />
										<col width="20%" />
										<col width="20%" />
										<col width="20%" />
									</colgroup>
									<thead class="text-center">
										<tr style="background-color: #E8F5FF;">
											<th>추가</th>
											<th>NO</th>
											<th>구분</th>
											<th>약코드</th>
											<th>약명</th>
											<th>횟수</th>
											<th>일수</th>
											<th>재고</th>
										</tr>
									</thead>
									<tbody id="longPrescriptionDetail" class="text-left">
										
									</tbody>
								</table>
							</div>
							
							
						</div>
					</div>
					
					
					
					<div class="row m-0">
						<div class="card card-primary card-outline mb-1" style="height: 248px;">
							<div class="card-header">
								<div class="form-inline justify-content-between">
									<div class="form-inline">
										<i class='fas fa-star icon-size'></i>
										<h3 class="card-title">선택한 약 목록</h3>
									</div>
									<button class="btn btn-sm btn-primary mb-0 ml-2 float-right"
									 onclick="window.open('<%= request.getContextPath()%>/expert/business/goOrder.do?chemistCode=${loginUser.chemistCode}','발주서 작성','width=748,height=950,left=600,top=600,location=no,status=no,scrollbars=yes');">발주</button>
								</div>
							</div>
		
							<div class="card-body table-responsive" style="height: 400px;">
								
								<table class="table table-bordered table-head-fixed text-nowrap" style="margin-top: 10px;">
									<colgroup>
										<col width="9%"/>
										<col width="58%"/>
										<col width="17%"/>
										<col width="12%"/>
										<col width="25%"/>
									</colgroup>
									<thead class="text-center" style="font-size: 14px;">
										<tr>
											<th style="background-color: #E8F5FF;">삭제</th>
											<th style="background-color: #E8F5FF;">약명</th>
											<th style="background-color: #E8F5FF;">제약사</th>
											<th style="background-color: #E8F5FF;">구분</th>
											<th style="background-color: #E8F5FF;">금액</th>
											<th style="background-color: #E8F5FF;"></th>
										</tr>
									</thead>
									<tbody id="selectList" class="text-center" style="font-size: 14px;">
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
	
				</div>
			</div>

		

		</div>
	</div>
</body>

