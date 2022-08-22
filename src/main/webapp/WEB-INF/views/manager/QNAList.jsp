<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 자주묻는질문</title>

<style>
.stand-by{
	background-color: #adb5bd;
	background: #adb5bd;
	color: white;
}
.stand-end{
	background-color: #007bff;
	background: #007bff;
	color: white;
}
th{
	background-color: #343a40;
	background: #343a40;
	color: white;
	text-align: center;
	font-weight: bold;
}
td{
	text-align: center;
	font-size: 15px;
	color:black;
}
.tableText{
	text-align: left;
}
.select2{
	width: 140px;
}
.searchBox{
	padding-top: 30px;
	align-items:center;
	background: white;
	background-color:white;
	text-align: center;
	width: 1038px;
}
.pageTitle{
	font-size: 30px;
	font-weight: bold;
	color: black;
	text-align: left;
	padding-left: 30px;
}
.select2-container--default .select2-selection--single{
	padding: 3px;
}
.searchBtn{
	height: 30px;
}
.searchDiv{
	width: 300px;
}
.form-group{
	margin: 0px;
}
.pagination{
	justify-content: center;
}
.accodianText{
	font-size: 15px;
}
.accodianTd{
	text-align: left;	
}

.btn_detail{
	width: 60px;
	height: 30px;
	margin : 10px;
	padding : 4px;
}
.subPageTitle{
	font-size: 15px;
	font-weight: normal;
}
</style>
</head>
<body>
	<div class="content-wrapper">
		<div class="row searchBox">
			<div class="col-lg-12 pageTitle">
				<span>자주묻는질문</span><span class="subPageTitle">(최대 8개까지 등록이 가능합니다.)</span>
			</div>
		</div>
		<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>순번</th>
								<th>제목</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<tr data-widget="expandable-table" aria-expanded="false">
								<td>1</td>
								<td class="tableText">약사in이 무엇인가요?</td>
								<td>2022-06-30</td>
							</tr>
							<tr class="expandable-body">
								<td colspan="3" class="accodianTd">
									<p class="accodianText">약사in이란........... 입니다.</p>
									<div class="row" style="justify-content: end;">
										<button type="button" class="btn btn-block btn-warning btn_detail">수정</button>
										<button type="button" class="btn btn-block btn-danger btn_detail" style="margin:10px;">삭제</button>
									</div>
								</td>
							</tr>
							<tr data-widget="expandable-table" aria-expanded="false">
								<td>2</td>
								<td class="tableText">약사in이 무엇인가요?</td>
								<td>2022-06-30</td>
							</tr>
							<tr class="expandable-body">
								<td colspan="3" class="accodianTd">
									<p class="accodianText">약사in이란........... 입니다.</p>
									<div class="row" style="justify-content: end;">
										<button type="button" class="btn btn-block btn-warning btn_detail">수정</button>
										<button type="button" class="btn btn-block btn-danger btn_detail" style="margin:10px;">삭제</button>
									</div>
								</td>
							</tr>
							<tr data-widget="expandable-table" aria-expanded="false">
								<td>3</td>
								<td class="tableText">약사in이 무엇인가요?</td>
								<td>2022-06-30</td>
							</tr>
							<tr class="expandable-body">
								<td colspan="3" class="accodianTd">
									<p class="accodianText">약사in이란........... 입니다.</p>
									<div class="row" style="justify-content: end;">
										<button type="button" class="btn btn-block btn-warning btn_detail">수정</button>
										<button type="button" class="btn btn-block btn-danger btn_detail" style="margin:10px;">삭제</button>
									</div>
								</td>
							</tr>
							<tr data-widget="expandable-table" aria-expanded="false">
								<td>4</td>
								<td class="tableText">약사in이 무엇인가요?</td>
								<td>2022-06-30</td>
							</tr>
							<tr class="expandable-body">
								<td colspan="3" class="accodianTd">
									<p class="accodianText">약사in이란........... 입니다.</p>
									<div class="row" style="justify-content: end;">
										<button type="button" class="btn btn-block btn-warning btn_detail">수정</button>
										<button type="button" class="btn btn-block btn-danger btn_detail" style="margin:10px;">삭제</button>
									</div>
								</td>
							</tr>
							<tr data-widget="expandable-table" aria-expanded="false">
								<td>5</td>
								<td class="tableText">약사in이 무엇인가요?</td>
								<td>2022-06-30</td>
							</tr>
							<tr class="expandable-body">
								<td colspan="3" class="accodianTd">
									<p class="accodianText">약사in이란........... 입니다.</p>
									<div class="row" style="justify-content: end;">
										<button type="button" class="btn btn-block btn-warning btn_detail">수정</button>
										<button type="button" class="btn btn-block btn-danger btn_detail" style="margin:10px;">삭제</button>
									</div>
								</td>
							</tr>
							<tr data-widget="expandable-table" aria-expanded="false">
								<td>6</td>
								<td class="tableText">약사in이 무엇인가요?</td>
								<td>2022-06-30</td>
							</tr>
							<tr class="expandable-body">
								<td colspan="3" class="accodianTd">
									<p class="accodianText">약사in이란........... 입니다.</p>
									<div class="row" style="justify-content: end;">
										<button type="button" class="btn btn-block btn-warning btn_detail">수정</button>
										<button type="button" class="btn btn-block btn-danger btn_detail" style="margin:10px;">삭제</button>
									</div>
								</td>
							</tr>
							<tr data-widget="expandable-table" aria-expanded="false">
								<td>7</td>
								<td class="tableText">약사in이 무엇인가요?</td>
								<td>2022-06-30</td>
							</tr>
							<tr class="expandable-body">
								<td colspan="3" class="accodianTd">
									<p class="accodianText">약사in이란........... 입니다.</p>
									<div class="row" style="justify-content: end;">
										<button type="button" class="btn btn-block btn-warning btn_detail">수정</button>
										<button type="button" class="btn btn-block btn-danger btn_detail" style="margin:10px;">삭제</button>
									</div>
								</td>
							</tr>
							<tr data-widget="expandable-table" aria-expanded="false">
								<td colspan="3">
									<i class="fa-solid fa-circle-plus fa-xl"></i>
								</td>
							</tr>
							<tr class="expandable-body">
								<td colspan="3" class="accodianTd">
										<div class="form-group">
											<label for="inputName">제목</label> 
											<input type="text" id="inputName" class="form-control" placeholder="제목을 입력하세요.">
										</div>
										<div class="form-group">
											<label for="inputDescription">내용</label>
											<textarea id="inputDescription" class="form-control" rows="4" placeholder="내용을 입력하세요."></textarea>
										</div>
										<p class="accodianText"></p>
									<div class="row" style="justify-content: end;">
										<button type="button" class="btn btn-block btn-primary btn_detail">등록</button>
									</div>
								</td>
							</tr>
						</tbody>
						
					</table>
				</div>

			</div>

		</div>
	</div>
	</div>
</body>
</html>