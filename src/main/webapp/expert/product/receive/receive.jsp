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
	margin-bottom:2px;
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
	text-align:center;
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
.card-body.p-0 .table tbody>tr>td:first-of-type{
	padding:0;	
}
</style>
</head>

<body>
	<div class="content-wrapper">
		<div class="row m-0">
			<div class="card" style="margin-left:2px;"> 
				<div class="card-header" style="height:108px;"> 
					<h1 style="font-weight:bold;text-align: center;">- 2022.07.08 입고장 -</h1> 
				<span class="writer">입고자 : 김동글</span>
				</div>
				<div class="searchBox" style="display:flex; margin-top:3px;">
				<a style="margin-top:8px; background:lightgray;">추가할 입고품 검색</a>
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
				<div class="card-body p-0" style="width:846px; height:750px;"> 
					<div class="card card-primary" style="height: 330px;">
									<table class="table table-bordered table-hover"
										style="overflow: auto; font-size: 16px; margin-bottom: 0px;"> 
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
									</table>
								<div class="tableScroll" style="height:330px;">
									<table class="table table-bordered table-hover"
										style="overflow: auto; font-size: 16px;"> 
										<tbody>
											<tr>
												<td class="tableNum" style="width: 45px;" >1</td>
												<td class="tableTextCenter" style="width: 61px;">전문</td>
												<td class="tableNum" style="width: 38px;">131</td>
												<td class="tableNum" style="width: 79px;">692001201</td>
												<td class="tableTextCenter" style="width: 90px;">급여</td>                      	
												<td class="tableTextCenter" style="width: 57px;">외용</td>	
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
							<span style="background: lightgray;">선택한 입고품목록</span>
							<div class="card card-primary" style="height: 340px;">
									<table class="table table-bordered table-hover"  
										style="overflow: auto; font-size: 16px; margin-bottom:0px;"> 
										<thead>
											<tr>
												<th style="width: 30px;">No</th>
												<th style="width: 34px;">구분</th>
												<th style="width: 33px;">분류</th>
												<th style="width: 74px;">약코드</th>
												<th style="width: 101px;">제약회사</th>
												<th style="width: 50px;">투여</th>
												<th style="width: 165px;">약명</th>
												<th style="width: 79px;">제조일</th>
												<th style="width: 58px;">수량</th>
												<th style="width: 56px;">단위</th>
												<th style="width: 61px;">약위치</th>
												<th style="width: 60px;">금액(원)</th> 
												<th> </th>
											</tr>
										</thead>
										</table>
								<div class="tableScroll" style="height:340px;"> 
								<div class="card card-primary" style="height: 340px;">
									<table class="table table-bordered table-hover"  
										style="overflow: auto; font-size: 16px;"> 
										
										<tbody>
											<tr>
												<td class="tableTextCenter" style="width: 30px;">1</td>
												<td class="tableTextCenter" style="width: 34px;">전문</td>
												<td class="tableTextCenter" style="width: 33px;">112</td>
												<td style="width: 74px;">645302132</td>
												<td style="width: 101px;">한림제약(주)</td>
												<td class="tableTextCenter" style="width: 50px;">내복</td>
												<td class="medicalTxt" style="width: 165px;">포크랄시럽(포수클로랄)_(9.5g/95mL)</td> 
												<td style="width: 79px;"><input type="date"></td>
												<td style="width: 58px;"><input type="number" value="6" ></td>
												<td style="width: 56px;"><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option>정</option>
													  <option selected>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td style="width: 61px;"><input type="text" value="A7"></td> 
												<td style="width: 60px;">1,200</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
												                                          margin-left:4px;margin-top:2px;'></i></td>                       		
											</tr>
											<tr>
												<td class="tableTextCenter">2</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableTextCenter">112</td>
												<td>643507540</td>
												<td>한미약품(주)</td>
												<td class="tableTextCenter">내복</td>
												<td class="medicalTxt">독세정3밀리그램(독세핀염산염)_(3.39mg/1정)</td> 
												<td><input type="date"></td>
												<td><input type="number" value="8"></td>
												<td><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option selected>정</option>
													  <option>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td><input type="text" value="A7"></td> 
												<td>2,200</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
												                                          margin-left:4px;margin-top:2px;'></i></td>                       		
											</tr>
											<tr>
												<td class="tableTextCenter">3</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableTextCenter">112</td>
												<td>649001610</td>
												<td>풍림무약(주)</td>
												<td class="tableTextCenter">내복</td>
												<td class="medicalTxt">리치나잇정6밀리그램(독세핀염산염)_(6.78mg/1정)</td> 
												<td><input type="date"></td>
												<td><input type="number" value="20"></td>
												<td><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option selected>정</option>
													  <option>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td><input type="text" value="A7"></td> 
												<td>10,200</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
												                                          margin-left:4px;margin-top:2px;'></i></td>                       		
											</tr>
											<tr>
												<td class="tableTextCenter">4</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableTextCenter">112</td>
												<td>651900330</td>
												<td>명인제약(주)</td>
												<td class="tableTextCenter">내복</td>
												<td class="medicalTxt">루나팜정(플루니트라제팜)_(1mg/1정)</td> 
												<td><input type="date"></td>
												<td><input type="number" value="11"></td>
												<td><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option selected>정</option>
													  <option>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td><input type="text" value="A7"></td> 
												<td>6,800</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
												                                          margin-left:4px;margin-top:2px;'></i></td>                       		
											</tr>
											<tr>
												<td class="tableTextCenter">5</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableTextCenter">112</td>
												<td>648901230</td>
												<td>한화화이자제약(주)</td>
												<td class="tableTextCenter">외용</td>
												<td class="medicalTxt">할시온정0.125밀리그램(트리아졸람)_(0.125mg/1정)</td> 
												<td><input type="date"></td>
												<td><input type="number" value="8"></td>
												<td><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option selected>정</option>
													  <option>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td><input type="text" value="A7"></td> 
												<td>6,800</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
												                                          margin-left:4px;margin-top:2px;'></i></td>                       		
											</tr>
											<tr>
												<td class="tableTextCenter">6</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableTextCenter">112</td>
												<td>648901230</td>
												<td>한화화이자제약(주)</td>
												<td class="tableTextCenter">외용</td>
												<td class="medicalTxt">할시온정0.125밀리그램(트리아졸람)_(0.125mg/1정)</td> 
												<td><input type="date"></td>
												<td><input type="number" value="8"></td>
												<td><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option selected>정</option>
													  <option>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td><input type="text" value="A7"></td> 
												<td>6,800</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
												                                          margin-left:4px;margin-top:2px;'></i></td>                       		
											</tr>
											<tr>
												<td class="tableTextCenter">7</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableTextCenter">112</td>
												<td>648901230</td>
												<td>한화화이자제약(주)</td>
												<td class="tableTextCenter">외용</td>
												<td class="medicalTxt">할시온정0.125밀리그램(트리아졸람)_(0.125mg/1정)</td> 
												<td><input type="date"></td>
												<td><input type="number" value="8"></td>
												<td><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option selected>정</option>
													  <option>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td><input type="text" value="A7"></td> 
												<td>6,800</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
												                                          margin-left:4px;margin-top:2px;'></i></td>                       		
											</tr>
											<tr>
												<td class="tableTextCenter">8</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableTextCenter">112</td>
												<td>648901230</td>
												<td>한화화이자제약(주)</td>
												<td class="tableTextCenter">외용</td>
												<td class="medicalTxt">할시온정0.125밀리그램(트리아졸람)_(0.125mg/1정)</td> 
												<td><input type="date"></td>
												<td><input type="number" value="8"></td>
												<td><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option selected>정</option>
													  <option>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td><input type="text" value="A7"></td> 
												<td>6,800</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
												                                          margin-left:4px;margin-top:2px;'></i></td>                       		
											</tr>
											<tr>
												<td class="tableTextCenter">9</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableTextCenter">112</td>
												<td>648901230</td>
												<td>한화화이자제약(주)</td>
												<td class="tableTextCenter">외용</td>
												<td class="medicalTxt">할시온정0.125밀리그램(트리아졸람)_(0.125mg/1정)</td> 
												<td><input type="date"></td>
												<td><input type="number" value="8"></td>
												<td><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option selected>정</option>
													  <option>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td><input type="text" value="A7"></td> 
												<td>6,800</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
												                                          margin-left:4px;margin-top:2px;'></i></td>                       		
											</tr>
											<tr>
												<td class="tableTextCenter">10</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableTextCenter">112</td>
												<td>648901230</td>
												<td>한화화이자제약(주)</td>
												<td class="tableTextCenter">외용</td>
												<td class="medicalTxt">할시온정0.125밀리그램(트리아졸람)_(0.125mg/1정)</td> 
												<td><input type="date"></td>
												<td><input type="number" value="8"></td>
												<td><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option selected>정</option>
													  <option>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td><input type="text" value="A7"></td> 
												<td>6,800</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
												                                          margin-left:4px;margin-top:2px;'></i></td>                       		
											</tr>
											<tr>
												<td class="tableTextCenter">11</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableTextCenter">112</td>
												<td>648901230</td>
												<td>한화화이자제약(주)</td>
												<td class="tableTextCenter">외용</td>
												<td class="medicalTxt">할시온정0.125밀리그램(트리아졸람)_(0.125mg/1정)</td> 
												<td><input type="date"></td>
												<td><input type="number" value="8"></td>
												<td><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option selected>정</option>
													  <option>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td><input type="text" value="A7"></td> 
												<td>6,800</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
												                                          margin-left:4px;margin-top:2px;'></i></td>                       		
											</tr>
											<tr>
												<td class="tableTextCenter">12</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableTextCenter">112</td>
												<td>648901230</td>
												<td>한화화이자제약(주)</td>
												<td class="tableTextCenter">외용</td>
												<td class="medicalTxt">할시온정0.125밀리그램(트리아졸람)_(0.125mg/1정)</td> 
												<td><input type="date"></td>
												<td><input type="number" value="8"></td>
												<td><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option selected>정</option>
													  <option>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td><input type="text" value="A7"></td> 
												<td>6,800</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
												                                          margin-left:4px;margin-top:2px;'></i></td>                       		
											</tr>
											<tr>
												<td class="tableTextCenter">13</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableTextCenter">112</td>
												<td>648901230</td>
												<td>한화화이자제약(주)</td>
												<td class="tableTextCenter">외용</td>
												<td class="medicalTxt">할시온정0.125밀리그램(트리아졸람)_(0.125mg/1정)</td> 
												<td><input type="date"></td>
												<td><input type="number" value="8"></td>
												<td><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option selected>정</option>
													  <option>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td><input type="text" value="A7"></td> 
												<td>6,800</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
												                                          margin-left:4px;margin-top:2px;'></i></td>                       		
											</tr>
											<tr>
												<td class="tableTextCenter">14</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableTextCenter">112</td>
												<td>648901230</td>
												<td>한화화이자제약(주)</td>
												<td class="tableTextCenter">외용</td>
												<td class="medicalTxt">할시온정0.125밀리그램(트리아졸람)_(0.125mg/1정)</td> 
												<td><input type="date"></td>
												<td><input type="number" value="8"></td>
												<td><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option selected>정</option>
													  <option>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td><input type="text" value="A7"></td> 
												<td>6,800</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
												                                          margin-left:4px;margin-top:2px;'></i></td>                       		
											</tr>
											<tr>
												<td class="tableTextCenter">15</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableTextCenter">112</td>
												<td>648901230</td>
												<td>한화화이자제약(주)</td>
												<td class="tableTextCenter">외용</td>
												<td class="medicalTxt">할시온정0.125밀리그램(트리아졸람)_(0.125mg/1정)</td> 
												<td><input type="date"></td>
												<td><input type="number" value="8"></td>
												<td><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option selected>정</option>
													  <option>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td><input type="text" value="A7"></td> 
												<td>6,800</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
												                                          margin-left:4px;margin-top:2px;'></i></td>                       		
											</tr>
											<tr>
												<td class="tableTextCenter">16</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableTextCenter">112</td>
												<td>648901230</td>
												<td>한화화이자제약(주)</td>
												<td class="tableTextCenter">외용</td>
												<td class="medicalTxt">할시온정0.125밀리그램(트리아졸람)_(0.125mg/1정)</td> 
												<td><input type="date"></td>
												<td><input type="number" value="8"></td>
												<td><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option selected>정</option>
													  <option>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td><input type="text" value="A7"></td> 
												<td>6,800</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
												                                          margin-left:4px;margin-top:2px;'></i></td>                       		
											</tr>
											<tr>
												<td class="tableTextCenter">17</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableTextCenter">112</td>
												<td>648901230</td>
												<td>한화화이자제약(주)</td>
												<td class="tableTextCenter">외용</td>
												<td class="medicalTxt">할시온정0.125밀리그램(트리아졸람)_(0.125mg/1정)</td> 
												<td><input type="date"></td>
												<td><input type="number" value="8"></td>
												<td><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option selected>정</option>
													  <option>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td><input type="text" value="A7"></td> 
												<td>6,800</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
												                                          margin-left:4px;margin-top:2px;'></i></td>                       		
											</tr>
											<tr>
												<td class="tableTextCenter">18</td>
												<td class="tableTextCenter">전문</td>
												<td class="tableTextCenter">112</td>
												<td>648901230</td>
												<td>한화화이자제약(주)</td>
												<td class="tableTextCenter">외용</td>
												<td class="medicalTxt">할시온정0.125밀리그램(트리아졸람)_(0.125mg/1정)</td> 
												<td><input type="date"></td>
												<td><input type="number" value="8"></td>
												<td><select>
													  <option>개</option>
													  <option>캡슐</option>
													  <option selected>정</option>
													  <option>병</option>
													  <option>통</option>
													  <option>앰플</option>
													</select></td>
												<td><input type="text" value="A7"></td> 
												<td>6,800</td>
												<td><i class='far fa-minus-square' style='font-size:20px;color:red; cursor: pointer;
												                                          margin-left:4px;margin-top:2px;'></i></td>                       		
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="footerResult">
							<div class="priceSum" style="height:57px; display:flex; float: left;">
								<a style="font-size:30px; font-weight:bold; margin-top:5px;margin-left:5px;">입고 합계 금액 : 310,150원</a> 	
							</div>
								<div class="buttons" style="width: 310px;height: 55px;float: right;display: flex;margin-right: 20px; margin-left:5px;">	 
								<button type="button" class="btn btn-block btn-secondary" style="width: 90px;height: 45px;margin-top: 5px;float: left;" onclick="temporarySave()">임시저장</button>					
								<button type="button" class="btn btn-block btn-info" style="width:90px; height: 45px; margin-left:20px; margin-top: 5px;" onclick="Complete()">완료</button>	 				
								<button type="button" class="btn btn-block btn-danger" style="width:90px; height: 45px; margin-left:20px; margin-top: 5px;" onclick="Cancel()">취소</button>
							</div>	
						</div>
				</div>
				<!-- /.card-body -->
			</div> 
			<!-- /.card -->
		</div>
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
