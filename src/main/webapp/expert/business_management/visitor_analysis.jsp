<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/common.js" ></script>

<script>
$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();   
});	
</script>
<style type="text/css">

.table td, .table th {
	padding: 5px;
	vertical-align: top;
	border-top: 1px solid #dee2e6;
	font-size: 12px;

}
.table td {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.form-control.d-inline-block {
	height: 31px;
	font-size: 12px;
	width: 120px;
}

.table th {
	align-content: center;
}

/* .table td:hover { */
/* 	overflow: visible; */
/* } */

.card-body {
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	min-height: 1px;
	padding: 0.5rem;
	padding-top: 0px;
}

table {
	table-layout: fixed;
}
</style>
</head>

<title>내방환자 분석</title>

<body>
	<div class="content-wrapper">
		<div class="row m-0 p-2 border">
			
			<div class="row m-0">
				<div class="col-6 p-0 border" style="height: 900px;">
					<div class="row m-0 border">
						<div class="card w-100 mb-0">
							<div class="card-header">
								<div class="form-inline">
									<h3 class="card-title">연령/성별 매출 현황</h3>
									<input type="date" style="margin-left: 137px; display: inline; width: 120px;"
										class="form-control form-control-sm mr-2"> <input
										type="date" style="display: inline; width: 120px;"
										class="form-control form-control-sm mr-2">
									<button class="btn btn-sm btn-default">검색</button>
								</div>
							</div>
							<div class="card-body" style="height: 200px;">
								<table class="table table-hover table-bordered"
									style="border-top: 1px solid #dee2e6;">
									<colgroup>
										<col width="13%" />
										<col width="10%" />
										<col width="15%" />
										<col width="28%" />
										<col width="15%" />
										<col width="28%" />
										<col width="15%" />
										<col width="25%" />
									</colgroup>
									<thead class="text-center">
										<tr>
											<th class="align-middle" rowspan='2'>연령</th>
											<th class="align-middle" rowspan='2'>성별</th>
											<th colspan='2'>처방조제</th>
											<th colspan='2'>비처방조제</th>
											<th colspan='2'>합계금액</th>
										</tr>
										<tr>
											<th>조제건</th>
											<th>조제금액</th>
											<th>조제건</th>
											<th>조제금액</th>
											<th>조제건</th>
											<th>조제금액</th>
										</tr>
									</thead>
									<tbody class="text-right">
										<tr>
											<td class="text-center">40~49</td>
											<td class="text-center">여</td>
											<td>80</td>
											<td>845,120</td>
											<td>98</td>
											<td>100,500</td>
											<td>178</td>
											<td>945,620</td>
										</tr>
										<tr>
											<td class="text-center">40~49</td>
											<td class="text-center">남</td>
											<td>90</td>
											<td>981,120</td>
											<td>78</td>
											<td>90,100</td>
											<td>168</td>
											<td>1,071,220</td>
										</tr>
										<tr>
											<td class="text-center">50~59</td>
											<td class="text-center">여</td>
											<td>70</td>
											<td>691,240</td>
											<td>86</td>
											<td>110,100</td>
											<td>156</td>
											<td>801,340</td>
										</tr>
										<tr>
											<td class="text-center">30~39</td>
											<td class="text-center">여</td>
											<td>70</td>
											<td>610,400</td>
											<td>56</td>
											<td>54,100</td>
											<td>126</td>
											<td>664,500</td>
										</tr>
										<tr>
											<td class="text-center">30~39</td>
											<td class="text-center">남</td>
											<td>60</td>
											<td>530,540</td>
											<td>30</td>
											<td>35,100</td>
											<td>90</td>
											<td>565,640</td>
										</tr>
									</tbody>
								</table>
							</div>
							
							<div class="card-footer p-1">
								<div class="row">
									<div class="col-6" style="padding-top: 7px; font-size: 14px;">Showing 1 to 10 of 57 entries</div>
									<div class="col-6" style="text-align: right;">
										<ul class="pagination pagination-sm justify-content-end mb-0">
											<li class="page-item"><a class="page-link" href="#">Previous</a></li>
											<li class="page-item active"><a class="page-link" href="#">1</a></li>
											<li class="page-item"><a class="page-link" href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item"><a class="page-link" href="#">Next</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row m-0 border">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">연령/성별 선호 약/건강기능식품</h3>
							</div>
							
							<div class="card-body">
								<div class="row p-1 m-0 border">
									<i class='fas fa-filter' style='font-size:24px'></i>
									<form class="form-inline">
										<div class="input-group input-group-sm ml-1">
											<div class="input-group-prepend">
												<span class="input-group-text">제약사</span>
											</div>
											<input class="form-control d-inline-block" list="companylist" id="company" name="company">
											<datalist id="companylist">
												<option>녹십자</option>
												<option>동아제약</option>
											</datalist>
										</div>
										
										<div class="input-group input-group-sm ml-1">
											<div class="input-group-prepend">
												<span class="input-group-text">구분</span>
											</div>
											
											<input class="form-control d-inline-block" list="gubunlist" id="gubun" name="gubun">
											<datalist id="gubunlist">
												<option>건강기능식품</option>
												<option>전문의약품</option>
												<option>일반의약품</option>
											</datalist>
											<button class="btn btn-sm btn-default align-middle ml-1">적용</button>
										</div>
									</form>
								</div>
								<table class="table table-hover table-bordered text-nowrap">
									<colgroup>
										<col width="10%" />
										<col width="10%" />
										<col width="45%" />
										<col width="29%" />
										<col width="25%" />
										<col width="16%" />
										<col width="15%" />
										<col width="20%" />
									</colgroup>
									<thead class="text-center">
										<tr>
											<th><i class='fas fa-star'></i></th>
											<th>NO.</th>
											<th>약이름</th>
											<th>제조사</th>
											<th id="gubun">구분
											</th>
											<th>판매수</th>
											<th>판매가</th>
											<th>재고수</th>
										</tr>
									</thead>
									<tbody class="text-left">
										<tr onclick="">
											<th><i class='fas fa-star'></i></th>
											<td>1</td>
											<td>
												<a href="javascript:OpenWindow('<%=request.getContextPath() %>/expert/product/medicine_detail.jsp','상세보기',800,700);">
													박카스
												</a>
											
											</td>
											<td>녹십자</td>
											<td>건강기능식품</td>
											<td class="text-right">10</td>
											<td class="text-right">500</td>
											<td class="text-right">50</td>
										</tr>
										<tr>
											<th><i class='fas fa-star'></i></th>
											<td>2</td>
											<td><a href="javascript:OpenWindow('<%=request.getContextPath() %>/expert/product/product_detail.jsp','상세보기',800,700);">
													비타500
												</a>
											</td>
											<td>동아제약</td>
											<td>건강기능식품</td>
											<td class="text-right">5</td>
											<td class="text-right">500</td>
											<td class="text-right">50</td>
										</tr>
										<tr>
											<th><i class='far fa-star'></i></th>
											<td>3</td>
											<td data-toggle="tooltip" data-placement="top" title="다이크로짇정(히드로클로로티아지드)_(25mg/1정)">다이크로짇정(히드로클로로티아지드)_(25mg/1정)</td>
											<td>(주)유한양행</td>
											<td>전문의약품</td>
											<td class="text-right">1</td>
											<td class="text-right">10</td>
											<td class="text-right">50</td>
										</tr>
										<tr>
											<th><i class='far fa-star'></i></th>
											<td>4</td>
											<td data-toggle="tooltip" data-placement="top" title="알파아세트아미노펜정500밀리그람_(0.5g/1정)">
											
											알파아세트아미노펜정500밀리그람_(0.5g/1정)
	
											</td>
											<td>알파제약(주)</td>
											<td>일반의약품</td>
											<td class="text-right">2</td>
											<td class="text-right">11</td>
											<td class="text-right">50</td>
										</tr>
										<tr>
											<th><i class='far fa-star'></i></th>
											<td>5</td>
											<td data-toggle="tooltip" data-placement="top" title="일양노이시린에이정(규산알루민산마그네슘)_(0.5g/1정)">일양노이시린에이정(규산알루민산마그네슘)_(0.5g/1정)</td>
											<td>일양약품(주)</td>
											<td>일반의약품</td>
											<td class="text-right">3</td>
											<td class="text-right">11</td>
											<td class="text-right">50</td>
										</tr>
									</tbody>
								</table>
							</div>
							
							<div class="card-footer p-1">
								<div class="row">
									<div class="col-6" style="padding-top: 7px; font-size: 14px;">Showing 1 to 10 of 57 entries</div>
									<div class="col-6" style="text-align: right;">
										<ul class="pagination pagination-sm justify-content-end mb-0">
											<li class="page-item"><a class="page-link" href="#">Previous</a></li>
											<li class="page-item active"><a class="page-link" href="#">1</a></li>
											<li class="page-item"><a class="page-link" href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item"><a class="page-link" href="#">Next</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row m-0 border">
						<div class="card">
							<div class="card-header form-inline">
								<h3 class="card-title">선호 약/건강기능식품 재고 현황</h3>
	
							</div>
		
							<div class="card-body table-responsive" style="height: 220px;">
								
								<table class="table table-bordered table-head-fixed text-nowrap">
									<colgroup>
										<col width="9%"/>
										<col width="45%"/>
										<col width="17%"/>
										<col width="22%"/>
										<col width="15%"/>
										<col width="25%"/>
									</colgroup>
									<thead class="text-center" style="font-size: 14px;">
										<tr>
											<th>NO.</th>
											<th>약명</th>
											<th>제조사</th>
											<th>구분</th>
											<th>재고수</th>
											<th>유통기한</th>
										</tr>
									</thead>
									<tbody class="text-center" style="font-size: 14px;">
										<tr>
											<td class="text-left">1</td>
											<td class="text-left">박카스</td>
											<td class="text-left">녹십자</td>
											<td>건강기능식품</td>
											<td>5</td>
											<td class="text-right">2023-06-30</td>
										</tr>
										<tr>
											<td class="text-left">2</td>
											<td class="text-left">박카스</td>
											<td class="text-left">녹십자</td>
											<td>건강기능식품</td>
											<td>5</td>
											<td class="text-right">2023-12-15</td>
										</tr>
										<tr>
											<td class="text-left">1</td>
											<td class="text-left">박카스</td>
											<td class="text-left">녹십자</td>
											<td>건강기능식품</td>
											<td>5</td>
											<td class="text-right">2023-06-30</td>
										</tr>
										<tr>
											<td class="text-left">2</td>
											<td class="text-left">박카스</td>
											<td class="text-left">녹십자</td>
											<td>건강기능식품</td>
											<td>5</td>
											<td class="text-right">2023-12-15</td>
										</tr>
										<tr>
											<td class="text-left">1</td>
											<td class="text-left">박카스</td>
											<td class="text-left">녹십자</td>
											<td>건강기능식품</td>
											<td>5</td>
											<td class="text-right">2023-06-30</td>
										</tr>
										<tr>
											<td class="text-left">2</td>
											<td class="text-left">박카스</td>
											<td class="text-left">녹십자</td>
											<td>건강기능식품</td>
											<td>5</td>
											<td class="text-right">2023-12-15</td>
										</tr>
										<tr>
											<td class="text-left">1</td>
											<td class="text-left">박카스</td>
											<td class="text-left">녹십자</td>
											<td>건강기능식품</td>
											<td>5</td>
											<td class="text-right">2023-06-30</td>
										</tr>
										<tr>
											<td class="text-left">2</td>
											<td class="text-left">박카스</td>
											<td class="text-left">녹십자</td>
											<td>건강기능식품</td>
											<td>5</td>
											<td class="text-right">2023-12-15</td>
										</tr>
										<tr>
											<td class="text-left">1</td>
											<td class="text-left">박카스</td>
											<td class="text-left">녹십자</td>
											<td>건강기능식품</td>
											<td>5</td>
											<td class="text-right">2023-06-30</td>
										</tr>
										<tr>
											<td class="text-left">2</td>
											<td class="text-left">박카스</td>
											<td class="text-left">녹십자</td>
											<td>건강기능식품</td>
											<td>5</td>
											<td class="text-right">2023-12-15</td>
										</tr>
										<tr>
											<td class="text-left">1</td>
											<td class="text-left">박카스</td>
											<td class="text-left">녹십자</td>
											<td>건강기능식품</td>
											<td>5</td>
											<td class="text-right">2023-06-30</td>
										</tr>
										<tr>
											<td class="text-left">2</td>
											<td class="text-left">박카스</td>
											<td class="text-left">녹십자</td>
											<td>건강기능식품</td>
											<td>5</td>
											<td class="text-right">2023-12-15</td>
										</tr>
										<tr>
											<td class="text-left">1</td>
											<td class="text-left">박카스</td>
											<td class="text-left">녹십자</td>
											<td>건강기능식품</td>
											<td>5</td>
											<td class="text-right">2023-06-30</td>
										</tr>
										<tr>
											<td class="text-left">2</td>
											<td class="text-left">박카스</td>
											<td class="text-left">녹십자</td>
											<td>건강기능식품</td>
											<td>5</td>
											<td class="text-right">2023-12-15</td>
										</tr>
										<tr>
											<td class="text-left">1</td>
											<td class="text-left">박카스</td>
											<td class="text-left">녹십자</td>
											<td>건강기능식품</td>
											<td>5</td>
											<td class="text-right">2023-06-30</td>
										</tr>
										<tr>
											<td class="text-left">2</td>
											<td class="text-left">박카스</td>
											<td class="text-left">녹십자</td>
											<td>건강기능식품</td>
											<td>5</td>
											<td class="text-right">2023-12-15</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					
					
					
					
					
				</div>
				
				<div class="col-6 p-0 border" style="height: 900px;">
					
					
					<div class="row m-0 border">
						<div class="card w-100 mb-0">
							<div class="card-header">
								<div class="form-inline">
									<h3 class="card-title">장기조제환자 현황</h3>
									
									<button class="btn btn-sm btn-default" style="margin-left: 245px;">1개월</button>
									<button class="btn btn-sm btn-default ml-2">2개월</button>
									<button class="btn btn-sm btn-default ml-2">3개월 이상</button>
								</div>
							</div>
							
							<div class="card-body">
								<table class="table table-hover table-bordered"
									style="border-top: 1px solid #dee2e6;">
									<colgroup>
										<col width="35%" />
										<col width="20%" />
										<col width="20%" />
										<col width="26%" />
										<col width="20%" />
										<col width="20%" />
										<col width="33%" />
									</colgroup>
									<thead class="text-center">
										<tr>
											<th>최근처방일</th>
											<th>이름</th>
											<th>처방일수</th>
											<th>처방기관</th>
											<th>처방의</th>
											<th>약사명</th>
											<th>재고확인</th>
										</tr>
									</thead>
									<tbody class="text-left">
										<tr>
											<td>2022.06.28</td>
											<td>곽수현</td>
											<td>60</td>
											<td>대덕병원</td>
											<td>이정규</td>
											<td>이병진</td>
											<td><span class="badge badge-pill badge-danger">부족</span></td>
										</tr>
										<tr>
											<td>2022.06.30</td>
											<td>곽성상</td>
											<td>30</td>
											<td>대덕병원</td>
											<td>이정규</td>
											<td>이병진</td>
											<td><span class="badge badge-pill badge-danger">부족</span></td>
										</tr>
										<tr>
											<td>2022.06.26</td>
											<td>김형민</td>
											<td>60</td>
											<td>대덕병원</td>
											<td>이정규</td>
											<td>이병진</td>
											<td>-</td>
										</tr>
										<tr>
											<td>2022.06.27</td>
											<td>김기웅</td>
											<td>60</td>
											<td>대덕병원</td>
											<td>이정규</td>
											<td>이병진</td>
											<td>-</td>
										</tr>
										<tr>
											<td>2022.06.28</td>
											<td>김민지</td>
											<td>60</td>
											<td>대덕병원</td>
											<td>이정규</td>
											<td>이병진</td>
											<td>-</td>
										</tr>
										<tr>
											<td>2022.06.29</td>
											<td>이슬기</td>
											<td>60</td>
											<td>대덕병원</td>
											<td>이정규</td>
											<td>이병진</td>
											<td>-</td>
										</tr>
	
									</tbody>
								</table>
							</div>
							
							<div class="card-footer p-1">
								<div class="row">
									<div class="col-6" style="padding-top: 7px; font-size: 14px;">Showing 1 to 10 of 57 entries</div>
									<div class="col-6" style="text-align: right;">
										<ul class="pagination pagination-sm justify-content-end mb-0">
											<li class="page-item"><a class="page-link" href="#">Previous</a></li>
											<li class="page-item active"><a class="page-link" href="#">1</a></li>
											<li class="page-item"><a class="page-link" href="#">2</a></li>
											<li class="page-item"><a class="page-link" href="#">3</a></li>
											<li class="page-item"><a class="page-link" href="#">Next</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row m-0 border">
						<div class="card w-100 mb-0">
							<div class="card-header">
								<h3 class="card-title">상세처방 내역</h3>
							</div>
							
							<div class="card-body" style="height: 300px;">
								
								<div class="d-flex flex-row" style="font-size: 12px;">
									<div class="p-1 font-weight-bold">교부번호</div>
									<div class="p-1">2206280014</div>
									<div class="p-1 font-weight-bold">교부일자</div>
									<div class="p-1">22.06.28</div>
									<div class="p-1 font-weight-bold">발행기관</div>
									<div class="p-1">대덕병원</div>
									<div class="p-1 font-weight-bold">의사명</div>
									<div class="p-1">이정규</div>
									<div class="p-1 font-weight-bold">조제약사</div>
									<div class="p-1">이병진</div>
								</div>
								
								<table class="table table-hover table-bordered"
									style="border-top: 1px solid #dee2e6;">
									<colgroup>
										<col width="10%" />
										<col width="10%" />
										<col width="15%" />
										<col width="33%" />
										<col width="51%" />
										<col width="20%" />
										<col width="20%" />
										<col width="20%" />
									</colgroup>
									<thead class="text-center">
										<tr>
											<th><i class='fas fa-star'></i></th>
											<th>NO</th>
											<th>구분</th>
											<th>약코드</th>
											<th>약명</th>
											<th>횟수</th>
											<th>일수</th>
											<th>재고</th>
										</tr>
									</thead>
									<tbody class="text-left">
										<tr>
											<td><i class='fas fa-star'></i></td>
											<td>4</td>
											<td>전문</td>
											<td>644206400</td>
											<td>에트론가나콘정50밀리그램</td>
											<td>2</td>
											<td>30</td>
											<td>50<span class="badge badge-pill badge-danger">부족</span></td>
										</tr>
										<tr>
											<td><i class='far fa-star'></i></td>
											<td>3</td>
											<td>전문</td>
											<td>644206412</td>
											<td>건알펠로디핀정5밀리그람</td>
											<td>1</td>
											<td>30</td>
											<td>60</td>
										</tr>
										<tr>
											<td><i class='far fa-star'></i></td>
											<td>2</td>
											<td>전문</td>
											<td>644206487</td>
											<td>알파아세트아미노펜정500밀리그람_(0.5g/1정)</td>
											<td>1</td>
											<td>30</td>
											<td>60</td>
										</tr>
										<tr>
											<td><i class='far fa-star'></i></td>
											<td>1</td>
											<td>전문</td>
											<td>644206424</td>
											<td>일양노이시린에이정(규산알루민산마그네슘)_(0.5g/1정)</td>
											<td>1</td>
											<td>30</td>
											<td>60</td>
										</tr>
										
	
									</tbody>
								</table>
							</div>
							
							
						</div>
					</div>
					
					
					
					<div class="row m-0 border">
						<div class="card" style="height: 248px;">
							<div class="card-header form-inline">
								<h3 class="card-title">선택한 약 목록</h3>
								<button class="btn btn-sm btn-default mb-0 ml-2 float-right">발주하기</button>
							</div>
		
							<div class="card-body table-responsive" style="height: 400px;">
								
								<table class="table table-bordered table-head-fixed text-nowrap">
									<colgroup>
										<col width="58%"/>
										<col width="17%"/>
										<col width="22%"/>
										<col width="15%"/>
										<col width="9%"/>
									</colgroup>
									<thead class="text-center" style="font-size: 14px;">
										<tr>
											<th>약명</th>
											<th>제약사</th>
											<th>구분</th>
											<th>금액</th>
											<th></th>
										</tr>
									</thead>
									<tbody class="text-center" style="font-size: 14px;">
										<tr>
											<td class="text-left">박카스</td>
											<td class="text-left">녹십자</td>
											<td>건강기능식품</td>
											<td class="text-right">51</td>
											<td><i class="far fa-minus-square"></i></td>
										</tr>
										
										<tr>
											<td class="text-left">비타500</td>
											<td class="text-left">동아제약</td>
											<td>건강기능식품</td>
											<td class="text-right">50</td>
											<td><i class="far fa-minus-square"></i></td>
										</tr>
										<tr>
											<td class="text-left">에트론가나콘정50밀리그램</td>
											<td class="text-left">코오롱제약</td>
											<td>전문</td>
											<td class="text-right">51</td>
											<td><i class="far fa-minus-square"></i></td>
										</tr>
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
	
				</div>
			</div>

		

		</div>
	</div>
</body>

