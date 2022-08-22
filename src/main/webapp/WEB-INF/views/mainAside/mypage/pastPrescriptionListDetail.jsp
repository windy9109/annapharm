<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="pastPrescriptionDetail" value="${dataMap.pastPrescriptionDetail }" />
<html>
<head>
<meta charset="UTF-8">
<title>일반 - 과거처방내역 상세보기</title>
<style type="text/css">
.btn_regist {
	border: none;
	border-radius: 5px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	padding: 0px 30px;
	background-color: #2F88FF;
	color: white;
}

.stand-by {
	background-color: #adb5bd;
	background: #adb5bd;
	color: white;
}

.stand-end {
	background-color: #007bff;
	background: #007bff;
	color: white;
}

.goListBtnDiv {
	width: 100%;
	height: 50px;
	text-align: center;
	padding-left: 90%;
}

/* 목록으로 버튼 */
.goListBtn {
	height: 30px;
	width: 90px;
	display: block;
	position: relative;
	float: left;
	padding: 0;
	/* margin: 10px 20px 10px 0; */
	text-align: center;
	line-height: 30px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
	border: 0;
	background: #1E90FF;
}

.goListBtn:hover {
	background: #1478FF;
	color: #FFF;
}

.fa-cloud-download-alt:hover {
	color: #00458f !important;
}
</style>
</head>
<body>
	<div class="content-wrapper">
		<div class="card" style="background: #fff; margin: 30px; margin-bottom: 0px; border-radius: 0.25rem 0 0.25rem 0.25rem;">

			<div class="card-header with-border" style="display: -webkit-box; display: block; padding: 20px; padding-bottom: 15px; border-bottom: 0;">
				<span style="font-weight: bold; font-size: 20px; padding: 0px 7.5px;">과거처방내역</span>
				<div style="position: absolute; right: 20px; font-size: 14px; top: 20px; margin-bottom: 30px;">
					<span> 처방내역은 최대 <span style="color: #2F88FF">6개월</span>까지 조회가능합니다.
					</span>
				</div>
				<br>
				<button class="btn btn-block btn-outline-primary" style="font-size: 14px; display: inline-block; margin: 8px; margin-bottom: 0px; width: 100px; padding: 3px;" onclick="history.back()">
					<b>&lt;</b>&nbsp;목록으로
				</button>
				<br>
			</div>
			<!-- card-header끝! -->
			<hr style="width: 95%; margin: auto;">
			<div class="card-body" style="min-height: 590px; font-size: 14px;">
				<table class="table text-nowrap table-bordered" id="vertical-1" style="height: 50px; width: 100%; text-align: center;">


					<tr>
						<th style="border: 0; border-bottom: 1px solid #0069d9; border-top: 2px solid #0069d9; color: #0069d9; min-width: 200px;">처방약국</th>
						<td onclick="goFindPharmacy(this);" style="background-color: #FFFFFF; min-width: 200px; font-weight: bold;">
						<c:forEach items="${pastPrescriptionDetail }" var="pastPrescription" varStatus="count" end="0">
						${pastPrescription.piDutyname } <input type="hidden" value="${pastPrescription.phmacyCode}"/>
						</c:forEach></td>
						<th style="border: 0; border-bottom: 1px solid #0069d9; border-top: 2px solid #0069d9; color: #0069d9; min-width: 200px;">처방일자</th>
						<td style="background-color: #FFFFFF; min-width: 200px; font-weight: bold;">
						<c:forEach items="${pastPrescriptionDetail }" var="pastPrescription" varStatus="count" end="0">
						<fmt:formatDate pattern="yyyy-MM-dd" value="${pastPrescription.psDate }" />
						</c:forEach>
						</td>
					</tr>
				</table>

				<br>
				<table class="table table-bordered" style="text-align: center;">
					<thead style="border: 0px solid; border-top: 2px solid #0069d9;">
						<tr >
							<th style="width: 55px; border: 0; border-bottom: 1px solid #0069d9; color: #0069d9;">번호</th>
							<th style="width: 425px; border: 0; border-bottom: 1px solid #0069d9; color: #0069d9;">처방약</th>
							<th style="width: 150px; border: 0; border-bottom: 1px solid #0069d9; color: #0069d9;">횟수</th>
							<th style="width: 150px; border: 0; border-bottom: 1px solid #0069d9; color: #0069d9;">일수</th>
							<th style="width: 150px; border: 0; border-bottom: 1px solid #0069d9; color: #0069d9;">약품상세</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pastPrescriptionDetail }" var="pastPrescription" varStatus="count">
							<tr>
								<td style="border: 0; border-bottom: 1px solid #d9d9d9;">${count.count}</td>
								<td style="border: 0; border-bottom: 1px solid #d9d9d9; text-align: left; padding-left: 30px;">${pastPrescription.mdName }</td>
								<td style="border: 0; border-bottom: 1px solid #d9d9d9;">${pastPrescription.preDrugCount }</td>
								<td style="border: 0; border-bottom: 1px solid #d9d9d9;">${pastPrescription.preDrugDay }</td>
								<td style="border: 0;padding: 10px; border-bottom: 1px solid #d9d9d9;"><i class='fas fa-cloud-download-alt' style='font-size: 20px; color: #00A5FF;' onclick="OpenWindow('https://nedrug.mfds.go.kr/pbp/CCBBB01/getItemDetail?itemSeq=${pastPrescription.mdNo}','상세보기','600','800')"></i></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>


			</div>
			<div class="card-footer" style="background: transparent;">
				<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
			</div>
		</div>


	</div>
	
	<script type="text/javascript">
	function goFindPharmacy(target){
		var piHpid = target.querySelector('input').value;
// 		console.log(piHpid);
		window.top.location.href = "<%=request.getContextPath()%>/index.do?mCode=U010000&piHpid=" + piHpid;
<%-- 		location.href = "<%=request.getContextPath()%>/searchPharmacy/goPharmacy.do"; --%>
	}
	
	</script>
	
	
</body>
</html>