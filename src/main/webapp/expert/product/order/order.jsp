<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">

<head>
<style>
input, select{
	margin:2px;
	height: 19px;
}
select{
	width:51px;
	font-size:14px;
}
input[type="date"] {
	font-size:10px;
	font-weight:bold;
	width: 74px;
} 
input[type="number"]{
	width: 52px;
}
input[type="text"]{
	width: 56px;
}

/* 약목록 스크롤 */
.tableScroll {
	overflow: auto;
}

table {
	table-layout: fixed;	
}	  
td { 		 
	vertical-align: middle; 		
	padding:5px;		
	overflow:hidden;		
	white-space : nowrap;		
	text-overflow: ellipsis;	 
}

/* 표 머리행 */
table{
	font-size:16px; 
}
th {
	background-color: #E8F5FF;
	text-align: center;
	position: sticky;
	top: 0px;  
	paddong:0px;
}
.card{
	margin-bottom:0px;
}
.tableNum{	
	text-align:right;
}
.table td, .table th{
	padding:0;
}

.tableTextCenter{
	text-align:center;
}
.card-body.p-0 .table thead>tr>th:first-of-type{
	padding:0;
}
.card-body.p-0 .table tbody>tr>td:last-of-type, .card-body.p-0 .table thead>tr>th:last-of-type{
	padding:0;
}
</style>
</head>

