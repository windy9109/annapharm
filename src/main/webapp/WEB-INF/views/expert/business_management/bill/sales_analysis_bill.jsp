<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>청구서 서식</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/sweetalert2/sweetalert2.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/toastr/toastr.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css?v=3.2.0">
<style>
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');

	#loginUserName {
		font: 18px 'Nanum Gothic', sans-serif;
		font-weight: bold;
	}
	.main_table{
		width: 1150px;
		text-align: center;
		border: 1px solid black;
		border-collapse: collapse;
		margin:0px;
	}
	body{
		font-size: 14px;
	}
	.center_table{
		text-align: center;
		width: 900px;
		border: 1px solid black;
		border-collapse: collapse;
		margin-left: 114px;
		margin-top: 40px;
	}
	.center_table tr{
		height: 30px;
	}
	.center_text{
		text-align: end;
	}
	.outline{
		width: 1150px;
		border: 1px solid black;
		padding: 0px;
	}
	.card-header{
		padding:0px;
	}
	.body-font{
		font-size: 18px;
	}
	.text_right{
		text-align: right;
	}
	.btn{
		margin: 10px;
	}
	.writeDate{
		margin-left: 30px;
	}
	#num1,#num2,#num3,#num4,#num5,#num6,#num7,#num8{
		font: 14px 'Nanum Gothic', sans-serif;
		font-weight: bold;
	}
	#prenum1,#prenum2,#prenum3,#prenum4,#prenum5,#prenum6,#prenum7,#prenum8,#prenum9,#prenum10,#prenum11,#prenum12,#prenum13,#prenum14,#prenum15{
		font: 12px 'Nanum Gothic', sans-serif;
		font-weight: bold;
	}
	#nonnum1,#nonnum2,#nonnum3,#nonnum4,#nonnum5,#nonnum6,#nonnum7,#nonnum8,#nonnum9,#nonnum10,#nonnum11,#nonnum12,#nonnum13,#nonnum14,#nonnum15{
		font: 12px 'Nanum Gothic', sans-serif;
		font-weight: bold;
	}
</style>

