<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	padding: 3px;
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

.col-lg-3, .col-lg-6 {
	padding-right: 5px;
	max-width: none;
}

.col-lg-6 {
	display: inline-block;
}

.col-lg-4 {
	max-width: initial;
}

.member_box {
	text-align: center;
	border: 1px solid #ddd;
	background: #fff;
	height: 185px;
	display: table;
	width: 100%;
	border-top: 3px solid #007bff !important;
	border-radius: 5px;
}

.member_b {
	display: table-cell;
	padding: 0 30px;
	vertical-align: middle;
	width: 20%;
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
	margin-bottom: 20px;
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

<div class="card card-primary card-outline" style="padding: 10px;">
	<div class="card-header">

		<div style="float: right;font-size: 12px;">
			<span class="cardTitle"><span class="accent">1일</span>마다 실시간 업데이트</span> <i class="fa-solid fa-gear pointer"></i>
			<span class="cardTitle" style="margin-left: 10px;"><span class="accent"><img src="<%=request.getContextPath()%>/resources/img/Vector1.png"></span>새로고침</span>
		</div>
	</div>
	<div class="card-body" style="text-align: center; padding: 25px;">
		<div style="width: 19%; display: inline-block;">
			<div class="member_n1">총 누적회원 수</div>
			<h4 class="member_n2">${allCount}</h4>
			<div class="member_n3">
				<span>이전달 대비</span><br> <b>${allCountCompare}명</b>
				<bb>증가</bb>
			</div>
		</div>
		<div style="width: 19%; display: inline-block;">
			<div class="member_n1">약사회원 수</div>
			<h4 class="member_n2">${allPharmacy}</h4>
			<div class="member_n3">
				<span>이전달 대비</span><br> <b>${allPountCompare}명</b>
				<bb>증가</bb>
			</div>
		</div>
		<div style="width: 19%; display: inline-block;">
			<div class="member_n1">의사회원 수</div>
			<h4 class="member_n2">${allDoctor}</h4>
			<div class="member_n3">
				<span>이전달 대비</span><br> <b>${allDoctorCompare}명</b>
				<bb>증가</bb>
			</div>
		</div>
		<div style="width: 19%; display: inline-block;">
			<div class="member_n1">일반회원 수</div>
			<h4 class="member_n2">${allNormal}</h4>
			<div class="member_n3">
				<span>어제 대비</span><br> <b>${allNormalCompare}명</b>
				<bb>증가</bb>
			</div>
		</div>
		<div style="width: 19%; display: inline-block;">
			<div class="member_n1">오늘의 총 신규회원 수</div>
			<h4 class="member_n2">${newCount}</h4>
			<div class="member_n3">
				<span>어제 대비</span><br> <b>${newCountCompare}명</b>
				<bb>증가</bb>
			</div>
		</div>
	</div>

</div>