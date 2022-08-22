<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
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
	text-overflow: ellipsis;
}
.tableNum{
	text-align: right;
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
	width: 1280px;
	margin: 0px;
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
.btn_detail{
	height: 30px;
	margin : 10px;
	margin-right: 30px;
	padding : 4px;
	float: right;
}
/* select 박스 관련 설정 */
.input-group:not(.has-validation)>.form-control:not(:last-child){
	height: 35px;
}
.select2-container--default .select2-selection--single .select2-selection__arrow{
	height: 33px;
}
.divideMember-select{
	background-color: #0069d9;
	font-weight: bold; 
	color:white;
}
.divideMember{
	font-weight: bold;
}
.mainTitle{
	font-size: 40px;
}
.subTitle{
	font-size: 14px;
}
.sort_list_module li {
    float: left;
    margin-left: 4px;
}
.mainRadio{
	float:right;
	margin-right: 5px;
}

</style>
</head>

<title>약사IN 목록</title>

<body>
	 <!-- header content -->
	<div class="content-wrapper">
		<div class="row searchBox" style="padding-top: 0px;">
			<div class="col-lg-12 pageTitle">
				<button type="button" class="btn btn-primary btn_detail">약사IN 등록</button>
			</div>
		</div>

	<!-- Main content -->
    <section class="content">		
		<div class="card" style="box-shadow:none;">
			<div class="card-header with-border">
				<div class="row">
					<div class="col-lg-4">
						<span class="mainTitle">약사</span><span class="mainTitle" style="color:#0069d9;">IN</span><br>
						<span class="subTitle">&nbsp;&nbsp;복약과 관련한 질문을 전문 약사님들이 답변해드립니다.</span>
					</div>
					
					<div class="col-lg-8">
						<div id="keyword" class="card-tools" style="width:670px; float:right;">
							<div class="input-group row">
								<div class="form-check" style="margin-right:10px; padding-top:5px;">
									<input class="form-check-input" type="checkbox">
									<label class="form-check-label">답변대기</label>
								</div>
								<div class="form-check" style="margin-right:10px; padding-top:5px;">
									<input class="form-check-input" type="checkbox">
									<label class="form-check-label">답변완료</label>
								</div>
								<select class="form-control col-md-2" name="searchType" id="searchType">
									<option selected>10개</option>
									<option>20개</option>
									<option>50개</option>
								</select>
								<select class="form-control col-md-2" name="searchType" id="searchType">
									<option value="tcw" ${cri.searchType eq "tcw" ? "selected" : "" }  >전 체</option>
									<option value="t"	${cri.searchType eq "t" ? "selected" : "" } >제 목</option>
									<option value="c"	${cri.searchType eq "c" ? "selected" : "" } >내 용</option>
								</select>			
								<input type="search" class="form-control form-control-lg" style="height: 35px;" placeholder="검색어를 입력하세요." value="">
								<div class="input-group-append">
									<button type="submit" class="btn btn-lg btn-default searchBtn" style="padding-top: 3px;height: 35px;">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
							<br>
							<div class="custom-control custom-radio mainRadio">
								<input class="custom-control-input" type="radio" id="customRadio1" name="customRadio">
								<label for="customRadio1" class="custom-control-label">답변 적은순</label>
							</div>
							<div class="custom-control custom-radio mainRadio">
								<input class="custom-control-input" type="radio" id="customRadio2" name="customRadio">
								<label for="customRadio2" class="custom-control-label">첫 질문</label>
							</div>
							<div class="custom-control custom-radio mainRadio">
								<input class="custom-control-input" type="radio" id="customRadio3" name="customRadio">
								<label for="customRadio3" class="custom-control-label">최신순</label>
							</div>
							
						</div>
					</div>						
				</div>
			</div>
			<div class="card-body">
			<div class="row">
				<div class="col-lg-12">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th style="width:700px">제목</th>
									<th>답변 수</th>
									<th>카테고리</th>
									<th>조회수</th>
									<th>최근 답변일</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="tableText">질문이요!</td>
									<td class="tableNum">0</td>
									<td>복약 관련</td>
									<td class="tableNum">12</td>
									<td> - </td>
									<td>2022-07-06</td>
								</tr>
								<tr>
									<td class="tableText">질문이요!</td>
									<td class="tableNum">2</td>
									<td>기타</td>
									<td class="tableNum">41</td>
									<td>2022-07-06</td>
									<td>2022-07-06</td>
								</tr>
								<tr>
									<td class="tableText">질문이요!</td>
									<td class="tableNum">3</td>
									<td>약국 관련</td>
									<td class="tableNum">51</td>
									<td>2022-07-06</td>
									<td>2022-07-06</td>
								</tr>
								<tr>
									<td class="tableText">질문이요!</td>
									<td class="tableNum">3</td>
									<td>약제비 관련</td>
									<td class="tableNum">84</td>
									<td>2022-07-06</td>
									<td>2022-07-06</td>
								</tr>
								<tr>
									<td class="tableText">질문이요!</td>
									<td class="tableNum">3</td>
									<td>복약 관련</td>
									<td class="tableNum">41</td>
									<td>2022-07-06</td>
									<td>2022-07-06</td>
								</tr>
								<tr>
									<td class="tableText">질문이요!</td>
									<td class="tableNum">5</td>
									<td>복약 관련</td>
									<td class="tableNum">61</td>
									<td>2022-07-06</td>
									<td>2022-07-06</td>
								</tr>
								<tr>
									<td class="tableText">질문이요!</td>
									<td class="tableNum">1</td>
									<td>복약 관련</td>
									<td class="tableNum">32</td>
									<td>2022-07-06</td>
									<td>2022-07-06</td>
								</tr>
								<tr>
									<td class="tableText">질문이요!</td>
									<td class="tableNum">0</td>
									<td>복약 관련</td>
									<td class="tableNum">3</td>
									<td> - </td>
									<td>2022-07-06</td>
								</tr>
								<tr>
									<td class="tableText">질문이요!</td>
									<td class="tableNum">4</td>
									<td>복약 관련</td>
									<td class="tableNum">124</td>
									<td>2022-07-06</td>
									<td>2022-07-06</td>
								</tr>
								<tr>
									<td class="tableText">질문이요!</td>
									<td class="tableNum">1</td>
									<td>복약 관련</td>
									<td class="tableNum">92</td>
									<td>2022-07-06</td>
									<td>2022-07-06</td>
								</tr>
								
							</tbody>
						</table>
						</div>
						</div>
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
		
    </section>
    </div>
    
    
 </body>
 
 