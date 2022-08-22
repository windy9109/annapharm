<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.body {
	padding: 10px;
}

td, th, tr {
	font-size: 12px;
	padding: 4px !important;
}
</style>
<meta charset="UTF-8">
<title>회수대상약품재고 전송</title>
</head>
<body>
	<div class="content-wrapper">
		<div class="body">
			<div class="row" style="margin-bottom: 4px;">
				<div class="col-6">
					<button class="btn  btn-primary" style="width: 100%; height: 30px; line-height: inherit; font-weight: bold;">회수대상약품전송</button>
				</div>
				<div class="col-6">
					<button class="btn  btn-default" style="width: 100%; height: 30px; line-height: inherit; font-weight: bold;">회수대상약품전송</button>
				</div>
			</div>

			<div class="card card-primary card-outline">
				<div class="card-header">
					<div class="search">
						<i class="fas fa-capsules icon-size" style="margin-left: 10px; font-size: 18px;" aria-hidden="true"></i>
						<div style="display: inline-block; margin-left: 5px; font-weight: bold;">약품 목록</div>
						<div style="display: inline-block; margin-left: 20px;">
							<div class="input-group input-group-lg" style="width: 300px;">
								<input type="search" class="form-control form-control-lg" placeholder="검색어를 입력해주세요" style="height: 30px; font-size: 16px;">
								<div class="input-group-append">
									<button type="submit" class="btn btn-lg btn-default" style="background-color: #007bff; height: 30px; font-size: 16px; padding: 0px 10px;">
										<i class="fa fa-search" style="color: white;"></i>
									</button>
								</div>
							</div>
						</div>
						<div style="display: inline-block; margin-left: 10px;">
							<input type="checkbox"><span style="margin-left: 5px; font-size: 15px;">유통기한 지난 약품 </span>
						</div>
						<div style="float: right;">
							<input type="button" value="QR 검색하기" class="btn  btn-primary" style="line-height: inherit; height: 30px; font-weight: bold; font-size: 14px;">
						</div>
					</div>
				</div>
				<!-- 검색결과 목록 -->
				<div class="card-body" style="padding: 8px; padding-top: 12px;">
					<div class="searchList">

						<div class="card-body table-responsive p-0" style="height: 250px;">

							<table class="table table-hover table-bordered" style="table-layout: fixed; text-align: center; height: 20px;">
								<thead>
									<tr style="background-color: #E8F5FF; height: 15px;">
										<th style="width: 44px; padding: 12px;">NO</th>
										<th>약품명</th>
										<th>업체명</th>
										<th style="width: 200px;">약코드</th>
										<th style="width: 150px;">QR코드</th>
										<th style="width: 80px;">수량</th>
										<th style="width: 80px;">단위</th>
										<th style="width: 120px;">제조일자</th>
										<th style="width: 120px;">유통기한</th>
									</tr>
								</thead>
								<tbody id="recallRequestList">
									<tr style="width: 30px;">
										<td style="text-align: center;">1</td>
										<td>약품명</td>
										<td style="text-align: center;">약코드</td>
										<td style="text-align: center;">QR코드</td>
										<td style="text-align: right;">회수수량</td>
										<td>회수사유</td>
										<td style="text-align: center;">1</td>
										<td style="text-align: center;">1</td>
										<td style="text-align: center;">1</td>

									</tr>
								</tbody>
							</table>



						</div>
						<div style="float: right; margin-right: 10px; font-size: 12px; font-weight: bold; padding: 10px 0px;">총 8건</div>
					</div>

				</div>
			</div>


			<div class="card card-primary card-outline">
				<div class="card-header">
					<span style="font-size: 17px; font-weight: bold;">약품 상세</span>
				</div>
				<div class="card-body" style="padding: 8px; padding-top: 12px;">
					<div class="detail" style="font-size: 12px; margin-right: 17px;">
						<div class="row" style="margin-top: 5px;">
							<div class="col-1" style="text-align: right;">
								<span> 약품명</span>
							</div>
							<div class="col-2">
								<input type="text" style="width: 100%;" value="타일레놀" disabled>
							</div>
							<div class="col-1" style="text-align: right;">
								<span> 업체명</span>
							</div>
							<div class="col-2">
								<input type="text" style="width: 100%;" value="업체명" disabled>
							</div>
							<div class="col-1" style="text-align: right;">
								<span> 약코드</span>
							</div>
							<div class="col-2">
								<input type="text" style="width: 100%;" value="000000" disabled>
							</div>
							<div class="col-1" style="text-align: right;">
								<span> QR코드</span>
							</div>
							<div class="col-2">
								<input type="text" style="width: 100%;" value="000000" disabled>
							</div>
						</div>
						<div class="row" style="margin-top: 5px;">
							<div class="col-1" style="text-align: right;">
								<span> 제조일자</span>
							</div>
							<div class="col-2">
								<input type="date" style="width: 100%;" disabled>
							</div>
							<div class="col-1" style="text-align: right;">
								<span> 회수일</span>
							</div>
							<div class="col-2">
								<input type="date" style="width: 100%;" disabled>
							</div>
							<div class="col-1" style="text-align: right;">
								<span> 수량</span>
							</div>
							<div class="col-2">
								<input type="text" style="width: 100%;">
							</div>
							<div class="col-1" style="text-align: right;">
								<span> 단위</span>
							</div>
							<div class="col-2">
								<input type="text" style="width: 100%;" value="개" disabled>
							</div>
						</div>
						<div class="row" style="margin-top: 5px;">
							<div class="col-1" style="text-align: right;">
								<span> 회수사유</span>
							</div>
							<div class="col-10">
								<input type="text" style="width: 100%;">
							</div>
							<div class="col-1">
								<input type="button" value="추가" class="btn btn-primary" style="font-size: 12px; height: 20px; line-height: 8px; width: 100%; font-weight: bold;">
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- card 끝! -->
			<div class="card card-primary card-outline" style="height: 300px; margin: 0px;">
				<div class="card-header">
					<span style="font-size: 17px; font-weight: bold;"> 회수약품</span>
					<div style="float: right;">
						<span style="font-size: 12px; font-weight: bold;">총 8건</span> <input type="button" value="회수" class="btn btn-primary" style="line-height: inherit; width: 88px; font-size: 14px; font-weight: bold; height: 30px; margin-right: 0px;">
					</div>
				</div>

				<div class="card-body" style="padding: 8px; padding-top: 12px;">

					<table class="table table-hover table-bordered" style="table-layout: fixed; text-align: center; height: 20px;">
						<thead>
							<tr style="background-color: #E8F5FF; height: 15px;">
								<th style="text-align: center; width: 44px;">NO</th>
								<th style="width: 300px;">약품명</th>
								<th style="width: 120px; text-align: center;">약코드</th>
								<th style="text-align: center;">QR코드</th>
								<th style="width: 120px; text-align: center;">회수수량</th>
								<th style="width: 500px;">회수사유</th>
								<th style="width: 35px;"><i class="far fa-check-square" aria-hidden="true"></i></th>
							</tr>
						</thead>
						<tbody id="list">
							<tr style="width: 30px;">
								<td style="text-align: center;">1</td>
								<td>약품명</td>
								<td style="text-align: center;">약코드</td>
								<td style="text-align: center;">QR코드</td>
								<td style="text-align: right;">회수수량</td>
								<td>회수사유</td>
								<td><i class="fa fa-minus-square" style="color: #dc3545;"></i></td>
							</tr>
						</tbody>
					</table>




				</div>
				<!-- card-body 끝! -->
			</div>

		</div>
	</div>


	<!-- 상세정보 -->
	<!-- 검색결과 목록 -->



</body>
</html>