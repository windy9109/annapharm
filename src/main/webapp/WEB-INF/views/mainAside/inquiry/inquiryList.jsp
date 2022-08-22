<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원 마이페이지 문의사항</title>
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
			<div style="margin-top: 50px;">
				<span style="font-weight: bold; font-size: 1.4em;">문의내역</span>
				<div style="float: right;">
					<input type="radio" name="replyStatus" id="a" /> <span
						for="replyStatus">답변완료</span> <input type="radio"
						name="replyStatus" id="a" /> <span for="replyStatus">답변대기</span>
					<div style="display: inline-block; margin-left: 20px; margin-right: 20px;">
						<div class="input-group input-group-lg" style="width: 300px;">
							<input type="search" class="form-control form-control-lg"
								placeholder="검색어를 입력해주세요" style="height: 30px; font-size: 16px;">
							<div class="input-group-append">
								<button type="submit" class="btn btn-lg btn-default"
									style="height: 30px; font-size: 16px; padding: 0px 10px;">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</div>
					<input type="button" value="작성" class="btn_regist"
						style="float: right; width: 100px;">
				</div>
				<!-- 문의내역 -->
				<div class="inquiryList" style="margin-top: 20px;">
					<div class="card">
						<div class="card-body table-responsive p-0">
							<table class="table table-hover text-nowrap"
								style="text-align: center;">
								<thead>
									<tr style="background-color: #2F88FF; color: white;">
										<th style="width: 500px;">제목</th>
										<th>작성일</th>
										<th>답변상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>문의사항 제목</td>
										<td>2022.06.30</td>
										<td><span class="stand-by btn-sm">답변대기</span></td>
									</tr>
									<tr>
										<td>문의사항 제목</td>
										<td>2022.06.30</td>
										<td><span class="stand-end btn-sm">답변완료</span></td>
									</tr>
									<tr>
										<td>문의사항 제목</td>
										<td>2022.06.30</td>
										<td><span class="stand-end btn-sm">답변완료</span></td>
									</tr>
									<tr>
										<td>문의사항 제목</td>
										<td>2022.06.30</td>
										<td><span class="stand-by btn-sm">답변대기</span></td>
									</tr>
									<tr>
										<td>문의사항 제목</td>
										<td>2022.06.30</td>
										<td><span class="stand-by btn-sm">답변대기</span></td>
									</tr>
									<tr>
										<td>문의사항 제목</td>
										<td>2022.06.30</td>
										<td><span class="stand-by btn-sm">답변대기</span></td>
									</tr>
									<tr>
										<td>문의사항 제목</td>
										<td>2022.06.30</td>
										<td><span class="stand-by btn-sm">답변대기</span></td>
									</tr>
									<tr>
										<td>문의사항 제목</td>
										<td>2022.06.30</td>
										<td><span class="stand-by btn-sm">답변대기</span></td>
									</tr>
									<tr>
										<td>문의사항 제목</td>
										<td>2022.06.30</td>
										<td><span class="stand-by btn-sm">답변대기</span></td>
									</tr>
									<tr>
										<td>문의사항 제목</td>
										<td>2022.06.30</td>
										<td><span class="stand-by btn-sm">답변대기</span></td>
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