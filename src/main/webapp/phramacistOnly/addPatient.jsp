<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자 등록</title>

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
				<div class="card card-primary card-outline" style="height: 220px;">
					<div class="card-header">
						<h5 class="card-title m-0 title">
							<i class='far fa-address-card' style='font-size: 20px'></i> 환자 등록
						</h5>
					</div>

					<div class="card card-primary">
						<div class="card-body" style="text-align: center;">
							<form action="" class="" style="font-size: 12px;">
								<div class="patientInfoDetail mb-3">
									<label for="total_salesCount" style="text-align: right;">이&emsp;&nbsp;름</label>
									<input type="text" id="total_salesCount" value=""><br />
								</div>

								<div class="patientInfoDetail mb-3">
									<label for="total_salesFee" style="text-align: right;">생년월일</label>
									<input type="text" style="width: 70px;" value="">&nbsp;-&nbsp;<input type="text" style="width: 10px;" value="">******<br />
								</div>

								<div class="patientInfoDetail mb-3">
									<label for="total_compoundingFee" style="text-align: right;">전화번호</label>
									<input type="text" value=""><br />
								</div>
							</form>
							<div class="addViewBtn">
								<button class="button btnFade btnBlueGreen addBtn"
									style="width: 70px; margin-right: 25px;">등록</button>
								<button onClick="window.close()" class="button btnFade btnBlueGreen viewBtn"
									style="width: 70px;">취소</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>