</head>
<body>
	<div class="container" style="max-width:1280px; margin-top: 20px;">
		<div class="row" style="justify-content: end;">
			<button class="btn btn-primary buttons-pdf buttons-html5" onclick="pdfDownload()"
				tabindex="0" aria-controls="example1" type="button"
				style="border-radius: 5px;">
				<span>저장</span>
			</button>
			<button class="btn btn-secondary buttons-pdf buttons-html5" onclick="window.close()"
				tabindex="0" aria-controls="example1" type="button"
				style="border-radius: 5px;">
				<span>닫기</span>
			</button>
		</div>
		<div id="pdfLine">
			<div class="row">
				<div class="col-lg-12">
					<span style="font-weight:bold; font-size:20px;">(별지 제9-2호서식)</span>
				</div>
			</div>
			<div class="outline">
				<div class="card-header">
					<table class="main_table" border="1" style="height: 90px;">
						<tr>
							<td style="width: 8%">서식번호</td>
							<td style="width: 2%">G</td>
							<td style="width: 2%">1</td>
							<td style="width: 2%">0</td>
							<td style="width: 2%">1</td>
							<td style="width: 34%">
								(<span style="margin-left: 60px; margin-right: 40px;">년</span> 월분)
								<br/>
								<span style="font-weight:bold; font-size:20px;">요양급여비용심사청구서</span>
							</td>
							<td style="width: 5%;">
								보험자<br/>
								종별<br/>
								구분<br/>
							</td>
							<td style="width: 20%;"></td>
							<td style="width: 5%;">※접수<br>
													번호
							</td>
							<td style="width: 20%;"></td>

						</tr>
					</table>

					<table class="main_table" border="1" style="height: 140px;">
						<tr>
							<td style="width: 2%" rowspan="4">
								요양기관
							</td>
							<td style="width: 14%" colspan="2">①기 호</td>
							<td style="width: 10%" id="num1"></td>
							<td style="width: 8%">②명칭</td>
							<td style="width: 16%" id="num2"></td>

							<td style="width: 15%" colspan="2">③전화번호</td>
							<td style="width: 15%" id="num3"></td>
							<td style="width: 15%">④청구단위구분</td>
							<td style="width: 5%"></td>
						</tr>
						<tr>
							<td style="width: 14%" colspan="2" >⑤소재지</td>
							<td style="width: 34%" colspan="3" id="num5"></td>
							<td style="width: 15%" colspan="2">⑥우편번호</td>
							<td style="width: 35%" colspan="3" id="num6"></td>
						</tr>
						<tr>
							<td style="width: 5%" rowspan="2">작성자</td>
							<td style="width: 9%">⑦성명</td>
							<td style="width: 34%" colspan="3" class="text_right">
								<span id="num7"></span>
								(서명 또는 날인)
							</td>
							<td style="width: 6%" rowspan="2">
								대행청구
								단      체
							</td>
							<td style="width: 9%" >⑨기호</td>
							<td style="width: 35%" colspan="2"></td>
						</tr>
						<tr>
							<td style="width: 9%">⑧생년월일</td>
							<td style="width: 34%" colspan="3" id="num8"></td>
							<td style="width: 9%" >⑩명칭</td>
							<td style="width: 36%" colspan="4" ></td>
						</tr>
					</table>
					<table class="main_table" border="1" style="height: 200px;">
						<tr>
							<td style="width: 7%;" colspan="3">구 분</td>
							<td style="width: 6%;">⑪건수</td>
							<td style="width: 6%;">⑫요양급여비용총액 1</td>
							<td style="width: 6%;">⑬본인일부부담금</td>
							<td style="width: 6%;">⑱지원금</td>
							<td style="width: 6%;">⑭청구액</td>
							<td style="width: 6%;">⑮차등수가청구액</td>
							<td style="width: 6%;">㉕본인부담상한액초과금총액</td>
							<td style="width: 6%;">⑯요양급여비용총액 2, 진료비총액</td>
							<td style="width: 6%;">⑰보훈청구액</td>
							<td style="width: 6%;">⑲건강보험100분의100본인부담금 총액</td>
							<td style="width: 6%;">⑳보훈본인일부부담금</td>
							<td style="width: 6%;">㉑100분의100미만 총액</td>
							<td style="width: 7%;">㉒100분의100미만 본인일부 부담금</td>
							<td style="width: 7%;">㉓100분의100미만 청구액</td>
							<td style="width: 7%;">㉔100분의100미만 보훈청구액</td>
						</tr>
						<tr class="text_right">
							<td style="width: 2%;" rowspan="2">약국</td>
							<td style="width: 3%">처방조제</td>
							<td style="width: 2%; text-align: center;">8</td>
							<td id="prenum1">0</td>
							<td id="prenum2">0￦</td>
							<td id="prenum3">0￦</td>
							<td id="prenum4">0￦</td>
							<td id="prenum5">0￦</td>
							<td id="prenum6">0￦</td>
							<td id="prenum7">0￦</td>
							<td id="prenum8">0￦</td>
							<td id="prenum9">0￦</td>
							<td id="prenum10">0￦</td>
							<td id="prenum11">0￦</td>
							<td id="prenum12">0￦</td>
							<td id="prenum13">0￦</td>
							<td id="prenum14">0￦</td>
							<td id="prenum15">0￦</td>
						</tr>
						<tr class="text_right">
							<td style="width: 3%">직접조제</td>
							<td style="width: 2%; text-align: center;">9</td>
							<td id="nonnum1">0</td>
							<td id="nonnum2">0￦</td>
							<td id="nonnum3">0￦</td>
							<td id="nonnum4">0￦</td>
							<td id="nonnum5">0￦</td>
							<td id="nonnum6">0￦</td>
							<td id="nonnum7">0￦</td>
							<td id="nonnum8">0￦</td>
							<td id="nonnum9">0￦</td>
							<td id="nonnum10">0￦</td>
							<td id="nonnum11">0￦</td>
							<td id="nonnum12">0￦</td>
							<td id="nonnum13">0￦</td>
							<td id="nonnum14">0￦</td>
							<td id="nonnum15">0￦</td>
						</tr>
					</table>
				</div>
				<!-- card-header end -->

				<div class="card-body body-font" style="padding-top: 150px;">
					<div class="row">
						<div class="col-lg-12">
							<table border="1" class="center_table">
								<tr>
									<td style="width: 20%;" rowspan="2">차등수가 적용기준</td>
									<td style="width: 50%;" colspan="10">차등지수</td>
									<td style="width: 30%;" colspan="6">조제일수</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12" style="margin-left:120px; margin-top:20px;">
							<span>
								□「국민건강보험법 시행규칙」 제19조제1항에 따라 요양급여비용의 심사를 청구합니다.
							</span>
							<br>
							<span>
								□「한국보훈복지의료공단법 시행령」 제17조제2항에 따라 진료비용의 심사를 청구합니다.
							</span>
						</div>
					</div>
					<div class="row" style="flex-wrap: nowrap; margin-top:300px;">
						<div class="col-lg-5 center_text">
							<span>청구일자 : </span>
						</div>
						<div class="col-lg-7" >
							<span id="todayYear" class="writeDate"></span>년<span id="todayMonth" class="writeDate"></span>월<span id="todayDay" class="writeDate"></span>일
						</div>
					</div>
					<br/>
					<div class="row" style="flex-wrap: nowrap;">
						<div class="col-lg-5 center_text">
							<span>청 구 인 :</span>
						</div>
						<div class="col-lg-3">
							<span id="loginUserName" style="margin-left:30px;"></span>
						</div>
						<div class="col-lg-4">
							<span>(서명 또는 날인)</span>

						</div>
					</div>
					<div class="row">
						<div class="col-lg-12" style="margin-top:150px;">
							<span>
								□ 건강보험신사평가원장&nbsp;&nbsp;&nbsp; 귀하<br/>
								□ 국민겅강보험공단이사장&nbsp;&nbsp;&nbsp; 귀하<br/>
								□ 한국보훈복지의료공단이사장&nbsp;&nbsp;&nbsp; 귀하
							</span>
						</div>
					</div>
				</div>
				<!--end card-body -->

				<div class="outline body-font">
					<div class="row">
						<div class="col-lg-6">
							<span>&nbsp;&nbsp;※첨 부 : 요양급여(의료급여)비용명세서</span>
						</div>
						<div class="col-lg-6">
							<span>매</span>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6">
							<span>&nbsp;&nbsp;처 방 전</span>
						</div>
						<div class="col-lg-6">
							<span>매</span>
						</div>
					</div>
				</div>
				<!--end card-footer  -->

			</div>
			<div class="row body-font">
				<div class="col-lg-12">
					<span>
						주: 1. ※ 란은 접수기관에서 기재합니다.<br/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.보험자 종별 구분 : 건강보험 조제분은 기재하지 않으며, 보훈위탁자료 요양기관에서
						발행한 처방전에 따른 "보훈 국비환자(상이처, 무자격자)"의<br/>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 처방 조제분인 경우에만 "7"을 기재합니다.
					</span>
				</div>
			</div>
		</div>
	</div>








