<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.nav-tabs .nav-link{
    color: #007bff;
     height: 100%;
     border-bottom: 0;
}

.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active{
    color: #fff;
    background-color: #007bff;
        height: 100%;
}


.card-title{
	float:unset;
}
.p-0 .re_02{
text-align: right;
}
.p-0 .re_01{
    text-align: left;
    line-height: 27px;
}
</style>


<style>
.nav-item{
float: right;
}

.nav-item:last-child{
    margin-right: 10px;
}

#box1, #box2{
	width: 620px;
/* 	border: 1px solid black;  */
}
#box1-2, #box1-3, #box2-2, #box2-3, #box3-3{
	width: 300px;
	box-shadow: 0 0 1px rgb(0 0 0 / 13%), 0 1px 3px rgb(0 0 0 / 20%);

/* 	border: 1px solid black; */
}
#box3, #box3-2{
	width: 415px;
	height: 280px;
/* 	border: 1px solid black; */
}
.container2{
}
.accent{
	color: red;
}
.pointer{
	cursor: pointer;
}
.rightSort{
	text-align: right;
	font-size: 0.7em;
	padding: 3px;
}

.mainTitle{
	font-weight: bold;
}
.card-header{
	    padding: 12px 15px;
}
.btn-date{
	width: 50px;
	height: 30px;
}
.pl-3, .px-3{
padding: 12px 12px;
}

.card{
    box-shadow: none;
}

.nav-link{
	font-size: 14px;
	padding: 5px;
}
.col-lg-3, .col-lg-6{
	padding-right:5px;
}
.col-lg-6{
	display: inline-block;

}

.tew_00{
    margin-left: -20px;  float: left; width:300px;height:200px;
}

.chart_div{
display: inline-block;
    float: left;
    margin-left: 7px;
}

.erw_0{
    width: 48%;
    display: inline-block;
}

.max_wrap001{
    padding-top: 15px;
    padding-left: 15px;
    line-height: 18px;
    font-size: 10px;
}
.max_day01{
}
.max_day01 b{
    font-size: 12px;
}
.max_coin01{
}

.max_coin01 b{
    font-size: 12px;
}

.box_wrap001{
border-top: 3px solid #007bff;
}
</style>

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
.card-primary.card-outline{
    background: #fff;
    height: 247px;
        box-shadow: 0 0 1px rgb(0 0 0 / 13%), 0 1px 3px rgb(0 0 0 / 20%);

}
</style>



</head>
<body>
	<div class="content-wrapper" style="padding: 15px; width: 1280px;">
		<div class="container" style="max-width: 1280px;">
			<div class="row">
				<div class="col-lg-6" style="margin-top: 20px;">
					<!-- 실시간 처방 내역 -->
					<div id="box1">
							<div class="row-4">
							<div class="card card-primary card-outline box_wrap001" >
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
								<iframe name="ifr" src="<%=request.getContextPath() %>/expert/viewT/prescription.do" frameborder="0" style="width:100%; height: 185px; scrolling="no">
								</iframe>
							<%-- <%@ include file="../viewT/prescription.jsp" %> --%>
						</div>
						</div>
					</div>
				</div>

				<!-- 최다판매약품 시작-->
