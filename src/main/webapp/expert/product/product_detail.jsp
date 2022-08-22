<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<style type="text/css">
.table th, .table td{
	font-size: 12px;
}
.form-control.tableInput{
	height: 24px;width: 50px;font-size: 12px;padding: 5px;
}
.form-control:disabled {
	background: white;
	border-color: white;
}
</style>
</head>

<title>의약품 상세정보</title>

<body>
	<div class="content-wrapper">
		<div class="row m-0">
			<div class="card w-100 mb-0">
				<div class="card-header text-center">
					<h2><strong>적정재고 및 약위치 설정</strong></h2>
				</div>
				
				<div class="card-body">
					<div class="row m-0">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th class="text-center">분류코드</th>
									<th class="text-center">약명</th>
									<th class="text-center">재고수</th>
									<th class="text-center">적정재고</th>
									<th class="text-center">유통기한</th>
									<th class="text-center">약위치</th>
								</tr>
								<tr>
									<th>201</th>
									<th>AC8타이피린정</th>
									<th>15</th>
									<th style="padding: 7px">
										<input disabled class="form-control tableInput float-right" type="number" value="0">
									</th>
									<th>-</th>
									<th>-</th>
								</tr>
							</thead>
							
							<tbody>
								<tr>
									<td>201</td>
									<td>AC8타이피린정</td>
									<td>8</td>
									<td>-</td>
									<td style="padding: 7px">
										<input disabled class="form-control tableInput mx-auto" style="width: 100px;" type="date" value="2022-09-21">
									</td>
									<td style="padding: 7px">
										<input disabled class="form-control tableInput mx-auto" type="text" value="B7">
									</td>
								</tr>
								<tr>
									<td>201</td>
									<td>AC8타이피린정</td>
									<td>2</td>
									<td>-</td>
									<td style="padding: 7px">
										<input disabled class="form-control tableInput mx-auto" style="width: 100px;" type="date" value="2022-09-28">
									</td>
									<td style="padding: 7px">
										<input disabled class="form-control tableInput mx-auto" type="text" value="B7">	
									</td>
								</tr>
								<tr>
									<td>201</td>
									<td>AC8타이피린정</td>
									<td>5</td>
									<td>-</td>
									<td style="padding: 7px">
										<input disabled class="form-control tableInput mx-auto" style="width: 100px;" type="date" value="2022-10-05">
									</td>
									<td style="padding: 7px">
										<input disabled class="form-control tableInput mx-auto" type="text" value="B8">
									</td>
								</tr>
								
							</tbody>
						</table>
					</div>
					
					<div class="card-footer text-center">
						<button class="btn btn-default">수정</button>
						<button class="btn btn-default">저장</button>
						<button class="btn btn-default">취소</button>
					</div>
					
					
					
					
				</div>
			</div>
		</div>
	</div>
</body>