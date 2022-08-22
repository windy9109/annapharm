<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근 처방전 조회하기</title>

<style>


.button {
	width: 55px;
	height: 25px;
	padding: 0;
	/* margin: 10px 20px 10px 0; */
	font-weight: 600;
	text-align: center;
	line-height: 25px;
	color: #FFF;
	border-radius: 5px;
	border: 0px;
	transition: all 0.2s;
}


/* 처방전상세내역버튼(추가, 저장, 취소) */
.btnBlueGreen {
	background: #1E82FF;
}

.btnFade.btnBlueGreen:hover {
	background: #0A6EFF;
}

/* 괄호안 문자 span태그 */
.titleSpan{
	font-size: 12px;
}

th{
	background-color: #E8F5FF;
	font-size: 12px;
	height: 25px;
}
td{
	font-size: 12px;
	height: 25px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

.scrolltbody, .scrolltbody2{
    display: block;
}

/* 처방전이 출력되는 테이블 tbody */
.scrolltbody tbody{
	display: block;
    height: 126px;
    max-height: 126px;
    overflow: auto;
}

/* 처방전 상세내역이 출력되는 테이블 tbody */
.scrolltbody2 tbody{
	display: block;
    height: 185px;
    max-height: 185px;
    overflow: auto;
}

.scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) { width: 60px; }
.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) { width: 100px; }
.scrolltbody th:nth-of-type(3), .scrolltbody td:nth-of-type(3) { width: 100px; }
.scrolltbody th:nth-of-type(4), .scrolltbody td:nth-of-type(4) { width: 100px; }
.scrolltbody th:nth-of-type(5), .scrolltbody td:nth-of-type(5) { width: 100px; }
.scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) { max-width: 60px; }
.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) { max-width: 100px; }
.scrolltbody th:nth-of-type(3), .scrolltbody td:nth-of-type(3) { max-width: 100px; }
.scrolltbody th:nth-of-type(4), .scrolltbody td:nth-of-type(4) { max-width: 100px; }
.scrolltbody th:nth-of-type(5), .scrolltbody td:nth-of-type(5) { max-width: 100px; }

.scrolltbody2 th:nth-of-type(1), .scrolltbody2 td:nth-of-type(1) { width: 140px; }
.scrolltbody2 th:nth-of-type(2), .scrolltbody2 td:nth-of-type(2) { width: 80px; }
.scrolltbody2 th:nth-of-type(3), .scrolltbody2 td:nth-of-type(3) { width: 60px; }
.scrolltbody2 th:nth-of-type(4), .scrolltbody2 td:nth-of-type(4) { width: 60px; }
.scrolltbody2 th:nth-of-type(5), .scrolltbody2 td:nth-of-type(5) { width: 60px; }
.scrolltbody2 th:nth-of-type(6), .scrolltbody2 td:nth-of-type(6) { width: 60px; }
.scrolltbody2 th:nth-of-type(1), .scrolltbody2 td:nth-of-type(1) { max-width: 140px;}
.scrolltbody2 th:nth-of-type(2), .scrolltbody2 td:nth-of-type(2) { max-width: 80px;  }
.scrolltbody2 th:nth-of-type(3), .scrolltbody2 td:nth-of-type(3) { max-width: 60px;  }
.scrolltbody2 th:nth-of-type(4), .scrolltbody2 td:nth-of-type(4) { max-width: 60px;  }
.scrolltbody2 th:nth-of-type(5), .scrolltbody2 td:nth-of-type(5) { max-width: 60px;  }
.scrolltbody2 th:nth-of-type(6), .scrolltbody2 td:nth-of-type(6) { max-width: 60px;  }


label{
	margin-right: 10px;
}

/* 환자 정보 입력 div */
.patientInfoDetail{
	margin-bottom: 10px !important;
}

#phoneSpan{
	font-size: 12px;
    font-weight: bold;
    position: relative;
    left: 30px;
}

/* 조제대기 버튼 배경 */
.statusReady {
	background-color: #FF3232;
	color: white;
}

/* 조제완료 버튼 배경 */
.statusEnd {
	background-color: #1478CD;
	color: white;
}

/* 수정요청 버튼 배경 */
.statusUpdate {
	background-color: #FF9B00;
	color: white;
}

/* 테이블 왼쪽 정렬 */
.tdLeft{
	text-align: left;
}


</style>