<div class="col-lg-3">
					<!-- 최다 판매 약품 -->

					<div id="box2-2" style="margin-top: 20px;     margin-left: 7px;">
						<div class="card card-secondary card-tabs box_wrap001" style="height: 250px;">
							<div class="p-0 pt-1">
								<ul class="nav nav-tabs" id="custom-tabs-two-tab" role="tablist">
									<li class="pt-2 px-3">
										<span class="cardTitle mainTitle">최다 판매 약품</span>
										<i class="fa-solid fa-arrow-right-to-bracket accent pointer"></i>
									</li>
									<li class="nav-item"><a class="nav-link active"
										id="custom-tabs-two-home-tab" data-toggle="pill"
										href="#custom-tabs-two-home0" role="tab"
										aria-controls="custom-tabs-two-home0" aria-selected="true" onclick="maxSalesDrug('m')">한달</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										id="custom-tabs-two-profile-tab" data-toggle="pill"
										href="#custom-tabs-two-profile0" role="tab"
										aria-controls="custom-tabs-two-profile0" aria-selected="false" onclick="maxSalesDrug('w')">일주일</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										id="custom-tabs-two-messages-tab" data-toggle="pill"
										href="#custom-tabs-two-messages0" role="tab"
										aria-controls="custom-tabs-two-messages0" aria-selected="false" onclick="maxSalesDrug('y')">어제</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										id="custom-tabs-two-settings-tab" data-toggle="pill"
										href="#custom-tabs-two-settings0" role="tab"
										aria-controls="custom-tabs-two-settings0" aria-selected="false" onclick="maxSalesDrug('t')">오늘</a>
									</li>
								</ul>
							</div>
							<div class="card-body" style="padding: 0;">
								<div class="tab-content" id="custom-tabs-two-tabContent">
									<div class="tab-pane fade show active"
										id="custom-tabs-two-home0" role="tabpanel"
										aria-labelledby="custom-tabs-two-home-tab">
											<%@ include file="../viewT/MaxSalesDrug_m.jsp" %>
										</div>
									<div class="tab-pane fade" id="custom-tabs-two-profile0"
										role="tabpanel" aria-labelledby="custom-tabs-two-profile-tab">
											<%@ include file="../viewT/MaxSalesDrug_w.jsp" %>
										</div>
									<div class="tab-pane fade" id="custom-tabs-two-messages0"
										role="tabpanel" aria-labelledby="custom-tabs-two-messages-tab">
											<%@ include file="../viewT/MaxSalesDrug_y.jsp" %>
										</div>
									<div class="tab-pane fade" id="custom-tabs-two-settings0"
										role="tabpanel" aria-labelledby="custom-tabs-two-settings-tab">
											<%@ include file="../viewT/MaxSalesDrug.jsp" %>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
