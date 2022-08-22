<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 의사 : 약 추가하는 창 -->


<html>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">

<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>



<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body, .selectBox, .searchBox {
	font-size: 12px;
}

/*~~~ 버튼 스타일 ~~~*/
a.button {
	display: block;
	position: relative;
	float: left;
	width: 55px;
	height: 40px;
	padding: 5px;
	margin: 0px 1px 0px 5px;
	font-weight: 600;
	text-align: center;
	line-height: 30px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
}

.btnBlueGreen {
	background: #1E82FF;
}

.btnFade.btnBlueGreen:hover {
	background: #0A6EFF;
}

.btnBlueRed {
	background: #FF4646;
}

.btnFade.btnBlueRed:hover {
	background: #FF0000;
}
/* [추가∨ ], [QR코드인식] Div*/
.addBtnDiv {
	margin: 20px;
	text-align: center;
}

/* [추가∨  ] 버튼  */
.addBtn {
	font-weight: bold;
	width: 12%;
	border: 1px solid gray;
	margin-right: 30px;
}

/* []QR코드인식] 버튼 */
.qrBtn {
	width: 55px;
	height: 40px;
	padding: 5px;
	margin: 0px 1px 0px 5px;
	font-weight: 600;
	text-align: center;
	line-height: 30px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
	background: #1E82FF;
}

.btnFade.btnBlueGreen:hover {
	background: #0A6EFF;
}

/* 약목록 스크롤 */
.tableScroll {
	overflow: auto;
}

/* 표 머리행 */
th {
	background-color: #E8F5FF;
	text-align: center;
	position: sticky;
	top: 0px;
}

.table td, .table th {
	padding: 4px;
}

.tableTextCenter {
	text-align: center;
}

.card-body.p-0 .table thead>tr>th:first-of-type {
	padding: 0;
}
/* 구분 -> 전문 */
.sortPro {
	background-color: #FEBEBE;
}

/* 구분 -> 일반 */
.sortGeneral {
	background-color: #AFDDFA;
}
</style>
</head>
<body>

	<div class="content-wrapper" style="min-height: 915px;">
		<section class="content">
			<div class="row">


				<div class="col-md-12">
					<div class="card card-primary">
						<div class="card-header">
							<h5 class="card-title">약추가</h5>
						</div>
						<!-- /.card-header -->
						<div class="card-body" style="height: 885px;">

							<div class="row">
								<select id="inputStatus" style="width: 75px;"
									class="form-control custom-select selectBox">
									<option selected="" disabled="">구분</option>
									<option>전체</option>
									<option>전문</option>
									<option>일반</option>
								</select> <select id="inputStatus"
									class="form-control custom-select selectBox"
									style="margin-left: 5px; width: 100px;">
									<option selected="" disabled="">분류코드</option>
									<option>전체</option>
									<option value="100">100-신경계 감각기관용 의약품</option>
									<option value="110">110-중추신경계용 약</option>
									<option value="111">111-전신마취제</option>
									<option value="112">112-최면진정제</option>
									<option value="113">113-항전간제</option>
									<option value="114">114-해열,진통,소염제</option>
									<option value="115">115-각성제,흥분제</option>
									<option value="116">116-진훈제</option>
									<option value="117">117-정신신경용제</option>
									<option value="119">119-기타의 중추신경용 약</option>
									<option value="120">120-말초신경계용 약</option>
									<option value="121">121-국소마취제</option>
									<option value="122">122-골격근이완제</option>
								</select>

								<div class="form-group">
									<div class="input-group input-group-lg">
										<input type="search"
											class="form-control form-control-lg searchBox"
											placeholder="약명을 입력하세요."
											style="height: 40px; margin-left: 5px; font-size: 12px; width: 290px;">
										<div class="input-group-append">
											<button type="submit" class="btn btn-lg btn-default"
												style="height: 40px;">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
								</div>

