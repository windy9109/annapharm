<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

	<title><decorator:title default="ddit's System"/></title>

  <!-- expert_decorator -->

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <!-- summernote -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.css">

  <!-- <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css"> -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/sweetalert2/sweetalert2.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/toastr/toastr.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css?v=3.2.0">

     <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/menu.css">
         <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/expert.css">


  <decorator:head />

  <style>
   	body { background:#292e33;}
  </style>
</head>
<body>

<div class="wrapper">

<%@ include file="./main/header.jsp" %>

<decorator:body />

<%@ include file="./expert/footer.jsp" %>
</div>

<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js?v=3.2.0"></script>
<!-- summernote -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.js"></script>
<!-- FontAwesome -->
<script src="https://kit.fontawesome.com/1fc71bb455.js" crossorigin="anonymous"></script>

<script src="<%=request.getContextPath() %>/resources/js/common.js" ></script>

<script src="<%=request.getContextPath() %>/resources/js/menu.js" ></script>


<!-- <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> -->
<%-- <script src="<%=request.getContextPath() %>/resources/js/analysisPrescription.js" ></script> --%>
<%-- <script src="<%=request.getContextPath() %>/resources/js/takeStatistics.js" ></script> --%>



<script>
	$('div.wrapper').css({
		"max-width":"1280px",
		"margin":"0 auto"
	});
</script>

<!-- 환자 선택 후 해당 환자 정보 출력 -->
<script>
// function patientClick(code){

// 	console.log("환자코드 : " + code);

// 	$('#registTable').attr("val",code);

// 	$.ajax({
// 		url:"readCode.do",
// 		data : {"code":code},
// 		type:"post",
// 		success:function(res){
// // 			선택 환자 정보
// 			console.log(res.patientInfo);
// // 			console.log(res.preInfo.patient_name);
// // 			console.log(res.preInfo.patient_birth);
// // 			console.log(res.preInfo.patient_phone);
// // 			console.log(res.preInfo.patient_addr);

// 			// 선택한 환자 정보 출력
// 			$('#patient_name').attr('value', res.patientInfo[0].patientName);
// 			$('#patient_birth').attr('value', res.patientInfo[0].patientBirth);
// 			$('#patient_phone').attr('value', res.patientInfo[0].patientPhone);
// 			$('#patient_addr').attr('value', res.patientInfo[0].patientAddr);

// 			// textArea에 주소 출력
// 			var txt = document.getElementById('patient_addr2');
// 			txt.innerHTML = res.patientInfo[0].patientAddr;


// 			//console.log('res : ',res);

// 			//console.log('preinfo : ', res.preInfo);

// 			// 하나의 처방전의 약 갯수 세기
// 			//console.log(res.medicineName.length);

// 			// 하나의 처방전에 약 명 출력하기
// 			// console.log(1, res.medicineName);

// 			//과거 처방 이력 목록
// 			printData2(res.preInfo,$('#prescriptionList'),$('#prescription-list-template'))

// 			//console.log(res.preInfo);

// 			// 환자 선택시 새처방 작성 버튼들 활성화
// 			// [약추가]
// 			$('#newMedicine').attr("disabled", false);
// 			$('#newMedicine').css('background', '#007bff');
// 			// [취소]
// 			$('#newMedicineCancel').attr("disabled", false);
// 			$('#newMedicineCancel').css('background', '#007bff');
// 			// [작성완료]
// 			$('#saveNewMedicine').attr("disabled", false);
// 			$('#saveNewMedicine').css('background', '#007bff');

// 			// [삭제]
// 			$('#deleteMediBtn').attr("disabled", false);
// 			$('#deleteMediBtn').css('background', '#007bff');

// 		},
// 		error:function(){
// 			alert("오류입니다.");
// 		}
// 	});
// }
</script>
<!-- 헤지 : 과거 처방 이력에서 처방전 하나 선택 -> 처방 상세 내역 출력 -->
<script>
// 	function preClick(psCode, psStatus){
//  		console.log(psCode);
//  		console.log(psStatus);

//  		$('#psCodeUpdate').attr("val",psCode);

// 		$.ajax({
// 			url:"readPre.do",
// 			data : {"psCode":psCode,
// 				    "psStatus":psStatus},
// 			type:"post",
// 			success:function(res){
// 				printData3(res.detailInfo,$('#prescriptionDetail'),$('#prescriptionDetail-list-template'))

// 				console.log("res : " + res.psStatus);

// 				if(res.psStatus == "조제대기" || res.psStatus == "수정요청"){
// 					$('#abc').attr("disabled",false);
// 					$('#abc').css('background', '#007bff');
// 				}else if(res.psStatus == "조제완료"){
// 					$('#abc').attr("disabled",true);
// 					$('#abc').css('background', '#6c757d');
// 					disableds();
// 				}


// 			},
// 			error:function(){
// 				alert("오류입니다.");
// 			}
// 		});
// 	}

</script>


<!-- [수정]버튼을 클릭했을때... -->
<script>

// // 횟수, 일수 변경하면 색상 변경됨.
// function drugCount(obj) {  
// // 	console.log("obj1 : " + obj.value);
// // 	console.log("obj2 : " + $(obj).attr("base-value"));

// 	var objChange = obj.value;
// 	var objOriginal = $(obj).attr("base-value");

// 	if(objChange > objOriginal){
// 		obj.style.color = 'red';
// 	}else if(objChange < objOriginal){
// 		obj.style.color = 'blue';
// 	}else{
// 		obj.style.color = 'black';
// 	}
// }

// function drugDay(obj) {  
// // 	console.log("obj1 : " + obj.value);
// // 	console.log("obj2 : " + $(obj).attr("base-value"));

// 	var objChange = obj.value;
// 	var objOriginal = $(obj).attr("base-value");

// 	if(objChange > objOriginal){
// 		obj.style.color = 'red';
// 	}else if(objChange < objOriginal){
// 		obj.style.color = 'blue';
// 	}else{
// 		obj.style.color = 'black';
// 	}
// }


// 	/* [수정]버튼을 클릭했을때... */
// 	function preUpdate(){

// 		// [추가], [저장], [취소] 버튼 활성화
// 		$('#addBtn').attr("disabled",false);
// 		$('#storeBtn').attr("disabled",false);
// 		$('#cancelBtn').attr("disabled",false);
// 		$('#deleteBtn').attr("disabled",false);

// 		// 수정버튼 클릭전 버튼들 배경색  : 회색 -> 파란색
// 		$('#addBtn').css('background', '#007bff');
// 		$('#storeBtn').css('background', '#007bff');
// 		$('#cancelBtn').css('background', '#007bff');
// 		$('#deleteBtn').css('background', '#007bff');

// 		// text수정
// 		$('.preDrugCount').attr("readonly",false);
// 		$('.preDrugDay').attr("readonly",false);

// 		// 약 삭제체크박스 활성화
// 		$('.deleteChk').attr("disabled", false);



// 	}
</script>

<!-- [추가]버튼 클릭시... -->
<script>
// 	function addMedicine(){
<%-- 		window.open('<%=request.getContextPath()%>/addMedicinalDoctor.do','약등록','width=748,height=950,left=600,top=600,location=no,status=no,scrollbars=yes'); --%>
// 	}
</script>

<!-- [약삭제]버튼 클릭시... -->
<script>
// 	function deleteBtn(){
// 		$("input:checkbox[name='deleteChk']:checked").each(function(index,obj){

// 			console.log("삭제 : " + obj.parentElement.parentElement);

// 			var grandparents = obj.parentNode.parentNode;

// 			console.log("부모" + grandparents);

// 			deleteMedicineTr(grandparents);

// // 			$("input:checkbox[name='deletechk']").prop("checked", false);
// 		})
// 	}

// 	// 약 삭제 함수
// 	function deleteMedicineTr(data){

// 		var a = data;
// 		var b = a.children;

// 		console.log("데이터 : " + b);

// 		for(var i=0; i<b.length; i++){
// 			console.log(b[i].innerText);
// 		}

// 		data.remove();
// 	}
</script>

<!-- [저장]버튼 클릭시 -->
<script>
// 	function savePre(){
// 		var miCode = document.querySelectorAll(".miCode");
// 		var preDrugCount = document.querySelectorAll(".preDrugCount");
// 		var preDrugDay = document.querySelectorAll(".preDrugDay");
// 		var psCode = document.querySelectorAll(".psCode");

// 		var arr = [];

// 		// console.log('miCode.length' + miCode.length);

// 		for(var i = 0; i < miCode.length; i++){
// 			var obj = "";

// 			var code = $(miCode[i]).attr("value");
// 			var count = preDrugCount[i].value;
// 			var day = preDrugDay[i].value;
// 			var pscode = $('#psCodeUpdate').attr("val");

// 			obj += '{"mdNo" : "' + code + '"';
// 			obj += ', "preDrugCount" : "' + count + '"';
// 			obj += ', "preDrugDay" : "' + day + '"'
// 			obj += ', "pscode" : "' + pscode + '"}';

// 			arr.push(obj);
// 		}
// 		// console.log(JSON.parse(JSON.stringify(arr)));

// 		$.ajax({
// 			url:"medicineUpdate.do",
// 			data:JSON.stringify(arr),
// 			contentType : "application/json",
// 			type:"post",
// 			success:function(res){
// 				alert("수정되었습니다.");

// 				// 저장 완료한 후 버튼들/텍스트입력/체크박스 비활성화
// 				preClick($('#psCodeUpdate').attr("val"), "조제대기");

// 				$('#addBtn').attr("disabled",true);
// 				$('#storeBtn').attr("disabled",true);
// 				$('#cancelBtn').attr("disabled",true);
// 				$('#deleteBtn').attr("disabled",true);

// 				// 수정버튼 클릭전 버튼들 배경색  : 파란색 -> 회색
// 				$('#addBtn').css('background', '#6c757d');
// 				$('#storeBtn').css('background', '#6c757d');
// 				$('#cancelBtn').css('background', '#6c757d');
// 				$('#deleteBtn').css('background', '#6c757d');
// 			},
// 			error:function(){
// 				alert("수정실패했습니다.");
// 			}
// 		})


// 	}
</script>

<!-- [취소]버튼 클릭시... -->
<script>
// 	function disableds(){
// 		$('#addBtn').attr("disabled",true);
// 		$('#storeBtn').attr("disabled",true);
// 		$('#cancelBtn').attr("disabled",true);
// 		$('#deleteBtn').attr("disabled",true);

// 		// 수정버튼 클릭전 버튼들 배경색  : 파란색 -> 회색
// 		$('#addBtn').css('background', '#6c757d');
// 		$('#storeBtn').css('background', '#6c757d');
// 		$('#cancelBtn').css('background', '#6c757d');
// 		$('#deleteBtn').css('background', '#6c757d');

// 		// text수정
// // 		var b = $('.preDrugCount').attr("value");
// // 		var c = $('.preDrugDay').attr("value");

// // 		$('.preDrugCount').attr("value", b);
// // 		$('.preDrugDay').attr("value", c);

// 		f.reset(); //데이터 초기화

// 		$('.preDrugCount').attr("readonly",true);
// 		$('.preDrugDay').attr("readonly",true);

// 		$('.preDrugCount').css('color', 'black');
// 		$('.preDrugDay').css('color', 'black');

// 		// 약 삭제체크박스 활성화
// 		$('.deleteChk').attr("disabled", true);

// 		// 버튼들/텍스트입력/체크박스 비활성화
// 		preClick($('#psCodeUpdate').attr("val"), "조제대기");

// 	}
</script>


<!-- [약추가]버튼 클릭(새처방작성) -->
<script>
// 	function newMedicine(){
<%-- 		window.open('<%=request.getContextPath()%>/addNewMedicinalDoctor.do','약등록','width=748,height=950,left=600,top=600,location=no,status=no,scrollbars=yes'); --%>
// 	}
</script>

<!-- [작성완료]버튼 클릭(새처방작성) -->
<script>
// 	function saveNewMedicine(){
// 		alert("작성완료");

// 		//환자코드/닥터코드/약번호/횟수/일수

// 		// 환자코드
// 		var patientCode = $('#registTable').attr("val");

// 		// 의사코드
// 		var doctorCode = 'D00001';
// 		// 약번호
// 		var miCode = document.querySelectorAll(".miCode");

// 		// 횟수
// 		var count = document.getElementsByClassName("registCount");
// 		// 일수
// 		var day = document.getElementsByClassName("registDay");

// 		//console.log("약횟수 : " + count);
// 		//console.log("약횟수 : " + day);

// 		var registArr = [];

// 		for(var i = 0; i < miCode.length; i++){
// 			var registObj = "";
// 			// 약코드
// 			var code = $(miCode[i]).attr("value");
// 			// 횟수
// 			var countfor = count[i].value;
// 			// 일수
//  			var dayfor = day[i].value;

// // 			console.log("countfor : " + countfor)
// // 			console.log("dayfor : " + dayfor)

// 			registObj += '{"patientCode" : "' + patientCode + '"';
// 			registObj += ', "mdNo" : "' + code + '"';
// 			registObj += ', "preDrugCount" : "' + countfor + '"'
// 			registObj += ', "preDrugDay" : "' + dayfor + '"}';

// 			registArr.push(registObj);
// 		}

// // 		console.log("registArr" + registArr);
// // 		console.log("JSON.registArr" + JSON.parse(JSON.stringify(registArr)));

// 		$.ajax({
// 			url:"newMedicineInsert.do",
// 			data:JSON.stringify(registArr),
// 			contentType : "application/json",
// 			type:"post",
// 			success:function(res){
// 				console.log("res : " + res);
// 				alert("성공~");
// 			},
// 			error:function(){
// 				alert("에러ㅓㅓㅓㅓㅓㅓㅓㅓㅓ");
// 			}
// 		})
// 	}
</script>

<!-- [취소]버튼 클릭(새처방작성) -->
<script>
// 	function newMedicineCancel(){
// 		alert("취소");
// 		$( '#registTable > tbody').empty();
// 	}
</script>

<!-- [삭제]버튼 클릭(새처방작성) -->
<script>
// 	function deleteMediBtn(){
// 		$("input:checkbox[name='deleteNewChk']:checked").each(function(index,obj){

// 			console.log("삭제 : " + obj.parentElement.parentElement);

// 			var grandparents = obj.parentNode.parentNode;

// 			console.log("부모" + grandparents);

// 			deleteMedicineTr(grandparents);

// // 			$("input:checkbox[name='deletechk']").prop("checked", false);
// 		})
// 	}

// 	// 약 삭제 함수
// 	function deleteMedicineTr(data){

// 		var a = data;
// 		var b = a.children;

// 		console.log("데이터 : " + b);

// 		for(var i=0; i<b.length; i++){
// 			console.log(b[i].innerText);
// 		}

// 		data.remove();
// 	}
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

		if(month < 10) month = "0" + month;
		if(date < 10) date = "0" + date;

		return year+"."+month+"."+date;
	},

});


