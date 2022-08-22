<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>

body{
	font-size : 12px;
}
label {
	width: 90px;
	margin-left: 10px;
}


.title{
	font-weight: bold;
	
}

.patientList{
	padding:0px;
}

th{
	background-color: #E8F5FF;
	text-align: center;
	position: sticky;
    top: 0px;
}

/* 조제대기 버튼 배경 */
.statusReady{
	background-color: #FF3232;
	color : white;
}

/* 조제완료 버튼 배경 */
.statusEnd{
	background-color: #1478CD;
	color : white;
}

/* 수정요청 버튼 배경 */
.statusUpdate{
	background-color: #FF9B00;
	color : white;
}

.medicalTxt{
	text-align: left;
}

td{
	text-align: center;
}

.tableScroll{
	overflow:auto;
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

.selectTxt{
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
.preDetailBtn{
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


span:hover + p.arrow_box {
  display: block;
}


/* 구분 -> 전문 */
.sortPro{
	background-color: #FEBEBE;
}

/* 처방전작성 -> 약추가, 처방완료버튼 */
.locationBtn{
    display: flex;
    left: 30px;
}


.table td{
	padding: 5px;
}

</style>

    
						<div class="row-4">
							<div class="card card-primary card-outline " >
								<div class="card-header">
										<div class="row">
										<div class="col-lg-6">
											<span class="cardTitle mainTitle">실시간 처방 내역</span> 
											<i class="fa-solid fa-arrow-right-to-bracket accent pointer"></i>
										</div>
										<div class="col-lg-6 rightSort">
											<span class="cardTitle"><span class="accent">30초</span>마다 실시간 업데이트</span> 
											<i class="fa-solid fa-gear pointer"></i>
										</div>
									</div>
								</div>
								<div class="card card-primary">
								<div class="tableScroll" style="height: 155px;">
									<table class="table table-hover table-bordered">
										<thead>
											<tr>
												<th>NO</th>
												<th>교부번호</th>
												<th>교부일자</th>
												<th>약명</th>
												<th>처방병원</th>
												<th>의사명</th>
												<th>상태</th>
											</tr>
										</thead>
										<tbody>
										
										<tr>
												<td>6</td>
												<td>2205110011</td>
												<td>2022.05.11</td>
												<td class="medicalTxt">박카스D 외 4개</td>
												<td>말끄미병원</td>
												<td>이말끔</td>
												<td class="statusReady">조제대기</td>
											</tr>
											<tr class="medicinalUpdate">
												<td>5</td>
												<td>2205110011</td>
												<td>2022.05.11</td>
												<td class="medicalTxt">박카스D 외 4개</td>
												<td>말끄미병원</td>
												<td>이말끔</td>
												<td class="statusUpdate tooltip2">
													<span>수정요청</span>
													<p class="arrow_box">
														약국명 : 똥글똥글약국 <br>
														약사명 : 김똥그리	<br>
														수정요청합니다.
													</p>
												</td>
											</tr>
											<tr>
												<td>4</td>
												<td>2205110011</td>
												<td>2022.05.11</td>
												<td class="medicalTxt">박카스D 외 4개</td>
												<td>말끄미병원</td>
												<td>이말끔</td>
												<td class="statusEnd">조제완료</td>
											</tr>
											<tr>
												<td>3</td>
												<td>2205110011</td>
												<td>2022.05.11</td>
												<td class="medicalTxt">록소젠정(내복) 외 3개</td>
												<td>말끄미병원</td>
												<td>이말끔</td>
												<td class="statusEnd">조제완료</td>
											</tr>
											<tr>
												<td>2</td>
												<td>2205110011</td>
												<td>2022.05.11</td>
												<td class="medicalTxt">록소젠정(내복) 외 3개</td>
												<td>말끄미병원</td>
												<td>이말끔</td>
												<td class="statusEnd">조제완료</td>
											</tr>
											<tr>
												<td>1</td>
												<td>2203110012</td>
												<td>2022.03.11</td>
												<td class="medicalTxt">타이레놀 외 3개</td>
												<td>말끄미병원</td>
												<td>이말끔</td>
												<td class="statusEnd">조제완료</td>
											</tr>
										</tbody>
									</table>
									</div>
								</div>
							</div>
						</div>