<!-- 최다판매약품 마침 -->


				<div class="col-lg-3">
					<!-- 재고부족 -->
					<div class="col-lg-3" style="margin-top: 20px;" >
						<div id="box1-3">
							<div class="card box_wrap001" >
								<div class="card-header">
									<div class="row">
										<div class="col-lg-6">
											<span class="cardTitle mainTitle">재고부족</span>
											<i class="fa-solid fa-arrow-right-to-bracket accent pointer"></i>
										</div>
										<div class="col-lg-6 rightSort">
											<span class="cardTitle"><span class="accent">1일</span>마다 실시간 업데이트</span>
											<i class="fa-solid fa-gear pointer"></i>
										</div>
									</div>
								</div>
								<div class="card-body" style="padding: 0;">
									<div>
										<%@ include file="../viewT/StockShortage.jsp" %>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>
			<div class="row">

				<div class="col-lg-6">
					<!-- 실시간 처방분석통계 -->
					<div class="card  box_wrap001" style="box-shadow: 0 0 1px rgb(0 0 0 / 13%), 0 1px 3px rgb(0 0 0 / 20%);">
						<div class="card card-secondary card-tabs" style="height: 282px;">
							<div class="p-0 pt-1" >
								<ul class="nav nav-tabs" id="custom-tabs-two-tab" role="tablist">
									<li class="pt-2 px-3">
										<span class="cardTitle mainTitle">실시간 처방 환자 분석통계</span>
										<i class="fa-solid fa-arrow-right-to-bracket accent pointer"></i>
									</li>


									<div class="col-lg-6 rightSort" style="max-width: 250px; margin-top: 7px;">
										<span class="cardTitle"><span class="accent">30초</span>마다 실시간 업데이트</span>
										<i class="fa-solid fa-gear pointer"></i>
									</div>


									<li class="nav-item"><a class="nav-link active"
										id="custom-tabs-two-home-tab" data-toggle="pill"
										href="#custom-tabs-two-home" role="tab"
										aria-controls="custom-tabs-two-home" onclick="selectMaximumPxList('m')" aria-selected="true">한달</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										id="custom-tabs-two-profile-tab" data-toggle="pill"
										href="#custom-tabs-two-profile" role="tab"
										aria-controls="custom-tabs-two-profile" onclick="selectMaximumPxList('w')" aria-selected="false">일주일</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										id="custom-tabs-two-messages-tab" data-toggle="pill"
										href="#custom-tabs-two-messages" role="tab"
										aria-controls="custom-tabs-two-messages" onclick="selectMaximumPxList('y')" aria-selected="false">어제</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										id="custom-tabs-two-settings-tab" data-toggle="pill"
										href="#custom-tabs-two-settings" role="tab"
										aria-controls="custom-tabs-two-settings" onclick="selectMaximumPxList('t')" aria-selected="false">오늘</a>
									</li>
								</ul>
							</div>
							<div class="card-body"  style="padding-left: 0; padding-right: 0; padding-bottom: 0;">
								<div class="tab-content" id="custom-tabs-two-tabContent">
									<div class="tab-pane fade show active"
										id="custom-tabs-two-home" role="tabpanel"
										aria-labelledby="custom-tabs-two-home-tab">
										<!-- 그래프는 js에서 수정가능 -->
										<div id="chart_div_m" class="chart_div"></div>
										<div class="erw_0">
											<%@ include file="../viewT/salesStatistics_m.jsp" %>
										</div>
									</div>
									<div class="tab-pane fade" id="custom-tabs-two-profile"
										role="tabpanel" aria-labelledby="custom-tabs-two-profile-tab">
										<div id="chart_div_w" class="chart_div"></div>
										<div class="erw_0">
											<%@ include file="../viewT/salesStatistics_w.jsp" %>
										</div>

										</div>
									<div class="tab-pane fade" id="custom-tabs-two-messages"
										role="tabpanel" aria-labelledby="custom-tabs-two-messages-tab">
										<div id="chart_div_y" class="chart_div"></div>
										<div class="erw_0">
											<%@ include file="../viewT/salesStatistics_y.jsp" %>
										</div>
										</div>
									<div class="tab-pane fade" id="custom-tabs-two-settings"
										role="tabpanel" aria-labelledby="custom-tabs-two-settings-tab">
										<div id="chart_div" class="chart_div"></div>
										<div class="erw_0">
											<%@ include file="../viewT/salesStatistics.jsp" %>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		<!-- 실시간처방분석통계 마침 -->

						<div class="col-lg-3" >
					<!-- 매출액 통계 -->
					<div id="box1-2" style="width: 260px;">
						<div class="card box_wrap001">
							<div class="card card-primary card-tabs">
								<div class="p-0 pt-1" style="border-bottom: 1px solid #dee2e6;">
									<div class="col-lg-6" style="max-width: fit-content; padding: 10px 10px;">
										<span class="cardTitle mainTitle">매출액 통계</span>
										<i class="fa-solid fa-arrow-right-to-bracket accent pointer"></i>
									</div>
									<ul class="nav nav-tabs" id="custom-tabs-one-tab"
										role="tablist" style="float: right; border-bottom:0;     height: 34px;">
										<li class="nav-item"><a class="nav-link"
											id="custom-tabs-one-profile-tab" data-toggle="pill"
											href="#custom-tabs-one-profile" role="tab"
											aria-controls="custom-tabs-one-profile" aria-selected="false" onclick="drawChart03()">일년</a>
										</li>
										<li class="nav-item"><a class="nav-link"
											id="custom-tabs-one-messages-tab" data-toggle="pill"
											href="#custom-tabs-one-messages" role="tab"
											aria-controls="custom-tabs-one-messages"
											aria-selected="false" onclick="drawChart02()">한달</a>
											</li>
										<li class="nav-item"><a class="nav-link active"
											id="custom-tabs-one-settings-tab" data-toggle="pill"
											href="#custom-tabs-one-settings" role="tab"
											aria-controls="custom-tabs-one-settings" aria-selected="true" onclick="drawChart01()">일주일</a>
										</li>
									</ul>
								</div>
								<div class="card-body" style="padding: 0;">
									<div class="tab-content" id="custom-tabs-one-tabContent">
										<div class="tab-pane fade" id="custom-tabs-one-profile" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">
											<div class="max_wrap001">
												<div class="max_day01"><b>기준년도 :&nbsp;<span id="salesChartCalY"></span>&nbsp;년</b></div>
												<div class="max_coin01"><b>누적매출(일년) :&nbsp;<span id="salesChartCalAccrueY"></span></b></div>
											</div>
											 <div id="take_chart_div_y"></div>
										</div>
										<div class="tab-pane fade" id="custom-tabs-one-messages" role="tabpanel" aria-labelledby="custom-tabs-one-messages-tab">
											<div class="max_wrap001">
												<div class="max_day01"><b>기준월 :&nbsp;<span id="salesChartCalM"></span>&nbsp;월</b></div>
												<div class="max_coin01"><b>누적매출(한달) :&nbsp;<span id="salesChartCalAccrueM"></span></b></div>
											</div>
											<div id="take_chart_div_m"></div>
										</div>
										<div class="tab-pane fade active show" id="custom-tabs-one-settings" role="tabpanel" aria-labelledby="custom-tabs-one-settings-tab">
											<div class="max_wrap001">
												<div class="max_day01"><b>오늘 일자 :&nbsp;<span id="salesChartCalD"></span></b></div>
												<div class="max_coin01"><b>누적매출(일주일) :&nbsp;<span id="salesChartCalAccrueD"></span></b></div>
											</div>
											<div id="take_chart_div"></div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>


				<div class="col-lg-3">
					<!-- 재고 유통기한 임박 -->
					<div class="col-lg-3" >
						<div id="box1-3" style="width: 350px; margin-left: -50px;    height: 300px; background: #fff;">
							<div class="card box_wrap001" >
								<div class="card-header">
									<div class="row">
										<div class="col-lg-6">
											<span class="cardTitle mainTitle">재고 유통기한 임박</span>
											<i onclick="goPage('/annapharm/expert/product/product.do','C020100');" class="fa-solid fa-arrow-right-to-bracket accent pointer"></i>
										</div>
										<div class="col-lg-6 rightSort">
											<span class="cardTitle"><span class="accent">1일</span>마다 실시간 업데이트</span>
											<i class="fa-solid fa-gear pointer"></i>
										</div>
									</div>
								</div>
								<div class="card-body" style="padding: 0;">
									<div>
										<%@ include file="../viewT/StockEXP.jsp" %>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container2" style="max-width: 1280px;">
			<div class="row">
				<div class="col-lg-4" style="margin-right: 35px;">
					<!-- 공지사항 -->
						<div class="col-lg-3" >
							<!-- 공지사항 -->
							<div id="box1-3" style="width: 405px;">
								<div class="card box_wrap001" style="margin-bottom:0;" >
									<div class="card-header">
										<div class="row">
											<div class="col-lg-6">
												<span class="cardTitle mainTitle">공지사항</span>
												<i class="fa-solid fa-arrow-right-to-bracket accent pointer"></i>
											</div>
										</div>
									</div>
									<div class="card-body" style="padding: 0;">
										<div>
											<%@ include file="../viewT/notice.jsp" %>
										</div>
									</div>
								</div>
							</div>
						</div>
				</div>
				<div class="col-lg-4" style="margin-right: 36px;">
					<!-- 약사in -->

					<div class="col-lg-3" >
						<div id="box1-3" style="width: 410px;  margin-left: -40px;">
							<div class="card box_wrap001" >
								<div class="card-header">
									<div class="row">
										<div class="col-lg-6">
											<span class="cardTitle mainTitle">약사IN</span>
											<i class="fa-solid fa-arrow-right-to-bracket accent pointer"
											onClick="window.parent.location.href='<%=request.getContextPath() %>/annapharmIn/list.do'">
											</i>
										</div>
									</div>
								</div>
								<div class="card-body" style="padding: 0;">
									<div>
									<iframe name="ifr" src="<%=request.getContextPath() %>/expert/viewT/pharmacistIN.do" frameborder="0" style="width:100%; height: 185px; scrolling="no">
									</iframe>
										<%-- <%@ include file="../viewT/pharmacistIN.jsp" %> --%>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3" >
					<!-- 최근누적 재고 -->
					<div id="box1-3" style=" width: 400px;     margin-left: -70px;">
						<div class="card box_wrap001" >
							<div class="card-header">
								<div class="row">
									<div class="col-lg-6">
										<span class="cardTitle mainTitle">최근누적 재고</span>
										<i class="fa-solid fa-arrow-right-to-bracket accent pointer"></i>
									</div>
									<div class="col-lg-6 rightSort">
										<span class="cardTitle"><span class="accent">1일</span>마다 실시간 업데이트</span>
										<i class="fa-solid fa-gear pointer"></i>
									</div>
								</div>
							</div>
							<div class="card-body" style="padding: 0;">
								<div>
									<iframe name="ifr" src="<%=request.getContextPath() %>/expert/viewT/cumulativeStock.do" frameborder="0" style="width:100%; height: 185px; scrolling="no">
									</iframe>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<div>
			<input type="hidden" id="sessionChemistCode" value="${loginUser.chemistCode }">
			<input type="hidden" id="sessionChemistName" value="${loginUser.memName }">
			<input type="hidden" id="sessionPharmacyCode" value="${loginUser.pharmacyCode }">
			<input type="hidden" id="sessionPharmacyName" value="${loginUser.pharmacyName }">
		</div>


</body>
</html>