<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<!--Get your own code at fontawesome.com-->

<title>공지사항 상세보기</title>

<style>
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

th {
	background-color: #343a40;
	background: #343a40;
	color: white;
	text-align: center;
	font-weight: bold;
}

td {
	text-align: center;
	font-size: 15px;
	color: black;
}

tr:hover {
	background-color: #c4e2ff;
	cursor: pointer;
}

.tableText {
	text-align: left;
}

.select2 {
	width: 140px;
}

.searchBox {
	padding-top: 30px;
	align-items: center;
	background: white;
	background-color: white;
	text-align: center;
	width: 1037px;
}

.pageTitle {
	font-size: 30px;
	font-weight: bold;
	color: black;
	text-align: left;
	padding-left: 30px;
}

.select2-container--default .select2-selection--single {
	padding: 3px;
}

.searchBtn {
	height: 30px;
}

.searchDiv {
	width: 300px;
}

.form-group {
	margin: 0px;
}

.pagination {
	justify-content: center;
}

.btn_detail {
	width: 60px;
	height: 30px;
	margin: 10px;
	padding: 4px;
}

/* 목록으로 버튼 div */
.goListBtnDiv{
    width: 100%;
    height: 50px;
    text-align: center;
    padding-left: 90%;
}

/* 목록으로 버튼 */
.goListBtn {
	height: 30px;
	width: 90px;
	display: block;
	position: relative;
	float: left;
	padding: 0;
	/* margin: 10px 20px 10px 0; */
	text-align: center;
	line-height: 30px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
	border: 0;
	background: #1E90FF;
}

.goListBtn:hover {
	background: #1478FF;
	color: #FFF;
}

/* 공지 내용 */
.noticeContent{

}

/* 첨부파일 */
.attachedFile:hover {
	background: #EBF5FF;
}
</style>
</head>
<body>
	<div class="content-wrapper">
		<div class="body" style="padding: 30px; padding-top: 7%;">
			<div class="card">

				<div class="card-body table-responsive p-0">
				
					<!-- 공지 상단 -->
					<table class="table text-nowrap table-bordered" id="vertical-1"
						style="height: 50px; width: 100%; text-align: center;">
						<tr>
							<th style="background: #343a40; color: white; border-top: 1px solid; width: 20%;">공지 제목</th>
							<td colspan='3' style="background-color: #FFFFFF;text-align:left;"><span class="badge bg-success">약사</span> &emsp;2022년 약사연수교육 계획 안내</td>
						</tr>
						<tr>
							<th style="background: #343a40; color: white; border-top: 1px solid;">작성일</th>
							<td style="background-color: #FFFFFF;text-align:left;">2022.06.03</td>
							<th
								style="background: #343a40; color: white; border-top: 1px solid; width: 20%;">조회수</th>
							<td style="background-color: #FFFFFF;">25484</td>
						</tr>
					</table>
					
					
					<!-- 공지내용 -->
					<div class="noticeContent"
						style="height: 400px; background-color: #f4f6f9; line-height: 30px; padding: 5%;">
						2022년도 약사연수교육 계획을 붙임과 같이 안내드리오니 <br> 
						본 계획을 숙지하시어 교육 이수에 참고하시기 바랍니다.
					</div>

					<!-- 첨부파일 -->
					<table class="table text-nowrap table-bordered" id="vertical-1"
						style="height: 50px; width: 100%; text-align: center; height: 80px; line-height: 55px;">
						<tr>
							<th style="background: #343a40; color: white; border-top: 1px solid; width: 20%; height: 80px;">첨부파일</th>
							<td colspan='3' style="background-color: #FFFFFF;">
								<div style="margin-left: 2%;">
									<div class="attachedFile" style="border:1px solid gray;height: 55px;float: left;padding-right: 6px;">
										&nbsp;<i class='fas fa-paperclip' style='color:#0064FF; font-size:18px'></i>&nbsp;[별첨2] 2022년도 약사연수교육 계획.pdf
									</div>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="goListBtnDiv">
				<a href="<%=request.getContextPath() %>/manager/noticeList.jsp" class="goListBtn">목록으로</a>
			</div>

		</div>


	</div>
</body>
</html>