<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js?v=3.2.0"></script>

<!-- pdf 다운 -->
<script src="<%=request.getContextPath() %>/resources/pdf/html2canvas.js"></script>
<script src="<%=request.getContextPath() %>/resources/pdf/jspdf.min.js"></script>


<script>
	// pdf로 저장 할 수 있도록 하는 함수
	function pdfDownload(){

		registBillSave();

		 html2canvas($('#pdfLine')[0]).then(function(canvas) { //저장 영역 div id

	    // 캔버스를 이미지로 변환
	    var imgData = canvas.toDataURL('image/png');

	    var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
	    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
	    var imgHeight = canvas.height * imgWidth / canvas.width;
	    var heightLeft = imgHeight;
	    var margin = 10; // 출력 페이지 여백설정
	    var doc = new jsPDF('p', 'mm');
	    var position = 20;

	    // 첫 페이지 출력
	    doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
	    heightLeft -= pageHeight;

	    // 한 페이지 이상일 경우 루프 돌면서 출력
	    while (heightLeft >= 20) {
	        position = heightLeft - imgHeight;
	        doc.addPage();
	        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
	        heightLeft -= pageHeight;
	    }

	    // 오늘 날짜
	    var day = new Date();
	    day = day.toLocaleDateString();

	    // 약국 이름
	    var name = $('#num2').text();
	    // 파일 저장
	    doc.save(day + name + '청구서.pdf');
		 });

	}

	// 출력된 데이터 저장
	function registBillSave(){
		var arr = []; // 체크된 데이터를 담는 배열
		var chemistName = []; // 약사 이름을 담는 배열
		var prescriptArr = [];
		var check = opener.document.getElementsByClassName('abled');
		var count = 0; // 청구건수를 담을 변수

		// 목록 전체에서 체크된 checkbox 찾고 배열에 넣기
		for (let i = 0; i < check.length; i++) {
			if (check[i].checked) {
				arr.push(check[i]);
			}
		}

		count = arr.length;

		// 체크한 값의 정보를 갖고 오기
		for (let i = 0; i < arr.length; i++) {
			var main = arr[i].parentNode.parentNode.parentNode;
			prescriptArr.push(main.getAttribute('psCode')); // 처방전 코드 뽑기
			chemistName.push($(main).find('td:eq(3)').text()); // 약사 이름 뽑기
		}

		// 약국코드 (추후 세션으로부터 받는다.)
		var pharmacyCode = 'C2104147';

		// 약사 이름(중복되는 결과 제외)
		var setArr = new Set(chemistName);
		// set 객체를 배열로 바꿔주기
		var nonoverlap = Array.from(setArr)
		// DB에 들어갈 약사 이름
		var setChemistName = "";

		for (let i = 0; i < nonoverlap.length; i++) {
			if (i != 0) {
				setChemistName += ",";
			}
			setChemistName += nonoverlap[i];
		}

		console.log('청구건수', count)
		console.log('약사명', setChemistName)
		console.log('약국코드', pharmacyCode)
		console.log('처방전 코드', prescriptArr)

		var saveData = {
			"prescriptArr" : prescriptArr,
			"pharmacyCode" : pharmacyCode,
			"chemistName" : setChemistName,
			"count" : count
		}

		//console.log(JSON.stringify(prescriptArr));


		$.ajax({
			url : "printAndSave",
			type : "post",
			data : saveData,
			success : function() {
				alert('청구서 저장 성공')
				opener.location.reload();
			},
			error : function() {
				alert("저장 실패");
			}
		});

	}
</script>


</body>
</html>