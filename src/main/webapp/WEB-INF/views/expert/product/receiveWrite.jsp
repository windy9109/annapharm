<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date today = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
%>
<c:set var="classficationList" value="${dataMap.classficationList}" />
<c:set var="receiveCartList" value="${receiveCartList}" />

<!-- 의사 : 약 추가하는 창 -->


<html>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">

<meta name='viewport' content='width=device-width, initial-scale=1'>

<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>



<head>
<meta charset="UTF-8">
<title>약 추가 페이지</title>
<style>
body, .selectBox, .searchBox {
	font-size: 12px;
}
input[type="date"],[type="text"] {
	font-size: 12px !important;
}
.selectBox {
	width: auto;
	margin-left: 6px;
}

.searchBox {

}

/*~~~ 버튼 스타일 ~~~*/
/* 버튼눌렀을때 */
a, a:visited {
	text-decoration: none;
	color: #00AE68;
}

a.button {
	display: block;
	position: relative;
	float: left;
	width: 55px;
	height: 40px;
	padding: 5px;
	margin: 0px 1px 0px 5px;
	font-weight: 600;
	text-align: center;
	line-height: 30px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
}

.btnBlueGreen {
	background: #1E82FF;
}

.btnFade.btnBlueGreen:hover {
	background: #0A6EFF;
}

.btnBlueRed {
	background: #FF4646;
}

.btnFade.btnBlueRed:hover {
	background: #FF0000;
}
/* 추가∨ 버튼 */
.addBtnDiv {
	margin: 20px;
	text-align: center;
}

.addBtn, .deleteBtn {
	font-weight: bold;
	width: 12%;
	border: 1px solid gray;
}

table {
	table-layout: fixed;
}

/* 약목록 스크롤 */
.tableScroll {
	overflow: auto;
}

/* 표 머리행 */
th {
	background-color: #E8F5FF;
	text-align: center;
	position: sticky;
	top: 0px;
}

/* .styleTd !important{ */
/*     text-align: center; */
/*     padding-top: 7px; */
/* } */

.table td, .table th {
	padding: 4px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.tableTextCenter {
	text-align: center;
}


.card-body.p-0 .table thead>tr>th:first-of-type {
	padding: 0;
}
/* 구분 -> 전문 */
.sortPro {
	background-color: #FEBEBE;
}

/* 구분 -> 일반 */
.sortGeneral {
	background-color: #AFDDFA;
}

tr:hover {
	background-color: rgba(0, 0, 0, 0.1);
}

.statusReady {
	background-color: #FF3232;
	color: white;
}

.allCheckDelete{
	height: 18px;
    font-size: 11px;
    line-height: 10px;
    float: left;
    margin-left: 40%;
    margin-bottom: 3px;
}
#basicText{
    height: 361px;
    text-align: center;
    padding: 50px;
    pointer-events: none;
    font-weight: bold;
    font-size: 13px;
}

