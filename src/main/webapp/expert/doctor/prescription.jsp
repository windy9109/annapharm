<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- 의사 : 처방전 작성 -->

<html>
<head>
<meta charset="UTF-8">
<title>의사-처방전작성</title>
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
}

tr:hover{
	cursor: pointer;
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
a, a:visited {
	text-decoration: none;
	color: #00AE68;
}

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
				<div class="row">
					<div class="col-lg-4">
						<div class="card card-primary card-outline" style="height: 600px;">
							<div class="card-header">
								<h5 class="card-title m-0 title">처방 대기 환자 목록</h5>
							</div>
							<div class="card-body patientList ">
								<div class="row">
									<div class="col-12">
										<div class="card">
											<div class="card-body table-responsive p-0">
												<table class="table-hover table table-bordered">
													<thead class="listTitle">
														<tr>
															<th>NO</th>
															<th>환자명</th>
															<th>생년월일</th>
															<th>최근처방일</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>24</td>
															<td>이순신</td>
															<td>981215</td>
															<td>2022.01.25</td>
														</tr>
														<tr>
															<td>25</td>
															<td>홍길동</td>
															<td>990101</td>
															<td>2022.05.11</td>
														</tr>
														<tr>
															<td>26</td>
															<td>개나리</td>
															<td>850224</td>
															<td>2021.10.27</td>
														</tr>
														<tr>
															<td>27</td>
															<td>박보검</td>
															<td>940812</td>
															<td>2022.06.11</td>
														</tr>
														<tr>
															<td>28</td>
															<td>이순신</td>
															<td>750928</td>
															<td>2021.09.15</td>
														</tr>
														<tr>
															<td>29</td>
															<td>박효신</td>
															<td>851017</td>
															<td>2019.10.08</td>
														</tr>
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
						<div class="card card-primary card-outline">
							<div class="card-header">
								<h5 class="card-title m-0 title">환자 정보</h5>
							</div>
							<div class="card-body" style="height: 206px;">
								<form action="" class="" style="font-size: 13px;">
									<div class="patientInfoDetail mb-3">
										<label for="total_salesCount" style="text-align: right;">이름</label>
										<input type="text" id="total_salesCount" value="홍길동" readonly><br />
									</div>

									<div class="patientInfoDetail mb-3">
										<label for="total_salesFee" style="text-align: right;">생년월일</label>
										<input type="text" id="total_salesFee" value="990101" readonly><br />
									</div>

									<div class="patientInfoDetail mb-3">
										<label for="total_compoundingFee" style="text-align: right;">전화번호</label>
										<input type="text" id="total_compoundingFee"
											value="010-****-1234" readonly><br />
									</div>

									<div class="patientInfoDetail">
										<label for="total_carge" style="text-align: right;">주소</label>
										<input type="text" id="total_carge" value="대전광역시 중구 계룡로 846 3층 304호"
											readonly><br />
									</div>

								</form>
							</div>
						</div>
					</div>

					<div class="col-lg-8">
						<!-- 표가 들어갈 곳 -->
						<div class="row-4">
							<div class="card card-primary card-outline ">
								<div class="card-header">
									<h5 class="card-title m-0 title">과거처방이력</h5>
									<select name="select">
										<option value="none" selected>전체</option>
										<option value="최근 1개월">최근 1개월</option>
										<option value="최근 3개월">최근 3개월</option>
										<option value="최근 6개월">최근 6개월</option>
									</select>
									<div class="selectTxt">(최대 1년 처방정보 출력)</div>
								</div>
								<div class="tableScroll" style="height: 208px;">
									<table class="table table-hover table-bordered">
										<thead>
											<tr>
												<th>NO</th>
												<th>교부번호</th>
												<th>교부일자</th>
												<th>약명</th>
												<th>발행병원</th>
												<th>의사명</th>
												<th>상태</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>5</td>
												<td>2206270001</td>
												<td>22.06.27</td>
												<td class="medicalTxt">에트론가나콘정50밀리그램 외 3개</td>
												<td>DDIT병원</td>
												<td>오반짝</td>
												<td class="statusReady">조제대기</td>
											</tr>
											<tr>
												<td>4</td>
												<td>2206270025</td>
												<td>22.06.25</td>
												<td class="medicalTxt">에이프로젠카르베딜롤정 외 1개</td>
												<td>DDIT병원</td>
												<td>오반짝</td>
												<td class="statusUpdate"><span>수정요청</span>
													<p class="arrow_box">약국명 : 똥글똥글약국 <br> 약사명 : 김똥그리 <br> 수정요청합니다.</p>
												</td>
											</tr>
											<tr>
												<td>3</td>
												<td>2206010101</td>
												<td>22.06.01</td>
												<td class="medicalTxt">카디올정(카르베딜롤) 외 5개</td>
												<td>바른니치과</td>
												<td>박바른</td>
												<td class="statusEnd">조제완료</td>
											</tr>
											<tr>
												<td>2</td>
												<td>2205270031</td>
												<td>22.05.27</td>
												<td class="medicalTxt">레고켐카르베딜롤정 외 4개</td>
												<td>돌멩이외과</td>
												<td>오돌멩</td>
												<td class="statusEnd">조제완료</td>
											</tr>
											<tr>
												<td>1</td>
												<td>2109270021</td>
												<td>21.09.27</td>
												<td class="medicalTxt">록소젠정(내복) 외 3개</td>
												<td>바른니치과</td>
												<td>박바른</td>
												<td class="statusEnd">조제완료</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<div class="row-4">
							<div class="card card-primary card-outline">
								<div class="card-header">
									<div class="row">
										<div class="col-sm-7">
											<h5 class="card-title m-0 title">처방 내역</h5>
										</div>
										<div class="col-sm-5">
											<a href="" class="button btnFade preDetailBtn"
												style="margin-right: 20px;">추가</a> <a href=""
												class="button btnFade preDetailBtn"
												style="margin-right: 20px;">저장</a> <a href=""
												class="button btnFade preDetailBtn"
												style="margin-right: 20px;">취소</a> <a
												href="prescriptionModifyRequest.jsp"
												class="button btnFade btnBlueGreen">수정</a>
										</div>
									</div>
								</div>
								<div class="tableScroll" style="height: 235px;">
									<table class="table table-bordered" style="overflow: auto;">
										<thead>
											<tr>
												<th>NO</th>
												<th>구분</th>
												<th>분류</th>
												<th>약코드</th>
												<th>투여</th>
												<th>약명</th>
												<th>횟수</th>
												<th>일수</th>
												<th>보험</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>4</td>
												<td class="statusReady">전문</td>
												<td>131</td>
												<td>692001201</td>
												<td>외용</td>
												<td class="medicalTxt">에트론가나콘정50밀리그램</td>
												<td>3</td>
												<td>1</td>
												<td>급여</td>
											</tr>
											<tr>
												<td>3</td>
												<td class="statusReady">전문</td>
												<td>131</td>
												<td>692004123</td>
												<td>외용</td>
												<td class="medicalTxt">건알펠로디핀정5밀리그램</td>
												<td>3</td>
												<td>1</td>
												<td>급여</td>
											</tr>
											<tr>
												<td>2</td>
												<td class="statusReady">전문</td>
												<td>131</td>
												<td>692007891</td>
												<td>외용</td>
												<td class="medicalTxt">진타주250IU(모록토코그알파)(혈액응고인자VIII, 유전자재조합)</td>
												<td>4</td>
												<td>3</td>
												<td>급여</td>
											</tr>
											<tr>
												<td>1</td>
												<td class="statusReady">전문</td>
												<td>131</td>
												<td>692009511</td>
												<td>외용</td>
												<td class="medicalTxt">포크랄시럽(포수클로랄)_(1g/50mL)</td>
												<td>4</td>
												<td>3</td>
												<td>급여</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<div class="row-4">
							<div class="card card-primary card-outline">
								<div class="card-header">
									<div class="row">
										<div class="col-sm-9">
											<h5 class="card-title m-0 title">처방전 작성</h5>
										</div>
										<div class="col-sm-3 locationBtn">

											<%-- <a href="" onclick="window.open('<%=request.getContextPath() %>/addMedicinal/addMedicinalDoctor.jsp','약추가','width=100,height=100');" class="button btnFade btnBlueGreen" style="margin-right: 20px;">약추가</a> --%>
											<a href=""
												onclick="window.open('<%=request.getContextPath()%>/addMedicinal/addMedicinalDoctor.jsp','약등록','width=700,height=950,left=600,top=600,location=no,status=no,scrollbars=yes');"
												class="button btnFade btnBlueGreen"
												style="margin-right: 20px;">약추가</a>
											<a href="" class="button btnFade btnBlueGreen">작성 완료</a>
										</div>
									</div>
								</div>
								<div class="tableScroll" style="height: 233px;">
									<table class="table table-bordered" style="margin-bottom: 0px; padding:0px;">
										<thead>
											<tr>
												<th style="width:34px;padding:7px 0px 7px 0px;">NO</th>
												<th style="width:34px;padding:7px 0px 7px 0px;">구분</th>
												<th style="width:40px;padding:7px 0px 7px 0px;">분류</th>
												<th style="width:79px;padding:7px 0px 7px 0px;">약코드</th>
												<th style="width:49px;padding:7px 0px 7px 0px;">투여</th>
												<th style="width:306px;padding:7px 0px 7px 0px;">약명</th>
												<th style="width: 48px;padding:7px 0px 7px 0px;">횟수</th>
												<th style="width: 48px;padding:7px 0px 7px 0px;">일수</th>
												<th style="width: 48px;padding:7px 0px 7px 0px;">보험</th>
												<th style="width: 27px;padding:7px 0px 7px 0px;"></th>
											</tr>
										</thead>
									</table>
									<div style="width: 100%; height: 190px; overflow: auto;">
										<table class="table table-bordered">
											<tbody>
												<tr style="height: 30px;">
													<td style="width: 34px;">4</td>
													<td class="statusReady">전문</td>
													<td style="width: 44px">131</td>
													<td style="width: 82px;">692001201</td>
													<td style="width: 52px;">외용</td>
													<td class="medicalTxt" style="width: 320px;">에트론가나콘정50밀리그램</td>
													<td style="width: 50px;">3</td>
													<td style="width: 48px;">1</td>
													<td style="width: 48px;">급여</td>
													<td style="width: 31px;"></td>
												</tr>
												<tr style="height: 30px;">
													<td>3</td>
													<td class="statusReady">전문</td>
													<td>131</td>
													<td>692004123</td>
													<td>외용</td>
													<td class="medicalTxt">건알펠로디핀정5밀리그램</td>
													<td>3</td>
													<td>1</td>
													<td>급여</td>
													<td></td>
												</tr>
												<tr style="height: 30px;">
													<td>2</td>
													<td class="statusReady">전문</td>
													<td>131</td>
													<td>692007891</td>
													<td>외용</td>
													<td class="medicalTxt">진타주250IU(모록토코그알파)(혈액응고인자VIII,
														유전자재조합)</td>
													<td>4</td>
													<td>3</td>
													<td>급여</td>
													<td></td>
												</tr>
												<tr style="height: 30px;">
													<td>1</td>
													<td class="statusReady">전문</td>
													<td>131</td>
													<td>692009511</td>
													<td>외용</td>
													<td class="medicalTxt">포크랄시럽(포수클로랄)_(1g/50mL)</td>
													<td>4</td>
													<td>3</td>
													<td>급여</td>
													<td></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>


			</div>

		</div>
	</div>

	<%-- <script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js?v=3.2.0"></script>

<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/demo.js"></script> --%>

</body>
</html>