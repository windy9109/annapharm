<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.newPreBtn:hover {
	background: #355E99;
}

/* 결제, 조제완료 버튼 div */
.payBtn {
	margin: 18px;
	text-align: center;
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
	margin-right: 30px;
}

.paymentBtn:hover {
	background-color: #FF0000;
}

/* 조제완료 버튼 */
.successBtn {
	background-color: #6e6e6e;
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
.preDetailBtn {
	background-color: #6e6e6e;
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
.preDetailBtn{
	background-color: #FF4646;
}

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
	color: #FFF;
	border-radius: 5px;
	border: 0px;
	transition: all 0.2s;
	width: 95px;
	height: 20px;
	line-height: 0px;
	margin-left: 10px;
	background-color: #FFA500;
}

.preUpdateBtn:hover {
	background: #FF8200;
}

/* 복약지도, 주의사항, 용법용량 다운버튼들 */
.downloadBtn {
	width: 100px;
	height: 30px;
	border: 1.5px solid #0A6ECD;
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
	max-width: 200px;
	text-align: left;
}
</style>

</head>
<body>

	<div class="content-wrapper">
		<div class="content">
			<div class="container">
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
								<div class="card card-primary card-outline"
									style="height: 400px;">
									<div class="card-header">
										<h5 class="card-title m-0 title">
											<i class='far fa-address-card' style='font-size: 20px'></i>
											환자 정보
										</h5>
									</div>

									<div class="card card-primary">
										<div class="card-body" style="text-align: center;">
											<form action="" class="" style="font-size: 12px;">
												<div class="patientInfoDetail mb-3">
													<label for="total_salesCount" style="text-align: right;">이&emsp; &nbsp;름</label>
													<input type="text" id="total_salesCount" value="홍길동"><br />
												</div>

												<div class="patientInfoDetail mb-3">
													<label for="total_salesFee" style="text-align: right;">생년월일</label>
													<input type="text" id="total_salesFee" value="990101"><br />
												</div>

												<div class="patientInfoDetail mb-3">
													<label for="total_compoundingFee"
														style="text-align: right;">전화번호</label> <input type="text"
														id="total_compoundingFee" value="010-****-1234"><br />
												</div>
											</form>
											<div class="addViewBtn">
												<button onclick="window.open('<%=request.getContextPath() %>/phramacistOnly/addPatient.jsp','환자등록','width=400,height=270,left=600,top=300,location=no,status=no,scrollbars=yes');" 
												class="button btnFade btnBlueGreen addBtn" style="width: 70px; margin-right: 25px;">등록</button>
												<button class="button btnFade btnBlueGreen viewBtn" style="width: 70px;">조회</button>
											</div>
										</div>
									</div>
									<div class="card" style="font-size: 12px;">
										<div class="card-body table-responsive p-0">
											<table class="table-hover table table-bordered">
												<thead class="listTitle">
													<tr style="height: 25px;">
														<th style="padding: 0px;padding-bottom: 4px;">NO</th>
														<th>환자명</th>
														<th>주민번호</th>
														<th>전화번호</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>1</td>
														<td>홍길동</td>
														<td>990101-1******</td>
														<td>010-****-1234</td>
													</tr>
													<tr>
														<td>2</td>
														<td>홍길동</td>
														<td>990101-1******</td>
														<td>010-****-4567</td>
													</tr>
												</tbody>
											</table>
										</div>
										<!-- /.card-body -->
									</div>

								</div>

							</div>
							<div class="col-lg-5 col-5">
								<div class="card  card-primary card-outline"
									style="height: 400px;">
									<div class="card-header">
										<h5 class="card-title ">
											<i class='far fa-calendar-plus' style='font-size: 20px'></i>
											약국 대기 목록
										</h5>
									</div>
									<div class="card-body" style="padding: 0px; font-size: 12px;">
										<table class="table-hover table table-bordered">
											<thead class="listTitle">
												<tr>
													<th>NO</th>
													<th>환자명</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>24</td>
													<td>이순신</td>
												</tr>
												<tr>
													<td>25</td>
													<td>홍길동</td>
												</tr>
												<tr>
													<td>26</td>
													<td>개나리</td>
												</tr>
												<tr>
													<td>27</td>
													<td>박보검</td>
												</tr>
												<tr>
													<td>28</td>
													<td>이순신</td>
												</tr>
												<tr>
													<td>29</td>
													<td>박효신</td>
												</tr>
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
									<div class="col-sm-9">
										<h5 class="card-title m-0 title">
											<i class='far fa-file-alt' style='font-size: 20px'></i> 과거 처방 이력
										</h5>
									</div>
									<div class="col-sm-3">
										<a onclick="window.open('<%=request.getContextPath() %>/addMedicinal/addMedicinalPharma.jsp','약등록','width=700,height=950,left=600,top=600,location=no,status=no,scrollbars=yes');"  
										href="" class="newPreBtn">새처방</a> 
									</div>
								</div>
							</div>
							<!-- /.card-header -->
							<div class="card-body table-responsive p-0"
								style="height: 398px;">
								<table class="table-hover table table-bordered">
									<thead class="listTitle">
										<tr style="height: 25px;">
											<th style="padding: 0px;padding-bottom: 4px;">NO</th>
											<th style="width: 45px;">구분</th>
											<th>교부번호</th>
											<th>교부일자</th>
											<th>조제일자</th>
											<th>발행병원</th>
											<th>의사명</th>
											<th>조제약국</th>
											<th style="padding-right: 0;">상태</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>7</td>
											<td>처방</td>
											<td>2206270001</td>
											<td>22.06.27</td>
											<td>-</td>
											<td>DDIT병원</td>
											<td>오반짝</td>
											<td>-</td>
											<td class="statusReady">조제대기</td>
										</tr>
										<tr>
											<td>6</td>
											<td>처방</td>
											<td>2206270025</td>
											<td>22.06.25</td>
											<td>22.06.25</td>
											<td>DDIT병원</td>
											<td>오반짝</td>
											<td>똥글똥글약국</td>
											<td class="statusEnd">조제완료</td>
										</tr>
										<tr>
											<td>5</td>
											<td>비처방</td>
											<td>-</td>
											<td>-</td>
											<td>22.07.01</td>
											<td>-</td>
											<td>-</td>
											<td>동그라미ㅇ약국</td>
											<td class="statusEnd">조제완료</td>
										</tr>
										<tr>
											<td>4</td>
											<td>처방</td>
											<td>2206010101</td>
											<td>22.06.01</td>
											<td>22.06.02</td>
											<td>바른니치과</td>
											<td>박바른</td>
											<td>다나아약국</td>
											<td class="statusEnd">조제완료</td>
										</tr>
										<tr>
											<td>3</td>
											<td>처방</td>
											<td>2205270031</td>
											<td>22.05.27</td>
											<td>22.05.27</td>
											<td>돌멩이외과</td>
											<td>오돌멩</td>
											<td>돌멩이약국</td>
											<td class="statusEnd">조제완료</td>
										</tr>
										<tr>
											<td>2</td>
											<td>비처방</td>
											<td>-</td>
											<td>-</td>
											<td>22.07.01</td>
											<td>-</td>
											<td>-</td>
											<td>똥글똥글약국</td>
											<td class="statusEnd">조제완료</td>
										</tr>
										<tr>
											<td>1</td>
											<td>처방</td>
											<td>2109270021</td>
											<td>21.09.27</td>
											<td>21.10.01</td>
											<td>바른니치과</td>
											<td>박바른</td>
											<td>다나아약국</td>
											<td class="statusEnd">조제완료</td>
										</tr>
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
						<div class="card card-primary card-outline">
							<div class="card-header">
								<div class="row">
									<div class="col-sm-7">
										<h5 class="card-title m-0 title">
										<i class='far fa-edit' style='font-size:20px'></i> 처방 상세 내역</h5>
									</div>
									<div class="col-sm-5">
										<a href="" onclick="window.open('<%=request.getContextPath() %>/addMedicinal/addMedicinalPharma.jsp','약등록','width=700,height=950,left=600,top=600,location=no,status=no,scrollbars=yes');"
										   class="button btnFade preDetailBtn" style="margin-right: 10px;width: 40px;">추가</a> 
										<a href="<%=request.getContextPath() %>/expert/prescript/pharmacist_prescript.jsp" class="button btnFade btnBlueGreen" style="margin-right: 10px;width: 40px;">저장</a> 
										<a href="" class="button btnFade preDetailBtn" style="margin-right: 10px;width: 40px;">취소</a> 
										<a href="" class="button btnFade btnBlueGreen" style="width: 40px;">수정</a>
									</div>
								</div>
							</div>
							<div class="card-body " style="height: 57px; padding: 5px;">
								<div class="">
									<label for="" style="text-align: right;">교부번호</label> <input
										type="text" style="width: 85px;" value="2206270001"
										readonly="readonly"> <label for=""
										style="text-align: right;">교부일자</label> <input type="text"
										style="width: 85px;" value="22.06.27" readonly="readonly">

									<label for="" style="text-align: right;">발행기관</label> <input
										type="text" style="width: 85px;" value="DDIT병원"
										readonly="readonly"> <label for=""
										style="text-align: right;">의사명</label> <input type="text"
										style="width: 85px;" value="오반짝" readonly="readonly">
								</div>
								<div class="">
									<label for="" style="text-align: right;">조제약국</label> <input
										type="text" style="width: 85px;" value="똥글똥글약국"
										readonly="readonly"> <label for=""
										style="text-align: right;">조제약사</label> <input type="text"
										style="width: 85px;" value="김동글" readonly="readonly">

									<label for="" style="text-align: right;">상&emsp;&emsp;태</label>
									<input type="text" style="width: 85px; background-color: #FF5A5A; color:white;border:1px solid black;" value="조제대기" readonly="readonly">

									<button class="preUpdateBtn">처방 수정 요청</button>
								</div>
							</div>

							<div class="card-body table-responsive p-0" style="height: 260px;">
								<table class="table-hover table table-bordered" style="width: 100%;">
									<thead class="listTitle">
										<tr style="height: 25px;">
											<th style="padding: 0px; padding-bottom: 4px; width: 30px;">NO</th>
											<th style="width: 33px;">구분</th>
											<th style="width: 88px;">약코드</th>
											<th style="width: 214px;">약명</th>
											<th>횟수</th>
											<th>일수</th>
											<th>위치</th>
											<th>재고</th>
											<th style="padding-right: 0;width: 40px;">보험</th>
										</tr>
									</thead>
								</table>
								<div style="width: 100%; overflow: hidden;">
									<table class="table-hover table table-bordered">
										<tbody>
											<tr>
												<td style="width:30px;">4</td>
												<td class="statusReady" style="width: 33px;">전문</td>
												<td style="width: 78px;">644206400</td>
												<td class="ellipsis_name" style="width: 200px;">에트론가나콘정50밀리그램</td>
												<td style="width: 34px;"><input type="number" name="favnum" style="width: 33px;" min="1" max="50"></td>
												<td style="width: 34px;"><input type="number" name="favnum" style="width: 33px;" min="1" max="50"></td>
												<td style="width: 34px;">A1</td>
												<td style="width: 34px;">50</td>
												<td style="width: 43px;">급여</td>
											</tr>
											<tr>
												<td>3</td>
												<td class="statusReady">전문</td>
												<td>644206412</td>
												<td class="ellipsis_name">건알펠로디핀정5밀리그람</td>
												<td><input type="number" name="favnum" style="width: 33px;" min="1" max="50"></td>
												<td><input type="number" name="favnum" style="width: 33px;" min="1" max="50"></td>
												<td>A1</td>
												<td>21</td>
												<td>급여</td>
											</tr>
											<tr>
												<td>2</td>
												<td class="statusReady">전문</td>
												<td>644206487</td>
												<td class="ellipsis_name">진타주250IU(모록토코그알파)(혈액응고인자VIII, 유전자재조합)</td>
												<td><input type="number" name="favnum" style="width: 33px;" min="1" max="50"></td>
												<td><input type="number" name="favnum" style="width: 33px;" min="1" max="50"></td>
												<td>A1</td>
												<td>40</td>
												<td>비급여</td>
											</tr>
											<tr>
												<td>1</td>
												<td class="statusReady">전문</td>
												<td>644206424</td>
												<td class="ellipsis_name">포크랄시럽(포수클로랄)_(1g/50mL)</td>
												<td><input type="number" name="favnum" style="width: 33px;" min="1" max="50"></td>
												<td><input type="number" name="favnum" style="width: 33px;" min="1" max="50"></td>
												<td>A1</td>
												<td>30</td>
												<td>급여</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<!-- 선택 약품 복약지도, 주의사항, 용법용량 다운로드  -->
						<div class="card card-primary card-outline">
							<div class="card-header" style="padding: 0px; margin: 10px;">
								<p style="font-size: 14px;">
									<i class='fas fa-capsules' style="font-size: 20px;margin-left: 10px;"></i> 약명 :
									에트론가나콘정50밀리그램
								</p>
							</div>
							<div class="card-body"
								style="padding: 0px; padding-bottom: 12px;">
								<button class="downloadBtn">
									상세정보 <i class='far fa-check-circle' style='font-size: 16px'></i>
								</button>
								<button class="downloadBtn">
									복약지도 <i class='fas fa-sign-in-alt' style='font-size: 16px'></i>
								</button>
								<button class="downloadBtn">
									용법용량 <i class='fas fa-sign-in-alt' style='font-size: 16px'></i>
								</button>
								<button class="downloadBtn">
									주의사항 <i class='fas fa-sign-in-alt' style='font-size: 16px'></i>
								</button>
							</div>
						</div>

						<!-- 처방영수증 -->
						<div class="card card-primary card-outline">
							<div class="card-header">
								<h5 class="card-title">
									<i class='fas fa-cart-plus' style='font-size:20px'></i> 처방 영수증
								</h5>
							</div>

							<div class="card-body" style="height: 318px;">

								<div class="row">
									<!-- 약금액  -->
									<div class="col-lg-6 col-6">
										<table class="table table-bordered"
											style="margin-bottom: 0px;">
											<thead>
												<tr>
													<th style="width: 233px;">약명</th>
													<th style="width: 83px;">금액(원)</th>
												</tr>
											</thead>
										</table>
										<div style="width: 100%; height: 240px; overflow: auto;">
											<table class="table table-bordered">
												<tbody>
													<tr>
														<td style="width: 240px;">에트론가나콘정50밀리그램</td>
														<td style="width: 83px;">900</td>
													</tr>

													<tr>
														<td>건알펠로디핀정5밀리그람</td>
														<td>1,100</td>
													</tr>
													<tr>
														<td>진타주250IU(모록토코그알파)(혈액응고인자VIII, 유전자재조합)</td>
														<td>16,000</td>
													</tr>
													<tr>
														<td>포크랄시럽(포수클로랄)_(1g/50mL)</td>
														<td>22,010</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="col-lg-6 col-6 receiptRight">
										<table class="table-bordered" id="vertical-1"
											style="height: 235px; width: 255px;">
											<tr>
												<th>조제일자</th>
												<td>2022.07.02</td>
											</tr>
											<tr>
												<th>약제비총액<br>(①+②+③)
												</th>
												<td>30,200</td>
											</tr>
											<tr>
												<th>① 본인부담금</th>
												<td>12,500</td>
											</tr>
											<tr>
												<th>② 보험자부담금</th>
												<td>17,700</td>
											</tr>
											<tr>
												<th>③ 비급여(전액본인)</th>
												<td>0</td>
											</tr>
											<tr>
												<th>총 처방금액</th>
												<td>12,500</td>
											</tr>
										</table>
										
										<div class="payBtn">
												<button class="paymentBtn">결제</button>
												<button class="successBtn">조제완료</button>
										</div>
										
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
	</div>
</body>
</html>