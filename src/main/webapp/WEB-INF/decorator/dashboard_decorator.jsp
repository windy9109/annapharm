<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title><decorator:title default="ddit's System" /></title>

<!-- none_decorator -->

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main_aside.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/menu.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/main.css">
      <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/dist/fullpage.css">



  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/sweetalert2/sweetalert2.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/toastr/toastr.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css?v=3.2.0">



     <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/menu.css">
         <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/expert.css">
<decorator:head />

<style>
body {
	background-color: #f4f6f9 !important;
}
</style>
</head>
<body>

	<div class="wrapper">

		<decorator:body />

	</div>

	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/adminlte.min.js"></script>

	<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>

	<script src="<%=request.getContextPath()%>/resources/js/menu.js"></script>

	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/select2/js/select2.full.min.js"></script>

	<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/adminlte.min.js?v=3.2.0"></script>



<!-- summernote -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.js"></script>
<!-- FontAwesome -->
<script src="https://kit.fontawesome.com/1fc71bb455.js" crossorigin="anonymous"></script>

<script src="<%=request.getContextPath() %>/resources/js/common.js" ></script>

<script src="<%=request.getContextPath() %>/resources/js/menu.js" ></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	google.load("visualization", {
		packages : [ "corechart" ]
	});
	google.setOnLoadCallback(drawChart1);
	google.setOnLoadCallback(drawChart2);
	google.setOnLoadCallback(drawChart3);
	google.setOnLoadCallback(drawChart4);
});


	function drawChart1() {
		var date = new Date();
		var endDate = date.getFullYear() + '-' + (date.getMonth()+1) + '-' + date.getDate();
		var startDate = date.getFullYear() + '-' + (date.getMonth()+1) + '-' + date.getDate();
		var data = {
			"startDate" : startDate,
			"endDate" : endDate
		}

		var arr;

		$.ajax({
			url:"<%=request.getContextPath()%>/expert/viewT/analysisPrescription.do",
			type:"post",
			data:JSON.stringify(data),
			contentType:'application/json',
			success:function(data){
	 			arr= [
	 				[ '연령', '남', '여' ],
	 				[ '00', data[0].male, data[0].female ],
	 				[ '10', data[1].male, data[1].female ],
	 				[ '20', data[2].male, data[2].female ],
	 				[ '30', data[3].male, data[3].female ],
	 				[ '40', data[4].male, data[4].female ],
	 				[ '50', data[5].male, data[5].female ],
	 				[ '60', data[6].male, data[6].female ],
	 				[ '70', data[7].male, data[7].female ],
	 				[ '80', data[8].male, data[8].female ]];

	 			var data = google.visualization.arrayToDataTable(arr);
	 			var options = {width : 300, // 가로 px
	 			height : 200, // 세로 px
	 			bar : {
	 				groupWidth : '80%' // 그래프 너비 설정 %
	 			},
	 					vAxis: {
	 	                title: '방문자수',
	 	                    minValue: 0,
	 	                    maxValue: 10
	 	            },

	 					hAxis: {title: '연령', titleTextStyle: {color: 'red'}}};

	 			var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));


	 			chart.draw(data, options);
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

	function drawChart2() {
		var date = new Date();
		date.setDate(date.getDate()-1);
		var endDate = date.getFullYear() + '-' + (date.getMonth()+1) + '-' + date.getDate();
		var startDate = date.getFullYear() + '-' + (date.getMonth()+1) + '-' + date.getDate();
		var data = {
			"startDate" : startDate,
			"endDate" : endDate
		}

		var arr;

		$.ajax({
			url:"<%=request.getContextPath()%>/expert/viewT/analysisPrescription.do",
			type:"post",
			data:JSON.stringify(data),
			contentType:'application/json',
			success:function(data){
	 			arr= [
	 				[ '연령', '남', '여' ],
	 				[ '00', data[0].male, data[0].female ],
	 				[ '10', data[1].male, data[1].female ],
	 				[ '20', data[2].male, data[2].female ],
	 				[ '30', data[3].male, data[3].female ],
	 				[ '40', data[4].male, data[4].female ],
	 				[ '50', data[5].male, data[5].female ],
	 				[ '60', data[6].male, data[6].female ],
	 				[ '70', data[7].male, data[7].female ],
	 				[ '80', data[8].male, data[8].female ]];

	 			var data = google.visualization.arrayToDataTable(arr);
	 			var options = {width : 300, // 가로 px
	 			height : 200, // 세로 px
	 			bar : {
	 				groupWidth : '80%' // 그래프 너비 설정 %
	 			},
	 					vAxis: {
	 	                title: '방문자수',
	 	                    minValue: 0,
	 	                    maxValue: 10
	 	            },

	 					hAxis: {title: '연령', titleTextStyle: {color: 'red'}}};

	 			var chart = new google.visualization.ColumnChart(document.getElementById('chart_div_y'));

	 			chart.draw(data, options);
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});

	}

	function drawChart3() {
		var sysdate = new Date();
		var date = new Date();
		date.setDate(date.getDate()-7);
		var endDate = sysdate.getFullYear() + '-' + (sysdate.getMonth()+1) + '-' + sysdate.getDate();
		var startDate = date.getFullYear() + '-' + (date.getMonth()+1) + '-' + date.getDate();
		var data = {
			"startDate" : startDate,
			"endDate" : endDate
		}

		var arr;

		$.ajax({
			url:"<%=request.getContextPath()%>/expert/viewT/analysisPrescription.do",
			type:"post",
			data:JSON.stringify(data),
			contentType:'application/json',
			success:function(data){
	 			arr= [
	 				[ '연령', '남', '여' ],
	 				[ '00', data[0].male, data[0].female ],
	 				[ '10', data[1].male, data[1].female ],
	 				[ '20', data[2].male, data[2].female ],
	 				[ '30', data[3].male, data[3].female ],
	 				[ '40', data[4].male, data[4].female ],
	 				[ '50', data[5].male, data[5].female ],
	 				[ '60', data[6].male, data[6].female ],
	 				[ '70', data[7].male, data[7].female ],
	 				[ '80', data[8].male, data[8].female ]];

	 			var data = google.visualization.arrayToDataTable(arr);
	 			var options = {width : 300, // 가로 px
	 			height : 200, // 세로 px
	 			bar : {
	 				groupWidth : '80%' // 그래프 너비 설정 %
	 			},
	 					vAxis: {
	 	                title: '방문자수',
	 	                    minValue: 0,
	 	                    maxValue: 10
	 	            },

	 					hAxis: {title: '연령', titleTextStyle: {color: 'red'}}};

	 			var chart = new google.visualization.ColumnChart(document.getElementById('chart_div_w'));


	 			chart.draw(data, options);
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

		function drawChart4() {
			var sysdate = new Date();
			var date = new Date();
			date.setDate(date.getDate()-30);
			var endDate = sysdate.getFullYear() + '-' + (sysdate.getMonth()+1) + '-' + sysdate.getDate();
			var startDate = date.getFullYear() + '-' + (date.getMonth()+1) + '-' + date.getDate();
			console.log(sysdate)
			console.log(date)
			var data = {
				"startDate" : startDate,
				"endDate" : endDate
			}

			var arr;

			$.ajax({
				url:"<%=request.getContextPath()%>/expert/viewT/analysisPrescription.do",
				type:"post",
				data:JSON.stringify(data),
				contentType:'application/json',
				success:function(data){
		 			arr= [
		 				[ '연령', '남', '여' ],
		 				[ '00', data[0].male, data[0].female ],
		 				[ '10', data[1].male, data[1].female ],
		 				[ '20', data[2].male, data[2].female ],
		 				[ '30', data[3].male, data[3].female ],
		 				[ '40', data[4].male, data[4].female ],
		 				[ '50', data[5].male, data[5].female ],
		 				[ '60', data[6].male, data[6].female ],
		 				[ '70', data[7].male, data[7].female ],
		 				[ '80', data[8].male, data[8].female ]];

		 			var data = google.visualization.arrayToDataTable(arr);
		 			var options = {width : 300, // 가로 px
 					height : 200, // 세로 px
 					bar : {
 						groupWidth : '80%' // 그래프 너비 설정 %
 					},
 							vAxis: {
 			                title: '방문자수',
 			                    minValue: 0,
 			                    maxValue: 10
 			            },
 							hAxis: {title: '연령', titleTextStyle: {color: 'red'}}};

 					var chart = new google.visualization.ColumnChart(document.getElementById('chart_div_m'));


 					chart.draw(data, options);
				},
				error:function(error){
					AjaxErrorSecurityRedirectHandler(error.status);
				}
			});

	}

</script>

<!-- 매출액 통계 차트 -->
<script>
google.load("visualization", {packages:["corechart"]});
google.setOnLoadCallback(drawChart01);
google.setOnLoadCallback(drawChart02);
google.setOnLoadCallback(drawChart03);

var salesChartDate = new Date();

	// 매출통계 일주일 그래프
	function drawChart01() {

		var pharmacyCode = $('#sessionPharmacyCode').val();

		var week = ['일', '월', '화', '수', '목', '금', '토'];
		var today = (salesChartDate.getMonth()+1) + "." + salesChartDate.getDate();
		var todayName = week[salesChartDate.getDay()];

		// 오늘 날짜 넣기
		$('#salesChartCalD').text(today + "(" + todayName + ")");

		salesChartDate.getFullYear();

		$.ajax({
			url:"<%=request.getContextPath()%>/expert/viewT/salesWeek.do?pharmacyCode=" + pharmacyCode,
			type:"get",
			data:pharmacyCode,
			success: function(res){
				var total = res.sun + res.mon + res.tue + res.wed + res.thur + res.fri + res.sat;
				$('#salesChartCalAccrueD').text(total.toLocaleString('ko-KR') + '(￦)');
				  var data = google.visualization.arrayToDataTable([
				    ['요일', '원'],
				    ['일',  res.sun],
				    ['월',  res.mon],
				    ['화',  res.tue],
				    ['수',  res.wed],
				    ['목',  res.thur],
				    ['금',  res.fri],
				    ['토',  res.sat]
				  ]);


				  var options = {width : 250, // 가로 px
					height : 190, // 세로 px
					vAxis: {
				         	 title: '매출액'
				             ,minValue: 0
				             ,maxValue: 500000
				      },
				    hAxis: {title: '요일(기간)',  titleTextStyle: {color: 'red'}}
				  };

				  var chart = new google.visualization.AreaChart(document.getElementById('take_chart_div'));
				  chart.draw(data, options);
			},
			error: function(){
				//alert("매출액통계(일주일) 실패")
			}
		});

	}



	// 매출통계 한달 그래프
	function drawChart02() {

		var pharmacyCode = $('#sessionPharmacyCode').val();

		// 기준월 넣기
		$('#salesChartCalM').text(salesChartDate.getMonth() + 1);

		$.ajax({
			url:"<%=request.getContextPath()%>/expert/viewT/salesMonth.do?pharmacyCode=" + pharmacyCode,
			type:"get",
			data:pharmacyCode,
			success: function(res){
				var total = res.day7 + res.day14 + res.day21 + res.day28;
				$('#salesChartCalAccrueM').text(total.toLocaleString('ko-KR') + '(￦)');
				 var data = google.visualization.arrayToDataTable([
				   ['일', '원'],
				   ['7',  res.day7],
				   ['14', res.day14],
				   ['21', res.day21],
				   ['28', res.day28],
				 ]);

				 var options = {
				width : 250, // 가로 px
				height : 190, // 세로 px
				vAxis: {
				         	title: '매출액'
				           ,minValue: 0
				           ,maxValue: 500000
				     },
				   hAxis: {title: '일(기간)',  titleTextStyle: {color: 'red'}}
				 };

				 var chart = new google.visualization.AreaChart(document.getElementById('take_chart_div_m'));
				 chart.draw(data, options);
			},
			error: function(){
				//alert("매출액통계(한달) 실패")
			}

			})

	}


	// 매출통계 일년 그래프
	function drawChart03() {

		var pharmacyCode = $('#sessionPharmacyCode').val();

		// 기준년도 넣기
		$('#salesChartCalY').text(salesChartDate.getFullYear())

		$.ajax({
			url:"<%=request.getContextPath()%>/expert/viewT/salesYear.do?pharmacyCode=" + pharmacyCode,
			type:"get",
			data:pharmacyCode,
			success: function(res){
				var total = res.month1 + res.month2 + res.month3 + res.month4 + res.month5 + res.month6 + res.month7 + res.month8 + res.month9 + res.month10 + res.month11 + res.month12;
				$('#salesChartCalAccrueY').text(total.toLocaleString('ko-KR') + '(￦)');

				  var data = google.visualization.arrayToDataTable([
				    ['월', '원'],
				    ['1',  res.month1],
				    ['2',  res.month2],
				    ['3',  res.month3],
				    ['4',  res.month4],
				    ['5',  res.month5],
				    ['6',  res.month6],
				    ['7',  res.month7],
				    ['8',  res.month8],
				    ['9',  res.month9],
				    ['10', res.month10],
				    ['11', res.month11],
				    ['12', res.month12]
				  ]);

				  var options = {
					width : 250, // 가로 px
					height : 190, // 세로 px
					vAxis: {
				          	title: '매출액'
				            ,minValue: 0
				            ,maxValue: 10000000
				      },
				    hAxis: {title: '월(기간)',  titleTextStyle: {color: 'red'}}
				  };

				  var chart = new google.visualization.AreaChart(document.getElementById('take_chart_div_y'));
				  chart.draw(data, options);
			},
			error: function(){
				//alert("매출통계 일년 데이터를 가져오는데 실패하였습니다.")
			}
		});
	}

</script>

<%-- <script src="<%=request.getContextPath() %>/resources/js/analysisPrescription.js" ></script> --%>
<%-- <script src="<%=request.getContextPath() %>/resources/js/takeStatistics.js" ></script> --%>



<script>
	$('div.wrapper').css({
		"max-width":"1280px",
		"margin":"0 auto"
	});
</script>





<!--------------------------  전문가 페이지 시작  -------------------------------->

<!-- 환자 선택 후 해당 환자 정보 출력 -->
<script>
function patientClick(code){

	console.log("환자코드 : " + code);

	$('#registTable').attr("val",code);

	$.ajax({
		url:"readCode.do",
		data : {"code":code},
		type:"post",
		success:function(res){
// 			선택 환자 정보
// 			console.log(res.preInfo);
// 			console.log(res.preInfo.patient_name);
// 			console.log(res.preInfo.patient_birth);
// 			console.log(res.preInfo.patient_phone);
// 			console.log(res.preInfo.patient_addr);

			// 선택한 환자 정보 출력
			$('#patient_name').attr('value', res.info[0].patientName);
			$('#patient_birth').attr('value', res.info[0].patientBirth);
			$('#patient_phone').attr('value', res.info[0].patientPhone);
			$('#patient_addr').attr('value', res.info[0].patientAddr);

			// textArea에 주소 출력
			var txt = document.getElementById('patient_addr2');
			txt.innerHTML = res.info[0].patientAddr;


			//console.log('res : ',res);

			//console.log('preinfo : ', res.preInfo);

			// 하나의 처방전의 약 갯수 세기
			//console.log(res.medicineName.length);

			// 하나의 처방전에 약 명 출력하기
			// console.log(1, res.medicineName);

			//과거 처방 이력 목록
			printData2(res.preInfo,$('#prescriptionList'),$('#prescription-list-template'))

			//console.log(res.preInfo);

			// 환자 선택시 새처방 작성 버튼들 활성화
			// [약추가]
			$('#newMedicine').attr("disabled", false);
			$('#newMedicine').css('background', '#007bff');
			// [취소]
			$('#newMedicineCancel').attr("disabled", false);
			$('#newMedicineCancel').css('background', '#007bff');
			// [작성완료]
			$('#saveNewMedicine').attr("disabled", false);
			$('#saveNewMedicine').css('background', '#007bff');

		},
		error:function(){
			alert("오류입니다.");
		}
	});
}
</script>
<!-- 헤지 : 과거 처방 이력에서 처방전 하나 선택 -> 처방 상세 내역 출력 -->
<script>
	function preClick(psCode, psStatus){
 		console.log(psCode);
 		console.log(psStatus);

 		$('#psCodeUpdate').attr("val",psCode);

		$.ajax({
			url:"readPre.do",
			data : {"psCode":psCode,
				    "psStatus":psStatus},
			type:"post",
			success:function(res){
				printData3(res.detailInfo,$('#prescriptionDetail'),$('#prescriptionDetail-list-template'))

				if(res.psStatus == "조제대기" || res.psStatus == "수정요청"){
					$('#abc').attr("disabled",false);
					$('#abc').css('background', '#007bff');
				}else{
					$('#abc').attr("disabled",true);
					$('#abc').css('background', '#6c757d');
					disableds();
				}


			},
			error:function(){
				alert("오류입니다.");
			}
		});
	}

	function ex01(){

		alert('눌리기')

	}


</script>


<!-- [수정]버튼을 클릭했을때... -->
<script>

// 횟수, 일수 변경하면 색상 변경됨.
function drugCount(obj) {  
// 	console.log("obj1 : " + obj.value);
// 	console.log("obj2 : " + $(obj).attr("base-value"));

	var objChange = obj.value;
	var objOriginal = $(obj).attr("base-value");

	if(objChange > objOriginal){
		obj.style.color = 'red';
	}else if(objChange < objOriginal){
		obj.style.color = 'blue';
	}else{
		obj.style.color = 'black';
	}
}

function drugDay(obj) {  
// 	console.log("obj1 : " + obj.value);
// 	console.log("obj2 : " + $(obj).attr("base-value"));

	var objChange = obj.value;
	var objOriginal = $(obj).attr("base-value");

	if(objChange > objOriginal){
		obj.style.color = 'red';
	}else if(objChange < objOriginal){
		obj.style.color = 'blue';
	}else{
		obj.style.color = 'black';
	}
}


	/* [수정]버튼을 클릭했을때... */
	function preUpdate(){
		//alert($('#abc').attr("check"));

		// [추가], [저장], [취소] 버튼 활성화
		$('#addBtn').attr("disabled",false);
		$('#storeBtn').attr("disabled",false);
		$('#cancelBtn').attr("disabled",false);
		$('#deleteBtn').attr("disabled",false);

		// 수정버튼 클릭전 버튼들 배경색  : 회색 -> 파란색
		$('#addBtn').css('background', '#007bff');
		$('#storeBtn').css('background', '#007bff');
		$('#cancelBtn').css('background', '#007bff');
		$('#deleteBtn').css('background', '#007bff');

		// text수정
		$('.preDrugCount').attr("readonly",false);
		$('.preDrugDay').attr("readonly",false);

		// 약 삭제체크박스 활성화
		$('.deleteChk').attr("disabled", false);



	}
</script>

<!-- [추가]버튼 클릭시... -->
<script>
	function addMedicine(){
		window.open('<%=request.getContextPath()%>/addMedicinalDoctor.do','약등록','width=748,height=950,left=600,top=600,location=no,status=no,scrollbars=yes');
	}
</script>

<!-- [약삭제]버튼 클릭시... -->
<script>
	function deleteBtn(){
		$("input:checkbox[name='deleteChk']:checked").each(function(index,obj){

			console.log("삭제 : " + obj.parentElement.parentElement);

			var grandparents = obj.parentNode.parentNode;

			console.log("부모" + grandparents);

			deleteMedicineTr(grandparents);

// 			$("input:checkbox[name='deletechk']").prop("checked", false);
		})
	}

	// 약 삭제 함수
	function deleteMedicineTr(data){

		var a = data;
		var b = a.children;

		console.log("데이터 : " + b);

		for(var i=0; i<b.length; i++){
			console.log(b[i].innerText);
		}

		data.remove();
	}
</script>

<!-- [저장]버튼 클릭시 -->
<script>
	function savePre(){
		var miCode = document.querySelectorAll(".miCode");
		var preDrugCount = document.querySelectorAll(".preDrugCount");
		var preDrugDay = document.querySelectorAll(".preDrugDay");
		var psCode = document.querySelectorAll(".psCode");

		var arr = [];

		// console.log('miCode.length' + miCode.length);

		for(var i = 0; i < miCode.length; i++){
			var obj = "";

			var code = $(miCode[i]).attr("value");
			var count = preDrugCount[i].value;
			var day = preDrugDay[i].value;
			var pscode = $('#psCodeUpdate').attr("val");

			obj += '{"mdNo" : "' + code + '"';
			obj += ', "preDrugCount" : "' + count + '"';
			obj += ', "preDrugDay" : "' + day + '"'
			obj += ', "pscode" : "' + pscode + '"}';

			arr.push(obj);
		}
		// console.log(JSON.parse(JSON.stringify(arr)));

		$.ajax({
			url:"medicineUpdate.do",
			data:JSON.stringify(arr),
			contentType : "application/json",
			type:"post",
			success:function(res){
				alert("수정되었습니다.");

				// 저장 완료한 후 버튼들/텍스트입력/체크박스 비활성화
				preClick($('#psCodeUpdate').attr("val"), "조제대기");

				$('#addBtn').attr("disabled",true);
				$('#storeBtn').attr("disabled",true);
				$('#cancelBtn').attr("disabled",true);
				$('#deleteBtn').attr("disabled",true);

				// 수정버튼 클릭전 버튼들 배경색  : 파란색 -> 회색
				$('#addBtn').css('background', '#6c757d');
				$('#storeBtn').css('background', '#6c757d');
				$('#cancelBtn').css('background', '#6c757d');
				$('#deleteBtn').css('background', '#6c757d');
			},
			error:function(){
				alert("수정실패했습니다.");
			}
		})


	}
</script>

<!-- [취소]버튼 클릭시... -->
<script>
	function disableds(){
		$('#addBtn').attr("disabled",true);
		$('#storeBtn').attr("disabled",true);
		$('#cancelBtn').attr("disabled",true);
		$('#deleteBtn').attr("disabled",true);

		// 수정버튼 클릭전 버튼들 배경색  : 파란색 -> 회색
		$('#addBtn').css('background', '#6c757d');
		$('#storeBtn').css('background', '#6c757d');
		$('#cancelBtn').css('background', '#6c757d');
		$('#deleteBtn').css('background', '#6c757d');

		// text수정
// 		var b = $('.preDrugCount').attr("value");
// 		var c = $('.preDrugDay').attr("value");

// 		$('.preDrugCount').attr("value", b);
// 		$('.preDrugDay').attr("value", c);

		f.reset(); //데이터 초기화

		$('.preDrugCount').attr("readonly",true);
		$('.preDrugDay').attr("readonly",true);

		$('.preDrugCount').css('color', 'black');
		$('.preDrugDay').css('color', 'black');

		// 약 삭제체크박스 활성화
		$('.deleteChk').attr("disabled", true);

		// 버튼들/텍스트입력/체크박스 비활성화
		preClick($('#psCodeUpdate').attr("val"), "조제대기");

	}
</script>


<!-- [약추가]버튼 클릭(새처방작성) -->
<script>
	function newMedicine(){
		window.open('<%=request.getContextPath()%>/addNewMedicinalDoctor.do','약등록','width=748,height=950,left=600,top=600,location=no,status=no,scrollbars=yes');
	}
</script>

<!-- [작성완료]버튼 클릭(새처방작성) -->
<script>
	function saveNewMedicine(){
		alert("작성완료");

		//환자코드/닥터코드/약번호/횟수/일수

		// 환자코드
		var patientCode = $('#registTable').attr("val");

		// 의사코드
		var doctorCode = 'D00001';
		// 약번호
		var miCode = document.querySelectorAll(".miCode");

		// 횟수
		var count = document.getElementsByClassName("registCount");
		// 일수
		var day = document.getElementsByClassName("registDay");

		//console.log("약횟수 : " + count);
		//console.log("약횟수 : " + day);

		var registArr = [];

		for(var i = 0; i < miCode.length; i++){
			var registObj = "";
			// 약코드
			var code = $(miCode[i]).attr("value");
			// 횟수
			var countfor = count[i].value;
			// 일수
 			var dayfor = day[i].value;

// 			console.log("countfor : " + countfor)
// 			console.log("dayfor : " + dayfor)

			registObj += '{"patientCode" : "' + patientCode + '"';
			registObj += ', "mdNo" : "' + code + '"';
			registObj += ', "preDrugCount" : "' + countfor + '"'
			registObj += ', "preDrugDay" : "' + dayfor + '"}';

			registArr.push(registObj);
		}

// 		console.log("registArr" + registArr);
// 		console.log("JSON.registArr" + JSON.parse(JSON.stringify(registArr)));

		$.ajax({
			url:"newMedicineInsert.do",
			data:JSON.stringify(registArr),
			contentType : "application/json",
			type:"post",
			success:function(res){
				console.log("res : " + res);
				alert("성공~");
			},
			error:function(){
				alert("에러ㅓㅓㅓㅓㅓㅓㅓㅓㅓ");
			}
		})
	}
</script>

<!-- [취소]버튼 클릭(새처방작성) -->
<script>
	function newMedicineCancel(){
		alert("취소");
	}
</script>


<!-- checkbox event -->
<script>
  $(function () {
    //Enable check and uncheck all functionality
    $('.checkbox-toggle').click(function () {
      var clicks = $(this).data('clicks')
      if (clicks) {
        //Uncheck all checkboxes
        	$('.mailbox-messages input[class="abled"]').prop('checked', false)
        	$('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
      } else {
        //Check all checkboxes
        	$('.mailbox-messages input[class="abled"]').prop('checked', true)
        	$('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
      }
      $(this).data('clicks', !clicks)
    })
  })
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>
<script  type="text/x-handlebars-template"  id="subMenu-list-template">
	{{#each .}}
		<li class="nav-item subMenu" >
    		<a href="javascript:goPage('<%=request.getContextPath()%>{{murl}}','{{mcode}}');" class="nav-link">
        		<i class="{{micon}}"></i>
          		 <p>{{mname}}</p>
      		</a>
		</li>
	{{/each}}
</script>

<!-- 선택환자 처방전 출력하는 기능 -->
<script  type="text/x-handlebars-template"  id="prescription-list-template">
	{{#each .}}
		<tr class="prescription_tboy" id="prescription_tboy" id="{{psCode}}" onClick="preClick({{psCode}}, '{{psStatus}}')">
			<td>{{inc @index}}</td>
			<td>{{psCode}}</td>
			<td>{{prettifyDate psDate}}</td>
			<td style="text-align: left;">{{medicineName}}</td>
			<td>{{hospitalName}}</td>
			<td>{{memName}}</td>
			{{#eq psStatus "조제완료" }}
				<td class="statusEnd">{{psStatus}}</td>
			{{else eq psStatus "조제대기"}}
				<td class="statusReady">{{psStatus}}</td>
			{{else}}
				<td class="statusUpdate">{{psStatus}}</td>
			{{/eq}}
		</tr>
	{{/each}}
</script>

<script>
Handlebars.registerHelper('eq', function(arg1, arg2, options) {
	 return (arg1 == arg2) ? options.fn(this) : options.inverse(this);
});
</script>

<!-- 과거처방이력에서 처방전 하나 선택 -> 해당 처방전의 상세 내역 출력  -->
<script  type="text/x-handlebars-template"  id="prescriptionDetail-list-template">
	{{#each .}}
		<tr class="prescriptionDetail_tboy psCode" value="{{psCode}}" id="prescriptionDetail_tboy">
			<td>{{inc @index}}</td>
			<td class="statusReady">{{mdClass}}</td>
			<td>{{miType}}</td>
			<td class="miCode" value="{{mdNo}}" >{{mdNo}}</td>
			<td>{{miUse}}</td>
			<td style="text-align: left;">{{mdName}}</td>
			<td>
				<input type="number" base-value="{{preDrugCount}}" class="preDrugCount" value="{{preDrugCount}}" onchange="drugCount(this)" min="1" readonly=true style="width: 35px;">
			</td>
			<td>
				<input type="number" base-value="{{preDrugDay}}" class="preDrugDay" value="{{preDrugDay}}" onchange="drugDay(this)" min="1" readonly=true style="width: 35px;">
			</td>
			<td>급여</td>
			<td><input type="checkbox" class="deleteChk" name="deleteChk" value="{{mdNo}}" disabled=true ></td>
		</tr>
	{{/each}}
</script>


<!-- 이름과 생년월일로 조회된 회원을 출력하는 기능 -->
<script  type="text/x-handlebars-template"  id="lookUp-list-template">
	{{#each .}}
	<tbody id="lookUp_tboy">
		<tr>
			<td>{{inc @index}}</td>
			<td>{{patientName}}</td>
			<td>{{patientRegnum}}</td>
			<td>{{patientPhone}}</td>
		</tr>
	{{/each}}
</script>


<script>

Handlebars.registerHelper("inc", function(value,options){
    return parseInt(value) + 1;
});

Handlebars.registerHelper({
	"prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
		if(timeValue == null){
			return "-";
		}
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		var date=dateObj.getDate();
		return year+"."+month+"."+date;
	},
});


/* 해당 환자의  과거 처방 이력 출력 */
function printData2(list,target,templateObject){
	var template = Handlebars.compile(templateObject.html());
	var html = template(list);
	$('.prescription_tboy').remove();
	target.append(html);
}

/* 과거처방이력에서 처방전 선택 -> 해당 처방전의 상세 내역 출력 */
function printData3(list,target,templateObject){
	var template = Handlebars.compile(templateObject.html());
	var html = template(list);
	$('.prescriptionDetail_tboy').remove();
	target.append(html);
}
</script>



<script>
	function a(){
		<%-- goPage('<%=request.getContextPath()%>${menu.murl}','${menu.mcode}');
		subMenu_go('${menu.mcode}'.substring(0,3)+"0000"); --%>
		var mediName = document.querySelector(".mediName");
	 	//console.log(mediName);
	}

</script>
<!----------------------------------- 전문가 페이지 마침 --------------------------------->





















<script type="text/x-handlebars-template" id="subMenu-list-template">
	{{#each .}}
		<li class="nav-item subMenu" >
    		<a href="javascript:goPage('<%=request.getContextPath()%>{{murl}}','{{mcode}}');" class="nav-link">
        		<i class="{{micon}}"></i>
          		 <p>{{mname}}</p>
      		</a>
		</li>
	{{/each}}
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function() {
		$('.select2').select2()
	});

	function click2(){
		//카카오 지도 발생
	    new daum.Postcode({
	    	oncomplete: function(data) { //선택시 입력값 세팅
	    		document.getElementById("zcode").value = data.zonecode;
	        	document.getElementById("text_adress").value = data.address; // 주소 넣기

	       		document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
	    	}
	    }).open();
	}

</script>

<script>
	$(document).ready(function(){
	   $('[data-toggle="tooltip"]').tooltip();
	});

	Handlebars.registerHelper("inc", function(value,options){
	    return parseInt(value) + 1;

	});

	Handlebars.registerHelper({
		"prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
			if(timeValue == null){
				return "-";
			}
			var dateObj=new Date(timeValue);
			var year=dateObj.getFullYear();
			var month=dateObj.getMonth()+1;
			var date=dateObj.getDate();
			return year+"/"+month+"/"+date;
		},
	});


	function printData4(list,target,templateObject){
		var template = Handlebars.compile(templateObject.html());
		var html = template(list);
		$('.medicineInfoList').remove();
		target.after(html);
	}
</script>
<script>
Handlebars.registerHelper('eq', function(arg1, arg2, options) {
	 return (arg1 == arg2) ? options.fn(this) : options.inverse(this);
});
</script>

<script>
$(function(){
	$('#endDate').change(function(){
		var changeEnd = $(this).val();
		$('#startDate').attr('max',changeEnd);

		var endDate = $('#endDate').val();
		var startDate = $('#startDate').val();

		if(!compareDate(startDate,endDate)){
			$('#startDate').val(endDate);
		}
	});
});

function compareDate(startDate, endDate) {

	var start = new Date(startDate);
	var end = new Date(endDate);

	var result;

	if(start <= end) result = true;
	else result = false;

	return result;
}
</script>


<script>
//대시보드 함수 시작!!!!!!!!!!!!!!!!!!!!!
//최고 방문 연령별 최다 처방 약품 함수
function selectMaximumPxList(target){
	var startDate = setDate(target)[0];
	var endDate = setDate(target)[1];

	var data = {
		"startDate" : startDate,
		"endDate" : endDate
	}

	$.ajax({
		url:"<%=request.getContextPath()%>/expert/viewT/selectSalesStatistics.do",
		type:"post",
		data:JSON.stringify(data),
		contentType:'application/json',
		success:function(data){
			console.log(data);
			if(target == 'm') printData(data,$('#salesStatistics_m'),$('#salesStatistics-list-template'),"salesStatistics");
			if(target == 'w') printData(data,$('#salesStatistics_w'),$('#salesStatistics-list-template'),"salesStatistics");
			if(target == 'y') printData(data,$('#salesStatistics_y'),$('#salesStatistics-list-template'),"salesStatistics");
			if(target == 't') printData(data,$('#salesStatistics_t'),$('#salesStatistics-list-template'),"salesStatistics");
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});

	console.log("startDate : " + startDate)
	console.log("endDate : " + endDate)
}

// 최다판매 약품
function maxSalesDrug(target){
	var startDate = setDate(target)[0];
	var endDate = setDate(target)[1];

	var data = {
		"startDate" : startDate,
		"endDate" : endDate
	}

	$.ajax({
		url:"<%=request.getContextPath()%>/expert/viewT/selectMaximumSalesList.do",
		type:"post",
		data:JSON.stringify(data),
		contentType:'application/json',
		success:function(data){
			console.log(data);
			if(target == 'm') printData(data,$('#maxSalesDrug_m'),$('#maxSalesDrug-list-template'),"maxSalesDrug");
			if(target == 'w') printData(data,$('#maxSalesDrug_w'),$('#maxSalesDrug-list-template'),"maxSalesDrug");
			if(target == 'y') printData(data,$('#maxSalesDrug_y'),$('#maxSalesDrug-list-template'),"maxSalesDrug");
			if(target == 't') printData(data,$('#maxSalesDrug_t'),$('#maxSalesDrug-list-template'),"maxSalesDrug");
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});

	console.log("startDate : " + startDate)
	console.log("endDate : " + endDate)
}

// 재고부족 표시
function stockList(target){

	var data = {
		"keyword" : target
	}

	$.ajax({
		url:"<%=request.getContextPath()%>/expert/viewT/stockList.do",
		type:"post",
		data:JSON.stringify(data),
		contentType:'application/json',
		success:function(data){
			console.log(data);
			if(target == 'stockShortage'){
				printData(data,$('#stockShortage'),$('#stockShortage-list-template'),"stockShortage");
				var stockShortage = document.querySelectorAll('.stockShortage');
				stockShortage.forEach(function(ele){
					var td = ele.querySelectorAll('td')[2];
					if(td.innerText == '긴급'){
						td.style.color = 'red';
					}else if(td.innerText == '주의'){
						td.style.color = '#FF9B00';
					}else {
						td.style.color = 'black';
					}
				});
			}else {
				printData(data,$('#stockEXP'),$('#stockEXP-list-template'),"stockEXP");
				var stockEXP = document.querySelectorAll('.stockEXP');
				stockEXP.forEach(function(ele){
					var td = ele.querySelectorAll('td')[2];
					var td2 = ele.querySelectorAll('td')[1];
					if(td.innerText == '긴급'){
						td.style.color = 'red';
					}else if(td.innerText == '주의'){
						td.style.color = '#FF9B00';
					}else {
						td.style.color = 'black';
					}

					if(td2.innerText == '기간 만료') td2.style.color = 'red';
				});
			}

		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});

}

// 대시보드 날짜 m,w,y,t
function setDate(target) {
	var today = new Date();

	var end = new Date();
	var start = new Date();

	if(target == 'm'){
		start = new Date(start.setMonth(start.getMonth() - 1));
	}

	if(target == 'w'){
		start = new Date(start.setDate(start.getDate() - 7));
	}
	if(target == 'y'){
		start = new Date(start.setDate(start.getDate() - 1));
		end = new Date(end.setDate(end.getDate() - 1));
	}

	var startDate = start.toISOString().substring(0, 10);
	var endDate = end.toISOString().substring(0, 10);

	return [startDate,endDate]
}
$(function(){
	selectMaximumPxList('m');
	maxSalesDrug('m')
	stockList('stockShortage');
	stockList('stockEXP');

	$('#stockEXPStatus').tooltip({title: "<div class='text-left'>긴급 : 7일 미만</div><div class='text-left'>주의 : 30일 미만</div><div class='text-left'>정상 : 30일 이상</div> ", html: true});
	$('#stockStockShortageStatus').tooltip({title: "<div class='text-left'>긴급 : 적정재고 미만</div><div class='text-left'>주의 : 적정재고수 차가 30미만</div><div class='text-left'>정상 : 적정재고수 차가 30이상</div> ", html: true});

});
</script>

<script type="text/x-handlebars-template"  id="salesStatistics-list-template" >
{{#each .}}
<tr class="salesStatistics">
	<td class="text-center">{{rank}}</td>
	<td class="text-left" data-toggle="tooltip" title="{{mdName}}">{{mdName}}</td>
	<td class="text-center">{{age}}대 {{sex}}</td>
	<td class="text-right">{{num}}</td>
</tr>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="maxSalesDrug-list-template" >
{{#each .}}
<tr class="maxSalesDrug">
	<td class="text-center">{{inc @index}}</td>
	<td class="text-left" data-toggle="tooltip" title="{{mdName}}">{{mdName}}</td>
	<td class="text-right" style="padding-right: 18px;">{{numToComma price}}</td>
</tr>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="stockShortage-list-template" >
{{#each .}}
<tr class="stockShortage">
	<td class="text-left" data-toggle="tooltip" title="{{mdName}}">{{mdName}}</td>
	<td class="text-right" style="padding-right: 18px;">{{ownNum}}</td>
	<td class="text-center" style="padding-right: 16px;">{{status}}</td>
</tr>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="stockEXP-list-template" >
{{#each .}}
<tr class="stockEXP">
	<td class="text-left" data-toggle="tooltip" title="{{mdName}}">{{mdName}}</td>
	<td class="text-right" style="padding-right: 16px;">{{gubunFilter gubun}}</td>
	<td class="text-center" style="padding-right: 16px;">{{status}}</td>
</tr>
{{/each}}
</script>

<script type="text/javascript">
$(document.body).tooltip({
	selector : "[data-toggle='tooltip']"
});

// Handlebars 필터함수 및 필터
Handlebars.registerHelper({
	"gubunFilter" : function(data){
		var exp = data;
		if(exp < 0) exp = '기간 만료'

		return exp;
	},
	"componentFilter" : function(component){
		return component.replace(/\[(.*?)\]/gm,'').replaceAll('|',',');
	},
	"signActive" : function(pageNum){
		if(pageNum == nowPage) return 'active';
	},
	"classFilter": function(className){
		return className.replace("의약품","");
	},
	"startNum":function(page){
		return page*5-4;
	},
	"endNum":function(page){
		return page*5;
	},
	"ageRange":function(age){
		var range = age + "~" + (age + 9);
		return range;
	},
	"numToComma":function(num){
		var comma = num.toLocaleString('ko-KR');
		return comma;
	},
	"prettifyDateCompare":function(timeValue){ //Handlbars에 날짜출력함수 등록
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		if(month < 10) month = '0' + month;
		var date=dateObj.getDate();
		if(date < 10) date = '0' + date;
		return year+"."+month+"."+date;
	},
	"inc":function(index){
		return index + 1;
	},
	"eq":function(arg1, arg2, options) {
		 return (arg1 == arg2) ? options.fn(this) : options.inverse(this);
	}
});

function printData(replyArr,target,templateObject,targetName){
	var template=Handlebars.compile(templateObject.html());
	var html = template(replyArr);
	if(targetName == "salesStatistics") $('.salesStatistics').remove();
	if(targetName == "maxSalesDrug") $('.maxSalesDrug').remove();
	if(targetName == "stockShortage") $('.stockShortage').remove();
	if(targetName == "stockEXP") $('.stockEXP').remove();
	target.after(html);
}

/* pagination */
function printPagination(pageMaker,target,templateObject){
	var pageNumArray = new Array(pageMaker.endPage-pageMaker.startPage+1);
	for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNumArray[i]=pageMaker.startPage+i;
	}
	pageMaker.pageNum=pageNumArray;
	pageMaker.prevPageNum=pageMaker.startPage-1;
	pageMaker.nextPageNum=pageMaker.endPage+1;

	var template=Handlebars.compile(templateObject.html());
	var html = template(pageMaker);
	target.html("").html(html);
}

</script>
	<%-- <script>
function goPage(url,mCode){
	//alert(url);
	$('iframe[name="ifr"]').attr("src",url);

	// HTML5 지원브라우저에서 사용 가능
	if (typeof(history.pushState) == 'function') {
	    //현재 주소를 가져온다.
	    var renewURL = location.href;
	    //현재 주소 중 .do 뒤 부분이 있다면 날려버린다.
	    renewURL = renewURL.substring(0, renewURL.indexOf(".do")+3);

	    if (mCode != 'M000000') {
	        renewURL += "?mCode="+mCode;
	    }
	    //페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
	    history.pushState(mCode, null, renewURL);

	} else {
	    location.hash = "#"+mCode;
	}
}

function subMenu_go(mCode){
	//alert(mCode);
	if(mCode!="M000000"){

		$.ajax({
			url:"<%=request.getContextPath()%>/subMenu.do?mCode="+mCode,
			method:"get",
			success:function(data){
				printData(data,$('.subMenuList'),$('#subMenu-list-template'),'.subMenu');
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});


	}else{
		$('.subMenuList').html("");
	}
}


//handelbars printElement (args : data Array, appent target, handlebar template, remove class)
function printData(dataArr,target,templateObject,removeClass){

	var template=Handlebars.compile(templateObject.html());

	var html = template(dataArr);

	$(removeClass).remove();
	target.append(html);
}


</script> --%>
</body>

</html>