<body>
	<div class="content-wrapper">
		<div class="row m-0">
			<div class="card" style="margin-left:2px;"> 
				<div class="card-header" style="height:108px;"> 
					<h1 style="font-weight:bold;text-align: center;">- 2022.07.08 발주서 -</h1> 
				<span class="writer">발주자 : 김동글</span>
				</div>
				<div class="searchBox" style="display:flex; margin-top:3px;">
				<a style="margin-top:8px; background:lightgray;">추가할 발주품 검색</a>
					<select id="type" name="type" style="height: 24px; margin-left:295px; font-size:13px;"> 
						<option value="all">전체</option>
						<option value="ETC">전문</option> 
						<option value="OTC">일반</option> 
					</select>   
					<input list="classification-code" id="ice-cream-choice" name="ice-cream-choice" value="분류코드입력"
							style="width: 122px; height: 24px; margin-left:5px; font-size:13px;">
						<datalist id="classification-code">
							<option value="100">신경계 감각기관용 의약품</option>
							<option value="110">중추신경계용 약</option>
							<option value="111">전신마취제</option>
							<option value="112">최면진정제</option>
							<option value="113">항전간제</option>
							<option value="114">해열,진통,소염제</option>
							<option value="115">각성제,흥분제</option>
							<option value="116">진훈제</option>
							<option value="117">정신신경용제</option>
							<option value="119">기타의 중추신경용 약</option>
							<option value="120">말초신경계용 약</option>
							<option value="121">국소마취제</option>
							<option value="122">골격근이완제</option>
						</datalist>
					<input type="text" style="width: 150px; height: 24px; margin-left:5px; font-size:13px;"> 
					<input type="button" value="검색" style="width: 50px; height: 24px; margin-left:5px; font-size:13px;">
				</div>
				<!-- /.card-header -->
				<div class="card-body p-0" style="width:846px; height:805px;"> 
					<div class="card card-primary" style="height: 330px;">
								<div class="tableScroll" style="height:330px;">
									<table class="table table-bordered table-hover"
										style="overflow: auto; font-size: 16px;"> 
										<thead>
											<tr>
												<th style="width: 45px;">No</th>
												<th style="width: 61px;">구분</th>
												<th style="width: 38px;">분류</th>
												<th style="width: 79px;">약코드</th>
												<th style="width: 90px;">제약회사</th>
												<th style="width: 57px;">투여</th>
												<th>약명</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="tableNum">1</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableNum">131</td>
												<td class="tableNum">692001201</td>
												<td class="tableTextCenter">급여</td>                      	
												<td class="tableTextCenter">외용</td>	
												<td class="medicalTxt">프레드포르테점안액</td>
											</tr>
											<tr>
												<td class="tableNum">2</td>											
												<td class="tableTextCenter">전문</td>
												<td class="tableNum">131</td>
												<td class="tableNum">692004561</td>
												<td class="tableTextCenter">급여</td>
												<td class="tableTextCenter">외용</td>
												<td class="medicalTxt">오큐시클로점안액</td>
											</tr>
											<tr>
												<td class="tableNum">3</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableNum">131</td>
												<td class="tableNum">692007891</td>
												<td class="tableTextCenter">급여</td>
												<td class="tableTextCenter">내복</td>
												<td class="medicalTxt">솔로젠정</td>
											</tr>
											<tr>
												<td class="tableNum">4</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableNum">131</td>
												<td class="tableNum">692009511</td>
												<td class="tableTextCenter">급여</td>
												<td class="tableTextCenter">내복</td>
												<td class="medicalTxt">타이레놀500밀리그램</td>
											</tr>
											<tr>
												<td class="tableNum">5</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableNum">131</td>
												<td class="tableNum">692009511</td>
												<td class="tableTextCenter">급여</td>
												<td class="tableTextCenter">외용</td>
												<td class="medicalTxt">프레드포르테점안액</td>
											</tr>
											<tr>
												<td class="tableNum">6</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableNum">131</td>
												<td class="tableNum">692009511</td>
												<td class="tableTextCenter">급여</td>
												<td class="tableTextCenter">외용</td>
												<td class="medicalTxt">오큐시클로점안액</td>
											</tr>
											<tr>
												<td class="tableNum">7</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableNum">131</td>
												<td class="tableNum">692009511</td>
												<td class="tableTextCenter">급여</td>
												<td class="tableTextCenter">내복</td>
												<td class="medicalTxt">록소젠정</td>
											</tr>
											<tr>
												<td class="tableNum">8</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableNum">131</td>
												<td class="tableNum">692009511</td>
												<td class="tableTextCenter">급여</td>
												<td class="tableTextCenter">내복</td>
												<td class="medicalTxt">록소젠정</td>
											</tr>
											<tr>
												<td class="tableNum">9</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableNum">131</td>
												<td class="tableNum">692009511</td>
												<td class="tableTextCenter">급여</td>
												<td class="tableTextCenter">내복</td>
												<td class="medicalTxt">록소젠정</td>
											</tr>
											<tr>
												<td class="tableNum">10</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableNum">131</td>
												<td class="tableNum">692009511</td>
												<td class="tableTextCenter">급여</td>
												<td class="tableTextCenter">내복</td>
												<td class="medicalTxt">록소젠정</td>
											</tr>
											<tr>
												<td class="tableNum">11</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableNum">131</td>
												<td class="tableNum">692009511</td>
												<td class="tableTextCenter">급여</td>
												<td class="tableTextCenter">내복</td>
												<td class="medicalTxt">록소젠정</td>
											</tr>
											<tr>
												<td class="tableNum">12</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableNum">131</td>
												<td class="tableNum">692009511</td>
												<td class="tableTextCenter">급여</td>
												<td class="tableTextCenter">내복</td>
												<td class="medicalTxt">록소젠정</td>
											</tr>
											<tr>
												<td class="tableNum">13</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableNum">131</td>
												<td class="tableNum">692009511</td>
												<td class="tableTextCenter">급여</td>
												<td class="tableTextCenter">내복</td>
												<td class="medicalTxt">록소젠정</td>
											</tr>
											<tr>
												<td class="tableNum">14</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableNum">131</td>
												<td class="tableNum">692009511</td>
												<td class="tableTextCenter">급여</td>
												<td class="tableTextCenter">내복</td>
												<td class="medicalTxt">록소젠정</td>
											</tr>
											<tr>
												<td class="tableNum">15</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableNum">131</td>
												<td class="tableNum">692009511</td>
												<td class="tableTextCenter">급여</td>
												<td class="tableTextCenter">내복</td>
												<td class="medicalTxt">록소젠정</td>
											</tr>
											<tr>
												<td class="tableNum">16</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableNum">131</td>
												<td class="tableNum">692009511</td>
												<td class="tableTextCenter">급여</td>
												<td class="tableTextCenter">내복</td>
												<td class="medicalTxt">록소젠정</td>
											</tr>
											<tr>
												<td class="tableNum">17</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableNum">131</td>
												<td class="tableNum">692009511</td>
												<td class="tableTextCenter">급여</td>
												<td class="tableTextCenter">내복</td>
												<td class="medicalTxt">록소젠정</td>
											</tr>
											
										</tbody>
									</table>
								</div>
							</div>
							<div class="addBtnDiv" style="text-align:center; margin-top:20px;">
									<input type="button" value="추가 ∨" style="height:30px;">
							</div>		 
							<span style="background: lightgray;">선택한 발주품목록</span>
							<div class="card card-primary" style="height: 340px;">
								<div class="tableScroll" style="height:340px;"> 
									<table class="table table-bordered table-hover"  
										style="overflow: auto; font-size: 16px;"> 
										<thead>
											<tr>
												<th style="width: 45px;">No</th>
												<th style="width: 34px;">구분</th>
												<th style="width: 33px;">분류</th>
												<th style="width: 100px;">약코드</th>
												<th style="width: 101px;">제약회사</th>
												<th style="width: 50px;">투여</th>
												<th style="width: 260px;">약명</th>
												<th style="width: 58px;">수량</th>
												<th style="width: 56px;">단위</th>
												<th style="width: 60px;">금액(원)</th> 
												<th style="width: 30px;"> </th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="tableTextCenter">1</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableTextCenter">112</td>
												<td>123456789</td>
												<td>제약회사임요</td>
												<td class="tableTextCenter">외용</td>
												<td class="medicalTxt">프레드포르테점안액</td> 
												<td><input type="number" value="0"></td>
												<td><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option>정</option>
													  <option>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td>5,300</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
																						  margin-left:6px;margin-top:2px;'></i></td>                      		
											</tr>
											<tr>
												<td class="tableTextCenter">2</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableTextCenter">112</td>
												<td>123456789</td>
												<td>제약회사임요</td>
												<td class="tableTextCenter">외용</td>
												<td class="medicalTxt">프레드포르테점안액</td> 
												<td><input type="number" value="0"></td>
												<td><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option>정</option>
													  <option>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td>5,300</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
												                                          margin-left:6px;margin-top:2px;'></i></td>                      		
											</tr>
											<tr>
												<td class="tableTextCenter">3</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableTextCenter">112</td>
												<td>123456789</td>
												<td>제약회사임요</td>
												<td class="tableTextCenter">외용</td>
												<td class="medicalTxt">프레드포르테점안액</td> 
												<td><input type="number" value="0"></td>
												<td><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option>정</option>
													  <option>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td>5,300</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
												                                          margin-left:6px;margin-top:2px;'></i></td>                       		
											</tr>
											<tr>
												<td class="tableTextCenter">4</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableTextCenter">112</td>
												<td>123456789</td>
												<td>제약회사임요</td>
												<td class="tableTextCenter">외용</td>
												<td class="medicalTxt">프레드포르테점안액</td> 
												<td><input type="number" value="0"></td>
												<td><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option>정</option>
													  <option>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td>5,300</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
												                                          margin-left:6px;margin-top:2px;'></i></td>                       		
											</tr>
											<tr>
												<td class="tableTextCenter">5</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableTextCenter">112</td>
												<td>123456789</td>
												<td>제약회사임요</td>
												<td class="tableTextCenter">외용</td>
												<td class="medicalTxt">프레드포르테점안액</td> 
												<td><input type="number" value="0"></td>
												<td><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option>정</option>
													  <option>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td>5,300</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
												                                          margin-left:6px;margin-top:2px;'></i></td>                      		
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="priceSum" style="height:57px; display:flex; float: left;">
								<a style="font-size:32px; margin-left:25px; margin-right:85px;">입고 합계 금액 : 310,150원</a>	
								</div>	
								<div class="buttons" style="width: 310px;height: 55px;float: right;display: flex;margin-right: 20px;">	 
								<button type="button" class="btn btn-block btn-secondary" style="width: 90px;height: 45px;margin-top: 7px;float: left;" onclick="temporarySave()">임시저장</button>					
								<button type="button" class="btn btn-block btn-info" style="width:90px; height: 45px; margin-left:20px;" onclick="Complete()">완료</button>					
								<button type="button" class="btn btn-block btn-danger" style="width:90px; height: 45px; margin-left:20px;"
								  onclick="Cancel()">취소</button>
								 				 
							</div>
				</div>
				<!-- /.card-body -->
			</div> 
			<!-- /.card -->
		</div>
	</div>
<!-- jQuery -->
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/adminlte.min.js"></script>
	<script>
		function temporarySave(){
			if(confirm("작성내용을 임시저장 하시겠습니까?\n ※이전 임시저장 내용은 삭제됩니다.※") == true){
				self.close();
			}
		}
		
		function Complete(){
			if(confirm("작성을 완료하시겠습니까?") == true){
				self.close();
			}
		}
		
		function Cancel(){
			if(confirm("정말 작성을 취소하시겠습니까?") == true){
				self.close();
			}
		}
		
		
	</script>
</body>