/* 해당 환자의  과거 처방 이력 출력
function printData2(list,target,templateObject){
	var template = Handlebars.compile(templateObject.html());
	var html = template(list);
	$('.prescription_tboy').remove();
	target.append(html);
}

 과거처방이력에서 처방전 선택 -> 해당 처방전의 상세 내역 출력
function printData3(list,target,templateObject){
	var template = Handlebars.compile(templateObject.html());
	var html = template(list);
	$('.prescriptionDetail_tboy').remove();
	target.append(html);
}
 */
</script>

<%-- <%@ include file="/WEB-INF/views/expert/business_management/compare_js.jsp" %> --%>
<%-- <%@ include file="/WEB-INF/views/expert/business_management/visitor_js.jsp" %> --%>

<script>
	function a(){
		<%-- goPage('<%=request.getContextPath()%>${menu.murl}','${menu.mcode}');
		subMenu_go('${menu.mcode}'.substring(0,3)+"0000"); --%>
		var mediName = document.querySelector(".mediName");
	 	console.log(mediName);
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

  <script>

function changeIframeUrl(url){
		document.getElementById("main_frame_ex").src = url;
	}
</script>

<script>
function goPage(url,mCode){
	//alert(url);
	$('iframe[name="ifr"]').attr("src",url);

 	// HTML5 지원브라우저에서 사용 가능

	if (typeof(history.pushState) == 'function') {
	    //현재 주소를 가져온다.
	    var renewURL = location.href;
	    //현재 주소 중 .do 뒤 부분이 있다면 날려버린다.
	    renewURL = renewURL.substring(0, renewURL.indexOf(".do")+3);

	    if(mCode != 'C000001') {
	        renewURL += "?mCode="+mCode;
	    }
	    //페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
	    history.pushState(mCode, null, renewURL);

	} else {
	   // location.hash = "#"+mCode;
	}
}

 function subMenu_go(mCode){
	//alert(mCode);
	if(mCode!="C000000"){

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

		$.getJSON("<%=request.getContextPath()%>/subMenu.do?mCode="+mCode,function(data){
			printData(data,$('.subMenuList'),$('#subMenu-list-template'),'.subMenu');
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


</script>



</body>

</html>