<%-- 								<%=request.getContextPath() %>/expert/prescript/pharmacist_prescriptModify.jsp --%>
								<div>
									<a onClick="test()" href="" class="button btnFade btnBlueRed">추가</a> 
									<a onClick="window.close()" href="" class="button btnFade btnBlueGreen">취소</a>
								</div>
								<br>
								<p style="margin: 1px; color: gray;">※ 마약, 한외마약, 향정 약품은 구분 옆
									아이콘 표시 ※</p>
							</div>

							<div class="card card-primary  card-outline"
								style="height: 400px;">
								<div class="card-body" style="padding: 0px;">
									<table class="table table-bordered" style="margin-bottom: 0px;">
										<thead class="listTitle">
											<tr>
												<th style="width: 36px; text-align: center;">NO</th>
												<th style="width: 56px;">구분</th>
												<th style="width: 32px; text-align: center;">분류</th>
												<th style="width: 89px;">약코드</th>
												<th style="width: 37px;">투여</th>
												<th style="width: 242px;">약명</th>
												<th>재고</th>
												<th>단위</th>
												<th style="width: 61px;">보험</th>
											</tr>
										</thead>
									</table>
									<div style="width: 100%; height: 372px; overflow: auto;">
										<table class="table table-bordered">

											<tbody>
												<tr>
													<td style="width: 37px;">1</td>
													<td class="sortPro" style="width: 55px;">전문 <i
														class='fas fa-exclamation-triangle'
														style='font-size: 15px;'></i></td>
													<td style="width: 30px;">131</td>
													<td style="width: 90px;">692001201</td>
													<td style="width: 37px;">외용</td>
													<td>프레드포르테점안액</td>
													<td>50</td>
													<td>병</td>
													<td style="width: 45px;">급여</td>
												</tr>
												<tr>
													<td>2</td>
													<td class="sortPro">전문 <i
														class='fas fa-exclamation-triangle'
														style='font-size: 15px;'></i></td>
													<td>131</td>
													<td>692004561</td>
													<td>외용</td>
													<td>오큐시클로점안액</td>
													<td>9</td>
													<td>병</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>3</td>
													<td class="sortPro">전문</td>
													<td>131</td>
													<td>692007891</td>
													<td>내복</td>
													<td>솔로젠정</td>
													<td>15</td>
													<td>개</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>4</td>
													<td class="sortGeneral">일반</td>
													<td>131</td>
													<td>692009511</td>
													<td>내복</td>
													<td>타이레놀500밀리그램</td>
													<td>87</td>
													<td>개</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>5</td>
													<td class="sortGeneral">일반</td>
													<td>131</td>
													<td>692009511</td>
													<td>외용</td>
													<td>프레드포르테점안액</td>
													<td>40</td>
													<td>병</td>
													<td>비급여</td>
												</tr>
												<tr>
													<td>6</td>
													<td class="sortPro">전문 <i
														class='fas fa-exclamation-triangle'
														style='font-size: 15px;'></i></td>
													<td>131</td>
													<td>692009511</td>
													<td>외용</td>
													<td>오큐시클로점안액</td>
													<td>13</td>
													<td>병</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>7</td>
													<td class="sortPro">전문</td>
													<td>131</td>
													<td>692009511</td>
													<td>내복</td>
													<td>록소젠정</td>
													<td>24</td>
													<td>개</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>8</td>
													<td class="sortGeneral">일반 <i
														class='fas fa-exclamation-triangle'
														style='font-size: 15px;'></i></td>
													<td>131</td>
													<td>692009511</td>
													<td>내복</td>
													<td>록소젠정</td>
													<td>65</td>
													<td>개</td>
													<td>비급여</td>
												</tr>
												<tr>
													<td>9</td>
													<td class="sortPro">전문</td>
													<td>131</td>
													<td>692009511</td>
													<td>내복</td>
													<td>록소젠정</td>
													<td>10</td>
													<td>개</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>10</td>
													<td class="sortPro">전문</td>
													<td>131</td>
													<td>692009511</td>
													<td>내복</td>
													<td>록소젠정</td>
													<td>24</td>
													<td>개</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>11</td>
													<td class="sortPro">전문</td>
													<td>131</td>
													<td>692001201</td>
													<td>외용</td>
													<td>프레드포르테점안액</td>
													<td>55</td>
													<td>병</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>12</td>
													<td class="sortGeneral">일반</td>
													<td>131</td>
													<td>692004561</td>
													<td>외용</td>
													<td>오큐시클로점안액</td>
													<td>34</td>
													<td>병</td>
													<td>비급여</td>
												</tr>
												<tr>
													<td>13</td>
													<td class="sortPro">전문</td>
													<td>131</td>
													<td>692007891</td>
													<td>내복</td>
													<td>솔로젠정</td>
													<td>9</td>
													<td>개</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>14</td>
													<td class="sortPro">전문</td>
													<td>131</td>
													<td>692009511</td>
													<td>내복</td>
													<td>타이레놀500밀리그램</td>
													<td>65</td>
													<td>개</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>15</td>
													<td class="sortPro">전문 <i
														class='fas fa-exclamation-triangle'
														style='font-size: 15px;'></i></td>
													<td>131</td>
													<td>692009511</td>
													<td>외용</td>
													<td>프레드포르테점안액</td>
													<td>24</td>
													<td>개</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>16</td>
													<td class="sortGeneral">일반</td>
													<td>131</td>
													<td>692009511</td>
													<td>외용</td>
													<td>오큐시클로점안액</td>
													<td>11</td>
													<td>병</td>
													<td>비급여</td>
												</tr>
												<tr>
													<td>17</td>
													<td class="sortPro">전문</td>
													<td>131</td>
													<td>692009511</td>
													<td>내복</td>
													<td>록소젠정</td>
													<td>83</td>
													<td>개</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>18</td>
													<td class="sortPro">전문</td>
													<td>131</td>
													<td>692009511</td>
													<td>내복</td>
													<td>록소젠정</td>
													<td>64</td>
													<td>개</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>19</td>
													<td class="sortGeneral">일반</td>
													<td>131</td>
													<td>692009511</td>
													<td>내복</td>
													<td>록소젠정</td>
													<td>6</td>
													<td>개</td>
													<td>비급여</td>
												</tr>
												<tr>
													<td>20</td>
													<td class="sortPro">전문</td>
													<td>131</td>
													<td>692009511</td>
													<td>내복</td>
													<td>록소젠정</td>
													<td>82</td>
													<td>개</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>21</td>
													<td class="sortPro">전문</td>
													<td>131</td>
													<td>692009511</td>
													<td>내복</td>
													<td>록소젠정</td>
													<td>58</td>
													<td>개</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>22</td>
													<td class="sortPro">전문</td>
													<td>131</td>
													<td>692009511</td>
													<td>내복</td>
													<td>록소젠정</td>
													<td>61</td>
													<td>개</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>23</td>
													<td class="sortPro">전문</td>
													<td>131</td>
													<td>692001201</td>
													<td>외용</td>
													<td>프레드포르테점안액</td>
													<td>11</td>
													<td>병</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>24</td>
													<td class="sortGeneral">일반</td>
													<td>131</td>
													<td>692004561</td>
													<td>외용</td>
													<td>오큐시클로점안액</td>
													<td>15</td>
													<td>병</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>25</td>
													<td class="sortPro">전문 <i
														class='fas fa-exclamation-triangle'
														style='font-size: 15px;'></i></td>
													<td>131</td>
													<td>692007891</td>
													<td>내복</td>
													<td>솔로젠정</td>
													<td>70</td>
													<td>개</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>25</td>
													<td class="sortPro">전문</td>
													<td>131</td>
													<td>692009511</td>
													<td>내복</td>
													<td>타이레놀500밀리그램</td>
													<td>83</td>
													<td>개</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>26</td>
													<td class="sortPro">전문</td>
													<td>131</td>
													<td>692009511</td>
													<td>외용</td>
													<td>프레드포르테점안액</td>
													<td>12</td>
													<td>병</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>26</td>
													<td class="sortGeneral">일반</td>
													<td>131</td>
													<td>692009511</td>
													<td>외용</td>
													<td>오큐시클로점안액</td>
													<td>83</td>
													<td>병</td>
													<td>비급여</td>
												</tr>
												<tr>
													<td>27</td>
													<td class="sortPro">전문</td>
													<td>131</td>
													<td>692009511</td>
													<td>내복</td>
													<td>록소젠정</td>
													<td>56</td>
													<td>개</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>28</td>
													<td class="sortPro">전문 <i class='fas fa-exclamation-triangle' style='font-size: 15px;'></i></td>
													<td>131</td>
													<td>692009511</td>
													<td>내복</td>
													<td>록소젠정</td>
													<td>15</td>
													<td>개</td>
													<td>급여</td>
												</tr>
												<tr>
													<td>29</td>
													<td class="sortGeneral">일반</td>
													<td>131</td>
													<td>692009511</td>
													<td>내복</td>
													<td>록소젠정</td>
													<td>62</td>
													<td>개</td>
													<td>비급여</td>
												</tr>
												<tr>
													<td>30</td>
													<td class="sortPro">전문</td>
													<td>131</td>
													<td>692009511</td>
													<td>내복</td>
													<td>록소젠정</td>
													<td>9</td>
													<td>개</td>
													<td>급여</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>

							<div class="addBtnDiv">
								<button class="addBtn">추가∨</button>
								<a href="" class="qrBtn">QR코드인식</a>
							</div>

							<div class="card card-primary  card-outline"
								style="height: 300px;">
								<div class="card-body" style="padding: 0px;">
									<table class="table table-bordered" style="margin-bottom: 0px;">
										<thead class="listTitle">
											<tr>
												<th style="width: 36px; text-align: center;">NO</th>
												<th style="width: 56px;">구분</th>
												<th style="width: 32px; text-align: center;">분류</th>
												<th style="width: 89px;">약코드</th>
												<th style="width: 37px;">투여</th>
												<th style="width: 210px;">약명</th>
												<th style="width: 41px;">재고</th>
												<th style="width: 33px;">단위</th>
												<th>수량</th>
												<th style="width: 45px;">보험</th>
											</tr>
										</thead>
									</table>
									<div style="width: 100%; overflow: auto;">
										<table class="table table-bordered">

											<tbody>
												<tr>
													<td style="width: 37px;">1</td>
													<td class="sortGeneral" style="width: 55px;">일반 <i
														class='fas fa-exclamation-triangle'
														style='font-size: 15px;'></i></td>
													<td style="width: 30px;">131</td>
													<td style="width: 90px;">692001201</td>
													<td style="width: 37px;">외용</td>
													<td>프레드포르테점안액</td>
													<td>50</td>
													<td>병</td>
													<td style="width: 45px;">
														<input type="number" name="favnum" style="width: 35px;" min="1" max="50">
													</td>
													<td style="width: 45px;">급여</td>
												</tr>
												<tr>
													<td>2</td>
													<td class="sortGeneral">일반 <i
														class='fas fa-exclamation-triangle'
														style='font-size: 15px;'></i></td>
													<td>131</td>
													<td>692004561</td>
													<td>외용</td>
													<td>오큐시클로점안액</td>
													<td>9</td>
													<td>병</td>
													<td style="width: 45px;"><input type="number"
														name="favnum" style="width: 35px;" min="1" max="50"></td>
													<td>급여</td>
												</tr>
												<tr>
													<td>3</td>
													<td class="sortGeneral">일반</td>
													<td>131</td>
													<td>692007891</td>
													<td>내복</td>
													<td>솔로젠정</td>
													<td>15</td>
													<td>개</td>
													<td style="width: 45px;"><input type="number"
														name="favnum" style="width: 35px;" min="1" max="50"></td>
													<td>급여</td>
												</tr>
												<tr>
													<td>4</td>
													<td class="sortGeneral">일반</td>
													<td>131</td>
													<td>692009511</td>
													<td>내복</td>
													<td>타이레놀500밀리그램</td>
													<td>87</td>
													<td>개</td>
													<td style="width: 45px;"><input type="number"
														name="favnum" style="width: 35px;" min="1" max="50"></td>
													<td>급여</td>
												</tr>
												<tr>
													<td>5</td>
													<td class="sortGeneral">일반</td>
													<td>131</td>
													<td>692009511</td>
													<td>외용</td>
													<td>프레드포르테점안액</td>
													<td>40</td>
													<td>병</td>
													<td style="width: 45px;"><input type="number"
														name="favnum" style="width: 35px;" min="1" max="50"></td>
													<td>비급여</td>
												</tr>
												<tr>
													<td>6</td>
													<td class="sortGeneral">일반 <i
														class='fas fa-exclamation-triangle'
														style='font-size: 15px;'></i></td>
													<td>131</td>
													<td>692009511</td>
													<td>외용</td>
													<td>오큐시클로점안액</td>
													<td>13</td>
													<td>병</td>
													<td style="width: 45px;"><input type="number"
														name="favnum" style="width: 35px;" min="1" max="50"></td>
													<td>급여</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>

							</div>
							<!-- /.card-body -->
						</div>

					</div>

					<!-- 				<div class="col-md-12"> -->
					<!-- 					<div class="card card-primary"> -->
					<!-- 						<div class="card-header"> -->
					<!-- 							<h3 class="card-title">약추가</h3> -->

					<!-- 							<div class="card-tools"> -->
					<!-- 								<button type="button" class="btn btn-tool" -->
					<!-- 									data-card-widget="collapse" title="Collapse"> -->
					<!-- 									<i class="fas fa-minus"></i> -->
					<!-- 								</button> -->
					<!-- 							</div> -->
					<!-- 						</div> -->
					<!-- 						<div class="card-body" style="display: block;"> -->
					<!-- 							<div class="form-group"> -->
					<!-- 								<label for="inputName">Project Name</label> <input type="text" -->
					<!-- 									id="inputName" class="form-control"> -->
					<!-- 							</div> -->
					<!-- 							<div class="form-group"> -->
					<!-- 								<label for="inputDescription">Project Description</label> -->
					<!-- 								<textarea id="inputDescription" class="form-control" rows="4"></textarea> -->
					<!-- 							</div> -->
					<!-- 							<div class="form-group"> -->
					<!-- 								<label for="inputStatus">Status</label> <select id="inputStatus" -->
					<!-- 									class="form-control custom-select"> -->
					<!-- 									<option selected="" disabled="">Select one</option> -->
					<!-- 									<option>On Hold</option> -->
					<!-- 									<option>Canceled</option> -->
					<!-- 									<option>Success</option> -->
					<!-- 								</select> -->
					<!-- 							</div> -->
					<!-- 							<div class="form-group"> -->
					<!-- 								<label for="inputClientCompany">Client Company</label> <input -->
					<!-- 									type="text" id="inputClientCompany" class="form-control"> -->
					<!-- 							</div> -->
					<!-- 							<div class="form-group"> -->
					<!-- 								<label for="inputProjectLeader">Project Leader</label> <input -->
					<!-- 									type="text" id="inputProjectLeader" class="form-control"> -->
					<!-- 							</div> -->
					<!-- 						</div> -->
					<!-- 						/.card-body -->
					<!-- 					</div> -->
					<!-- 					/.card -->
					<!-- 				</div> -->

				</div>
			</div>
		</section>
	</div>

	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/adminlte.min.js"></script>
	<script type="text/javascript">
		function test(){
			window.close();
			window.opener.location.href="<%=request.getContextPath()%>/expert/prescript/pharmacist_prescriptGeneralModify.jsp";
		}
	</script>

</body>