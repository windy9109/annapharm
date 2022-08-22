<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
				<div class="card card-primary card-outline" style="height: 500px;">
					<div class="card-header">
						<h5 class="card-title m-0 title">
							<i class='far fa-address-card' style='font-size: 20px'></i> 처방 수정 요청
						</h5>
					</div>

						<div class="card-body" style="text-align: center;">
							<form action="" class="" style="font-size: 12px;">
								<div class="patientInfoDetail mb-3">
									<label for="total_salesCount" style="text-align: right;">병원명</label> 
									<input type="text" id="total_salesCount" value="DDIT병원">&emsp;
									<label for="total_salesCount" style="text-align: right;">의사명</label> 
									<input type="text" id="total_salesCount" value="오반짝"><br />
								</div>

								<div class="patientInfoDetail mb-3">
									<label for="total_salesCount" style="text-align: right;">약국명</label> 
									<input type="text" id="total_salesCount" value="똥글똥글약국">&emsp;
									<label for="total_salesCount" style="text-align: right;">약사명</label> 
									<input type="text" id="total_salesCount" value="김동글"><br />
								</div>

								<div class="patientInfoDetail mb-3">
									<label for="total_compoundingFee" style="text-align: right;">처방전 수정 요청 사유</label><br>
									<textarea rows="17" cols="50"></textarea>
								</div>
							</form>
							<div class="addViewBtn">
								<button class="button btnFade btnBlueGreen addBtn"
									style="width: 70px; margin-right: 25px;">요청</button>
								<button onClick="window.close()" class="button btnFade btnBlueGreen viewBtn"
									style="width: 70px;">취소</button>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>