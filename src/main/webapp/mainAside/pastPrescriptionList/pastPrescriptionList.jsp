<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 - 과거처방내역 목록</title>
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
</style>
</head>
<body>
	<div class="content-wrapper">
		<div class="card" style="background: #fff; margin: 30px; margin-bottom: 0px; border-radius: 0.25rem 0 0.25rem 0.25rem;">

			<div class="card-header with-border" style="display: -webkit-box; padding: 20px; border-bottom: 0;">
				<span style="font-weight: bold; font-size: 20px; padding: 0px 7.5px;">과거처방내역</span>
				<div style="position: absolute; right: 20px; font-size: 14px; top: 20px; margin-bottom: 30px;">
					<span> 처방내역은 최대 <span style="color: #2F88FF">6개월</span>까지 조회가능합니다.
					</span>
				</div>
				<div style="position: absolute; right: 20px;">
					<div style="display: inline-block; margin-left: 20px;">
						<div class="input-group input-group-lg" style="width: 300px;">
							<input type="search" class="form-control form-control-lg" name="keyword" placeholder="검색어를 입력해주세요" value="${param.keyword }" style="height: 30px; font-size: 16px;">
							<div class="input-group-append">
								<button type="submit" class="btn btn-lg btn-default" style="height: 30px; font-size: 16px; padding: 0px 10px;" onclick="list_go(1)">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<br> <br>
			</div>
			<!-- card-header끝! -->
			<hr style="width: 95%; margin: auto;">

			<!-- 문의내역 -->
			<div class="card-body" style="min-height: 590px;">
				<table class="table table-bordered" style="font-size: 14px; text-align: center; border: 0px;">
					<thead style="border: 0px solid; border-top: 2px solid #0069d9;">
						<tr>
							<th style="width: 50px; border: 0; border-bottom: 1px solid #0069d9; color: #0069d9;">NO</th>
							<th style="width: 150px; border: 0; border-bottom: 1px solid #0069d9; color: #0069d9;">약국명</th>
							<th style="width: 550px; border: 0; border-bottom: 1px solid #0069d9; color: #0069d9;">처방약</th>
							<th style="width: 179px; border: 0; border-bottom: 1px solid #0069d9; color: #0069d9;">처방날짜</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>새봄약국</td>
							<td>타이레놀 외 2</td>
							<td>2022.07.06</td>
						</tr>
						<tr>
							<td>2</td>
							<td>새봄약국</td>
							<td>타이레놀 외 2</td>
							<td>2022.07.06</td>
						</tr>
						<tr>
							<td>3</td>
							<td>새봄약국</td>
							<td>타이레놀 외 2</td>
							<td>2022.07.06</td>
						</tr>
						<tr>
							<td>4</td>
							<td>새봄약국</td>
							<td>타이레놀 외 2</td>
							<td>2022.07.06</td>
						</tr>
						<tr>
							<td>5</td>
							<td>새봄약국</td>
							<td>타이레놀 외 2</td>
							<td>2022.07.06</td>
						</tr>
						<tr>
							<td>6</td>
							<td>새봄약국</td>
							<td>타이레놀 외 2</td>
							<td>2022.07.06</td>
						</tr>
						<tr>
							<td>7</td>
							<td>새봄약국</td>
							<td>타이레놀 외 2</td>
							<td>2022.07.06</td>
						</tr>
						<tr>
							<td>8</td>
							<td>새봄약국</td>
							<td>타이레놀 외 2</td>
							<td>2022.07.06</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

	</div>

</body>
</html>