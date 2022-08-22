<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 문의사항</title>

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
tr:hover{
	background-color: #c4e2ff;
	cursor: pointer;
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

</style>
</head>
<body>
	<div class="content-wrapper">
		<div class="row searchBox">
			<div class="col-lg-4 pageTitle">
				<span>문의사항</span>
			</div>
			<div class="col-lg-2">
				<div class="form-group">
					<select class="select2">
						<option selected>전체</option>
						<option>약사</option>
						<option>의사</option>
						<option>일반</option>
					</select>
				</div>
			</div>
			<div class="col-lg-2">
				<div class="form-group">
					<select class="select2">
						<option selected>전체</option>
						<option>답변대기</option>
						<option>답변완료</option>
					</select>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="form-group">
					<div class="input-group input-group-lg searchDiv">
						<input type="search" class="form-control form-control-lg" style="height: 30px;"
							placeholder="검색어를 입력하세요." value="">
						<div class="input-group-append">
							<button type="submit" class="btn btn-lg btn-default searchBtn" style="padding-top:0px;">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>순번</th>
									<th>분류</th>
									<th>제목</th>
									<th>아이디</th>
									<th>작성일</th>
									<th>첨부파일</th>
									<th>답변</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>67</td>
									<td>
										<span class="badge bg-info">의사</span>
									</td>
									<td class="tableText">처방전을 작성하는데 오류가 발생합니다.</td>
									<td>아이디</td>
									<td>2022-07-04</td>
									<td>
										<i class="fa-solid fa-file-arrow-down fa-2xl"></i>
									</td>
									<td>
										<span class="stand-by btn-sm">답변대기</span>
									</td>
								</tr>
								<tr>
									<td>66</td>
									<td>
										<span class="badge bg-info">의사</span>
									</td>
									<td class="tableText">처방전을 작성하는데 오류가 발생합니다.</td>
									<td>아이디</td>
									<td>2022-07-04</td>
									<td>
										<i class="fa-solid fa-file-arrow-down fa-2xl"></i>
									</td>
									<td>
										<span class="stand-by btn-sm">답변대기</span>
									</td>
								</tr>
								<tr>
									<td>65</td>
									<td>
										<span class="badge bg-success">약사</span>
									</td>
									<td class="tableText">재고를 확인하는데 오류가 있는거 같아요.</td>
									<td>아이디</td>
									<td>2022-07-04</td>
									<td>
									</td>
									<td>
										<span class="stand-by btn-sm">답변대기</span>
									</td>
								</tr>
								<tr>
									<td>64</td>
									<td>
										<span class="badge bg-success">약사</span>
									</td>
									<td class="tableText">재고를 확인하는데 오류가 있는거 같아요.</td>
									<td>아이디</td>
									<td>2022-07-04</td>
									<td>
										<i class="fa-solid fa-file-arrow-down fa-2xl"></i>
									</td>
									<td>
										<span class="stand-by btn-sm">답변대기</span>
									</td>
								</tr>
								<tr>
									<td>63</td>
									<td>
										<span class="badge bg-success">약사</span>
									</td>
									<td class="tableText">재고를 확인하는데 오류가 있는거 같아요.</td>
									<td>아이디</td>
									<td>2022-06-30</td>
									<td>
									</td>
									<td>
										<span class="stand-end btn-sm">답변완료</span>
									</td>
								</tr>
								<tr>
									<td>62</td>
									<td>
										<span class="badge bg-light">일반</span>
									</td>
									<td class="tableText">약사in 사용에 관련해서 궁금한게 있어요!</td>
									<td>아이디</td>
									<td>2022-06-30</td>
									<td>
										<i class="fa-solid fa-file-arrow-down fa-2xl"></i>
									</td>
									<td>
										<span class="stand-end btn-sm">답변완료</span>
									</td>
								</tr>
								<tr>
									<td>61</td>
									<td>
										<span class="badge bg-info">의사</span>
									</td>
									<td class="tableText">처방전을 작성하는데 오류가 발생합니다.</td>
									<td>아이디</td>
									<td>2022-06-30</td>
									<td>
									</td>
									<td>
										<span class="stand-end btn-sm">답변완료</span>
									</td>
								</tr>
								<tr>
									<td>60</td>
									<td>
										<span class="badge bg-info">의사</span>
									</td>
									<td class="tableText">처방전을 작성하는데 오류가 발생합니다.</td>
									<td>아이디</td>
									<td>2022-06-30</td>
									<td>
										<i class="fa-solid fa-file-arrow-down fa-2xl"></i>
									</td>
									<td>
										<span class="stand-end btn-sm">답변완료</span>
									</td>
								</tr>
								<tr>
									<td>59</td>
									<td>
										<span class="badge bg-success">약사</span>
									</td>
									<td class="tableText">재고를 확인하는데 오류가 있는거 같아요.</td>
									<td>아이디</td>
									<td>2022-06-30</td>
									<td>
										<i class="fa-solid fa-file-arrow-down fa-2xl"></i>
									</td>
									<td>
										<span class="stand-end btn-sm">답변완료</span>
									</td>
								</tr>
								<tr>
									<td>58</td>
									<td>
										<span class="badge bg-success">약사</span>
									</td>
									<td class="tableText">재고를 확인하는데 오류가 있는거 같아요.</td>
									<td>아이디</td>
									<td>2022-06-30</td>
									<td>
										<i class="fa-solid fa-file-arrow-down fa-2xl"></i>
									</td>
									<td>
										<span class="stand-end btn-sm">답변완료</span>
									</td>
								</tr>
								
							</tbody>
						</table>
					</div>

					<div class="card-footer clearfix">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#">«</a></li>
							<li class="page-item"><a class="page-link" href="#">&lsaquo;</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">6</a></li>
							<li class="page-item"><a class="page-link" href="#">7</a></li>
							<li class="page-item"><a class="page-link" href="#">8</a></li>
							<li class="page-item"><a class="page-link" href="#">9</a></li>
							<li class="page-item"><a class="page-link" href="#">&rsaquo;</a></li>
							<li class="page-item"><a class="page-link" href="#">»</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>