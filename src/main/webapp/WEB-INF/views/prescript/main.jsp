<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>



<meta charset="UTF-8">
<title>약사 - 조제</title>

<head>

<style>
body {
	font-size: 12px;
}

.table td, .table th {
	padding: 4px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

table {
	padding: 0px;
	text-align: center;
}

/* 표 머리행 */
th {
	background-color: #E8F5FF;
	text-align: center;
	position: sticky;
	top: 0px;
	height: 25px;
}

/* 환자조회 -> 등록, 추가버튼 */
.addViewBtn {
	text-align: center;
}

/* 환자 정보 추가 버튼 */
.addBtn {
	width: 70px;
	margin-right: 25px;
}

/* 환자 정보 조회 버튼 */
.viewBtn {
	width: 70px;
}

/* 새처방버튼 */
.newPreBtn {
	height: 30px;
	width: 90px;
	display: block;
	position: relative;
	float: left;
	padding: 0;
	/* margin: 10px 20px 10px 0; */
	font-weight: 600;
	text-align: center;
	line-height: 30px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
	border: 0;
	background: #1E82FF;
}


/* 결제, 조제완료 버튼 div */
.payBtn {
	margin: 0px;
	text-align: center;
	float: right;
}
/* 결제, 조제완료 버튼  */
.paymentBtn, .successBtn {
	height: 30px;
	width: 90px;
	display: block;
	position: relative;
	float: left;
	padding: 0;
	/* margin: 10px 20px 10px 0; */
	font-weight: 600;
	text-align: center;
	line-height: 25px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
	border: 0;
}
/* 결제 버튼 */
.paymentBtn {
	background-color: #FF3232;
	margin-right: 15px;
}

/* 조제완료 버튼 */
.successBtn {
	background-color: #6c757d;
}

/* 처방전 수정, 추가, 저장, 취소 버튼 */
a.button {
	display: block;
	position: relative;
	float: left;
	width: 55px;
	height: 25px;
	padding: 0;
	/* margin: 10px 20px 10px 0; */
	font-weight: 600;
	text-align: center;
	line-height: 25px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
}

/* 처방전상세내역버튼(추가, 저장, 취소) */
.col-sm-7 > .preDetailBtn {
	background-color: #6c757d;
	margin-right: 8px;
    width: 40px;
    height: 20px;
    line-height: 0px;
    float: right;
}

.btnBlueGreen {
	background: #1E82FF;
}

.btnFade.btnBlueGreen:hover {
	background: #0A6EFF;
}

/* 버튼 */
.button, button:visited {
	text-decoration: none;
	color: #00AE68;
}

.button {
	width: 55px;
	height: 25px;
	padding: 0;
	/* margin: 10px 20px 10px 0; */
	font-weight: 600;
	text-align: center;
	line-height: 25px;
	color: #FFF;
	border-radius: 5px;
	border: 0px;
	transition: all 0.2s;
}

/* 처방전상세내역버튼(추가, 저장, 취소) */
.btnBlueGreen {
	background: #1E82FF;
}

.btnFade.btnBlueGreen:hover {
	background: #0A6EFF;
}

.preUpdateBtn {
	padding: 0;
	/* margin: 10px 20px 10px 0; */
	font-weight: 600;
	text-align: center;
	color: wihte;
	border-radius: 5px;
	border: 0px;
	transition: all 0.2s;
	width: 95px;
	height: 20px;
	line-height: 0px;
	margin-left: 10px;
	background-color: #FFA500;
}

/* 복약지도, 주의사항, 용법용량 다운버튼들 */
.downloadBtn {
	width: 100px;
	height: 30px;
	border: 1.5px solid #6c757d;
	/* margin: 10px 20px 10px 0; */
	text-align: center;
	border-radius: 5px;
	transition: all 0.2s;
	line-height: 0px;
	margin-left: 10px;
	/* background-color: white; */
	margin-left: 27px;
}

.downloadBtn:hover {
	background: #E0EBFF;
}

/* 과거 처방이력 표 줄어들기... */
.card-body.p-0 .table tbody>tr>td:first-of-type, .card-body.p-0 .table tbody>tr>th:first-of-type,
	.card-body.p-0 .table tfoot>tr>td:first-of-type, .card-body.p-0 .table tfoot>tr>th:first-of-type,
	.card-body.p-0 .table thead>tr>td:first-of-type, .card-body.p-0 .table thead>tr>th:first-of-type
	{
	padding-left: 0;
}

.card-body.p-0 .table tbody>tr>td:last-of-type, .card-body.p-0 .table tbody>tr>th:last-of-type,
.card-body.p-0 .table tfoot>tr>td:last-of-type, .card-body.p-0 .table tfoot>tr>th:last-of-type,
.card-body.p-0 .table thead>tr>td:last-of-type, .card-body.p-0 .table thead>tr>th:last-of-type
{
	padding-right: 0;

}

/* 구분 -> 전문 */
.sortPro {
	background-color: #FEBEBE;
}

/* 구분 -> 일반 */
.sortGeneral {
	background-color: #AFDDFA;
}

/* 조제대기 버튼 배경 */
.statusReady {
	background-color: #FF3232;
	color: white;
}

/* 조제완료 버튼 배경 */
.statusEnd {
	background-color: #1478CD;
	color: white;
}

/* 수정요청 버튼 배경 */
.statusUpdate {
	background-color: #FF9B00;
	color: white;
}

.ellipsis_name {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	max-width: 214px;
	text-align: left;
}

/* card-heder 아이콘 크기 */
.icon-size{
	font-size: 18px;
}
/* card-heder 제목 글씨 */
.header-title{
	font-size: 17px;
	font-weight: bold;
}
/* 처방전 클릭시 약명 출력되는 곳 */
#readMName{
	font-size: 15px;
	font-weight: bold;
}
/* 상단 카드들의 크기 속성 */
.upCard{
	overflow: hidden;
	height: 400px;
	max-height: 400px;
}
/* 환자 정보를 입력하는 창 */
.patientInfoDetail{
	font-size: 15px;
	font-weight: bold;
}
/* 처방 상세 내역에서 처방전의 정보를 띄우는 div */
.prescriptionDetailContents{
	display: flex;
    align-items: baseline;
    height: 25px;
}
.prescriptionDetailContents > input, label{
	margin-left: 10px;
}
/* 상세 약명 버튼에 들어갈 아이콘 위치 */
.icon-position{
	font-size: 16px;
    position: relative;
    top: 2px;
}
/* 과거처방내역 우측에 뜨는 내역 */
.prescriptSpan{
	font-weight: bold;
	font-size: 14px;
}

