<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy. MM. dd");
%>

<!DOCTYPE html>

<!-- 의사 : 처방전 작성 -->

<html>
<head>
<meta charset="UTF-8">
<title>의사</title>
<%-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css?v=3.2.0"> --%>


<style>
body {
	font-size: 12px;
}

label {
	width: 90px;
	margin-left: 10px;
}

.title {
	font-weight: bold;
}

.patientList {
	padding: 0px;
}

th {
	background-color: #E8F5FF;
	text-align: center;
	position: sticky;
	top: 0px;
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

.medicalTxt {
	text-align: left;
}

td {
	text-align: center;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.tableScroll {
	overflow: auto;
}

select {
	box-sizing: border-box;
	/*   width: 100px; */
	padding: 4px;
	font-size: 14px;
	border-radius: 6px;
	float: right;
	height: 30px;
	width: 110px;
}

option {
	padding: 4px;
	font-size: 14px;
	background: #EBF5FF;
}

.selectTxt {
	display: block;
	float: right;
	margin: 10px 10px 0 0;
}

/* 버튼눌렀을때 */
button, button:visited {
	text-decoration: none;
	color: #00AE68;
}

button.button {
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
.preDetailBtn {
	background-color: #6e6e6e;
}

.btnBlueGreen {
	background: #1E82FF;
}

.btnFade.btnBlueGreen:hover {
	background: #0A6EFF;
}

/* 추가 */
.preAddBtn {
	background-color: #FF3232;
}
/* 저장 */
.preStoreBtn {
	background: #1E82FF;
}
/* 취소 */
.preCancelBtn {
	background-color: #FF3232;
}

/* 테이블에 마우스 오버시 메모 */
.arrow_box {
	display: none;
	position: absolute;
	width: 200px;
	padding: 8px;
	left: 0;
	-webkit-border-radius: 8px;
	-moz-border-radius: 8px;
	border-radius: 8px;
	background: #333;
	color: #fff;
	font-size: 14px;
	text-align: left;
}

.arrow_box:after {
	position: absolute;
	bottom: 100%;
	left: 50%;
	width: 0;
	height: 0;
	margin-left: -10px;
	border: solid transparent;
	border-color: rgba(51, 51, 51, 0);
	border-bottom-color: #333;
	border-width: 10px;
	pointer-events: none;
	content: " ";
}

span:hover+p.arrow_box {
	display: block;
}

/* 구분 -> 전문 */
.sortPro {
	background-color: #FEBEBE;
}

/* 처방전작성 -> 약추가, 처방완료버튼 */
.locationBtn {
	display: flex;
	left: 30px;
}

.table td {
	padding: 5px;
}

.card-body.p-0 .table tbody>tr>td:first-of-type, .card-body.p-0 .table tbody>tr>th:first-of-type,
	.card-body.p-0 .table tfoot>tr>td:first-of-type, .card-body.p-0 .table tfoot>tr>th:first-of-type,
	.card-body.p-0 .table thead>tr>td:first-of-type, .card-body.p-0 .table thead>tr>th:first-of-type
	{
	padding-left: 0;
}

.container, .container-fluid, .container-lg, .container-md,
	.container-sm, .container-xl {
	width: 100%;
	/* padding-right: 7.5px; */
	padding-left: 7.5px;
	/* margin-right: auto; */
	/* margin-left: auto; */
}

.abled {
	background-color: #b4b4b4;
}

button:disabled {
	background-color: #6e6e6e;
}

.listTitle !important {
	position: sticky;
	top: 0px;
}
</style>
</head>
<body>
	<div class="content-wrapper">
		<div class="content">
			<div class="container" style="margin-left: 5px;">
				<div class="row">
					<div class="col-lg-12">
						<div class="card card-outline"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4">
						<div class="row-4">
							<div class="card card-primary card-outline" style="">

								<div class="card-header" style="padding-bottom: 20px;">
									<p class="card-title m-0 title"
										style="font-size: 17px; font-weight: bold;">
										<i class='far fa-clipboard' style="font-size: 18px"></i>
										<%= sf.format(nowTime) %>&nbsp;처방 대기 환자 목록<i class='fas fa-redo-alt' style="cursor: pointer; color: #1547ff; padding-left: 32px;" onclick="window.location.reload()"></i>
									</p>
								</div>

								<div class="card-body patientList">
									<div class="row">
										<div class="col-12" style="height: 211px; max-height: 211px;">
											<div class="card">
												<div class="card-body table-responsive p-0 tableScroll" style="height: 210px; max-height: 210px;">
													<table id="example-table-1" class="table-hover table table-bordered" style="table-layout: fixed;">
														<thead class="listTitle" style="">
															<tr>
																<th style="padding-left: 7px; width: 50px;">NO</th>
																<th>환자명</th>
																<th>생년월일</th>
<!-- 																<th>최근처방일</th> -->
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${waitingList }" var="map"
																varStatus="status">
																<tr class="patientTr" value=${map.PATIENT_CODE } onclick="patientClick('${map.PATIENT_CODE }', this)">
																	<td>${status.count }</td>
																	<td>${map.PATIENT_NAME}</td>
																	<td>${map.PATIENT_BIRTH }</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
												<!-- /.card-body -->
												<!-- /.card -->
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>

						<div class="row-4">
							<div class="card card-primary card-outline" style="">

								<div class="card-header" style="padding-bottom: 20px;">
									<p class="card-title m-0 title"
										style="font-size: 17px; font-weight: bold;">
										<i class='fa fa-stethoscope' style="font-size: 18px"></i>
										처방 완료 환자 목록
									</p>
								</div>

								<div class="card-body patientList ">
									<div class="row">
										<div class="col-12" style="height: 236px; max-height: 236px;">
											<div class="card">
												<div class="card-body table-responsive p-0" style="height: 196px;">
													<table id="example-table-1" class="table-hover table table-bordered" style="auto;">
														<thead class="listTitle">
															<tr>
																<th style="padding-left: 7px;">NO</th>
																<th>환자명</th>
																<th>생년월일</th>
																<th>처방시간</th>
															</tr>
														</thead>
														<tbody id="psStatusReadyPatientList">
														</tbody>
													</table>
												</div>
												<!-- /.card-body -->

												<div class="card-footer" id="psStatusReadyPatientPagenation" style="padding-bottom: 7px; padding-top: 8px;">

												</div>
												<!-- /.card -->
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>

						<div class="row-4">
							<div class="card card-primary card-outline" style="">
								<div class="card-header" style="padding-bottom: 24px;">
									<p class="card-title m-0 title"
										style="font-size: 17px; font-weight: bold;">
										<i class='far fa-address-card' style='font-size: 18px'></i> 환자 정보
									</p>
								</div>
								<div class="card-body" style="height: 206px;">
									<form action="" class="" style="font-size: 12px;">
										<div class="patientInfoDetail mb-3">
											<label for="patient_name" style="text-align: right;">이름 : </label> <input type="text" id="patient_name" value="" readonly
												style="border: 0px; font-size: 15px; font-weight: bold;"><br />
										</div>

										<div class="patientInfoDetail mb-3">
											<label for="patient_birth" style="text-align: right;">생년월일 : </label> <input type="text" id="patient_birth" value="" readonly
												style="border: 0px; font-size: 15px; font-weight: bold;"><br />
										</div>

										<div class="patientInfoDetail mb-3">
											<label for="patient_phone" style="text-align: right;">전화번호 : </label> <input type="text" id="patient_phone" value="" readonly
												style="border: 0px; font-size: 15px; font-weight: bold;"><br />
										</div>

										<div class="patientInfoDetail">
											<div style="display: flex;">
												<div>
													<label for="patient_addr" style="text-align: right;">주소 :&nbsp;</label>
												</div>
												<textarea rows="10" cols="10" id="patient_addr2"
													style="resize: none; border: 0px; font-size: 15px; font-weight: bold; width: 180px; height: 54px;"></textarea>
											</div>
										</div>

									</form>
								</div>
							</div>
						</div>
					</div>




					<div class="col-lg-8">
						<!-- 표가 들어갈 곳 -->
						<div class="row-4" style="width: 855px;">
							<div class="card card-primary card-outline ">
								<div class="card-header">
									<p class="card-title m-0 title"
										style="font-size: 17px; font-weight: bold;">
										<i class='fas fa-tasks' style='font-size: 18px'></i> 과거처방이력
									</p>
									<select id="selectDoctor" data-code="" name="select">
										<option value="365" selected="selected">전체</option>
										<option value="30">최근 1개월</option>
										<option value="90">최근 3개월</option>
										<option value="180">최근 6개월</option>
									</select>
									<div class="selectTxt">(최대 1년 처방정보 출력)</div>
								</div>
								<div class="tableScroll" style="height: 208px;">
									<table class="table table-hover table-bordered"
										style="table-layout: fixed; border:0px;">
										<thead>
											<tr>
												<th style="width: 44px;">NO</th>
												<th>교부번호</th>
												<th>교부일자</th>
												<th style="width: 240px;">약명</th>
												<th>발행병원</th>
												<th>의사명</th>
												<th>상태</th>
											</tr>
										</thead>
										<tbody id="prescriptionList">
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<div class="row-4" style="width: 855px;">
							<div class="card card-primary card-outline">
								<div class="card-header">
									<div class="row">
										<div class="col-sm-7">
											<p class="card-title m-0 title"
												style="font-size: 17px; font-weight: bold;">
												<i class='far fa-file-alt' style='font-size: 18px'></i> 처방
												상세 내역
											</p>
										</div>
										<div class="col-sm-5">
											<button onClick="addMedicine()"
												class="btn btn-primary btn-sm" id="addBtn"
												disabled="disabled"
												style="margin-right: 20px; background-color: #6c757d; border: 0px;">추가</button>
											<button onClick="deleteBtn()"
												class="btn btn-primary btn-sm deleteBtn" id="deleteBtn"
												name="deleteBtn" disabled="disabled"
												style="margin-right: 20px; background-color: #6c757d; border: 0px;">삭제</button>
											<button onClick="savePre()" class="btn btn-primary btn-sm"
												id="storeBtn" disabled="disabled"
												style="margin-right: 20px; background-color: #6c757d; border: 0px;">저장</button>
											<button onClick="disableds()" class="btn btn-primary btn-sm"
												id="cancelBtn" disabled="disabled"
												style="margin-right: 20px; background-color: #6c757d; border: 0px;">취소</button>
											<button onClick="preUpdate()" class="btn btn-primary btn-sm"
												disabled="disabled" id="abc"
												style="background-color: #6c757d; border: 0px;">수정</button>
										</div>
									</div>
								</div>
								<div class="tableScroll" style="height: 238px;">
									<form action="updatePro.jsp" name="f" method="post">
										<table class="table table-bordered" id="psCodeUpdate"
											style="overflow: auto;">
											<thead>
												<tr>
													<th style="padding: 10px 0px 10px 0px; width: 24px;">NO</th>
													<th style="padding: 10px 0px 10px 0px; width: 24px;">구분</th>
													<th style="padding: 10px 0px 10px 0px; width: 24px;">분류</th>
													<th style="padding: 10px 0px 10px 0px; width: 80px;">약번호</th>
													<th style="padding: 10px 0px 10px 0px; width: 24px;">투여</th>
													<th style="padding: 10px 0px 10px 0px; width: 53%;">약명</th>
													<th style="padding: 10px 0px 10px 0px; width: 40px;">횟수</th>
													<th style="padding: 10px 0px 10px 0px; width: 40px;">일수</th>
													<th style="padding: 10px 0px 10px 0px; width: 24px;">보험</th>
													<th style="padding: 10px 0px 10px 0px; width: 24px;">선택</th>
												</tr>
											</thead>
											<tbody id="prescriptionDetail">
											</tbody>
										</table>
									</form>
								</div>
							</div>
						</div>

						<!-- 						<form id="frm" name="frm" method="POST" action="newMedicineInsert.do"> -->
						<div class="row-4" style="width: 855px;">
							<div class="card card-primary card-outline">
								<div class="card-header">
									<div class="row">
										<div class="col-sm-8">
											<p class="card-title m-0 title"
												style="font-size: 17px; font-weight: bold;">
												<i class='far fa-edit' style='font-size: 18px'></i> 처방전 작성
											</p>
										</div>
										<div class="col-sm-4 locationBtn">
											<button class="btn btn-primary btn-sm"
												onClick="newMedicine()" id="newMedicine" disabled="disabled"
												style="margin-right: 20px; background-color: #6c757d; border: 0px">추가</button>
											<button class="btn btn-primary btn-sm deleteMediBtn"
												onClick="deleteMediBtn()" id="deleteMediBtn"
												name="deleteMediBtn" disabled="disabled"
												style="margin-right: 20px; background-color: #6c757d; border: 0px;">삭제</button>
											<button type="submit" class="btn btn-primary btn-sm"
												onClick="saveNewMedicine()" id="saveNewMedicine"
												disabled="disabled"
												style="margin-right: 20px; background-color: #6c757d; border: 0px">저장</button>
											<button class="btn btn-primary btn-sm"
												onClick="newMedicineCancel()" id="newMedicineCancel"
												disabled="disabled"
												style="margin-right: 20px; background-color: #6c757d; border: 0px">취소</button>
										</div>
									</div>
								</div>
								<div class="tableScroll" style="height: 209px;">
									<form action="updatePro.jsp" name="f2" method="post">
										<table id="registTable" class="table table-bordered"
											style="margin-bottom: 0px; padding: 0px;">
											<thead>
												<tr>
													<th style="padding: 10px 0px 10px 0px; width: 24px;">NO</th>
													<th style="padding: 10px 0px 10px 0px; width: 24px;">구분</th>
													<th style="padding: 10px 0px 10px 0px; width: 24px;">분류</th>
													<th style="padding: 10px 0px 10px 0px; width: 80px;">약번호</th>
													<th style="padding: 10px 0px 10px 0px; width: 24px;">투여</th>
													<th style="padding: 10px 0px 10px 0px; width: 53%;">약명</th>
													<th style="padding: 10px 0px 10px 0px; width: 40px;">횟수</th>
													<th style="padding: 10px 0px 10px 0px; width: 40px;">일수</th>
													<th style="padding: 10px 0px 10px 0px; width: 24px;">보험</th>
													<th style="padding: 10px 0px 10px 0px; width: 24px;">선택</th>
												</tr>
											</thead>
											<tbody id="addNewPrescription">
											</tbody>
										</table>
									</form>
								</div>
							</div>
						</div>
						<!-- 						</form> -->
					</div>
				</div>
			</div>
		</div>
		<div>
			<input type="hidden" id="doctorName" value="${loginUser.memName }">
			<input type="hidden" id="hospitalCode" value="${loginUser.hospitalCode }">
			<input type="hidden" id="hospitalName" value="${loginUser.hospitalName }">
			<input type="hidden" id="doctorCode" value="${loginUser.doctorCode }">
		</div>
	</div>

	<%-- <script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js?v=3.2.0"></script>

<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/demo.js"></script> --%>


	<script>
		/* 처방완료환자목록*/
		function printPatientDoctor(list, target, templateObject) {
			var template = Handlebars.compile(templateObject.html());
			var html = template(list);
			$('.psStatusReadyPatientListTr').remove();
			target.append(html);
		}
	</script>

	<script>
		window.onload = function() {
			doctorReady()
		}
	</script>

	<!-- 헤지 : 의사)처방완료환자목록  -->
<!-- 	<script  type="text/x-handlebars-template"  id="psStatusReadyPatientList-list-template"> -->
<!-- 		{{#each .}} -->
<!-- 			<tr> -->
<!-- 				<th>{{inc @index}}</th> -->
<!-- 				<th>{{patientName}}</th> -->
<!-- 				<th>{{patientBirth}}</th> -->
<!-- 				<th>{{psTime}}</th> -->
<!-- 			</tr> -->
<!-- 		{{/each}} -->
<!-- 	</script> -->


<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
<%@include file="./doctor_js.jsp" %>
</body>
</html>