</head>
<body>
	<div class="content-wrapper">
		<div class="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="card card-outline"></div>
					</div>
				</div>
				<div class="card card-primary card-outline" style="height: 230px;">
					<div class="card-header">
						<h5 class="card-title m-0 title">
							<i class='far fa-address-card' style='font-size: 20px'></i> 간편 처방전 확인하기!
						</h5>
					</div>
					<div class="card-body" style="text-align: center;">
						<form method="post" action="insertMemberForPharmacist" name="registForm" id="registForm" target="_parent" style="font-size: 12px;">
							<div class="patientInfoDetail mb-3">
								<label for="total_salesCount" style="text-align: right; margin-right: 15px;">이&emsp;&nbsp;름</label>
								<input type="text" class="memberName" name="memName" id="memberName" onkeyup="patientEnter()"><br />
							</div>

							<div class="patientInfoDetail mb-3">
								<label for="total_salesFee" style="text-align: right; margin-right: 13px;">생년월일</label>
								<input type="text" onkeyup="" class="memberReg" name="memRegnum" id="memRegnum" onkeyup="patientEnter()" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">&nbsp;
							</div>
							<div class="patientInfoDetail mb-3">
									<label for="total_compoundingFee" style="text-align: right;">전화번호</label>
									<input type="text" class="memberTel" name="memTel" id="memTel" onkeyup="patientEnter()" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"><br />
									<span id="phoneSpan">(※ '-'를 빼고 입력해주세요.)</span>
							</div>
							<div class="addViewBtn">
								<button class="button btnFade btnBlueGreen addBtn" type="button"
									onclick="prescriptionRead()"class="insertMemberForPharmacist" id="insertMemberForPharmacist"
									style="width: 70px; margin-right: 25px;">조회</button>
								<button onclick="window.close()" class="button btnFade btnBlueGreen viewBtn" type="button"
									style="width: 70px;">닫기</button>
							</div>
						</form>
					</div>
				</div>

				<div class="card card-primary card-outline" style="height: 245px; display:none;" id="prescriptionDetailCard">
					<div class="card-header">
						<h5 class="card-title m-0 title">
							<i class='far fa-file-alt icon-size'></i> 처방전 확인하기<span class="titleSpan">(※ 간편 조회는 최근 30일내 자료를 최신순으로 출력합니다.)</span>
						</h5>
					</div>
					<div class="card-body" style="text-align: center;">
						<div class="row">
							<table id="example2" class="table-bordered dataTable dtr-inline scrolltbody" role="grid" aria-describedby="example1_info"
									style="margin:9px; margin-top: 0px;">
								<thead>
									<tr role="row" style="text-align: center;">
										<th class="inquriy_list" style="width: 60px;">구분</th>
										<th class="inquriy_list" style="width: 100px;">처방일</th>
										<th class="inquriy_list" style="width: 100px;">처방병원	</th>
										<th class="inquriy_list" style="width: 100px;">
											제조약국
											<i class="fa-solid fa-circle-question" data-toggle="tooltip" title="처방전을 조제받지 않았을 시 약국은 출력되지 않습니다."></i>
										</th>
										<th class="inquriy_list" style="width: 100px;">처방전 상태</th>
									</tr>
								</thead>
								<tbody id="nonLoginPrescriptionList">
									<!-- Handlebars : id="nonLoginPrescription-list-template" -->
								</tbody>
							</table>
						</div>
						<div class="row">

						</div>
					</div>
				</div>

				<div class="card card-primary card-outline" style="height: 300px; display:none;" id="prescriptionDetailMedicienCard">
					<div class="card-header">
						<h5 class="card-title m-0 title">
							<i class='far fa-edit icon-size'></i> 처방전 상세내역 확인하기<span class="titleSpan">(※ 더블 클릭하면 상세정보를 확인할 수 있습니다)</span>
						</h5>
					</div>
					<div class="card-body" style="text-align: center;">
						<div class="row">
							<table id="example2" class="table-bordered dataTable dtr-inline scrolltbody2" role="grid" aria-describedby="example1_info"
									style="margin:9px; margin-top: 0px;">
								<thead>
									<tr role="row" style="text-align: center;">
										<th class="inquriy_list" style="width: 140px;">약명</th>
										<th class="inquriy_list" style="width: 80px;">제조사</th>
										<th class="inquriy_list" style="width: 60px;">유형</th>
										<th class="inquriy_list" style="width: 60px;">급여</th>
										<th class="inquriy_list" style="width: 60px;">
										횟수
										<i class="fa-solid fa-circle-question" data-toggle="tooltip" title="하루기준 복용량"></i>
										</th>
										<th class="inquriy_list" style="width: 60px;">일수</th>
									</tr>
								</thead>
								<tbody id="nonLoginUserprescriptionReadDetail">
									<!-- Handlebars : id = nonLoginPrescriptionDetail-list-template -->
								</tbody>
							</table>
						</div>
						<div class="row">

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		window.onload = function(){
			$('[data-toggle="tooltip"]').tooltip();
			//findListChecked();
		}
	</script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
	<!-- 처방전 확인하기 테이블을 채워주는 핸들바스 -->
	<script  type="text/x-handlebars-template"  id="nonLoginPrescription-list-template">
		{{#each .}}
			<tr class="nonLoginPrescriptionTr" onclick="prescriptionReadDetail('{{psCode}}', this)">
				<td style="width: 60px; " class="dtr-control sorting_1" data-toggle="tooltip" title="">{{inc @index}}</td>
				<td style="width: 100px;">{{prettifyDate psDate}}</td>
				<td style="width: 100px;">{{hospitalName}}</td>
				<td style="width: 110px;">{{pharmacyName}}</td>
				{{#eq psStatus "조제대기"}}
					<td class="statusReady">{{psStatus}}</td>
				{{else eq psStatus "조제완료"}}
					<td class="statusEnd">{{psStatus}}</td>
				{{else}}
					<td class="statusUpdate">{{psStatus}}</td>
				{{/eq}}
			</tr>
		{{/each}}
	</script>
	<script  type="text/x-handlebars-template"  id="nonLoginPrescriptionDetail-list-template">
		{{#each .}}
			<tr class="nonLoginUserprescriptionReadDetailTr" onclick="medicienCheck(this)" ondblclick="medicienInfoOpen('{{mdNo}}')">
					<td class="tdLeft" style="width: 140px;" class="dtr-control sorting_1" data-toggle="tooltip" title="{{mdName}}">{{mdName}}</td>
					<td class="tdLeft" style="width: 80px;" data-toggle="tooltip" title="{{miCompany}}">{{miCompany}}</td>
					<td style="width: 60px;">{{miUse}}</td>
					<td style="width: 60px;">{{insurance}}</td>
					<td style="width: 60px;">{{preDrugCount}}</td>
					<td style="width: 60px;">{{preDrugDay}}</td>
			</tr>
		{{/each}}
	</script>

	<script>
	// 조회 버튼 클릭 시 최근 30일 내 처방전을 보여주는 이벤트
	function prescriptionRead(){

		var detailCard = document.querySelector('#prescriptionDetailCard');
		var detailMedicienCard = document.querySelector('#prescriptionDetailMedicienCard');

		var name = $.trim($('#memberName').val());
		var birth = $.trim($('#memRegnum').val());
		var phone = $.trim($('#memTel').val());

		// 입력값 검사
		if(name == null || name == ""){
			alert('이름이 입력되지 않았습니다.');
			return
		}
		if(birth == null || birth == ""){
			alert('생년월일이 입력되지 않았습니다.');
			return
		}
		if(phone == null || phone == ""){
			alert('전화번호가 입력되지 않았습니다.');
			return
		}

		$.ajax({
			url:"nonLoginPrescription?name="+ name + "&birth=" + birth + "&phone=" + phone,
			type:"get",
			success: function(res){

				if(res == null || res == ""){
					alert('최근 30일내 조회되는 처방전이 없습니다.');
					return;
				}

				if(res[0].memName == "none"){
					alert('일치하는 환자 정보가 없습니다.')
					return;
				}

				printDataNonLoginPrescription(res, $('#nonLoginPrescriptionList'), $('#nonLoginPrescription-list-template'));

				if(detailCard.style.display == 'none'){
					detailCard.style.display = 'block';
					detailMedicienCard.style.display = 'block';
					window.resizeTo(650,850);
				}

			},
			error: function(){
			}
		});
	}

	// 처방전 확인하기 테이블을 채워주는 핸들바스 생성 함수
	function printDataNonLoginPrescription(list,target,templateObject){
		var template = Handlebars.compile(templateObject.html());
		var html = template(list);
		$('.nonLoginPrescriptionTr').remove();
		target.append(html);
	}

	// 선택한 행 고정
	function nonLoginPrescriptReadFixLine(target){
		var tr = target.parentNode.querySelectorAll('tr');
		tr.forEach(function(obj){
			obj.style.backgroundColor = 'white';
			obj.style.fontWeight = 'normal';
		});
		target.style.backgroundColor = 'skyblue';
		target.style.fontWeight = 'bold';
	}

	// 처방전 상세 내역 확인
	function prescriptionReadDetail(psCode, target){
		console.log(1,psCode);
		nonLoginPrescriptReadFixLine(target);

		$.ajax({
			url:"nonLoginprescriptionReadDetail?psCode=" + psCode,
			type:"get",
			success: function(res){
				printDataPrescriptionDetail(res,$('#nonLoginUserprescriptionReadDetail'),$('#nonLoginPrescriptionDetail-list-template'))
			},
			error: function(){
			}
		});
	}

	// 처방전 상세내역을 확인하기 테이블을 채워주는 핸들바스 생성 함수
	function printDataPrescriptionDetail(list,target,templateObject){
		var template = Handlebars.compile(templateObject.html());
		var html = template(list);
		$('.nonLoginUserprescriptionReadDetailTr').remove();
		target.append(html);
	}


	function medicienCheck(target){
		nonLoginPrescriptReadFixLine(target);
	}

	function medicienInfoOpen(mdNo){
		// 의약품 안전나라 URL
		var detailUrl = "https://nedrug.mfds.go.kr/pbp/CCBBB01/getItemDetail?itemSeq=";
		var medicienUrl = detailUrl + mdNo;

		OpenWindow(medicienUrl, "약품 상세정보", "600", "800")
	}

	</script>


	<!-- 엔터키 이벤트  -->
	<script>
	function patientEnter(){
		if (window.event.keyCode == 13) {
			prescriptionRead();
		}
	}
	</script>

</body>
</html>