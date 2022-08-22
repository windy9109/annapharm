<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="short icon" href="#">
<meta charset="UTF-8">
<title>처방수정요청</title>

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
				<div class="card card-primary card-outline" style="height: 368px;">
					<div class="card-header">
						<h5 class="card-title m-0 title">
							<i class='far fa-address-card' style='font-size: 20px'></i> 처방 수정 요청
						</h5>
					</div>

						<div class="card-body" style="text-align: center;">
							<form action="" class="" style="font-size: 12px;">
								<div class="patientInfoDetail mb-3" style="text-align: left;">
									<label for="PharmacyNameRequest" style="margin-left: 13px; color:#1E82FF;">약국명 : </label> 
									<input type="text" id="PharmacyNameRequest" value="${aa.pharmacyName}" style="border:0px;font-weight: bold;font-size: 15px; width:70px;" readonly="readonly">&emsp;
									
									<label for="ChemistNameRequest" style=" color:#1E82FF;">약사명 : </label> 
									<input type="text" id="ChemistNameRequest" value="${aa.memName} " style="border:0px;font-weight: bold;font-size: 15px; width:70px;" readonly="readonly">
									
									<label for="DoctorNameRequest" style=" margin-left: 12px; color:#1E82FF;">번&nbsp;&nbsp;호 : </label> 
									<input type="text" id="DoctorNameRequest" value="${aa.piDutytel1}" style="width: 100px; border:0px;font-weight: bold;font-size: 15px;" readonly="readonly"><br />
								</div>

								<div class="patientInfoDetail mb-3" style="height: 30px;">
									
									<label for="hosNameRequest" style="text-align: right; margin-right: 5px; color:#1E82FF;">주&nbsp;&nbsp;소 : </label> 
									<input type="text" id="hosNameRequest" value="${aa.piDutyaddr}" style="border:0px;font-weight: bold;font-size: 15px; width: 78%; margin-right: 12px;" readonly="readonly">&emsp;
									
									
									<input type="hidden" id="PatientCodeRequest" value=""><br />
									<input type="hidden" id="PatientNameRequest" value=""><br />
									<input type="hidden" id="PrescriptionRequest" value=""><br />
<%-- 									<input type="text" id="total_salesCount" value="${loginUser.memName }"><br /> --%>
								</div>

								<div class="patientInfoDetail mb-3">
									<label for="total_compoundingFee" style="padding-right:68%; color:#1E82FF;">처방전 수정 요청 사유</label><br>
									<textarea id="requestWhy" readonly="readonly" rows="17" cols="50" style="font-weight: bold; font-size: 15px; height: 115px; width: 93%;resize: none;border:0px;">${aa.psModifyReq }</textarea>
								</div>
							</form>
							<div class="addViewBtn">
								<button onClick="window.close()" class="button btnFade btnBlueGreen viewBtn"
									style="width: 100px;">확인</button>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>
	
<script>
// 	function preUpdateRequest(){
// 		// alert("ㅇㅅㅇ");
// 		// 환자코드
// 		var patientCode = $('#PatientCodeRequest').attr('value');
// 		// 환자이름
// 		var patientName = $('#PatientNameRequest').attr('value');
// 		// 처방전코드
// 		var psCode = $('#PrescriptionRequest').attr('value');
// 		// 요청이유
// 		var psModifyReq = $('#requestWhy').val();
		
// // 		console.log("환자 : " + patientCode);
// // 		console.log("처방전 : " + psCode);
// // 		console.log("이유 : " + psModifyReq);
		
// 		var data = {
// 				"patientCode" : patientCode,
// 				"patientName" : patientName,
// 				"psModifyReq" : psModifyReq,
// 				"psCode" : psCode
// 			}
		
// 		$.ajax({
// 			url:"preUpdateRequest.do",
// 			data : data,
// 			type:"post",
// 			success : function(res){
// 				alert("처방전 수정요청되었습니다.");
// 				opener.document.location.reload();		
// 				self.close();
// 			},
// 			error : function(){
// 				alert("처방전 수정요청에 실패했습니다.");
// 			}
// 		})
		
// 	}
</script>
	
</body>
</html>