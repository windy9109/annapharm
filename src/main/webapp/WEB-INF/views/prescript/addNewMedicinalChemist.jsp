<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page trimDirectiveWhitespaces="true"%>

<c:set var="classficationList" value="${dataMap2.classficationList}" />

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
<title>Insert title here</title>
<style>
body, .selectBox, .searchBox {
	font-size: 12px;
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

.table td, .table th {
	padding: 4px;
	overflow: hidden;
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
    margin-left: 45%;
    margin-bottom: 3px;
}

/* 구분 -> 전문 */
.sortPro {
	background-color: #FEBEBE;
}

/* 구분 -> 일반 */
.sortGeneral {
	background-color: #AFDDFA;
}

/* 검색하기전 안내문구 출력 */
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
							<h5 class="card-title">약추가</h5>
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
											placeholder="약명을 입력하세요." value="${cri.keyword }"  onkeyup="medicineEnter()"
											style="height: 40px; margin-left: 5px; font-size: 12px; width: 290px;">
										<div class="input-group-append">
											<button type="button" onclick="javascript:testadd()"
												data-card-widget="search" class="btn btn-lg btn-default"
												style="height: 40px;">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
								</div>

								<div>
									<button onclick="addMedicineDoctor()"  class="btn btn-primary btn-sm"
										style="height: 40px; margin-left: 6px;">추가</button>
									<button onclick="window.close()" href=""
										class="btn btn-primary btn-sm" style="height: 40px;">취소</button>
								</div>
								
								<br>
								<div style="display: -webkit-box;">
									<p style="margin: 1px; color: gray;">
										※ 마약, 한외마약, 향정 약품은 구분에 <i class='fas fa-exclamation-triangle' style='font-size: 15px;'></i> 아이콘 표시 ※
									</p>
									
									<button onclick="javascript:allDeleteBtn()" class="btn btn-secondary btn-sm allCheckDelete" style="margin-left: 73%;">전체 체크 해제</button>
								</div>
							</div>

							<div class="card card-primary  card-outline"
								style="height: 400px;">
								<div class="card-body" style="padding: 0px; overflow: auto;">
									<table class="table table-bordered text-nowrap" style="table-layout: fixed;margin-bottom: 0px; width: 100%; overflow: auto; border: 0px;">
										<thead class="listTitle" style="position:sticky; top:0px">
											<tr>
												<th style="padding: 10px 0px 10px 0px;  width: 30px;">NO</th>
												<th style="padding: 10px 0px 10px 0px; width: 65px;">구분</th>
												<th style="padding: 10px 0px 10px 0px; width: 40px;">분류</th>
												<th style="padding: 10px 0px 10px 0px; width: 80px;">약번호</th>
												<th style="padding: 10px 0px 10px 0px; width: 40px;">투여</th>
												<th style="padding: 10px 0px 10px 0px; ">약명</th>
												<th style="padding: 10px 0px 10px 0px; width: 40px;">보험</th>
												<th style="padding: 10px 0px 10px 0px; width: 40px;">선택</th>
											</tr>
										</thead>
<!-- 									</table> -->
<!-- 									<div style="width: 100%; height: 372px; overflow: auto;"> -->
<!-- 										<table class="table table-bordered"> -->

											<tbody id="medicineList">
												<tr>
													<td id="basicText" colspan="8">
														※ 약명을 입력한 후 검색버튼을 눌러주세요 ※
													</td>
												</tr>
											</tbody>
										</table>
<!-- 									</div> -->
								</div>
							</div>

							<div class="addBtnDiv">
								<button onclick="selectBtn()" class="addBtn">추가∨</button>
								<button onclick="deleteBtnDoctor()" class="deleteBtn">삭제∧</button>
							</div>

							<div class="card card-primary  card-outline tableScroll"
								style="height: 300px;">
								<div class="card-body" style="padding: 0px;">
									<table id="addMediTable" class="table table-bordered"
										style="overflow: auto; font-size: 12px;">
										<thead class=" card-outline">
											<tr>
												<th style="padding: 10px 0px 10px 0px;  width: 30px;">NO</th>
												<th style="padding: 10px 0px 10px 0px; width: 40px;">구분</th>
												<th style="padding: 10px 0px 10px 0px; width: 40px;">분류</th>
												<th style="padding: 10px 0px 10px 0px; width: 80px;">약번호</th>
												<th style="padding: 10px 0px 10px 0px; width: 40px;">투여</th>
												<th style="padding: 10px 0px 10px 0px;">약명</th>
												<th style="padding: 10px 0px 10px 0px; width: 40px;">보험</th>
												<th style="padding: 10px 0px 10px 0px; width: 40px;">선택</th>
											</tr>
										</thead>
										<tbody id="readyMedicine">
										</tbody>
									</table>
								</div>
							</div>

						</div>
						<!-- /.card-body -->
					</div>
				</div>
			</div>
		</section>
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
				<td style="text-align:center;"><input class="compareCheck" name="chk" value="{{miCode}}" type="checkbox" style="width: 17px; height: 17px;"/></td>
			</tr>
		{{/each}}
	</script>
	
	<script>
	// 약 이름 길어질 때 ... 으로 표시
	$(document).ready(function(){
		   $('[data-toggle="tooltip"]').tooltip();
		});
	</script>


	<!-- 약목록에서 추가할 약 더블클릭 -->
	<script>
	// 약목록에서 추가할 약 더블클릭 함수
		function addMedi(medicine, mdNo) {
		
			var overlapCheck = new Array();
			overlapCheck = document.getElementsByClassName('readyMedicineTr');
			//console.log('확인 : ', overlapCheck);
		
			// 약 중복 등록 방지
			if(overlapCheck.length > 0){
				//console.log('확인2 : ', overlapCheck[0].getAttribute('val'));
				for(let i = 0; i < overlapCheck.length; i++){
					if(overlapCheck[i].getAttribute('val') == mdNo){
						alert('이미 추가한 약입니다.');
						return;
					}
				}
			}
			
			//console.log("medicine : " + medicine);
			var a = medicine;
			var b = a.children;
			
// 			for(var i=0; i<b.length-1; i++){
// 				console.log("b" + [i] + " : " + b[i].innerText);
// 			}
			 
			 var no = b[0].innerText;	//NO
			 var mediClass = b[1].innerText;	// 구분
			 var mediType = b[2].innerText;		// 분류코드
			 var mediNo = b[3].innerText;		// 약번호
			 var mediUse = b[4].innerText;		// 투여
			 var mediName = b[5].innerText;		// 약명
			 
// 			 console.log("a" + a);
// 			 console.log("no" + no);
// 			 console.log(mediClass);
// 			 console.log(mediType);
// 			 console.log(mediNo);
// 			 console.log(mediUse);
// 			 console.log(mediName);
			 
// 			 console.log(medicine);
				
			var str = `<tr class="readyMedicineTr" val='\${mediNo}' ondblclick="deleteMedicineTr(this)">
					   		<td>\${no}</td>
					   		<td class="sortPro">\${mediClass}</td>
					   		<td>\${mediType}</td>
					   		<td>\${mediNo}</td>
					   		<td>\${mediUse}</td>
					   		<td style="text-align: left;">\${mediName}</td>
					   		<td>급여</td>
					   		<td><input class="deleteNewChk" name="deleteNewChk" value="{{miCode}}" type="checkbox"/></td>
					   	</tr>`;
			$('#readyMedicine').append(str);
		}
	</script>

	<script>
	// 약 목록에서 체크하여 [추가]버튼 누르기
	function selectBtn() {
		$('.compareCheck:checked').each(function(index,obj){

			var grandparents = obj.parentNode.parentNode;
			
			//console.log(grandparents);
			
			addMedi(grandparents);	
			
			$("input:checkbox[name='chk']").prop("checked", false);
		})	
	}
	
	// 약 장바구니에서 체크하여 [삭제]버튼 누르기
	function deleteBtnDoctor(){
		$('.deleteNewChk:checked').each(function(index,obj){

			var grandparents = obj.parentNode.parentNode;
			
			console.log("부모" + grandparents);
			
			deleteMedicineTr(grandparents);	
			
			$("input:checkbox[name='deleteBtn']").prop("checked", false);
		})	
	}
	
	// 전체 체크 해제
	function allDeleteBtn(){
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
		function addMedicineDoctor(){
			
			window.close();
			
			
			// 중복체크
			var codeArr = new Array();
			
			$("tr.preDetailList", window.opener.document).each(function(i,v){
				codeArr.push( $("td:eq(2)", $(v)).text() );
			});
			console.log("codeArr", codeArr);
			
			
			//console.log($('.readyMedicineTr'));
			//console.log( $('#readyMedicine').html() );
			
			$('.readyMedicineTr', '#readyMedicine').each(function(i,v){
				console.log( $("td",$(v)) )
						
// 				console.log( $("td:eq(0)",$(v)).text() );
// 				console.log( $("td:eq(1)",$(v)).text() );
// 				console.log( $("td:eq(2)",$(v)).text() );
// 				console.log( $("td:eq(3)",$(v)).text() );
// 				console.log( $("td:eq(4)",$(v)).text() );
// 				console.log( $("td:eq(5)",$(v)).text() );
// 				console.log( $("td:eq(6)",$(v)).text() );

			if(codeArr != null){
				// 장바구니에 있는 약과 추가되어있는 약 중복체크 : 약 장바구니에서 약 코드 불러오기
				var mediNoTd = $("td:eq(3)",$(v)).text();	// 약번호
				console.log("약번호 : " + mediNoTd);
				var chk = false;
				for(var i=0; i<codeArr.length; i++){
					if(codeArr[i]==mediNoTd){
						chk = true;
						break;
					}
				}
				if(chk){
// 					console.log(codeTd + "는 중복됨");
					return;
				}
			}
				var classTd = $("td:eq(1)",$(v)).text();	// 구분
				var typeTd = $("td:eq(2)",$(v)).text();		// 분류
				var useTd = $("td:eq(4)",$(v)).text();		// 투여
				var nameTd = $("td:eq(5)",$(v)).text();		// 약명
				
				var test = opener.document.getElementsByClassName('newPrescription');
				console.log('test : ',test.length);
				var test2 = opener.document.getElementsByClassName('newPrescription')[test.length-1];
				console.log('test2',test2);
				
				if(test2 == null){
					test3 = 0;
				}else{
					var test3 = test2.getElementsByTagName('td')[0].innerText;
					console.log('test3',test3);
				}
				test3++;
				
				var date = new Date();
				var newDate =  date.getFullYear() + "." + ("0"+(date.getMonth()+1)).slice(-2) + "." + ("0"+date.getDate()).slice(-2);
				
				
				$("#prePsDate", window.opener.document).attr("value",newDate);
				
				// 발행기관
				$("#preHospitalName", window.opener.document).attr("value"," -");
				
				// 의사명
				$("#preDoctorName", window.opener.document).attr("value"," -");
				
				// 조제약국
				$("#prePharmacyName", window.opener.document).attr("value"," -");
				
				// 조제약사
				$("#prePharmacistName", window.opener.document).attr("value"," -");
				
				$("#prescriptionChoiceDetail", window.opener.document).append(`<tr class="preDetailList" style="height: 25px;">
						<td>\${test3}</td>
						<td>\${classTd}</td>
						<td class="mdNo" id="mediNoTd" value="\${mediNoTd}" >\${mediNoTd}</td>
						<td class="mdName" id="mdName" value="\${nameTd}" style="text-align: left;">\${nameTd}</td>
						<td>
							<input type="number" base-value="{{preDrugCount}}" class="registCountForChemist" min="1" onchange="drugCount(this)" style="width: 35px;">
						</td>
						<td>
							<input type="number" base-value="{{preDrugDay}}" class="registDayForChemist" min="1" onchange="drugDay(this)" style="width: 35px;">
						</td>
						<td>위치</td>
						<td>재고</td>
						<td>보험</td>
						<td>
							<input type="checkbox" class="deleteChk" id="deleteChk" name="deleteChk" value="{{miCode}}">
						</td>
					</tr>`);
				

			});
			
			
			
			// [추가]
			$("#newMedicineForChemist", window.opener.document).attr("disabled",false);
			$("#newMedicineForChemist", window.opener.document).css('background', '#007bff');
			// [삭제]
			$("#deleteMediBtnForChemist", window.opener.document).attr("disabled",false);
			$("#deleteMediBtnForChemist", window.opener.document).css('background', '#007bff');
			// [저장]
			$("#saveNewMedicineForChemist", window.opener.document).attr("disabled",false);
			$("#saveNewMedicineForChemist", window.opener.document).css('background', '#007bff');
			// [취소]
			$("#newMedicineCancelForChemist", window.opener.document).attr("disabled",false);
			$("#newMedicineCancelForChemist", window.opener.document).css('background', '#007bff');
			
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
				url:"addMedicinalSearchForChemist.do",
				data : {"keyword":keyword, "searchType" : searchType, "searchType2":searchType2},
				type:"post",
				success:function(res){
 		 			console.log(res);
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
		
// 		function deleteMedicineTrBtn(){
// 			var thisRow = $('#readyMedicineTr').closest('tr');
			
// 			console.log = ("thisRow : " + thisRow);
// 		}
	</script>
	
	<!-- 엔터키 이벤트  -->
	<script>
	function medicineEnter(){
		if (window.event.keyCode == 13) {
			testadd();
		}
	}
	</script>

</body>