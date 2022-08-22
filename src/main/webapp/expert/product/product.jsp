<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="productList" value="${dataMap.productList }" />
<head>
<style>
input[type="date"] {
	width: 130px;
	height: 22px;   
	/* 	font-size: em; */ 
}
table {
	table-layout: fixed;	
}	  
td { 		
	vertical-align: middle; 		
	padding:5px;		
	overflow:hidden;		
	white-space : nowrap;		
	text-overflow: ellipsis;	 
}

.table td, .table th {
	padding: 5px;
	vertical-align: top;
	border-top: 1px solid #dee2e6;
}
.table td, .pagination{
	font-size:12px;
}
.table th{ 
	font-size:14px; 
	text-align:center;  
}
 
.btn-block+.btn-block{
	margin-top:0px;
}
.btn {
	width: 110px;
}
.btn-lg{
	font-size:16px;
}
.card-body11{
	padding:0px;
}
.card-body.p-0 .table tbody>tr>td:first-of-type, .card-body.p-0 .table tbody>tr>th:first-of-type, .card-body.p-0 .table tfoot>tr>td:first-of-type, .card-body.p-0 .table tfoot>tr>th:first-of-type, .card-body.p-0 .table thead>tr>td:first-of-type, .card-body.p-0 .table thead>tr>th:first-of-type {
    padding-left:0;
}
.card-body.p-0 .table thead>tr>th:last-of-type{
	padding-right:0;
}
.tableNum{
	text-align: center;   
}
.pro_number{
    position: relative;
    top: -7px;
    right: 12px;
    padding: 0px;
    width: 11px;
    height: 11px;
    margin-right: -10px;  
}
.pro_no{
	position: absolute;
}

