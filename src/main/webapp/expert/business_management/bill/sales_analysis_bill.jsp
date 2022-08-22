<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>청구서 서식</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/sweetalert2/sweetalert2.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/toastr/toastr.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css?v=3.2.0">
<style>
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
</style>

</head>
<body>
	<div class="container" style="max-width:1280px; max-height: 950px; margin-top: 20px;">
		<div class="row" style="justify-content: end;">
			<button class="btn btn-primary buttons-pdf buttons-html5"
				tabindex="0" aria-controls="example1" type="button"
				style="border-radius: 5px;">
				<span>저장</span>
			</button>
			<button class="btn btn-secondary buttons-pdf buttons-html5"
				tabindex="0" aria-controls="example1" type="button"
				style="border-radius: 5px;">
				<span>닫기</span>
			</button>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<span style="font-weight:bold; font-size:20px;">(별지 제9-2호서식)</span>
			</div>
		</div>
		<div class="outline">
			<div class="card-header">
				<table class="main_table" border="1">
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
				<table class="main_table" border="1">
					<tr>
						<td style="width: 2%" rowspan="4">
							요양기관
						</td>
						<td style="width: 14%" colspan="2">①기 호</td>
						<td style="width: 10%"></td>
						<td style="width: 8%">②명칭</td>
						<td style="width: 16%"></td>
						<td style="width: 15%" colspan="2">③전화번호</td>
						<td style="width: 15%"></td>
						<td style="width: 15%">④청구단위구분</td>
						<td style="width: 5%"></td>
					</tr>
					<tr>
						<td style="width: 14%" colspan="2">⑤소재지</td>
						<td style="width: 34%" colspan="3"></td>
						<td style="width: 15%" colspan="2">⑥우편번호</td>
						<td style="width: 35%" colspan="3" ></td>
					</tr>
					<tr>
						<td style="width: 5%" rowspan="2">작성자</td>
						<td style="width: 9%">⑦성명</td>
						<td style="width: 34%" colspan="3" class="text_right">(서명 또는 날인)</td>
						<td style="width: 5%" rowspan="2">
							대행청구<br/>
							단      체
						</td>
						<td style="width: 9%" >⑨기호</td>
						<td style="width: 36%" colspan="4"></td>
					</tr>
					<tr>
						<td style="width: 9%">⑧생년월일</td>
						<td style="width: 34%" colspan="3"></td>
						<td style="width: 9%" >⑩명칭</td>
						<td style="width: 36%" colspan="4" ></td>
					</tr>
				</table>
				<table class="main_table" border="1">
					<tr>
						<td style="width: 7%;" colspan="3">구 분</td>
						<td style="width: 6%;">⑪건수</td>
						<td style="width: 6%;">⑫요양급여비용총액1</td>
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
						<td style="width: 2%;">8</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
					</tr>
					<tr class="text_right">
						<td style="width: 3%">직접조제</td>
						<td style="width: 2%">9</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
						<td>0￦</td>
					</tr>
				</table>
			</div>
			<!-- card-header end -->

			<div class="card-body body-font">
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
				<div class="row" style="flex-wrap: nowrap; margin-top:50px;">
					<div class="col-lg-5 center_text">
						<span>청구일자 : </span>
					</div>
					<div class="col-lg-7" style="margin-left:150px">
						<span>년&nbsp;&nbsp;&nbsp;&nbsp;월&nbsp;&nbsp;&nbsp;&nbsp;일 </span>
					</div>
				</div>
				<br/>
				<div class="row" style="flex-wrap: nowrap;">
					<div class="col-lg-5 center_text">
						<span>청 구 인 :</span>
					</div>
					<div class="col-lg-7" style="margin-left:300px">
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
						<span>※첨 부 : 요양급여(의료급여)비용명세서</span>
					</div>
					<div class="col-lg-6">
						<span>매</span>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6">
						<span>처 방 전</span>
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








	<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js?v=3.2.0"></script>

</body>
</html>