/* .chmistBtn !important{ */
/* 	font-size: 10px !important; */
/* } */
</style>

</head>
<body>

	<div class="content-wrapper">
		<div class="content">
			<div class="container" style="max-width: 1280px;">
				<div class="row">

					<div class="col-lg-12">
						<div class="card card-outline"></div>
					</div>
				</div>

				<!-- Main row -->
				<div class="row">
					<!-- 왼쪽 영역 시작 -->
					<section class="col-lg-6 connectedSortable ui-sortable">

						<div class="row">
							<div class="col-lg-7 col-7">
								<div class="card card-primary card-outline upCard">
									<div class="card-header">
										<span class="card-title m-0 title">
											<i class='far fa-address-card icon-size'></i>
											<span class="header-title">환자 정보</span>
										</span>
									</div>

									<div class="card card-primary" style="margin: 1px;">
										<div class="card-body" style="text-align: center;">
											<form action="" class="" style="font-size: 12px;">
												<div class="patientInfoDetail mb-3">
													<label for="lookUpId" style="text-align: right;">이&emsp; &nbsp;름 : </label>
													<input type="text" id="lookUpName" value=""><br />
												</div>

												<div class="patientInfoDetail mb-3">
													<label for="lookUpBirth" style="text-align: right;">생년월일 : </label>
													<input type="text" id="lookUpBirth" value="" onkeyup="lookupEnter()"><br />
												</div>
											</form>

												<div class="addViewBtn">
													<button onclick="memberInsert()"
														class="button btnFade btnBlueGreen addBtn" style="width: 70px; margin-right: 25px;">등록</button>
													<button class="button btnFade btnBlueGreen viewBtn" style="width: 70px;"
														onclick="lookupRead()">조회</button>
												</div>
										</div>
									</div>
									<div class="card" style="font-size: 12px;">
										<div class="card-body table-responsive p-0">
											<table class="table table-hover table-bordered">
												<thead class="listTitle">
													<tr style="height: 25px;">
														<th style="padding: 0px;padding-bottom: 4px;">NO</th>
														<th>환자명</th>
														<th>주민번호</th>
														<th>전화번호</th>
													</tr>
												</thead>
												<tbody id="lookupList">
													<!-- Handlebars -->
												</tbody>
											</table>
										</div>
										<!-- /.card-body -->
									</div>

								</div>

							</div>
							<div class="col-lg-5 col-5">
								<div class="card  card-primary card-outline upCard">
									<div class="card-header">
										<span class="card-title header-title">
											<i class='far fa-calendar-plus icon-size '></i>
											<span class="header-title">약국 대기 목록</span>
										</span>
									</div>
									<div class="card-body" style="padding: 0px; font-size: 12px;">
										<table class="table-hover table table-bordered patientCd">
											<thead class="listTitle">
												<tr>
													<th>NO</th>
													<th>환자명</th>
												</tr>
											</thead>
											<tbody id="readyList">
											</tbody>
										</table>
									</div>
									<!-- /.card-body -->
								</div>
							</div>
						</div>
						<div class="card card-primary card-outline">
							<div class="card-header">
								<div class="row">
									<div class="col-sm-9" style="align-self: center;">
										<span class="card-title m-0 title">
											<i class='far fa-file-alt icon-size'></i>
											<span class="header-title">과거 처방 이력</span>
											<span class="prescriptSpan">(대기번호 :</span>
											<span class="prescriptSpan" id="prescriptSpanNo"></span>
											<span class="prescriptSpan">&nbsp;&nbsp;환자명 :</span>
											<span class="prescriptSpan" id="prescriptSpanName"></span>
											<span class="prescriptSpan">)</span>
										<span>
									</div>
									<div class="col-sm-3">
										<div style="float:right;">
											<button onclick="newPreForChemist()" class="newPreBtn btn btn-primary" id="newPreBtn" disabled="disabled" >새처방</button>
										</div>
									</div>
								</div>
							</div>
							<!-- /.card-header -->
							<div class="card-body table-responsive p-0" style="height: 385px;">
								<table class="table-hover table table-bordered" id="prescriptTable">
									<thead class="listTitle">
										<tr style="height: 25px;">
											<th style="padding: 0px;padding-bottom: 4px;">NO</th>
											<th style="width: 45px;">구분</th>
											<th>교부번호</th>
											<th>교부일자</th>
											<th>조제일자
											<i class="fa-solid fa-circle-question" data-toggle="tooltip" title="최근 7일이내 조제받은 기록이 있을 경우 경고표시로  색이 출력됩니다. "></i>
											</th>
											<th>발행병원</th>
											<th>의사명</th>
											<th>조제약국</th>
											<th style="padding-right: 0;">상태</th>
										</tr>
									</thead>
									<tbody id="preList">
									</tbody>
								</table>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</section>
					<!-- 왼쪽 영역 끝 -->

					<!-- 오른쪽 영역 시작 -->
					<section class="col-lg-6">
						<!-- 상세 처방 내용  -->
						<div class="card card-primary card-outline upCard">
							<div class="card-header">
								<div class="row">
									<div class="col-sm-8">
										<span class="card-title m-0 title">
											<i class='far fa-edit icon-size'></i>
											<span class="header-title">처방 상세 내역</span>
										</span>
									</div>
									<div class="col-sm-4">

									<button class="btn btn-primary btn-sm chemistBtn" onClick="newMedicineForChemist()" id="newMedicineForChemist" disabled="disabled"
										style="margin-right: 8px;  background-color: #6c757d; border: 0px; font-size: 13px !important; padding: 4px;">추가</button>
									<button class="btn btn-primary btn-sm deleteMediBtn" onClick="deleteMediBtnForChemist()" id="deleteMediBtnForChemist" name="deleteMediBtnForChemist" disabled="disabled"
										style="margin-right: 8px;  background-color: #6c757d; border: 0px; font-size: 13px !important; padding: 4px;">삭제</button>
									<button type="submit" class="btn btn-primary btn-sm" onClick="saveNewMedicineForChemist()" id="saveNewMedicineForChemist" disabled="disabled"
										style="margin-right: 8px;  background-color: #6c757d; border: 0px; font-size: 13px !important; padding: 4px;">저장</button>
									<button class="btn btn-primary btn-sm" onClick="newMedicineCancelForChemist()" id="newMedicineCancelForChemist" disabled="disabled"
										style="margin-right: 8px;  background-color: #6c757d; border: 0px; font-size: 13px !important; padding: 4px;">취소</button>

