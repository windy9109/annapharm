<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	padding: 8px;
}
.btn-date{
	width: 50px;
	height: 30px;
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
</style>
</head>
<body>
	<div class="content-wrapper" style="padding: 15px;">
		<div class="container" style="max-width: 1280px;">
			<div class="row">
				<div class="col-lg-6" style="margin-top: 20px;">
					<!-- 실시간 처방 내역 -->
					<div id="box1">
						<div>
							<%@ include file="../viewT/prescription.jsp" %>
						</div>
					</div>
				</div>
				<div class="col-lg-3" style="margin-top: 20px;">
					<!-- 매출액 통계 -->
					<div id="box1-2">
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col-lg-6">
										<span class="cardTitle mainTitle">매출액 통계</span>
										<i class="fa-solid fa-arrow-right-to-bracket accent pointer"></i>
									</div>
									<div class="col-lg-6 rightSort"></div>
								</div>
							</div>
							<div class="card card-primary card-tabs">
								<div class="card-header p-0 pt-1">
									<ul class="nav nav-tabs" id="custom-tabs-one-tab"
										role="tablist">
										<li class="nav-item"><a class="nav-link"
											id="custom-tabs-one-profile-tab" data-toggle="pill"
											href="#custom-tabs-one-profile" role="tab"
											aria-controls="custom-tabs-one-profile" aria-selected="false">일년</a>
										</li>
										<li class="nav-item"><a class="nav-link"
											id="custom-tabs-one-messages-tab" data-toggle="pill"
											href="#custom-tabs-one-messages" role="tab"
											aria-controls="custom-tabs-one-messages"
											aria-selected="false">한달</a>
											</li>
										<li class="nav-item"><a class="nav-link active"
											id="custom-tabs-one-settings-tab" data-toggle="pill"
											href="#custom-tabs-one-settings" role="tab"
											aria-controls="custom-tabs-one-settings" aria-selected="true">일주일</a>
										</li>
									</ul>
								</div>
								<div class="card-body">
									<div class="tab-content" id="custom-tabs-one-tabContent">
										<div class="tab-pane fade" id="custom-tabs-one-profile" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">
											<iframe name="ifr3" src="../viewT/takeStatistics_y.jsp" frameborder="0" style=" width:250px;height:100px;" scrolling="no" border="no" >
											</iframe>
										</div>
										<div class="tab-pane fade" id="custom-tabs-one-messages" role="tabpanel" aria-labelledby="custom-tabs-one-messages-tab">
											<iframe name="ifr2" src="../viewT/takeStatistics_m.jsp" frameborder="0" style=" width:250px;height:100px;" scrolling="no" border="no" >
											</iframe>
										</div>
										<div class="tab-pane fade active show" id="custom-tabs-one-settings" role="tabpanel" aria-labelledby="custom-tabs-one-settings-tab">
											<iframe name="ifr1" src="../viewT/takeStatistics.jsp" frameborder="0" style=" width:250px;height:100px;" scrolling="no" border="no" >
											</iframe>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3" style="margin-top: 20px;" >
					<!-- 최근누적 재고 -->
					<div id="box1-3">
						<div class="card" >
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
									<%@ include file="../viewT/cumulativeStock.jsp" %>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">

				<div class="col-lg-6">
					<!-- 실시간 처방분석통계 -->
					<div class="card">
						<div class="card card-secondary card-tabs">
							<div class="card-header p-0 pt-1">
								<ul class="nav nav-tabs" id="custom-tabs-two-tab" role="tablist">
									<li class="pt-2 px-3">
										<span class="cardTitle mainTitle">실시간 처방 환자 분석통계</span>
										<i class="fa-solid fa-arrow-right-to-bracket accent pointer"></i>
									</li>


									<div class="col-lg-6 rightSort" style="max-width: 250px;">
										<span class="cardTitle"><span class="accent">30초</span>마다 실시간 업데이트</span>
										<i class="fa-solid fa-gear pointer"></i>
									</div>


									<li class="nav-item"><a class="nav-link active"
										id="custom-tabs-two-home-tab" data-toggle="pill"
										href="#custom-tabs-two-home" role="tab"
										aria-controls="custom-tabs-two-home" aria-selected="true">한달</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										id="custom-tabs-two-profile-tab" data-toggle="pill"
										href="#custom-tabs-two-profile" role="tab"
										aria-controls="custom-tabs-two-profile" aria-selected="false">일주일</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										id="custom-tabs-two-messages-tab" data-toggle="pill"
										href="#custom-tabs-two-messages" role="tab"
										aria-controls="custom-tabs-two-messages" aria-selected="false">어제</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										id="custom-tabs-two-settings-tab" data-toggle="pill"
										href="#custom-tabs-two-settings" role="tab"
										aria-controls="custom-tabs-two-settings" aria-selected="false">오늘</a>
									</li>
								</ul>
							</div>
							<div class="card-body">
								<div class="tab-content" id="custom-tabs-two-tabContent">
									<div class="tab-pane fade show active"
										id="custom-tabs-two-home" role="tabpanel"
										aria-labelledby="custom-tabs-two-home-tab">
										<iframe name="ifr" src="../viewT/analysisPrescription_m.jsp" frameborder="0" style="    float: left; width:300px;height:200px;" scrolling="no" border="no" >
										</iframe>
											<%@ include file="../viewT/salesStatistics_m.jsp" %>
									</div>
									<div class="tab-pane fade" id="custom-tabs-two-profile"
										role="tabpanel" aria-labelledby="custom-tabs-two-profile-tab">
										<iframe name="ifr" src="../viewT/analysisPrescription_w.jsp" frameborder="0" style="    float: left; width:300px;height:200px;" scrolling="no" border="no" >
										</iframe>
											<%@ include file="../viewT/salesStatistics_w.jsp" %>

										</div>
									<div class="tab-pane fade" id="custom-tabs-two-messages"
										role="tabpanel" aria-labelledby="custom-tabs-two-messages-tab">
										<iframe name="ifr" src="../viewT/analysisPrescription_y.jsp" frameborder="0" style="    float: left; width:300px;height:200px;" scrolling="no" border="no" >
										</iframe>
											<%@ include file="../viewT/salesStatistics_y.jsp" %>

										</div>
									<div class="tab-pane fade" id="custom-tabs-two-settings"
										role="tabpanel" aria-labelledby="custom-tabs-two-settings-tab">
										<iframe name="ifr" src="../viewT/analysisPrescription_y.jsp" frameborder="0" style="    float: left; width:300px;height:200px;" scrolling="no" border="no" >
										</iframe>
											<%@ include file="../viewT/salesStatistics.jsp" %>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		<!-- 실시간처방분석통계 마침 -->
<!-- 최다판매약품 시작-->
<div class="col-lg-3">
					<!-- 최다 판매 약품 -->
					<div id="box2-2">
						<div class="card card-secondary card-tabs">
							<div class="card-header p-0 pt-1">
								<ul class="nav nav-tabs" id="custom-tabs-two-tab" role="tablist">
									<li class="pt-2 px-3">
										<span class="cardTitle mainTitle">최다 판매 약품</span>
										<i class="fa-solid fa-arrow-right-to-bracket accent pointer"></i>
									</li>
									<li class="nav-item"><a class="nav-link active"
										id="custom-tabs-two-home-tab" data-toggle="pill"
										href="#custom-tabs-two-home0" role="tab"
										aria-controls="custom-tabs-two-home0" aria-selected="true">한달</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										id="custom-tabs-two-profile-tab" data-toggle="pill"
										href="#custom-tabs-two-profile0" role="tab"
										aria-controls="custom-tabs-two-profile0" aria-selected="false">일주일</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										id="custom-tabs-two-messages-tab" data-toggle="pill"
										href="#custom-tabs-two-messages0" role="tab"
										aria-controls="custom-tabs-two-messages0" aria-selected="false">어제</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										id="custom-tabs-two-settings-tab" data-toggle="pill"
										href="#custom-tabs-two-settings0" role="tab"
										aria-controls="custom-tabs-two-settings0" aria-selected="false">오늘</a>
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
					<!-- 재고 유통기한 임박 -->
					<div class="col-lg-3" >
						<div id="box1-3">
							<div class="card" >
								<div class="card-header">
									<div class="row">
										<div class="col-lg-6">
											<span class="cardTitle mainTitle">재고 유통기한 임박</span>
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
						<div class="col-lg-3" style="margin-top: 20px;" >
							<!-- 공지사항 -->
							<div id="box1-3" style="width: 450px;">
								<div class="card" >
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

					<div class="col-lg-3" style="margin-top: 20px;" >
						<div id="box1-3" style="width: 450px;">
							<div class="card" >
								<div class="card-header">
									<div class="row">
										<div class="col-lg-6">
											<span class="cardTitle mainTitle">약사IN</span>
											<i class="fa-solid fa-arrow-right-to-bracket accent pointer"></i>
										</div>
									</div>
								</div>
								<div class="card-body" style="padding: 0;">
									<div>
										<%@ include file="../viewT/pharmacistIN.jsp" %>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<!-- 재고부족 -->
					<div class="col-lg-3" style="margin-top: 20px;" >
						<div id="box1-3">
							<div class="card" >
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
		</div>
	</div>
</body>
</html>