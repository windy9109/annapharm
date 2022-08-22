<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="test" value="50"/>
<head>
<style type="text/css">
.hover:hover{
	background-color: #efefef;
	cursor: pointer;
}

.table td, .table th {
	padding: 5px;
	vertical-align: top;
	border-top: 1px solid #dee2e6;
	font-size: 12px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.table th {
	align-content: center;
}

.card-body {
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	min-height: 1px;
	padding: 0.5rem;
	padding-top: 0px;
}

.card-header {
	margin-bottom: 0.5rem;
}

ul {
	margin-bottom: 0;
}

table {
	table-layout: fixed;
}

.card-footer {
	padding: 0.5rem 1.25rem;
	background-color: rgba(0, 0, 0, .03);
	border-top: 0solidrgba(0, 0, 0, .125);
}
i:hover{
	cursor: pointer;
}
.card-title{
	font-size: 17px;
	font-weight: bold;
}

.btn{
	font-weight: bold;
}
.icon-size{
	font-size: 18px;
}
</style>
</head>

<title>제약사별 매입가 비교</title>

<body>
	<div class="content-wrapper">
		<div class="row m-0">
			<div class="col-lg-12">
				<div class="card card-outline"></div>
			</div>
			<div class="col-lg-6" style="height: 875px;">
				<div class="row-6 m-0">
					<div class="card card-primary card-outline" style="height: 424px;">
						<div class="card-header">
							<div class="form-inline justify-content-between">
								<div class="form-inline">
									<i class="fas fa-capsules icon-size"></i>
									<h3 class="card-title">약명 검색</h3>
								</div>
								<div class="input-group">
									<input list="nameKeywordList" id="nameKeyword" autocomplete="off" name="keyword" onkeydown="enterCheckName();" placeholder="검색어를 입력해주세요" style="height: 30px; font-size: 16px; padding: 0px 10px;" class="form-control form-control-sm" />
	 								<div class="input-group-append">
										<button onclick="getSearchMedicinePage('<%=request.getContextPath()%>/expert/business/compare/mdsearch/',1,'no');" class="btn btn-sm btn-primary" style="padding-bottom: 0px;"><i aria-hidden="true" class="fa fa-search"></i></button>
	 								</div>
	 								<div class="todo-inner nameSearch" style="display:none; position: absolute;background-color: white;top: 29px;left: 0px;width: 204px;border: 1px solid #ced4da;">
							            <div id="nameSearchRecord">
							            </div>
							            <p class="txt"></p>
							            <ul id="todo-list"></ul>
							        </div>
								</div>
							</div>
						</div>

<!-- 							<div class="form-inline"> -->
<!-- 								<h5 class="card-title"> -->
<!-- 										<i class="far fa-edit" style="font-size:20px" aria-hidden="true"></i> 처방 상세 내역</h5> -->
								

<!-- 								<input id="nameKeyword" name="keyword" class="form-control form-control-sm col-3 mr-2" -->
<!-- 										style="display: inline;" /> -->
<%-- 									<button class="btn btn-sm btn-default" onclick="getSearchMedicinePage('<%=request.getContextPath()%>/expert/business/compare/mdsearch/',1);">검색하기</button> --%>
								
<!-- 							</div> -->
						<div class="card-body" style="height: 353px;">
							<table class="table table-hover table-bordered"
								style="border-top: 1px solid #dee2e6;">
								<colgroup>
									<col width="45%" />
									<col width="29%" />
									<col width="10%" />
									<col width="16%" />
									<col width="20%" />
								</colgroup>
								<thead class="text-center">
									<tr style="background-color: #E8F5FF;">
										<th>약명</th>
										<th>성분명</th>
										<th>구분</th>
										<th>함량/단위</th>
										<th>주성분코드</th>
									</tr>
								</thead>
								<tbody id="searchMedicineList" class="text-left">
									
								</tbody>
							</table>

						</div>
						<div id="test3561" class="card-footer" style="height: 47px;">
						
						</div>

					</div>
				</div>

				<div class="row-6 m-0">
					<div class="card card-primary card-outline" style="height: 424px;">
						<div class="card-header">
							<div class="form-inline justify-content-between">
								<div class="form-inline">
									<i class="fas fa-flask icon-size"></i>
									<h3 class="card-title">주성분 검색</h3>
								</div>
								<div class="input-group">
									<input id="basisKeyword" onkeydown="enterCheckBasis();" autocomplete="off" placeholder="검색어를 입력해주세요" style="height: 30px; font-size: 16px; padding: 0px 10px;" name="keyword" class="form-control form-control-sm" />
	 								<div class="input-group-append">
										<button onclick="getSearchBasisPage('<%=request.getContextPath()%>/expert/business/compare/basearch/',1,'no');" class="btn btn-sm btn-primary" style="padding-bottom: 0px;"><i class="fa fa-search"></i></button>
	 								</div>
	 								<div class="todo-inner basisSearch" style="display:none; position: absolute;background-color: white;top: 29px;left: 0px;width: 204px;border: 1px solid #ced4da;">
							            <div id="basisSearchRecord">
							            </div>
							            <p class="txt"></p>
							            <ul id="todo-list"></ul>
							        </div>
								</div>
							</div>
						</div>

						<div class="card-body table-responsive" >
				
							<table class="table table-hover table-bordered text-nowrap"
								style="border-top: 1px solid #dee2e6;">
								<colgroup>
									<col width="10%" />
									<col width="40%" />
									<col width="20%" />
									<col width="15%" />
									<col width="15%" />
								</colgroup>
								<thead class="text-center">
									<tr style="background-color: #E8F5FF;">
										<th>분류</th>
										<th>성분명</th>
										<th>주성분코드</th>
										<th>함량/단위</th>
										<th>투여방법</th>
									</tr>
								</thead>
								<tbody id="searchBasisList" class="text-left">
									
								</tbody>
							</table>
						</div>
						<div id="basis3561" class="card-footer" style="height: 47px;">
							
						</div>

					</div>
				</div>

			</div>

			<div class="col-lg-6" style="height: 875px;">
				<div class="card card-primary card-outline" style="height: 564px;">
					<div class="card-header">
						<div class="form-inline justify-content-between">
							<div class="form-inline">
								<i class="fas fa-chart-line icon-size"></i>
								<h3 class="card-title">제조사별 매입가 비교</h3>
							</div>
							<div class="input-group">
								<button onclick="javascript:doCompare()" class="btn btn-sm btn-primary mb-0 ml-2 float-right">비교</button>
							</div>
						</div>
					</div>

					<div class="card-body table-responsive">
						
						<table class="table table-bordered table-head-fixed text-nowrap">
							<colgroup>
								<col width="9%" />
								<col width="53%" />
								<col width="27%" />
								<col width="12%" />
								<col width="20%" />
								<col width="9%" />
							</colgroup>
							<thead class="text-center" style="font-size: 14px;">
								<tr style="background-color: #E8F5FF;">
									<th style="background-color: #E8F5FF;">추가</th>
									<th style="background-color: #E8F5FF;">약명</th>
									<th style="background-color: #E8F5FF;">제약사</th>
									<th style="background-color: #E8F5FF;">구분</th>
									<th style="background-color: #E8F5FF;">금액(원)</th>
									<th style="background-color: #E8F5FF;"></th>
									<th style="background-color: #E8F5FF;">box</th>
								</tr>
							</thead>
							<tbody id="compareList" class="text-center" style="font-size: 14px;">
								

							</tbody>
						</table>
					</div>
					<div id="compareFooter" class="card-footer searchMedicine" style="height: 47px;padding-top: 13px;">
						<span>매입가 평균 : <span id="avgPrice">0</span>원</span>
					</div>



				</div>
				
				<div class="card card-primary card-outline" style="height: 283px;">
					<div class="card-header">
						<div class="form-inline justify-content-between">
							<div class="form-inline">
								<i class="fas fa-star icon-size"></i>
								<h3 class="card-title">선택한 약 목록</h3>
							</div>
							<div class="input-group">
								<button class="btn btn-sm btn-primary" onclick="window.open('<%= request.getContextPath()%>/expert/business/goOrder.do?chemistCode=${loginUser.chemistCode}','발주서 작성','width=748,height=950,left=600,top=600,location=no,status=no,scrollbars=yes');">발주</button>
							</div>
						</div>
					</div>

					<div class="card-body table-responsive">
						
						<table class="table table-bordered table-head-fixed text-nowrap">
							<colgroup>
								<col width="9%"/>
								<col width="58%"/>
								<col width="17%"/>
								<col width="12%"/>
								<col width="25%"/>
							</colgroup>
							<thead class="text-center" style="font-size: 14px;">
								<tr>
									<th style="background-color: #E8F5FF;">삭제</th>
									<th style="background-color: #E8F5FF;">약명</th>
									<th style="background-color: #E8F5FF;">제약사</th>
									<th style="background-color: #E8F5FF;">구분</th>
									<th style="background-color: #E8F5FF;">금액(원)</th>
									<th style="background-color: #E8F5FF;"></th>
								</tr>
							</thead>
							<tbody id="selectList" class="text-center" style="font-size: 14px;">
								
							</tbody>
						</table>
					</div>



				</div>


			</div>

		</div>
	</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>	

</body>