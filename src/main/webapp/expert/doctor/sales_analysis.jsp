<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약국 매출 현황</title>
<%-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css?v=3.2.0"> --%>
<style>
label{
	width: 90px;
	margin-left: 10px;
}

#total_*{
	text-align: right;
} 
</style>
</head>
<body>
	<div class="content-wrapper">
		<div class="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="card card-outline">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4">
						<div class="card">
							<div class="card-header">
								<h5 class="card-title m-0">검색조건</h5>
							</div>
							<div class="card-body">
								<label for="chemistName">조제약사</label> <select id="chemistName">
									<option>전체약사</option>
									<option>김동글 약사</option>
									<option>아나팜 약사</option>
								</select> <input type="button" value="조회">
							</div>
						</div>
						<div class="card card-primary card-outline">
							<div class="card-header">
								<h5 class="card-title m-0">항목 합계</h5>
							</div>
							<div class="card-body">
								<form action="">
									<label for="total_salesCount">총 매출건</label> 
									<input type="text" id="total_salesCount" value="13,632" readonly><br />
									<label for="total_salesFee">총 매출 금액</label> 
									<input type="text" id="total_salesFee" value="380,115,886" readonly><br />
									<label for="total_compoundingFee">조제료</label> 
									<input type="text" id="total_compoundingFee" value="95,404,470"	readonly><br /> 
									<label for="total_carge">청구액</label>
									<input type="text" id="total_carge" value="245,927,870"	readonly><br /> 
									<label for="total_salesDrugFee">약품판매액</label>
									<input type="text" id="total_salesDrugFee" value="20,243,286" readonly><br /> 
									<label for="total_copay">본인부담금</label>
									<input type="text" id="total_copay" value="91,935,410" readonly><br />
									<label for="total_drugFee">약가</label> 
									<input type="text" id="total_drugFee" value="532,586" readonly><br /> 
									<label for="total_deposit">입금액</label> 
									<input type="text" id="total_deposit" value="134,188,061" readonly><br />
									<label for="total_cardPayment">카드 승인</label> 
									<input type="text" id="total_cardPayment" value="100,752,120" readonly><br />
								</form>
							</div>
						</div>
					</div>

					<div class="col-lg-8">
						<!-- 표가 들어갈 곳 -->
						<div class="card">
							<div class="card-header">
								<h5 class="card-title m-0">검색조건</h5>
							</div>
							<div class="card-body">
								<label for="chemistName">조제약사</label> <select id="chemistName">
									<option>전체약사</option>
									<option>김동글 약사</option>
									<option>아나팜 약사</option>
								</select> <input type="button" value="조회">
							</div>
						</div>
						<div class="card">
							<div class="card-header">
								<h5 class="card-title m-0">검색조건</h5>
							</div>
							<div class="card-body">
								<label for="chemistName">조제약사</label> <select id="chemistName">
									<option>전체약사</option>
									<option>김동글 약사</option>
									<option>아나팜 약사</option>
								</select> <input type="button" value="조회">
							</div>
						</div>
						<div class="card">
							<div class="card-header">
								<h5 class="card-title m-0">검색조건</h5>
							</div>
							<div class="card-body">
								<label for="chemistName">조제약사</label> <select id="chemistName">
									<option>전체약사</option>
									<option>김동글 약사</option>
									<option>아나팜 약사</option>
								</select> <input type="button" value="조회">
							</div>
						</div>

					</div>

				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="card card-primary card-outline">
							<div class="card-header">
								<h5 class="card-title m-0">Featured</h5>
							</div>
							<div class="card-body">
								<h6 class="card-title">Special title treatment</h6>
								<p class="card-text">With supporting text below as a natural
									lead-in to additional content.</p>
								<a href="#" class="btn btn-primary">Go somewhere</a>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<%-- <script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js?v=3.2.0"></script>

<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/demo.js"></script> --%>

</body>
</html>