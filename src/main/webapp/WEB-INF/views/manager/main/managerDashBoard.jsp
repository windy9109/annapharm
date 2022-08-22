<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.nav-item {
	float: right;
}

.nav-item:last-child {
	margin-right: 10px;
}

#box1, #box2 {
	width: 620px;
	/* 	border: 1px solid black;  */
}

#box1-2, #box1-3, #box2-2, #box2-3, #box3-3 {
	width: 312px;
	border-top: 3px solid #007bff !important;
	border-radius: 5px;
	border-bottom: 0 !important;
	margin-bottom: 15px;
	box-shadow: 0 0 1px rgb(0 0 0/ 13%), 0 1px 3px rgb(0 0 0/ 20%);
	/* 	border: 1px solid black; */
}

#box3, #box3-2 {
	width: 415px;
	height: 280px;
	/* 	border: 1px solid black; */
}

.container2 {

}

.accent {
	color: red;
}

.pointer {
	cursor: pointer;
}

.rightSort {
	text-align: right;
	font-size: 0.7em;
	padding: 5px;
}

.mainTitle {
	font-weight: bold;
}

.card-header {
	padding: 8px;
}

.btn-date {
	width: 50px;
	height: 30px;
}

.nav-link {
	font-size: 14px;
	padding: 5px;
}
/* .col-lg-3, .col-lg-6{ */
/* 	padding-right:5px; */
/* 	max-width: none; */
/* } */

/* .col-lg-6{ */
/* 	display: inline-block; */

/* } */
/* .col-lg-4{ */
/*     max-width: initial; */
/*    } */
.member_box {
	text-align: center;
	border: 1px solid #ddd;
	background: #fff;
	padding: 40px 20px;
	margin-top: 10px;
	border-top: 3px solid #007bff !important;
	border-radius: 5px;
}

.member_b {
	display: inline-block;
	padding: 0 30px;
	border-right: 1px solid #ddd;
}

.member_b:last-child {
	border: 0;
}

.qwe1_wrap {
	width: 50%;
	text-align: right;
}

.member_n3 span {

}

.member_n3 b {
	color: #ff0000;
}

.member_n3 bb {
	color: #ff0000;
}

.member_b1 {

}

.member_b2 {

}

.member_b3 {

}

.member_b4 {

}

.member_b5 {

}

.member_n1 {
	font-size: 12px;
	color: #777;
}

.member_n2 {
	font-weight: 600;
	font-size: 40px;
	letter-spacing: -2px;
	color: #666;
}

.member_n3 {
	letter-spacing: -1px;
	color: #333;
}

.qwe1 {
	text-align: right;
	display: inline-block;
	font-size: 12px;
	margin-bottom: 10px;
	padding-right: 20px;
}

.qwe2 {
	text-align: right;
	display: inline-block;
	float: right;
	font-size: 12px;
}

.qwe_r1 {
	width: 100%;
	margin-bottom: 10px;
}

.vit_rwap {
	padding: 10px 20px 10px;
}

.vit1 {

}

.vit2 {

}

.vit3 {
	border-top: 1px solid #ddd;
	padding: 10px 0;
	padding-bottom: 0 !important;
}

.vit {
	padding-bottom: 10px;
	font-size: 12px;
}

.vit b {

}

.vit bb {

}

