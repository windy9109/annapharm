<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="noticeList" value="${dataMap.noticeList }" />

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
	width: 60px;
	height: 30px;
	margin : 10px;
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

</style>
</head>

<title>공지목록 일반</title>

<body>
	 <!-- header content -->
	<div class="content-wrapper">
		<div class="row searchBox">
			<div class="col-lg-12 pageTitle">
				<span>공지사항</span>
				<button type="button" class="btn btn-primary btn_detail">등록</button>
			</div>
		</div>

	<!-- Main content -->
    <section class="content">		
		<div class="card">
			<div class="card-header with-border">
				<div id="keyword" class="card-tools" style="width:540px;">
					<div class="input-group row">
					  	<select class="form-control col-md-2" name="perPageNum" id="perPageNum"
					  		onchange="list_go(1);">
					  		<option>전체</option>
					  		<option>약사</option>
					  		<option>의사</option>
					  		<option>일반</option>
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
				</div>						
			</div>
			<div class="card-body">
			<div class="row">
				<div class="col-lg-1">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>분류</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="divideMember-select">전체</td>
							</tr>
							<tr>
								<td class="divideMember">약사</td>
							</tr>
							<tr>
								<td class="divideMember">의사</td>
							</tr>
							<tr>
								<td class="divideMember">일반</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-lg-11">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>순번</th>
									<th>분류</th>
									<th>제목</th>
									<th>작성일</th>
									<th>첨부파일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>67</td>
									<td>
										<span class="badge bg-info">의사</span>
									</td>
									<td class="tableText">의사 회원분들께 전합니다.</td>
									<td>2022-07-04</td>
									<td>
										<i class="fa-solid fa-file-arrow-down fa-2xl"></i>
									</td>
									<td>1344</td>
								</tr>
								<tr>
									<td>66</td>
									<td>
										<span class="badge bg-info">의사</span>
									</td>
									<td class="tableText">의사 회원분들께 전합니다.</td>
									<td>2022-07-04</td>
									<td>
										<i class="fa-solid fa-file-arrow-down fa-2xl"></i>
									</td>
									<td>342</td>
								</tr>
								<tr>
									<td>65</td>
									<td>
										<span class="badge bg-dark">전체</span>
									</td>
									<td class="tableText">전체 회원분들께 전합니다.</td>
									<td>2022-07-04</td>
									<td>
									</td>
									<td>35235</td>
								</tr>
								<tr>
									<td>64</td>
									<td>
										<span class="badge bg-success">약사</span>
									</td>
									<td class="tableText">약사 회원분들께 전합니다.</td>
									<td>2022-07-04</td>
									<td>
										<i class="fa-solid fa-file-arrow-down fa-2xl"></i>
									</td>
									<td>2343</td>
								</tr>
								<tr>
									<td>63</td>
									<td>
										<span class="badge bg-success">약사</span>
									</td>
									<td class="tableText">약사 회원분들께 전합니다.</td>
									<td>2022-06-30</td>
									<td>
									</td>
									<td>232</td>
								</tr>
								<tr>
									<td>62</td>
									<td>
										<span class="badge bg-light">일반</span>
									</td>
									<td class="tableText">일반 회원분들께 전합니다.</td>
									<td>2022-06-30</td>
									<td>
										<i class="fa-solid fa-file-arrow-down fa-2xl"></i>
									</td>
									<td>346</td>
								</tr>
								<tr>
									<td>61</td>
									<td>
										<span class="badge bg-info">의사</span>
									</td>
									<td class="tableText">의사 회원분들께 전합니다.</td>
									<td>2022-06-30</td>
									<td>
									</td>
									<td>415</td>
								</tr>
								<tr>
									<td>60</td>
									<td>
										<span class="badge bg-light">일반</span>
									</td>
									<td class="tableText">일반 회원분들께 전합니다.</td>
									<td>2022-06-30</td>
									<td>
										<i class="fa-solid fa-file-arrow-down fa-2xl"></i>
									</td>
									<td>685</td>
								</tr>
								<tr>
									<td>59</td>
									<td>
										<span class="badge bg-dark">전체</span>
									</td>
									<td class="tableText">전체 회원분들께 전합니다.</td>
									<td>2022-06-30</td>
									<td>
										<i class="fa-solid fa-file-arrow-down fa-2xl"></i>
									</td>
									<td>2313</td>
								</tr>
								<tr>
									<td>58</td>
									<td>
										<span class="badge bg-success">약사</span>
									</td>
									<td class="tableText">약사 회원분들께 전합니다.</td>
									<td>2022-06-30</td>
									<td>
										<i class="fa-solid fa-file-arrow-down fa-2xl"></i>
									</td>
									<td>584</td>
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
    
    <c:if test="${from eq 'regist'}">
		<script>
			alert("공지사항 등록이 성공했습니다.");
			window.opener.location.reload();
			window.close();
		</script>
	</c:if>
    
    
 </body>
 
 