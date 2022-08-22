<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
</style>
</head>
<body>
	<div class="content-wrapper">
		<div class="card" style="background: #fff; margin: 30px; margin-bottom: 0px; border-radius: 0.25rem 0 0.25rem 0.25rem;">

			<div class="card-header with-border" style="display: -webkit-box; padding: 20px; border-bottom: 0;">
				<span style="font-weight: bold; font-size: 20px; padding: 0px 7.5px;">과거처방내역(상세)</span>
				<div style="position: absolute; right: 20px; font-size: 14px; top: 20px; margin-bottom: 30px;">
					<span> 처방내역은 최대 <span style="color: #2F88FF">6개월</span>까지 조회가능합니다.
					</span>
				</div>

				<br> <br>
			</div>
			<!-- card-header끝! -->
			<hr style="width: 95%; margin: auto;">
			<div class="card-body" style="min-height: 590px; font-size: 14px;">
				<table class="table text-nowrap table-bordered" id="vertical-1" style="height: 50px; width: 100%; text-align: center;">


					<tr>
						<th style="border: 0; border-bottom: 1px solid #0069d9; border-top: 2px solid #0069d9; color: #0069d9;">처방약국</th>
						<td style="background-color: #FFFFFF;">똥글똥글약국</td>
						<th style="border: 0; border-bottom: 1px solid #0069d9; border-top: 2px solid #0069d9; color: #0069d9;">처방일자</th>
						<td style="background-color: #FFFFFF;">2022.07.07</td>
					</tr>
				</table>

				<br>
				<table class="table text-nowrap" style="text-align: center;">
					<thead style="border: 0px solid; border-top: 2px solid #0069d9;">
						<tr>
							<th style="width: 55px; border: 0; border-bottom: 1px solid #0069d9; color: #0069d9;">번호</th>
							<th style="width: 525px; border: 0; border-bottom: 1px solid #0069d9; color: #0069d9;">처방약</th>
							<th style="width: 200px; border: 0; border-bottom: 1px solid #0069d9; color: #0069d9;">횟수</th>
							<th style="width: 200px; border: 0; border-bottom: 1px solid #0069d9; color: #0069d9;">일수</th>
							<th style="width: 200px; border: 0; border-bottom: 1px solid #0069d9; color: #0069d9;">복약지도</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>4</td>
							<td>에트론가나콘정50밀리그램</td>
							<td>3</td>
							<td>1</td>
							<td><i class='fas fa-cloud-download-alt' style='font-size: 24px; color: #00A5FF;'></i></td>
						</tr>
						<tr>
							<td>3</td>
							<td>건알펠로디핀정5밀리그램</td>
							<td>3</td>
							<td>1</td>
							<td><i class='fas fa-cloud-download-alt' style='font-size: 24px; color: #00A5FF;'></i></td>
						</tr>
						<tr>
							<td>2</td>
							<td>진타주250IU(모록토코그알파)(혈액응고인자VIII, 유전자재조합)</td>
							<td>4</td>
							<td>3</td>
							<td><i class='fas fa-cloud-download-alt' style='font-size: 24px; color: #00A5FF;'></i></td>
						</tr>
						<tr>
							<td>1</td>
							<td>포크랄시럽(포수클로랄)_(1g/50m)</td>
							<td>4</td>
							<td>3</td>
							<td><i class='fas fa-cloud-download-alt' style='font-size: 24px; color: #00A5FF;'></i></td>
						</tr>
					</tbody>
				</table>

				<div class="goListBtnDiv">
					<a href="pastPrescriptionList.jsp" class="goListBtn">목록으로</a>
				</div>
			</div>
			<div class="card-footer" style="background: transparent;">
				<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
			</div>
		</div>


	</div>
</body>
</html>