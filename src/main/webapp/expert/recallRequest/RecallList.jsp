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
<title>회수대상약품재전송 내역</title>
</head>
<body>
	<div class="content-wrapper">
		<div class="body">
			<!-- 상단 메뉴 탭 -->
			<div class="row" style="margin-bottom: 4px;">
				<div class="col-6">
					<button class="btn btn-default" style="width: 100%; height: 30px; line-height: inherit; font-weight: bold;">회수대상약품전송</button>
				</div>
				<div class="col-6">
					<button class="btn btn-primary" style="width: 100%; height: 30px; line-height: inherit; font-weight: bold;">회수대상약품전송</button>
				</div>
			</div>

			<div class="card card-primary card-outline">
				<!-- 검색 해더 -->
				<div class="card-header">
					<div style="display: inline-block; margin-left: 5px; font-size: 17px; font-weight: bold;">전체 회수 내역</div>
					<div style="float: right;">
						<input type="date">&nbsp;~&nbsp;<input type="date">
						<div style="display: inline-block; margin-left: 20px;">
							<div class="input-group input-group-lg" style="width: 300px;">
								<input type="search" class="form-control form-control-lg" placeholder="검색어를 입력해주세요" style="height: 30px; font-size: 16px;">
								<div class="input-group-append">
									<button type="submit" class="btn btn-lg btn-default" style="height: 30px; font-size: 16px; padding: 0px 10px;">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- card-header 끝! -->
				<!-- 검색결과 목록 -->
				<div class="card-body" style="padding: 8px; padding-top: 12px;">
					<div class="searchList">
						<div class="card-body table-responsive p-0" style="height: 250px;">
							<table class="table table-hover table-bordered" style="table-layout: fixed; text-align: center; height: 20px;">
								<thead>
									<tr style="background-color: #E8F5FF;">
										<th style="width: 100px;">NO</th>
										<th>회수일</th>
										<th>약품명</th>
										<th>약사명</th>
									</tr>
								</thead>
								<tbody id="recallRequestList">
									<tr>
										<td>1</td>
										<td>2022.06.30</td>
										<td>약품명 외 35</td>
										<td>약사명</td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>
			<!-- card-body끝! -->

			<!-- 검색결과 목록 -->

			<div class="card card-primary card-outline" style="height: 450px;">
				<!-- 검색 해더 -->
				<div class="card-header">
					<div style="margin-left: 5px; font-size: 17px; font-weight: bold;">회수 상세 내역</div>
				</div>
				<div class="card-body" style="padding: 8px; padding-top: 12px;">
					<div class="searchList">
						<div class="card-body table-responsive p-0" style="height: 250px;">
							<table class="table table-hover table-bordered" style="table-layout: fixed; text-align: center; height: 20px;">
								<thead>
									<tr style="text-align: center; background-color: #E8F5FF;">
										<th style="width: 50px;">번호</th>
										<th>약품명</th>
										<th style="width: 100px;">QR코드</th>
										<th style="width: 100px;">약코드</th>
										<th style="width: 100px;">회수수량</th>
										<th style="width: 50px;">단위</th>
										<th>회수사유</th>
									</tr>
								</thead>
								<tbody id="recallRequestList">
									<tr>
										<td>1</td>
										<td>타이레놀</td>
										<td style="text-align: center;">000000</td>
										<td style="text-align: center;">000000</td>
										<td style="text-align: right;">5</td>
										<td style="text-align: center;">정</td>
										<td>유통기한이 지남</td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>