<!-- 										<button onclick="" class="button btnFade preDetailBtn">추가</button> -->
<!-- 										<button onclick="" class="button btnFade preDetailBtn">저장</button> -->
<!-- 										<button onclick="" class="button btnFade preDetailBtn">취소</button> -->
<!-- 										<button onclick="" class="button btnFade preDetailBtn">수정</button> -->
									</div>
								</div>
							</div>
							<div class="card-body " style="height: 20px; padding: 5px;">
								<div class="prescriptionDetailContents">
									<label for="" style="text-align: right;">교부번호</label>
									<input type="text" id="prePsCode" style="width: 85px;" value="" readonly="readonly">

									<label for="" style="text-align: right;">교부일자</label>
									<input type="text" id="prePsDate" style="width: 85px;" value="" readonly="readonly">

									<label for="" style="text-align: right;">발행기관</label>
									<input type="text" id="preHospitalName" style="width: 85px;" value="" readonly="readonly">

									<label for="" style="text-align: right;">의사명</label>
									<input type="text" id="preDoctorName" style="width: 85px;" value="" readonly="readonly">
								</div>

								<div class="prescriptionDetailContents">
									<label for="" style="text-align: right;">조제약국</label>
									<input type="text" id="prePharmacyName" style="width: 85px;" value="" readonly="readonly">

									<label for="" style="text-align: right;">조제약사</label>
									<input type="text" id="prePharmacistName" style="width: 85px;" value="" readonly="readonly">

									<label for="" style="text-align: right;">상&emsp;&emsp;태</label>
									<input type="text" id="prePsStatus" style="width: 85px; border:1px solid black;" value="" readonly="readonly">

									<button class="btn btn-warning btn-sm preUpdateBtn" style="margin-left: 10px; width:130px;" id="preUpdateBtn" disabled="disabled"
									onclick="requestUpdatePre()">처방 수정 요청</button>
								</div>
							</div>

							<div class="card-body table-responsive p-0" style="height: 260px;">
								<table class="table-hover table table-bordered prescriptionChemist" style="width: 100%; table-layout: fixed;">
									<thead class="listTitle">
										<tr class="preForChemistHead" id="preForChemistHead" style="height: 25px;">
											<th style="padding: 0px; padding-bottom: 4px; width: 30px;">NO</th>
											<th style="width: 33px;">구분</th>
											<th style="width: 88px;">약코드</th>
											<th style="width: 214px;">약명</th>
											<th>횟수</th>
											<th>일수</th>
											<th>위치</th>
											<th>재고</th>
											<th style="padding-right: 0;width: 40px;">보험</th>
											<th style="padding-right: 0;width: 40px;">선택</th>
										</tr>
									</thead>
										<tbody id="prescriptionChoiceDetail">
										</tbody>
									</table>
								</div>
							</div>

						<!-- 선택 약품 복약지도, 주의사항, 용법용량 다운로드  -->
						<div class="card card-primary card-outline">
							<div class="card-header" style="padding: 0px; margin: 10px; padding-bottom: 3px;">
								<span>
									<i class='fas fa-capsules icon-size' style="margin-left: 10px;"></i>
									<span class="header-title">약명 : </span><span id="readMName"></span>
								</span>
							</div>
							<div class="card-body" style="padding: 0px; padding-bottom: 12px; justify-content: space-evenly; display: flex;">
								<button id="readMUrl" class="downloadBtn" onclick="location.href='#'">
									상세정보 <i class='far fa-check-circle icon-position'></i>
								</button>
								<button id="readMEffect" class="downloadBtn" onclick="location.href='#'">
									효능효과 <i class='fas fa-sign-in-alt icon-position'></i>
								</button>
								<button id="readMUse" class="downloadBtn" onclick="location.href='#'">
									용법용량 <i class='fas fa-sign-in-alt icon-position'></i>
								</button>
								<button id="readMAttention" class="downloadBtn" onclick="location.href='#'">
									주의사항 <i class='fas fa-sign-in-alt icon-position'></i>
								</button>
							</div>
						</div>

						<!-- 처방영수증 -->
						<div class="card card-primary card-outline" style="height: 338px; overflow: hidden; max-height: 338px;">
							<div class="card-header">
								<div class="row">
									<div class="col-sm-5" style="align-self: center;">
										<span class="card-title">
											<i class='fas fa-cart-plus icon-size'></i>
											<span class="header-title">처방 영수증</span>
										</span>
									</div>
									<div class="col-sm-7">
										<div class="payBtn">
											<button onclick="payment()" class="paymentBtn btn btn-danger" id="check_module" disabled="disabled"
												style="margin-right: 8px; border: 0px; font-size: 14px !important; padding: 4px; line-height: 1px;">결제</button>
											<button class="successBtn btn btn-primary" onclick="paySuccess()" disabled="disabled">조제완료</button>
										</div>
									</div>
								</div>
							</div>

							<div class="card-body" style="height: 318px;">

								<div class="row">
									<!-- 약금액  -->
									<div class="col-lg-6 col-6">
										<table class="table table-bordered receiptLeft" style="margin-bottom: 0px; overflow: auto; table-layout: fixed;">
											<thead>
												<tr>
													<th style="width: 200px; word-break: break-all; white-space: break-spaces;" >약명</th>
													<th>금액(원)</th>
												</tr>
											</thead>
											<tbody id="receiptMoney"></tbody>
										</table>
									</div>
									<div class="col-lg-6 col-6 receiptRight">
										<table class="table-bordered" id="vertical-1"
											style="height: 235px; width: 280px;">
											<tr>
												<th style="width: 130px;">조제일자</th>
												<td id="receiptRightDay"></td>
											</tr>
											<tr>
												<th>약제비총액<br>(①+②+③)
												</th>
												<td id="receiptRightTotal"></td>
											</tr>
											<tr>
												<th>① 본인부담금</th>
												<td id="receiptRightPatient"></td>
											</tr>

											<tr>
												<th>② 보험자부담금</th>
												<td id="receiptRightCharge"></td>
											</tr>
											<tr>
												<th>③ 비급여(전액본인)</th>
												<td id="receiptRightNon"></td>
											</tr>
											<tr>
												<th>총 처방금액</th>
												<td class="receiptRightPatientTotal" id="receiptRightPatientTotal" style="font-weight: bold; font-size: 14px;"></td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</section>
					<!-- 오른쪽 영역 끝 -->
				</div>
				<!-- /.row (main row) -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<div>
			<input type="hidden" id="sessionChemistCode" value="${loginUser.chemistCode }">
			<input type="hidden" id="sessionChemistName" value="${loginUser.memName }">
			<input type="hidden" id="sessionPharmacyCode" value="${loginUser.pharmacyCode }">
			<input type="hidden" id="sessionPharmacyName" value="${loginUser.pharmacyName }">
		</div>
	</div>




<!--  약 이름 길어질 때 ... 으로 표시 -->
<script>
$(document.body).tooltip({
   selector : "[data-toggle='tooltip']"
});
</script>

<%@include file="./prescript_js.jsp" %>
</body>
</html>