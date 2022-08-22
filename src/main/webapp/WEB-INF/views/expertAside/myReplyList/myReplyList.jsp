<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약사 마이페이지 내 복약질문 내역</title>
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
		<div class="body" style="padding: 30px;">
				<span style="font-weight: bold; font-size: 1.4em; margin-top: 80px;">내 약사IN답변</span>
			<div style="margin-top: 30px;">
				<div style="float: right;">
					<input type="date">&nbsp;~&nbsp;<input type="date">
					<button class="btn btn-default" style=" height: 25px; line-height: 13px;">조회</button>
					
				</div>
				<br><br>
				<!-- 문의내역 -->
				<div class="inquiryList" style="">
					<div class="card">
						<div class="card-body table-responsive p-0">
							<table class="table table-hover text-nowrap"
								style="text-align: center;">
								<thead>
									<tr style="background-color: #2F88FF; color: white;">
										<th style="width: 500px;">제목</th>
										<th>게시일</th>
										<th>최근 답변일</th>
										<th>답변수</th>
										
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>내 복약질문 제목</td>
										<td>2022.06.30</td>
										<td>2022.07.06</td>
										<td><span class="badge badge-info right" style="background-color: #2F88FF;">1</span></td>
									</tr>
									<tr>
										<td>내 복약질문 제목</td>
										<td>2022.06.30</td>
										<td>2022.07.06</td>
										<td><span class="badge badge-info right" style="background-color: #2F88FF;">3</span></td>
									</tr>
									<tr>
										<td>내 복약질문 제목</td>
										<td>2022.06.30</td>
										<td>2022.07.06</td>
										<td><span class="badge badge-info right" style="background-color: #2F88FF;">1</span></td>
									</tr>
									<tr>
										<td>내 복약질문 제목</td>
										<td>2022.06.30</td>
										<td>2022.07.06</td>
										<td><span class="badge badge-info right" style="background-color: #2F88FF;">2</span></td>
									</tr>
									<tr>
										<td>내 복약질문 제목</td>
										<td>2022.06.30</td>
										<td>2022.07.06</td>
										<td><span class="badge badge-info right" style="background-color: #2F88FF;">1</span></td>
									</tr>
									<tr>
										<td>내 복약질문 제목</td>
										<td>2022.06.30</td>
										<td>2022.07.06</td>
										<td><span class="badge badge-info right" style="background-color: #2F88FF;">7</span></td>
									</tr>
									<tr>
										<td>내 복약질문 제목</td>
										<td>2022.06.30</td>
										<td>2022.07.06</td>
										<td><span class="badge badge-info right" style="background-color: #2F88FF;">3</span></td>
									</tr>
									<tr>
										<td>내 복약질문 제목</td>
										<td>2022.06.30</td>
										<td>2022.07.06</td>
										<td><span class="badge badge-info right" style="background-color: #2F88FF;">3</span></td>
									</tr>
									<tr>
										<td>내 복약질문 제목</td>
										<td>2022.06.30</td>
										<td>2022.07.06</td>
										<td><span class="badge badge-info right" style="background-color: #2F88FF;">1</span></td>
									</tr>
									<tr>
										<td>내 복약질문 제목</td>
										<td>2022.06.30</td>
										<td>2022.07.06</td>
										<td><span class="badge badge-info right" style="background-color: #2F88FF;">5</span></td>
									</tr>
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- 페이지 -->
				<ul class="pagination pagination-sm "
					style="justify-content: center;">
					<li class="page-item"><a class="page-link" href="#">«</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">»</a></li>
				</ul>
			</div>

		</div>


	</div>
</body>
</html>