<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="receiveOrderList" value="${receiveOrder.receiveOrderList }" />
<c:set var="pageMaker" value="${receiveOrder.pageMaker }" />
<c:set var="cri" value="${receiveOrder.pageMaker.cri }" />

<head>
<style>
input[type="date"] {
	width: 110px;
	height: 30px;
	font-size:14px;
}

input, select {
	border: 1px solid #ced4da;
}

table {
	table-layout: fixed;
}

td {
	  vertical-align: middle;
	  padding: 5px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.table td, .table th {
	padding: 5px;
	vertical-align: top;
	border-top: 1px solid #dee2e6;
}

.table td, .pagination {
	font-size: 12px;
}

.table th {
	font-size: 14px;
	text-align: center;
}

.btn-block+.btn-block {
	margin-top: 0px;
}

.btn {
	width: 110px;
	padding: 6px;
	padding-top: 5px;
}

.btn-lg {
	font-size: 16px;
}

.card-body11 {
	padding: 0px;
}

.card-body.p-0 .table tbody>tr>td:first-of-type, .card-body.p-0 .table tbody>tr>th:first-of-type,
	.card-body.p-0 .table tfoot>tr>td:first-of-type, .card-body.p-0 .table tfoot>tr>th:first-of-type,
	.card-body.p-0 .table thead>tr>td:first-of-type, .card-body.p-0 .table thead>tr>th:first-of-type
	{
	padding-left: 0;
}

.card-body.p-0 .table thead>tr>th:last-of-type {
	padding-right: 0;
}

.tableNum {
	text-align: center;
}

.pro_number {
	position: relative;
	top: -7px;
	right: 12px;
	padding: 0px;
	width: 11px;
	height: 11px;
	margin-right: -10px;
}

.pro_no {
	position: absolute;
}

.proListTr:hover {
	cursor: pointer;
	background-color: #efefef !important;
}

.header-title {
	font-size: 17px;
	font-weight: bold;
}
</style>
</head>
<div class="card card-primary card-outline" style="margin-bottom: 7px;">
	<div class="card-header">
		<span class="card-title m-0 title"> <i
			class="far fa-edit icon-size" style="font-size: 18px;"></i> <span
			class="header-title" style="font-weight: bold;">입고/발주 검색목록</span>
		</span>
	</div>
	<div class="card-body" style="padding-top: 10px; padding-bottom: 10px;">
		<div class="row">
			<input type="date" id="startDate" name="startDate" value="${cri.startDate}">
				<span style="margin: 4px;">~</span>
			<input type="date" id="endDate" name="endDate" value="${cri.endDate }">
				<select id="searchType" name="searchType" style="height: 30px; margin-left: 3px;">
				<option value="receive" ${cri.searchType eq "receive" ? "selected":"" }>입고장</option>
				<option value="order" ${cri.searchType eq "order" ? "selected":"" }>발주서</option>
			</select>
			<div class="input-group input-group-lg" style="width: 225px;">
				<input type="search" class="form-control form-control-lg"
					name="keyword" placeholder="검색어를 입력해주세요"
					style="height: 30px; font-size: 16px; margin-left: 3px; padding: 5px;"
					value="${cri.keyword }">
				<div class="input-group-append" style="width: 0px;">
					<button type="submit" class="btn btn-lg btn-default"
						style="height: 30px; font-size: 16px; padding: 0px 10px;"
						onclick="list_go(1,'receiveOrder');">
						<i class="fa fa-search" aria-hidden="true"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
	<div class="card-body" style="padding-top: 0px;">
		<div class="card-body table-responsive p-0" style="height: 290px;">
			<table class="table table-bordered table-hover dataTable dtr-inline">
				<thead class="text-center">
					<tr style="background-color:#E8F5FF;">
						<th class="sorting sorting_asc" style="width: 30px;">No</th>
						<th class="sorting">구분</th>
<!-- 						<th class="sorting">제목</th> -->
						<th class="sorting">작성일</th>
						<th class="sorting">작성자</th>
					</tr>
				</thead>
				<tbody style="text-align: center;">
					<c:if test="${empty receiveOrderList }">
						<tr>
							<td colspan="4" style="text-align: center;">
							<strong>날짜를 선택해주세요!</strong></td>
						</tr>
					</c:if>
					<c:forEach items="${receiveOrderList }" var="receiveOrder" varStatus="status">
						<tr class="proListTr"
							onclick="receiveOrderDetail(${cri.searchType eq 'receive' ? receiveOrder.receiveNo : receiveOrder.orderNo })">
						<td class="tableNum">${status.index + 1}</td>
							<td>${cri.searchType eq 'receive' ? '입고장' : '발주서' }</td>
							<td><fmt:formatDate
									value="${cri.searchType eq 'receive' ?  receiveOrder.receiveDate : receiveOrder.orderDate}"
									pattern="yyyy.MM.dd" /></td>
							<td>${cri.searchType eq 'receive' ?  receiveOrder.receiveWriter : receiveOrder.orderWriter}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div class="row" style="margin: 5px; max-height:40px; ">
	<div class="col-sm-8">
		<a style="color: red; font-size: 14px; font-weight: bold;">
			<c:if test="${!empty RDemoCartList}">
				※임시저장된
			</c:if>
			<c:if test="${!empty RDemoCartList}">
				입고장
			</c:if>
			<c:if test="${!empty RDemoCartList}">
				이(가) 있습니다.
				<i class="far fa-minus-square curserIcon" style="color:#007bff;" onclick="deleteRDemo()"></i>
			</c:if>
		</a>
		<a style="color: red; font-size: 14px; font-weight: bold;">
			<c:if test="${!empty RDemoCartList}">
				<br>
			</c:if>
			<c:if test="${!empty ODemoCartList}">
				※임시저장된
			</c:if>
			<c:if test="${!empty ODemoCartList}">
				발주서
			</c:if>
			<c:if test="${!empty ODemoCartList}">
				이(가) 있습니다.
				<i class="far fa-minus-square curserIcon" style="color:#007bff;" onclick="deleteODemo()"></i>
			</c:if>
		</a>
	</div>
	<div class="col-sm-4" style="display: flex; align-items: center;">
		<button type="button" class="btn btn-block btn-primary" id="${RDemoCartList[0].receiveNo}"
			style="width: 92px; margin-right: 5px; height: 30px; font-size: 14px; font-weight: bold;"
			onclick="receiveWrite(this);">입고장작성</button>
		<button type="button" class="btn btn-block btn-primary" id="${ODemoCartList[0].orderNo }"
			style="margin-top: 0px; width: 92px; height: 30px; font-size: 14px; font-weight: bold;"
			onclick="orderWrite(this);">발주서작성</button>
	</div>
</div>

<div class="row border m-0">
	<div class="card card-primary card-outline" style="margin: 0px;">
		<div class="card-header">
			<div class="row">
				<div class="col-sm-6">
					<span class="card-title m-0 title"> <i class="fa fa-search"
						style="font-size: 18px;" aria-hidden="true"></i> <span
						class="header-title">입고/발주 상세내용</span>
					</span>
				</div>
				<div class="col-sm-6" style="display:flex; padding-right: 0px !important;">
					<c:choose>
						<c:when test="${cri.searchType eq 'receive'}">
							<button type="button" class="btn btn-block btn-secondary"
								style="margin-left: 33px; width: 80px; height: 32px; font-weight: bold; font-size:14px;"
								onclick="printQR();" >QR출력</button>
							<button type="button" class="btn btn-block btn-primary"
								style="margin-left: 5px; margin-right: 5px; width: 80px; height: 32px; font-weight: bold; font-size:14px;"
								onclick="receiveDetail();">수정</button>
							<button type="button" class="btn btn-block btn-danger"
								style="width: 80px; height: 32px; font-weight: bold; font-size:14px;"
								onclick="deleteReceive();">삭제</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-block btn-primary"
								style="margin-left: 118px; margin-right: 5px; width: 80px; height: 32px; font-weight: bold; font-size:14px;"
								onclick="orderDetail();">수정</button>
							<button type="button" class="btn btn-block btn-danger"
								style="width: 80px; height: 32px; font-weight: bold; font-size:14px;"
								onclick="deleteOrder();">삭제</button>
						</c:otherwise>
					</c:choose>		
				</div>
			</div>
		</div>
		<div class="card-body table-responsive p-0" style="height: 300px;">
			<table class="table table-head-fixed">
				<thead class="text-center">
					<c:choose>
						<c:when test="${cri.searchType eq 'receive' }">
							<tr style="background-color:#E8F5FF;">
								<th style="width: 30px;">NO</th>
								<th style="width: 37px;">분류</th>
								<th>제조회사</th>
								<th style="width: 165px;">약명</th>
								<th>제조일</th>
								<th style="width: 42px;">수량</th>
								<th style="width: 51px;">단위</th>
								<th style="width: 80px;">금액(원)</th>
							</tr>
						</c:when>
						<c:otherwise>
							<tr style="background-color:#E8F5FF;">
								<th style="width: 39px;">NO</th>
								<th style="width: 37px;">분류</th>
								<th>제조회사</th>
								<th style="width: 215px;">약명</th>
								<th style="width: 42px;">수량</th>
								<th style="width: 51px;">단위</th>
								<th style="width: 80px;">금액(원)</th>
							</tr>
						</c:otherwise>
					</c:choose>	
				</thead>
				<tbody class="receiveOrderCartList">

				</tbody>
			</table>
		</div>
		<div class="card-footer" style="height: 42px; float: left; font-size: 18px; font-weight: bold;">
			<div class="row" id="receiveOrderCartResult">
				<div class="col-sm-6" style="float: right; display: flex;" id="receiveOrderCartResDate">
					<span></span>
				</div>
				<div class="col-sm-6" id="receiveOrderCartResPrice">
					<span style="float:right;"></span>
				</div>
			</div>
		</div>
	</div>
</div>
<div>
	<input type="hidden" id="sessionChemistCode" value="${loginUser.chemistCode }">
	<input type="hidden" id="sessionChemistName" value="${loginUser.memName }">
	<input type="hidden" id="sessionPharmacyCode" value="${loginUser.pharmacyCode }">
	<input type="hidden" id="sessionPharmacyName" value="${loginUser.pharmacyName }">
</div>


<%@ include file="./product_js.jsp"%>
<%@ include file="/WEB-INF/views/common/receiveOrderPagination.jsp"%>

<script>
	function ownListReload(){
		console.log(window.parent.document.getElementById("ownList"));

		window.parent.document.getElementById("ownList").setAttribute("src", "ownList");
	}
	
	function receiveWrite(from){
		console.log(from.getAttribute('id'));
		var a = from.getAttribute('id');
		if(a != ''){
			 if (confirm("임시저장한 입고장이 있습니다. 불러오시겠습니까?")){ // "예"가 선택될 경우 입고장을 불러온다
				window.open('receiveDemoCartList.do','입고장 작성','width=748,height=950,left=600,top=600,location=no,status=no,scrollbars=yes');
			 }else{
			 	window.open('receiveWrite.do','입고장 작성','width=748,height=950,left=600,top=600,location=no,status=no,scrollbars=yes');
			 }
		}else{
			window.open('receiveWrite.do','입고장 작성','width=748,height=950,left=600,top=600,location=no,status=no,scrollbars=yes');
		}
	}
	
	function orderWrite(from){
		console.log(from.getAttribute('id'));
		var a = from.getAttribute('id');
		if(a != ''){
			 if (confirm("임시저장한 발주서가 있습니다. 불러오시겠습니까?")){ // "예"가 선택될 경우 입고장을 불러온다
				window.open('orderDemoCartList.do','발주서 작성','width=748,height=950,left=600,top=600,location=no,status=no,scrollbars=yes');
			 }else{
				 window.open('orderWrite.do','발주서 작성','width=748,height=950,left=600,top=600,location=no,status=no,scrollbars=yes');
			 }
		}else{
			window.open('orderWrite.do','발주서 작성','width=748,height=950,left=600,top=600,location=no,status=no,scrollbars=yes');
		}
	}
	
	function receiveDetail(){
		var receiveNo = $(".receiveNo").val();
		window.open('receiveDetail.do?receiveNo=' + receiveNo ,'입고장 수정','width=748,height=950,left=600,top=600,location=no,status=no,scrollbars=yes');
	}
	
	function orderDetail(){
		var orderNo = $(".orderNo").val();
		window.open('orderDetail.do?orderNo=' + orderNo ,'발주서 수정','width=748,height=950,left=600,top=600,location=no,status=no,scrollbars=yes');
	}
	
	function printQR(){
		var receiveNo = $(".receiveNo").val();
		window.open('printQR.do?receiveNo=' + receiveNo, 'QR태그 생성','width=850,height=900,left=600,top=600,location=no,status=no,scrollbars=yes');
	} 
	
	function deleteRDemo(){
		if(confirm('임시저장된 입고장을 삭제하시겠습니까?')){
			$.ajax({
				url:"deleteReceiveDemo.do",
				success:function(res){
					window.location.reload();
				},
				error:function(){
					alert("임시저장 삭제 오류...");
				}
			});
		}else{
			alert("삭제가 취소되었습니다.")
			return;
		}
	}
	
	function deleteODemo(){
		if(confirm('임시저장된 발주서를 삭제하시겠습니까?')){
			$.ajax({
				url:"deleteOrderDemo.do",
				success:function(res){
					window.location.reload();
				},
				error:function(){
					alert("임시저장 삭제 오류...");
				}
			});
		}else{
			alert("삭제가 취소되었습니다.")
			return;
		}
	}
	
	function receiveOrderDetail(no){
			var sum = 0;
		var type = $('#searchType').val();
// 		console.log("no",no);
		$.ajax({
			url:"receiveOrderDetail.do",
			data:{"no":no,
				  "type":type	
			},
			type:"post",
			success:function(res){
				if(type =='receive'){
					console.log(res.length);
					for(var i = 0; i < res.length; i++){
						sum += res[i].receiveCartNum * res[i].receiveCartPrice;
					}
					console.log(res);
					document.getElementById('receiveOrderCartResDate').childNodes[1].innerText = prettyDate(res[0].receiveDate) + " 입고장" ;
					document.getElementById('receiveOrderCartResPrice').childNodes[1].innerText = "합계금액 : " + sum.toLocaleString('ko-KR') + "원";
				
					printReceiveOrderCart(res, $('.receiveOrderCartList'),$('#receiveCart-list-template'))
				}else{
					for(var i = 0; i < res.length; i++){
						sum += res[i].orderCartNum * res[i].orderCartPrice;
					}
					console.log(res);
					document.getElementById('receiveOrderCartResDate').childNodes[1].innerText = prettyDate(res[0].orderDate) + " 발주서" ;
					document.getElementById('receiveOrderCartResPrice').childNodes[1].innerText = "합계금액 : " + sum.toLocaleString('ko-KR') + "원";
				
					printReceiveOrderCart(res, $('.receiveOrderCartList'),$('#orderCart-list-template'))
				}
			},
			error:function(){
				alert("오류에유..");
			}
		});
	}
	
	function deleteReceive(){
		var no = $('.receiveOrderCart').attr('id');
		console.log(no);
		if (!confirm("해당 입고장을 삭제 하시겠습니까?")){ // "예"가 선택될 경우 입고장을 삭제한다
			return false;       
		}
		$.ajax({
			url:"receiveDelete.do",
			data: {"no" : no} ,
			type:'post',
			success:function(res){
				alert("삭제되었습니다.")
				window.location.reload();
				ownListReload();
			},
			error:function(){
				alert("삭제 실패했습니다.")
			}
		});		
	}
	
	function deleteOrder(){
		var no = $('.receiveOrderCart').attr('id');
		console.log(no);
		if (!confirm("해당 발주서를 삭제 하시겠습니까?")){ // "예"가 선택될 경우 발주서를 삭제한다
			return false;       
		}
		$.ajax({
			url:"orderDelete.do",
			data: {"no" : no} ,
			type:'post',
			success:function(res){
				alert("삭제되었습니다.")
				window.location.reload();
				ownListReload();
			},
			error:function(){
				alert("삭제 실패했습니다.")
			}
		});		
	}
	
	
	function prettyDate(timeValue){ //Handlbars에 날짜출력함수 등록
		if(timeValue == null){
			return "-";
		}
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		var date=dateObj.getDate();
		return year+"."+month+"."+date;
	}
	
	
	function printReceiveOrderCart(receiveOrderCart, target, templateObject) {
	   var template = Handlebars.compile(templateObject.html());
	   var html = template(receiveOrderCart);
	   if(template != templateObject){
	   $('.receiveOrderCart').remove();
	   }
	   target.append(html);
	}
	
	function printReceiveOrderCartRes(receiveOrderCart, target, templateObject) {
		   var template = Handlebars.compile(templateObject.html());
		   var html = template(receiveOrderCart);
		   if(template != templateObject){
		   $('#receiveOrderCartResPrice').remove();
		   $('#receiveOrderCartResDate').remove();
		   }
		   target.append(html);
		}
	
</script>

<script type="text/x-handlebars-template"  id="receiveCart-list-template">
	{{#each .}}
		<tr class="receiveOrderCart" id="{{receiveNo}}">
			<td style="text-align:right;">{{inc @index}}</td> 
			<td>{{miType}}</td>
			<td>{{miCompany}}</td>
			<td class="mediName" data-toggle="tooltip" title={{mdName}}>{{mdName}}</td>
			<td>{{prettifyDate receiveShelfLife}}</td>
			<td>{{receiveCartNum}}</td>
			<td>{{miUnit}}</td>
			<td>{{sum receiveCartNum receiveCartPrice}}</td>
			<input type="hidden" class="receiveNo" value="{{receiveNo}}" />
		</tr>
	{{/each}}
</script>


<script type="text/x-handlebars-template"  id="orderCart-list-template">
	{{#each .}}
		<tr class="receiveOrderCart" id="{{orderNo}}">
			<td style="text-align:right;">{{inc @index}}</td> 
			<td>{{miType}}</td>
			<td style="text-align:center;" data-toggle="tooltip" title={{miCompany}}>{{miCompany}}</td>
			<td class="mediName" data-toggle="tooltip" title={{mdName}}>{{mdName}}</td>
			<td style="text-align:center;">{{orderCartNum}}</td>
			<td style="text-align:center;">{{miUnit}}</td>
			<td style="text-align:right;">{{sum orderCartNum orderCartPrice}}</td>
			<input type="hidden" class="orderNo" value="{{orderNo}}" />
		</tr>
	{{/each}}
</script>