</style>
</head>
<body>
	
	<div class="content-wrapper" style="min-height: 915px;">
		<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="card card-primary">
						<div class="card-header">
						<c:choose>
							<c:when test="${empty receiveCartList[0].receiveNo}">
								<h5 class="card-title" rDate="<%=sdf.format(today) %>"><%=sdf.format(today) %> 입고장</h5>
							</c:when>
							<c:otherwise>
								<h5 class="card-title" rDate="${receiveCartList[0].receiveDate}">${receiveCartList[0].receiveDate} 입고장</h5> 
							</c:otherwise>
						</c:choose>
						</div>
						<!-- /.card-header -->
						<div class="card-body" style="height: 885px;">

							<div class="row">
								<select name="searchType" id="searchType"
									style="height: 40px; margin: 0px 6px 0 10px;">
									<option value="ALL">전체</option>
									<option value="ETC" ${cri.searchType eq "ETC" ? "selected":"" }>전문</option>
									<option value="OTC" ${cri.searchType eq "OTC" ? "selected":"" }>일반</option>
								</select> <input list="classification-code" id="searchType2"
									name="searchType2" placeholder="분류코드입력"
									style="width: 122px; height: 40px;" value="${cri.searchType2}">
								<datalist id="classification-code">
									<c:forEach items="${classficationList }" var="classfication">
										<option value="${classfication.classNo }">${classfication.className }</option>
									</c:forEach>
								</datalist>


								<div class="form-group">
									<div class="input-group input-group-lg">
										<input type="text" id="textSearch" name="keyword" 
											class="form-control form-control-lg searchBox"
											placeholder="약명을 입력하세요." value="${cri.keyword }" onkeyup="medicineEnter()" 
											style="height: 40px; margin-left: 5px; font-size: 12px; width: 180px;">
										<div class="input-group-append">
											<button type="button" onclick="javascript:testadd()"
												data-card-widget="search" class="btn btn-lg btn-default"
												style="height: 40px;">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
								</div>

								<div style="width: 288px; display: flex;">
									<c:choose>
									<c:when test="${empty receiveCartList[0].receiveNo}">
										<button class="btn btn-block btn-secondary btn-sm"  
												style="height: 40px; margin-left: 15px; width:65px;"
												onclick="qrRead()">QR인식</button> 
										<button onclick="addMedicineK(this)" id="save" class="btn btn-primary btn-sm"
												style="height: 40px; margin-left: 6px; width:45px;">완료</button>
										<button onclick="window.close()" class="btn btn-danger btn-sm" 
												style="height: 40px; margin-left: 6px; width:45px;">취소</button>
										<button onclick="addMedicineK(this)" id="demoSave" class="btn btn-dark btn-sm"
												style="height: 40px; margin-left: 6px; width:75px;">임시저장</button>		
									</c:when>
									<c:otherwise>
										<button onclick="modifyMedicineK('${receiveCartList[0].receiveNo}')" class="btn btn-primary btn-sm"
												style="height: 40px; margin-left: 25px; width:60px;">완료</button>
										<button onclick="window.close()" class="btn btn-danger btn-sm" 
												style="height: 40px; margin-left: 15px; width:60px;">취소</button>		
									</c:otherwise>
									</c:choose>
									
								</div>

								<br>
								<p style="margin: 1px; color: gray;">
									※ 마약, 한외마약, 향정 약품은 구분에 <i class='fas fa-exclamation-triangle' style='font-size: 15px;'></i> 아이콘 표시 ※
								</p>

								<button onclick="javascript:allDeleteBtnK()" class="btn btn-secondary btn-sm allCheckDelete">전체 체크 해제</button>
							</div>

							<div class="card card-primary  card-outline"
								style="height: 400px;">
								<div class="card-body" style="padding: 0px; overflow: auto;">
									<table class="table table-bordered text-nowrap" style="table-layout: fixed;margin-bottom: 0px; width: 100%; overflow: auto; border: 0px;">
										<thead class="listTitle" style="position:sticky; top:0px">
											<tr>
												<th style="padding: 10px 0px 10px 0px;  width:40px;">NO</th>
												<th style="padding: 10px 0px 10px 0px; width: 65px;">구분</th>
												<th style="padding: 10px 0px 10px 0px; width: 40px;">분류</th>
												<th style="padding: 10px 0px 10px 0px; width: 80px;">약번호</th>
												<th style="padding: 10px 0px 10px 0px; width: 40px;">투여</th>
												<th style="padding: 10px 0px 10px 0px; ">약명</th>
												<th style="padding: 10px 0px 10px 0px; width: 40px;">보험</th>
												<th style="padding: 10px 0px 10px 0px; width: 40px;">선택</th>
											</tr>
										</thead>
											<tbody id="medicineList">
												<tr>
													<td id="basicText" colspan="8" style="vertical-align: middle; padding-bottom: 150px;">
														※ 약명을 입력한 후 검색버튼을 눌러주세요 ※
													</td>
												</tr>
											</tbody>
										</table>
								</div>
							</div>

							<div class="addBtnDiv">
								<button onclick="javascript:selectBtnK()" class="addBtn">추가∨</button>
								<button onclick="javascript:deleteBtnK()" class="deleteBtn">삭제∧</button>
							</div>

							<div class="card card-primary  card-outline tableScroll"
								style="height: 300px;">
								<div class="card-body" style="padding: 0px; overflow:auto;">
									<table id="addMediTable" class="table table-bordered"
										style="overflow: auto; font-size: 12px; border:0px;">
										<thead class=" card-outline">
											<tr>
												<th style="padding: 10px 0px 10px 0px; width: 55px;">거래처</th>
												<th style="padding: 10px 0px 10px 0px; width: 50px;">약번호</th>
												<th style="padding: 10px 0px 10px 0px; width: 100px;">약명</th>
												<th style="padding: 10px 0px 10px 0px; width: 70px;">제조일</th>
												<th style="padding: 10px 0px 10px 0px; width: 30px;">수량</th>
												<th style="padding: 10px 0px 10px 0px; width: 40px;">단위</th>
												<th style="padding: 10px 0px 10px 0px; width: 30px;">약위치</th>
												<th style="padding: 10px 0px 10px 0px; width: 40px;">금액(원)</th>
												<th style="padding: 10px 0px 10px 0px; width: 25px;">선택</th>
											</tr>
										</thead>
										<tbody id="readyMedicine" style="max-height: 200px;">
										<c:forEach items="${receiveCartList }" var="receiveCart" varStatus="status"> <!-- 이 foreach문은 입고장 수정 -->
											<tr class="readyMedicineTr" value='${receiveCart.mdNo}' ondblclick="deleteMedicineTr(this)">
										   		<td data-toggle="tooltip" title="${receiveCart.miCompany}">${receiveCart.miCompany}</td>
										   		<td>${receiveCart.mdNo}</td>
										   		<td data-toggle="tooltip" title="${receiveCart.mdName}" style="text-align: left;">${receiveCart.mdName}</td>
										   		<td><input type="date" style="width:94px;" value="${receiveCart.receiveShelfLife}"></td>
										   		<td><input type="text" class="mdNum" style="width:35px; height:20px;" value="${receiveCart.receiveCartNum}"></td>
										   		<td>${receiveCart.miUnit}</td>
										   		<td><input type="text" style="width:35px; height:20px;" value="${receiveCart.productPosition }"></td>
										   		<td><input type="text" class="mediPrice" style="width:72px; height:20px; border:0px;" price="${receiveCart.receiveCartPrice}" readonly ></td>
										   		<td style="text-align:center;">
										   			<input class="deleteCheck" name="deletechk" value="${receiveCart.miCode}" type="checkbox" style="width:17px; height:17px;"/>
										   			<input type="hidden" class="mdTerm" value="${receiveCart.mdTerm}" name="${receiveCart.mdTerm}" />
										   		</td>
										   	</tr>
										</c:forEach>
										<c:forEach items="${RDemoCartList }" var="RDemoCart" varStatus="status"> <!-- 이 foreach문은 임시저장 입고장 가져오기 -->
											<tr class="readyMedicineTr" value='${RDemoCart.mdNo}' ondblclick="deleteMedicineTr(this)">
										   		<td data-toggle="tooltip" title="${RDemoCart.miCompany}">${RDemoCart.miCompany}</td>
										   		<td>${RDemoCart.mdNo}</td>
										   		<td data-toggle="tooltip" title="${RDemoCart.mdName}" style="text-align: left;">${RDemoCart.mdName}</td>
										   		<td><input type="date" style="width:94px;" value="${RDemoCart.receiveShelfLife}"></td>
										   		<td><input type="text" class="mdNum" style="width:35px; height:20px;" value="${RDemoCart.receiveCartNum}"></td>
										   		<td>${RDemoCart.miUnit}</td>
										   		<td><input type="text" style="width:35px; height:20px;" value="${RDemoCart.receiveCartPosition }"></td>
										   		<td><input type="text" class="mediPrice" style="width:72px; height:20px; border:0px;" price="${RDemoCart.receiveCartPrice}" readonly ></td>
										   		<td style="text-align:center;">
										   			<input class="deleteCheck" name="deletechk" value="${RDemoCart.miCode}" type="checkbox" style="width:17px; height:17px;"/>
										   			<input type="hidden" class="mdTerm" value="${RDemoCart.mdTerm}" name="${RDemoCart.mdTerm}" />
										   		</td>
										   	</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="priceSumDiv" style="height:40px;">
								<span style="float:right; display: flex;">
									<p style="margin-bottom: 0px;font-size: 18px;font-weight: bold;">합계금액 : </p>
									<input type="text" class="mediPriceSum" style="border:0px;font-size: 18px !important;font-weight: bold;width: 150px;">
								</span>
							</div>
							</div>

						</div>
						<!-- /.card-body -->
					</div>
				</div>
			</div>
		</section>
		<div>
			<input type="hidden" id="sessionChemistCode" value="${loginUser.chemistCode }">
			<input type="hidden" id="sessionChemistName" value="${loginUser.memName }">
			<input type="hidden" id="sessionPharmacyCode" value="${loginUser.pharmacyCode }">
			<input type="hidden" id="sessionPharmacyName" value="${loginUser.pharmacyName }">
		</div>
	</div>

	<!-- Handlebars -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
	<script type="text/x-handlebars-template" id="medicineList-list-template">
		{{#each .}}
			<tr class="medicineInfoList" id="test" cursor="pointer" ondblclick="addMedi(this,'{{mdNo}}')">
				<td style="width: 37px;">{{inc @index}}</td>
				{{#eq mdClass "전문"}}
					<td class="sortPro">
						{{mdClass}}
						{{#eq mdDrug "-"}}
						{{else}}
							 <i class='fas fa-exclamation-triangle' style='font-size: 15px;'></i>
						{{/eq}}
					</td>
				{{else}}
					<td class="sortGeneral">
						{{mdClass}}
						{{#eq mdDrug "-"}}
						{{else}}
							 <i class='fas fa-exclamation-triangle' style='font-size: 15px;'></i>
						{{/eq}}
					</td>
				{{/eq}}

				<td>{{miType}}</td>
				<td style="width: 89px;">{{mdNo}}</td>
				<td style="width: 38px;">{{miUse}}</td>
				<td data-toggle="tooltip" title="{{mdName}}" style="width: 54%; text-align: left;">{{mdName}}</td>
				<td style="width: 37px;">급여</td>
				<td style="text-align:center;"><input class="compareCheck" name="chk" value="{{miCode}}" type="checkbox" style="width:17px; height:17px;"/></td>
				<input type="hidden" class="miCompany" value="{{miCompany}}" />
				<input type="hidden" class="miUnit" value="{{miUnit}}" />
				<input type="hidden" class="miPrice" value="{{miPrice}}" />
				<input type="hidden" class="mdTerm" value="{{mdTerm}}" />
			</tr>
		{{/each}}
	</script>
	
	<script>
	window.onload = function(){
		
		var mediCount = $('.mediPrice').length;
		var beforeSum = 0;
		for(let i = 0; i < mediCount; i++){
			var mediPrice = parseInt($('.mediPrice')[i].getAttribute('price'));
			var mediNum = parseInt($('.mdNum')[i].getAttribute('value'));
			
			var res = mediPrice * mediNum;
			beforeSum += res;
			$('.mediPrice')[i].setAttribute('value',res.toLocaleString('ko-KR'));
			console.log(beforeSum);
		}
			$(".mdNum").parents('div').find('div').find($('.priceSumDiv')).find('input').val((beforeSum).toLocaleString('ko-KR') +"원"); // 수정창 초기 합계금액
	
	$(".mdNum").on("change keyup paste",function(){ // 수량을 바꿀때마다 값 변경해주는 함수
		var price = parseInt($(this).parent('td').parent('tr').find('td:eq(7)').find('input').attr('price')); // 선택한 약의 1개당 값 
		var num = parseInt($(this).val()); // 수량을 변경하는 곳의 값
		$(this).parent('td').parent('tr').find('td:eq(7)').find('input').val(($(this).val() * price).toLocaleString('ko-KR')); // 입력한 수량에따라 변경되는 해당 컬럼의 약값.
 		$(".mdNum").parents('div').find('div').find($('.priceSumDiv')).find('input').val(sum2() +"원"); // 합계금액을 재조정해줌
    });
	
	function sum2(){
		var trNum = $('.mdNum').length;
		var sum = 0;
		for(var i = 0 ; i < trNum; i++){
			sum += parseInt($('.mdNum').parent('td').parent('tr').find('td:eq(7)').find('input')[i].value.replaceAll(',',''));
		}
		return sum.toLocaleString('ko-KR');
	}
		
	}
	</script>
	<script>
	function qrRead(){
		OpenWindow('receiveQR.do','상세보기',800,650);
	}
	</script>
		<script>
		function addMedi(medicine, mdNo) {
			var overlapCheck = new Array();
			overlapCheck = document.getElementsByClassName('readyMedicineTr');
		
			// 약 중복 등록 방지
			if(overlapCheck.length > 0){
				for(let i = 0; i < overlapCheck.length; i++){
					if(overlapCheck[i].getAttribute('value') == mdNo){
						alert('이미 추가한 약입니다.');
						return;
					}
				}
			}
			
			var a = medicine;
			var b = a.children;
			
			 var mediNo = b[3].innerText;		// 약번호
			 var mediName = b[5].innerText;		// 약명		
			 var miCode = b[7].firstChild.value;
			 var miCompany = b[8].value;  		// 거래처
			 var miUnit = b[9].value;			// 단위
			 var miPrice = b[10].value;			// 가격
			 var mdTerm = b[11].value;			// 제조일로부터~~
			 
			var str = `<tr class="readyMedicineTr" value='\${mediNo}' ondblclick="deleteMedicineTr(this)">
					   		<td data-toggle="tooltip" title="\${miCompany}">\${miCompany}</td>
					   		<td>\${mediNo}</td>
					   		<td data-toggle="tooltip" title="\${mediName}" style="text-align: left;">\${mediName}</td>
					   		<td><input type="date" style="width:94px;"></td>
					   		<td><input type="text" class="mdNum" style="width:35px; height:20px;"></td>
					   		<td>\${miUnit}</td>
					   		<td><input type="text" style="width:35px; height:20px;"></td>
					   		<td><input type="text" class="mediPrice" style="width:72px; height:20px; border:0px;" readonly price="\${miPrice}" value='0'></td>
					   		<td style="text-align:center;"><input class="deleteCheck" name="deletechk" value="\${miCode}" type="checkbox" style="width:17px; height:17px;"/>
					   		<input type="hidden" class="mdTerm" value="\${mdTerm}" name="\${mdTerm}" /></td>
					   	</tr>`;
			$('#readyMedicine').append(str);
		    // 재고 수량 입력시 약값이 자동 계산됨
		    $(".mdNum").on("change keyup paste",function(){ 
		    	miPrice = $(this).parent('td').parent('tr').find('td:eq(7)').find('input').attr('price');
		       $(this).parent('td').parent('tr').find('td:eq(7)').find('input').val(($(this).val() * miPrice).toLocaleString('ko-KR')); // 추가된 약목록에서 금액부분
		       $(this).parent('td').parent('tr').find('td:eq(7)').find('input').attr('price',(miPrice)); // input 태그에 price로 ,안 붙인 금액 저장
		       $(this).parents('div').find('div').find($('.priceSumDiv')).find('input').val(sum()+"원"); // 약목록 맨아래 합계 금액 출력
		    });
		}
		
		function sum(){ // 각 약들의 수량*약값 들을 총 합해주는 함수
			var a = $('.mdNum').length; // 추가된 약목록의 tr을 가져옴
			var b = 0; // 약들의 금액을 더할 변수
			for(var i = 0 ; i < a; i++){
				b += parseInt($('.mdNum').parent('td').parent('tr').find('td:eq(7)').find('input')[i].value.replaceAll(',',''));
			}
			return b.toLocaleString('ko-KR');
		}
	
	</script>

	<script>
	// 약 목록에서 체크하여 [추가]버튼 누르기
	function selectBtnK() {
		$('.compareCheck:checked').each(function(index,obj){
			var grandparents = obj.parentNode.parentNode;
			addMedi(grandparents);
			$("input:checkbox[name='chk']").prop("checked", false);
		})
	}

	// 약 장바구니에서 체크하여 [삭제]버튼 누르기
	function deleteBtnK(){
		$('.deleteCheck:checked').each(function(index,obj){
			var grandparents = obj.parentNode.parentNode;
			deleteMedicineTr(grandparents);
			$("input:checkbox[name='deleteBtn']").prop("checked", false);
		})
	}

	// 전체 체크 해제
	function allDeleteBtnK(){
		$("input:checkbox[name='deletechk']").prop("checked", false);
		$("input:checkbox[name='chk']").prop("checked", false);
	}
	</script>

	<script>
	// 횟수, 일수 수정하면 색 변화
	function(){
		// text수정
		$('.preDrugCount').attr("readonly",false);
		$('.preDrugDay').attr("readonly",false);

		// 약 삭제체크박스 활성화
		$('.deleteChk').attr("disabled", false);
	}

	</script>

<script type="text/javascript">
		// 약 추가버튼 클릭했을때...
	function addMedicineK(from){
		var callFrom = from.getAttribute('id');
		var receiveDate = $('.card-title').attr('rDate');
		console.log("입고장 날짜  : " + receiveDate);
		
		// 약사이름
		var chemistName = $('#sessionChemistName').val();
		console.log("약사코드 : " + chemistName);
		
		// 약국코드
		var pharmacyCode = $('#sessionPharmacyCode').val();
		console.log("약국코드 : " + pharmacyCode);
		
		var flag = true;
		
		var arr = [];
		$('.readyMedicineTr', '#readyMedicine').each(function(i,v){

			var obj ="";

			var miCompany = $("td:eq(0)",$(v)).text();  				// 제약사
			var mdNo = $("td:eq(1)",$(v)).text();						// 약번호
			var mdName = $("td:eq(2)",$(v)).text();						// 약이름
			var mediDate = $("td:eq(3)",$(v)).find('input').val();		// 제조일
			var mediNum = $("td:eq(4)",$(v)).find('input').val(); 		// 약 개수
			var miUnit = $("td:eq(5)",$(v)).text();						// 단위
			var miPos = $("td:eq(6)",$(v)).find('input').val(); 		// 약위치
			var miPrice = $("td:eq(7)",$(v)).find('input').attr('price');	// 가격
			var mdTerm = $("td:eq(8)",$(v)).find("input[type='hidden']").val();
			
			obj += '{"receiveDate" : "' + receiveDate + '"';
			obj += ', "chemistName" : "' + chemistName + '"';
			obj += ', "pharmacyCode" : "' + pharmacyCode + '"';
			obj += ', "mdNo" : "' + mdNo + '"';
			obj += ', "mdName" : "' + mdName + '"';
			obj += ', "miCompany" : "' + miCompany + '"';
			obj += ', "mediDate" : "' + mediDate + '"';
			obj += ', "mediNum" : "' + mediNum + '"';
			obj += ', "miUnit" : "' + miUnit + '"';
			obj += ', "miPos" : "' + miPos + '"';
			obj += ', "miPrice" : "' + miPrice + '"';
			obj += ', "mdTerm" : "' + mdTerm + '"}';

			arr.push(obj);
			if(mediDate == "" || mediNum == "" || miPos == ""){
				flag = false;
			}
		});
			console.log((JSON.stringify(arr)));
		if(callFrom == "save"){
			if(!flag){
				alert("제조일, 수량, 약위치를 모두 입력해주세요!")
				return;
			}
		$.ajax({
			url:"receiveInsert.do",
			data:JSON.stringify(arr),
			contentType : "application/json; charset=UTF-8",
			type:"post",
			success:function(res){
				if(res == "fail"){
					alert('입고물품이 없는 입고장은 존재 할 수 없습니다.')
					return;
				}
				alert("등록이 완료되었습니다.");
				//console.log(opener.document.location);
				opener.ownListReload();
				window.close();
			},
			error:function(){
				alert("등록에 실패했습니다.");
			}
		});
	  }else{
		  if (!confirm("임시저장한 입고장이 있을시 임시저장된 입고장은 삭제되고 현재 입고장이 임시저장됩니다. 임시저장 하시겠습니까?")){ // "예"가 선택될 경우 입고장을 삭제한다
				return false;       
			}
		$.ajax({
			url:"receiveDemoInsert.do",
			data:JSON.stringify(arr),
			contentType : "application/json; charset=UTF-8",
			type:"post",
			success:function(res){
				if(res == "fail"){
					alert('입고물품이 없는 입고장은 존재 할 수 없습니다.')
					return;
				}
				alert("임시저장이 완료되었습니다.");
				opener.location.reload();
				window.close();
			},
			error:function(){
				alert("임시저장에 실패했습니다.");
			}
		});
	  } 
	}
		
	function modifyMedicineK(no){
		var arr = [];
		//console.log(no);
		
		var receiveDate = $('.card-title').attr('rDate');
		console.log("입고장 날짜  : " + receiveDate);
		
		// 약사이름
		var chemistName = $('#sessionChemistName').val();
		console.log("약사코드 : " + chemistName);
		
		// 약국코드
		var pharmacyCode = $('#sessionPharmacyCode').val();
		console.log("약국코드 : " + pharmacyCode);
		
		$('.readyMedicineTr', '#readyMedicine').each(function(i,v){

			var obj ="";

			var miCompany = $("td:eq(0)",$(v)).text();  					// 제약사
			var mdNo = $("td:eq(1)",$(v)).text();							// 약번호
			var mdName = $("td:eq(2)",$(v)).text();							// 약이름
			var mediDate = $("td:eq(3)",$(v)).find('input').val();			// 제조일
			var mediNum = $("td:eq(4)",$(v)).find('input').val(); 			// 약 개수
			var miUnit = $("td:eq(5)",$(v)).text();							// 단위
			var miPos = $("td:eq(6)",$(v)).find('input').val(); 			// 약위치
			var miPrice = $("td:eq(7)",$(v)).find('input').attr('price');	// 가격
			var mdTerm = $("td:eq(8)",$(v)).find("input[type='hidden']").val();
			
			obj += '{"receiveDate" : "' + receiveDate + '"';
			obj += ', "chemistName" : "' + chemistName + '"';
			obj += ', "pharmacyCode" : "' + pharmacyCode + '"';
			obj += ', "mdNo" : "' + mdNo + '"';
			obj += ', "mdName" : "' + mdName + '"';
			obj += ', "miCompany" : "' + miCompany + '"';
			obj += ', "mediDate" : "' + mediDate + '"';
			obj += ', "mediNum" : "' + mediNum + '"';
			obj += ', "miUnit" : "' + miUnit + '"';
			obj += ', "miPos" : "' + miPos + '"';
			obj += ', "miPrice" : "' + miPrice + '"';
			obj += ', "mdTerm" : "' + mdTerm + '"';
			obj += ', "receiveNo" : "' + no + '"}';

			arr.push(obj);
		});
			console.log((JSON.stringify(arr)));
		// $.ajax만들기
		$.ajax({
			url:"receiveModify.do",
			data:JSON.stringify(arr),
			contentType : "application/json; charset=UTF-8",
			type:"post",
			success:function(res){
				console.log(res);
				if(res == "fail"){
					alert('입고물품이 없는 입고장은 존재 할 수 없습니다.')
					window.location.reload();
					return;
				}
				alert("수정이 완료되었습니다.");
				ownListReload();
				window.close();
			},
			error:function(){
				alert("수정에 실패했습니다.");
			}
		});
	}
</script>
		
		<script>
		function ownListReload(){
// 			console.log(opener.parent.document.getElementById("ownList"));
			opener.parent.document.getElementById("ownList").setAttribute("src", "ownList");
		}
		</script>

		<script>
		// 검색버튼을 눌렀을때...
		function testadd(){
			// 검색하기전 안내문구
	 		$('#medicineList').empty();
			
			var keyword = document.getElementById("textSearch").value;
			var searchType = document.getElementById("searchType").value;
			var searchType2 = document.getElementById("searchType2").value;

			$.ajax({
				url:"<%=request.getContextPath()%>/addMedicinalSearch.do",
				data : {"keyword":keyword, "searchType" : searchType, "searchType2":searchType2},
				type:"post",
				success:function(res){
					printData4(res,$('#medicineList'),$('#medicineList-list-template'));
				},
				error:function(){
					alert("오류입니다.");
				}
			});
		}
	</script>

	<script>
		// 약 장바구니에서 약 삭제
		function deleteMedicineTr(data){

			var a = data;
			var b = a.children;

			for(var i=0; i<b.length; i++){
				console.log(b[i].innerText);
			}

			data.remove();
		}

		function today(){
		var today = new Date();

		var year = today.getFullYear(); // 년도
		var month = today.getMonth() + 1;  // 월
		var day = today.getDate();  // 날짜

		var date = (year + '.' + month + '.' + day);
		alert(date);
		return date;
		}
	</script>

	<script>
	function medicineEnter(){
		if (window.event.keyCode == 13) {
			testadd();
		}
	}
	</script>

</body>