.vit1 span, .vit2 span, .vit1 b, .vit2 b {
	width: 33%;
	display: inline-block;
}
</style>
</head>
<body>
	<div class="content-wrapper" style="padding: 15px;">
		<div class="container" style="max-width: 1280px;">
			<!-- 회원 통계  -->
			<div class="row">
				<!-- 회원수 -->
				<div>
					<iframe name="ifr" src="<%=request.getContextPath()%>/manager/viewT/memberCount.do" frameborder="0" width='1250px' height='226px'> </iframe>
				</div>
			</div>
			<!-- 회원 통계 끝!! -->

			<!-- 2번째 줄  -->
			<div class="row">
				<!-- 방문자요약 -->
				<div class="col-lg-4">
					<!-- 					<div id="box1-3"> -->
					<div class="card card-primary card-outline " style="padding: 10px;">
						<div class="card-header">
							<div class="row">
								<div class="col-lg-6">
									<span class="cardTitle mainTitle">방문자 요약</span> <i class="fa-solid fa-arrow-right-to-bracket accent pointer"></i>
								</div>
								<div class="col-lg-6 rightSort">
									<span class="cardTitle"><span class="accent">1일</span>마다 실시간 업데이트</span> <i class="fa-solid fa-gear pointer"></i>
								</div>
							</div>
						</div>
						<div class="card-body" style="padding: 0;">
							<div>
								<iframe name="ifr3" src="<%=request.getContextPath()%>/manager/viewT/visit.do" frameborder="0" style="width: 300px; height: 140px;" scrolling="no" border="no"> </iframe>
								<div>
									<div class="vit1 vit">
										<span>오늘방문자</span><b>14</b>
									</div>
									<div class="vit2 vit">
										<span>오늘방문자</span><b>14</b>
										<bb>3%▲</bb>
									</div>
									<div class="vit3 vit">
										<div class="qwe1">
											<span class="cardTitle"><span class="accent"><img src="<%=request.getContextPath()%>/resources/img/Vector1.png"></span>새로고침</span>
										</div>
										<div class="qwe2">
											<span class="cardTitle"><span class="accent">1일</span>마다 실시간 업데이트</span> <i class="fa-solid fa-gear pointer"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 						</div> -->
					</div>
				</div>

				<!-- 방문자요약 -->
				<!-- 공지사항 시작-->
				<div class="col-lg-3">
					<div class="col-lg-3">
						<div id="box1-3">
							<div class="card">
								<div class="card-header">
									<div class="row">
										<div class="col-lg-6">
											<span class="cardTitle mainTitle">공지사항</span> <i class="fa-solid fa-arrow-right-to-bracket accent pointer"></i>
										</div>
									</div>
								</div>
								<div class="card-body" style="padding: 0;">
									<div>
										<%@ include file="../viewT/notice.jsp"%>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 공지사항 마침 -->
				<div class="col-lg-3">
					<!-- 활동로그 -->
					<div class="col-lg-3" style="padding-right: 0;">
						<div id="box1-3">
							<div class="card">
								<div class="card-header">
									<div class="row">
										<div class="col-lg-6" style="flex: 0 0 30%;">
											<span class="cardTitle mainTitle">활동로그</span> <i class="fa-solid fa-arrow-right-to-bracket accent pointer"></i>
										</div>
									</div>
								</div>
								<div class="card-body" style="padding: 0;">
									<div>
										<%@ include file="../viewT/log.jsp"%>
									</div>
								</div>
								<div class="tre1" style="padding: 7px 10px 13px; display: inline-block;">
									<div class="qwe1">
										<span class="cardTitle"><span class="accent"><img src="<%=request.getContextPath()%>/resources/img/Vector1.png"></span>새로고침</span>
									</div>
									<div class="col-lg-6 rightSort" style="display: inline-block; float: right; width: auto;">
										<span class="cardTitle"><span class="accent">1일</span>마다 실시간 업데이트</span> <i class="fa-solid fa-gear pointer"></i>
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
				<div class="col-lg-4" style="padding: 0; margin: 0;">
					<!-- 답변대기중인 문의사항 -->
					<div class="col-lg-6">
						<div id="box1-3" style="width: 630px; margin-bottom: 0;">
							<div class="card" style="background: transparent; background: #fff; display: block;">
								<div class="card-header">
									<div class="row">
										<div class="col-lg-6">
											<span class="cardTitle mainTitle">답변대기 중인 문의사항</span> <i class="fa-solid fa-arrow-right-to-bracket accent pointer"></i>
										</div>
										<div class="qwe1_wrap">
											<div class="qwe1">
												<span class="cardTitle"><span class="accent"><img src="<%=request.getContextPath()%>/resources/img/Vector1.png"></span>새로고침</span>
											</div>
											<div class="qwe2" style="line-height: 23px;">
												<span class="cardTitle"><span class="accent">1일</span>마다 실시간 업데이트</span> <i class="fa-solid fa-gear pointer"></i>
											</div>
										</div>
									</div>
								</div>
								<div class="card-body" style="padding: 0;">
									<div>
										<%@ include file="../viewT/qna.jsp"%>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4" style="padding: 0; margin: 0;">
					<!-- faq -->

					<div class="col-lg-3">
						<div id="box1-3" style="width: 350px; margin-bottom: 0;">
							<div class="card">
								<div class="card-header">
									<div class="row">
										<div class="col-lg-6">
											<span class="cardTitle mainTitle">FAQ등록</span> <i class="fa-solid fa-arrow-right-to-bracket accent pointer"></i>
										</div>
									</div>
								</div>
								<div class="card-body" style="padding: 0;">
									<div>
										<%@ include file="../viewT/faq.jsp"%>
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