.table tbody>tr{
	height:30px;
}
</style>
</head>
<body>
	<div class="content-wrapper">
		<div class="row m-0">
			<div class="col-6">
				<div class="row">
					<div class="card m-0" style="width: 640px; height: 350px;">
						<div class="card-header" style="height:40px;"> 
							<input type="date" value="2022-01-01" id="startDate"> <span>~</span>
							<input type="date" value="2022-01-31" id="endDate"> <select
								id="type" name="type" style="height: 23px;">
								<option value="receive">입고장</option>
								<option value="order">발주서</option>
							</select> <input type="text" style="width: 150px; height: 22px;">
							<input type="button" value="검색"
								style="width: 50px; height: 23px;">  
						</div>
						<!-- /.card-header -->
						<div class="card-body m-0" style="padding-top: 10px;">
							<div class="searchListDiv">
							<span style="background: lightgray;">입고/발주 검색목록</span>
							</div>
							<div id="example2_wrapper"
								class="dataTables_wrapper dt-bootstrap4">
								<div class="row">
									<div class="col-sm-12 col-md-6"></div>
									<div class="col-sm-12 col-md-6"></div>
								</div>
								<div class="row">
									<div class="col-sm-12 p-0">
										<table id="example2" class="table table-bordered table-hover dataTable dtr-inline"
											aria-describedby="example2_info" style="margin-bottom: 4px;">
											<thead class="text-center">
												<tr>
													<th class="sorting sorting_asc" style="width:30px;">No</th>
													<th class="sorting">구분</th>
													<th class="sorting">제목</th>
													<th class="sorting">작성일</th>
													<th class="sorting">작성자</th>
												</tr>
											</thead>
											<tbody>
												<tr class="odd">
													<td class="tableNum">1</td>
													<td>입고장</td>
													<td>2022.07.08 입고장</td>
													<td>2022.07.08</td>
													<td>김동글</td>
												</tr>
												<tr class="even">
													<td class="tableNum">2</td>
													<td>입고장</td>
													<td>2022.07.01 입고장</td>
													<td>2022.06.24</td>
													<td>김동글</td>
												</tr>
												<tr class="odd">
													<td class="tableNum">3</td>
													<td>입고장</td>
													<td>2022.06.24 입고장</td>
													<td>2022.06.24</td>
													<td>김동글</td>
												</tr>
												<tr class="even">
													<td class="tableNum">4</td>
													<td>입고장</td>
													<td>2022.06.17 입고장</td>
													<td>2022.06.17</td>
													<td>김동글</td>
												</tr>
												<tr class="odd">
													<td class="tableNum">5</td>
													<td>입고장</td>
													<td>2022.06.10 입고장</td>
													<td>2022.06.10</td>
													<td>김동글</td>
												</tr>
												<tr class="even">
													<td class="tableNum">6</td>
													<td>입고장</td>
													<td>2022.06.03 입고장</td>
													<td>2022.06.03</td>
													<td>김동글</td>
												</tr>
												<tr class="odd">
													<td class="tableNum">7</td>
													<td>입고장</td>
													<td>2022.05.27 입고장</td>
													<td>2022.05.27</td>
													<td>김동글</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 col-md-5" style="margin-left: 160px;">
										<div class="dataTables_paginate paging_simple_numbers"
											id="example2_paginate">
											<ul class="pagination">
												<li class="paginate_button page-item previous disabled"id="example2_previous">
												<a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0" class="page-link">&lt;</a></li>
												<li class="paginate_button page-item active">
												<a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">1</a></li>
												<li class="paginate_button page-item ">
												<a href="#" aria-controls="example2" data-dt-idx="2" tabindex="0" class="page-link">2</a></li>
												<li class="paginate_button page-item ">
												<a href="#" aria-controls="example2" data-dt-idx="3" tabindex="0" class="page-link">3</a></li>
												<li class="paginate_button page-item ">
												<a href="#" aria-controls="example2" data-dt-idx="4" tabindex="0" class="page-link">4</a></li>
												<li class="paginate_button page-item ">
												<a href="#" aria-controls="example2" data-dt-idx="5" tabindex="0" class="page-link">5</a></li>
												<li class="paginate_button page-item ">
												<a href="#" aria-controls="example2" data-dt-idx="6" tabindex="0" class="page-link">6</a></li>
												<li class="paginate_button page-item next" id="example2_next">
												<a href="#" aria-controls="example2" data-dt-idx="7" tabindex="0" class="page-link">&gt;</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row" style="margin: 5px;">
							<a style="color:red;">※임시저장된 발주서가 있습니다.</a> 
					<button type="button" class="btn btn-block btn-success"  
										  style="float: right;width: 92px; margin-left: 185px; margin-right:5px;height: 30px;font-size: 14px;font-weight:bold;"
										  onclick="receive();">입고장작성</button>
					<button type="button" class="btn btn-block btn-info" 
										  style="margin-top: 0px;width: 92px;height: 30px;font-size: 14px;font-weight:bold;"
										  onclick="order();">발주서작성</button>   
				</div> 
  
				<div class="row border">
					<div class="card m-0">
						<div class="card-body" style="width: 640px; height: 500px;"> 
							<span style="background: lightgray;">입고/발주 상세내용</span>
							<div class="border" style="width: 600px; height: 450px;">
								<div class="card" style="margin-bottom:7px;">
									<div class="card-header">
										<h1 class="card-title" style="margin-left: 183px;font-size: 25px;font-weight: bold;">2022.07.08 입고장</h1>
									</div>
 
									<div class="card-body table-responsive p-0"  
										style="height: 346px;"> 
										<table class="table table-head-fixed">
											<thead class="text-center">
												<tr>
													<th style="width: 50px;">NO</th> 
													<th style="width: 37px;">분류</th> 
													<th>제조회사</th>
													<th style="width:165px;">약명</th>
													<th>제조일</th>
													<th style="width: 42px;">수량</th>
													<th style="width: 51px;">단위</th>
													<th style="width: 80px;">금액(원)</th>
												</tr>
											</thead>
											<tbody class="text-center">  
												<tr>
													<td>1</td> 
													<td>112</td>
													<td>A회사</td>
													<td class="mediName">포크랄시럽(포수클로랄)_(9.5g/95mL)</td>
													<td>2022.05.06</td>
													<td>6</td>
													<td>병</td>
													<td>1200</td>
												</tr>
												<tr>
													<td>2</td>
													<td>112</td>
													<td>B회사</td>
													<td class="mediName">독세정3밀리그램(독세핀염산염)_(3.39mg/1정)</td>
													<td>2022.05.04</td>
													<td>8</td>
													<td>정</td>
													<td>2200</td>
												</tr>
												<tr>
													<td>3</td>
													<td>112</td>
													<td>C회사</td>
													<td class="mediName">리치나잇정6밀리그램(독세핀염산염)_(6.78mg/1정)</td>
													<td>2022.05.05</td>
													<td>20</td>
													<td>정</td>
													<td>10200</td>
												</tr>
												<tr>
													<td>4</td>
													<td>112</td>
													<td>D회사</td>
													<td class="mediName">루나팜정(플루니트라제팜)_(1mg/1정)</td>
													<td>2022.05.01</td>
													<td>11</td>
													<td>정</td>
													<td>6800</td>
												</tr>
												<tr>
													<td>5</td>
													<td>112</td>
													<td>E회사</td>
													<td class="mediName">할시온정0.125밀리그램(트리아졸람)_(0.125mg/1정)</td>
													<td>2022.05.03</td>
													<td>8</td>
													<td>정</td>
													<td>6800</td>
												</tr>
												<tr>
													<td>6</td>
													<td>113</td>
													<td>F회사</td>
													<td class="mediName">테그레톨씨알정200밀리그램(카르바마제핀)_(0.2g/1정)</td>
													<td>2022.05.06</td>
													<td>10</td>
													<td>정</td>
													<td>8100</td>
												</tr>
												<tr>
													<td>7</td>
													<td>113</td>
													<td>G회사</td>
													<td class="mediName">가바텍스캡슐100밀리그램(가바펜틴)_(0.1g/1캡슐)</td>
													<td>2022.05.04</td>
													<td>6</td>
													<td>캡슐</td>
													<td>7650</td>
												</tr>
												<tr>
													<td>8</td>
													<td>113</td>
													<td>H회사</td>
													<td class="mediName">유니토파정(토피라메이트)_(0.1g/1정)</td>
													<td>2022.05.06</td>
													<td>3</td>
													<td>정</td>
													<td>800</td>
												</tr>
												<tr>
													<td>9</td>
													<td>114</td>
													<td>I회사</td>
													<td class="mediName">에이펙스정(아세클로페낙)_(0.1g/1정)</td>
													<td>2022.05.06</td>
													<td>12</td>
													<td>정</td>
													<td>4200</td>
												</tr>
												<tr>
													<td>10</td>
													<td>114</td>
													<td>J회사</td>
													<td class="mediName">이지엔6애니연질캡슐(이부프로펜)_(0.2g/1캡슐)</td>
													<td>2022.05.03</td>
													<td>8</td>
													<td>캡슐</td>
													<td>4300</td>
												</tr>
												<tr>
													<td>11</td>
													<td>218</td>
													<td>K회사</td>
													<td class="mediName">삼성로수바스타틴정20밀리그램(로수바스타틴칼슘)_(20.8mg/1정)</td>
													<td>2022.05.04</td>
													<td>2</td>
													<td>정</td>
													<td>1200</td>
												</tr>
												<tr>
													<td>12</td>
													<td>222</td>
													<td>L회사</td>
													<td class="mediName">에르도캡슐300밀리그램(에르도스테인)_(0.3g/1캡슐)</td>
													<td>2022.05.02</td>
													<td>4</td>
													<td>캡슐</td>
													<td>3200</td>
												</tr>
												<tr>
													<td>13</td>
													<td>396</td>
													<td>M회사</td>
													<td class="mediName">피오스크정15밀리그램(피오글리타존염산염)_(16.53mg/1정)</td>
													<td>2022.05.05</td>
													<td>9</td>
													<td>정</td>
													<td>2800</td>
												</tr>
												<tr>
													<td>14</td>
													<td>618</td>
													<td>N회사</td>
													<td class="mediName">미래세파드록실캡슐(수출명: MERIXIL CAP.)_(0.5g/1캡슐)</td>
													<td>2022.05.06</td>
													<td>30</td>
													<td>캡슐</td>
													<td>13500</td>
												</tr>
												<tr>
													<td>15</td>
													<td>629</td>
													<td>O회사</td>
													<td class="mediName">조이록신정400밀리그램(목시플록사신염산염)_(0.4368g/1정)</td>
													<td>2022.04.28</td>
													<td>11</td>
													<td>정</td>
													<td>6800</td>
												</tr>
												<tr>
													<td>16</td>
													<td>112</td>
													<td>P회사</td>
													<td class="mediName">나카인주사(로피바카인염산염수화물)_(0.158g/20mL)</td>
													<td>2022.05.06</td>
													<td>10</td>
													<td>앰플</td>
													<td>104000</td>
												</tr>
												<tr>
													<td>17</td>
													<td>112</td>
													<td>Q회사</td>
													<td class="mediName">플렌뷰산_(1000mL)</td>
													<td>2022.05.03</td>
													<td>6</td>
													<td>통</td>
													<td>74000</td>
												</tr>
												<tr>
													<td>18</td>
													<td>721</td>
													<td>R회사</td>
													<td class="mediName">하프렙산_(2000mL)</td>
													<td>2022.05.03</td>
													<td>5</td>
													<td>통</td>
													<td>47000</td>
												</tr>
												<tr>
													<td>19</td>
													<td>641</td>
													<td>S회사</td>
													<td class="mediName">알나졸정400밀리그람(알벤다졸)_(0.4g/1정)</td>
													<td>2022.04.28</td>
													<td>10</td>
													<td>정</td>
													<td>5400</td>
												</tr>
											</tbody>
										</table>
									</div>

								</div>
								<div class="priceSum" style="width: 300px; height: 32px; float: left;
								                           text-align: center;font-size: 24px; font-weight: bold;"> 
									<a>입고 합계 금액 : 310,150원</a>
								</div>
								<div class="buttons" style="width: 291px; height: 50px; float: right;">
								<button type="button" class="btn btn-block btn-dark"
								        style="margin-left: 9px; float: left; width: 87px; height: 32px; font-weight: bold;" onclick="qrPage();">QR출력</button>
								<button type="button" class="btn btn-block btn-primary"
									style="float: left; margin-left: 5px; margin-right: 5px; width: 87px; height: 32px;  font-weight: bold;" onclick="receive();">수정하기</button> 
								<button type="button" class="btn btn-block btn-danger"
									style="float: left; width: 87px; height: 32px;  font-weight: bold;" onclick="deleteDocument();">삭제하기</button>   
								</div> 
							</div>
						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->
				</div>
				<!-- /.card-body -->
			</div>
			<div class="col-6">
				<div class="card m-0">
					<div class="card-header" style="height: 95px;">
						<h2 style="text-align: center; font-weight: bold;">-똥글똥글약국 재고현황-</h2>
						<button type="button" class="btn btn-block btn-danger btn-sm"
							style="font-weight: bold;float: left;">부족품신청</button>
						<select id="type" name="type"
							style="height: 23px; margin-left: 75px;">
							<option value="all">전체</option>
							<option value="ETC">전문</option>
							<option value="OTC">일반</option>
						</select> 
						<input list="classification-code" id="ice-cream-choice"
							name="ice-cream-choice" placeholder="분류코드입력"
							style="width: 122px; height: 24px;">
						<datalist id="classification-code">
							<option value="100">신경계 감각기관용 의약품</option>
							<option value="110">중추신경계용 약</option>
							<option value="111">전신마취제</option>
							<option value="112">최면진정제</option>
							<option value="113">항전간제</option>
							<option value="114">해열,진통,소염제</option>
							<option value="115">각성제,흥분제</option>
							<option value="116">진훈제</option>
							<option value="117">정신신경용제</option>
							<option value="119">기타의 중추신경용 약</option>
							<option value="120">말초신경계용 약</option>
							<option value="121">국소마취제</option>
							<option value="122">골격근이완제</option>
						</datalist>
						<input type="text" style="width: 150px; height: 24px;"> <input
							type="button" value="검색" style="width: 48px; height: 24px;">  
					</div>
					<!-- /.card-header -->
					<div class="card-body11" style="height: 796px;"> 
						<div class="card">					
							<div class="card-body p-0" style="width:606px; height:796x;"> 
								<div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4" style="width:626px;">
									<div class="row">
										<div class="col-sm-12">
											<table id="example2" class="table table-bordered table-hover dataTable dtr-inline"
												style="height:747px; display: table-header-group;">
												<thead> 
													<tr>
														<th style="width:67px;">약코드</th>
														<th style="width:38px;">구분</th>
														<th style="width:40px;">분류</th>
													   <th style="width:209px;">약명</th>
														<th style="width:38px;">수량</th>
														<th style="width:38px;">단위</th>
														<th style="width:64px;">적정재고</th>
														<th style="width:77px;">유통기한</th>
														<th style="width:48px;">약위치</th>
													</tr>
												</thead>
												<tbody>
											<c:forEach items="${productList }" var="product">
												<tr id="ProductList" style="text-align:center;">
													<td id="productNo">${product.md_no }</td>
													<td id="productClass">${product.md_class }</td>
													<td id="productType">${product.md_type }</td>
													<td id="productName">${product.md_name }
													<td id="productNum">${product.product_ownnum }</td>
													<td id="productUnit">${product.product_unit }</td>
													<td id="productSnum">${product.product_ownnum_standard }</td>
													<td id="productDate"><fmt:formatDate value="${product.product_date }" pattern="yyyy-MM-dd"/></td>
													<td id="productPos">${product.product_position }</td>
												</tr>
											</c:forEach>
											
												</tbody> 
											</table>  
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12 col-md-5">						 				
										<div class="col-sm-12 col-md-7">
											<div class="dataTables_paginate paging_simple_numbers"id="example2_paginate"
											     style="margin-left: 160px;">
												<ul class="pagination">
													<li class="paginate_button page-item previous disabled" id="example2_previous">
													<a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0" class="page-link">&lt;</a></li> 
													<li class="paginate_button page-item active">
													<a href="#" aria-controls="example2" data-dt-idx="1"tabindex="0" class="page-link">1</a></li>
													<li class="paginate_button page-item ">
													<a href="#"aria-controls="example2" data-dt-idx="2" tabindex="0" class="page-link">2</a></li>
													<li class="paginate_button page-item ">
													<a href="#"aria-controls="example2" data-dt-idx="3" tabindex="0" class="page-link">3</a></li>
													<li class="paginate_button page-item ">
													<a href="#" aria-controls="example2" data-dt-idx="4" tabindex="0" class="page-link">4</a></li>
													<li class="paginate_button page-item ">
													<a href="#" aria-controls="example2" data-dt-idx="5" tabindex="0" class="page-link">5</a></li>
													<li class="paginate_button page-item ">
													<a href="#" aria-controls="example2" data-dt-idx="6" tabindex="0" class="page-link">6</a></li>
													<li class="paginate_button page-item next"id="example2_next">
													<a href="#" aria-controls="example2" data-dt-idx="7" tabindex="0" class="page-link">&gt;</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>

					</div>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->
			</div>
		</div>
	</div>
	</div>
	<script>
	function order(){
		if(confirm("임시저장한 발주서가 존재합니다.\n 불러오시겠습니까?") == true){
			window.open('./order/order.jsp','window_name','width=850,height=950,left=600,top=600,location=no,status=no,scrollbars=yes,resizable=no');
		}else{
			window.open('./order/order2.jsp','window_name','width=850,height=950,left=600,top=600,location=no,status=no,scrollbars=yes,resizable=no');
		}
	}
	
	function receive(){
		window.open('./receive/receive.jsp','window_name','width=850,height=900,left=600,top=600,location=no,status=no,scrollbars=yes,resizable=no');
	}
	
	function deleteDocument(){
		confirm("해당 문서를 삭제하시겠습니까?");
	}
	
	function qrPage(){ 
		window.open('./receive/printQR.jsp','window_name','width=1000,height=850,left=600,top=600,location=no,status=no,scrollbars=yes,resizable=no');
		
	}
	</script>
</body>







