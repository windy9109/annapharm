<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
<!-- 이름과 생년월일로 조회된 회원을 출력하는 기능 -->
<script  type="text/x-handlebars-template"  id="lookUp-list-template">
	{{#each .}}
		<tr class="lookupTbody" onclick="fixLineChemist(this);" ondblclick="readyListInsert('{{patientName}}', '{{patientCode}}')" style="cursor:pointer">
			<td>{{inc @index}}</td>
			<td>{{patientName}}</td>
			<td>{{patientRegnum}}</td>
			<td>{{patientPhone}}</td>
		</tr>
	{{/each}}
</script>
<!-- 환자 코드로 환자의 과거 처방 이력을 조회하는 기능 -->
<script  type="text/x-handlebars-template"  id="preList-list-template">
	{{#each .}}
		<tr class="preListTr" val="{{psCode}}" onclick="preListDetail('{{psCode}}',this)"  style="cursor:pointer">
			<td>{{inc @index}}</td>
			<td>{{psType}}</td>
			<td>{{psCode}}</td>
			<td>
				{{prettifyDate psDate}}
			</td>
			{{#compareDatePhmacy psCompleteDate}}
			<td>
				{{prettifyDate psCompleteDate}}
			</td>
			{{else}}
			<td style="background-color:sandybrown">
				{{prettifyDate psCompleteDate}}
			</td>
			{{/compareDatePhmacy}}
			<td>{{hospitalName}}</td>
			<td>{{memName}}</td>
			<td>{{pharmacyName}}</td>
			{{#eq psStatus "조제대기"}}
				<td class="statusReady">{{psStatus}}</td>
			{{else eq psStatus "조제완료"}}
				<td class="statusEnd">{{psStatus}}</td>
			{{else}}
				<td class="statusUpdate">{{psStatus}}</td>
			{{/eq}}
		</tr>
	{{/each}}
</script>

<script>

</script>

<script>
window.onload = function(){
	getCookie('readyList');
}
</script>

<script>
//선택한 행 고정!!!!
function fixLineChemist(target){
// 	console.log(target);
// 	console.log(target.parentNode.querySelectorAll('tr'));
	var tr = target.parentNode.querySelectorAll('tr');
	tr.forEach(function(obj){
		obj.style.backgroundColor = 'white';
		obj.style.fontWeight = 'normal';
	});
	target.style.backgroundColor = '#B9E2FA';
	target.style.fontWeight = 'bold';
}
</script>

<script>
// 환자 조회 엔터키 event
function lookupEnter(){
	if (window.event.keyCode == 13) {
		lookupRead();
	}
}
</script>

<script>
// 과거 처방 이력 중 하나 클릭 시 이벤트
function preListDetail(code, target){
	//alert(code + " 확인");

	// 처방전의 첫번째 약 정보를 가져오는 함수
	readMedicineInfo(code);

	var data = {"psCode":code};

	$.ajax({
		url : "prescriptionDetail",
		type : "post",
		data : data,
		success : function(res){

			fixLineChemist(target);

// 			console.log(res.pdvo.psStatus);

			var psDate = res.pdvo.psLastDate;

			$('#prePsCode').attr('value', res.pdvo.psCode);
			$('#prePsDate').attr('value', res.pdvo.psLastDate);
			$('#preHospitalName').attr('value', res.pdvo.hospitalName);
			$('#preDoctorName').attr('value', res.pdvo.memName);


			if(res.pdvo.pharmacyCode == null){
				$('#prePharmacyName').attr('value', ' -');
				$('#prePharmacistName').attr('value', ' -');
			}else{
				$('#prePharmacyName').attr('value', res.pdvo2.pharmacyName);
				$('#prePharmacistName').attr('value', res.pdvo2.chemistName);
			}
			$('#prePsStatus').attr('value', res.pdvo.psStatus);

			var parent_val = $("#preHospitalName").attr('value');

// 			console.log("parent_val : " + parent_val);

			if(res.pdvo.psStatus == "조제대기"){
				$('#preUpdateBtn').attr("disabled",false);
				$('.paymentBtn').attr("disabled",false);
			}else if(res.pdvo.psStatus == "조제완료" || res.pdvo.psStatus == "수정요청"){
				$('#preUpdateBtn').attr("disabled",true);
				$('.paymentBtn').attr("disabled",true);
			}

			printDataDetail(res.pdList,$('#prescriptionChoiceDetail'),$('#preDetailList-list-template'));
			printDataPrice(res.pdList,$('#receiptMoney'),$('#preDetailPriceList-list-template'));

			let resDay = "";
			let today = new Date();

			let year = today.getFullYear(); // 년도
			let month = today.getMonth() + 1;  // 월
			let date = today.getDate();  // 날짜
			let day = today.getDay();  // 요일

// 			console.log("res.pdvo : " + res.pdvo.totalMedicienBill);
// 			console.log("patientCharge : " + res.pdvo.patientCharge);

			resDay = year + '.' + month + '.' + date;
			var vo = res.pdvo;
			$('#receiptRightDay').text(resDay);	// 조제일자
			$('#receiptRightTotal').text(vo.totalMedicienBill.toLocaleString('ko-KR') + '(￦)');	// 약제비총액
			$('#receiptRightPatient').text(vo.patientCharge.toLocaleString('ko-KR') + '(￦)');	// 본인부담금
			$('#receiptRightCharge').text(vo.charge.toLocaleString('ko-KR') + '(￦)');	// 보험자부담금
			$('#receiptRightNon').text(vo.nonBenefit.toLocaleString('ko-KR') + '(￦)');	// 비급여
			$('#receiptRightPatientTotal').text(vo.patientCharge.toLocaleString('ko-KR') + '(￦)');	// 총 처방금액

			var payTotal = res.pdvo.patientCharge;

			$('#receiptRightPatientTotal').attr("value",payTotal);

// 			console.log("결제 : " + $('#receiptRightPatientTotal').text(res.pdvo[0].patientCharge));

// 			console.log("총 금액 : " + payTotal);

// 			$('#receiptRightPatientTotal').attr
		},
		error : function(){
			alert("[처방전 조회 실패]");
		}
	})
}

// 처방전의 첫번째 약 정보를 가져오는 함수
function readMedicineInfo(code){
	var data = {"psCode":code};

	//console.log(data);
	//console.log(code);

	$.ajax({
		url: "medicineInfo",
		type: "post",
		data: data,
		success:function(res){
			$('#readMName').text(res.mdName);
			$('#readMUrl').attr('onclick', 'OpenWindow("'+res.mdUrl+'", "상세정보", "600", "800")');
			$('#readMEffect').attr('onclick', 'location.href="' + res.mdEffect + '"');
			$('#readMUse').attr('onclick', 'location.href="' + res.mdUse + '"');
			$('#readMAttention').attr('onclick', 'location.href="' + res.mdAttention + '"');
		},
		error:function(error){
			alert("약품 상세 정보 조회에 실패하였습니다.");
		}
	});
}

// 헤지 : 선택한 약 더블클릭 -> 해당 약의 상세정보 출력
function mediDetailInfo(mdNo){
	var data = {"mdNo":mdNo};

	$.ajax({
		url: "medicineInfoChoice",
		type: "post",
		data: data,
		success:function(res){
			window.open(res.mdUrl,'상세정보','width=600,height=800,left=600,top=300,location=no,status=no,scrollbars=yes');
		},
		error:function(error){
			alert("약품 상세 정보 조회에 실패하였습니다.");
		}
	});
}

function mediChoice(mdNo, target){
	var data = {"mdNo":mdNo};

// 	console.log(data);
// 	console.log(mdNo);

	$.ajax({
		url: "medicineInfoChoice",
		type: "post",
		data: data,
		success:function(res){

			fixLineChemist(target);

			$('#readMName').text(res.mdName);
			$('#readMUrl').attr('onclick', 'OpenWindow("'+res.mdUrl+'", "상세정보", "600", "800")');
			$('#readMEffect').attr('onclick', 'location.href="' + res.mdEffect + '"');
			$('#readMUse').attr('onclick', 'location.href="' + res.mdUse + '"');
			$('#readMAttention').attr('onclick', 'location.href="' + res.mdAttention + '"');
		},
		error:function(error){
			alert("약품 상세 정보 조회에 실패하였습니다.");
		}
	});

}

</script>

<script>
//헤지 : 처방전 상세 내역 출력 핸들바스
function printDataDetail(list,target,templateObject){
	btnDisabled();
	var template = Handlebars.compile(templateObject.html());
	var html = template(list);
	$('.preDetailList').remove();
	target.append(html);
}

function printDataPrice(list,target,templateObject){
	btnDisabled();
	var template = Handlebars.compile(templateObject.html());
	var html = template(list);
	$('.preDetailPriceList').remove();
	target.append(html);
}
</script>



<script  type="text/x-handlebars-template"  id="preDetailList-list-template">
	{{#each .}}
		<tr class="preDetailList" id="preDetailList" style="height: 25px;cursor:pointer;" onclick="mediChoice('{{mdNo}}', this)" ondblclick="mediDetailInfo('{{mdNo}}')">
			<td style="padding: 0px; padding-bottom: 4px; width: 30px;">{{inc @index}}</td>

			{{#eq mdClass "전문"}}
				<td class="sortPro" style="width: 33px;">{{mdClass}}</td>
			{{else}}
				<td class="sortGeneral" style="width: 33px;">{{mdClass}}</td>
			{{/eq}}

			<td  class="mdNo" value="{{mdNo}}" style="width: 88px;">{{mdNo}}</td>
			<td data-toggle="tooltip" title="{{mdName}}" style="width: 214px;text-align:left;">{{mdName}}</td>
			<td class="preDrugCount" value="{{preDrugCount}}" style="text-align:right;">{{preDrugCount}}</td>
			<td class="preDrugDay" value="{{preDrugDay}}" style="text-align:right;">{{preDrugDay}}</td>
			<td>{{productPosition}}</td>
			<td style="text-align:right;">{{productOwnnum}}</td>
			<td style="padding-right: 0;width: 40px;">보험</td>
			<td>
				<input type="checkbox" class="deleteChk" id="deleteChk" name="deleteChk" value="{{miCode}}" disabled="true">
			</td>
		</tr>
	{{/each}}
</script>

<script  type="text/x-handlebars-template"  id="preDetailPriceList-list-template">
	{{#each .}}
		<tr class="preDetailPriceList" id="preDetailPriceList">
			<td data-toggle="tooltip" title="{{mdName}}" style="width: 200px; text-align:left;">{{mdName}}</td>
			<td class="mdPrice" value="{{miPrice}}" style="text-align:right;">{{numToComma miPrice}}</td>
		</tr>
	{{/each}}
</script>

<script>
// 환자 정보를 입력 후 조회 버튼 클릭시 이벤트
function lookupRead(){
	$('.lookupTbody').remove();
	var lookUpName = $('#lookUpName').val();
	var lookUpBirth = $('#lookUpBirth').val();

	if(lookUpName == ""){
		alert('이름을 입력해주세요!');
		return;
	}

	if(lookUpBirth == ""){
		alert('생년월일을 입력해주세요!');
		return;
	}
	var data={
			"lookUpName":lookUpName,
			"lookUpBirth":lookUpBirth
	}

	$.ajax({
		url:"lookUp",
		type:"post",
		data:data,
		success:function(data){
			alert('회원이 조회되었습니다.');
			if(data == ""){
				var str = "<tr class='lookupTbody'><td colspan='4'>조회 결과가 없습니다.</td></tr>";
				$('#lookupList').append(str)
			}else{
				printData(data,$('#lookupList'),$('#lookUp-list-template'))
			}
		},
		error:function(error){
			alert('회원 조회에 실패하였습니다.')
		}
	});
}

function printData(list,target,templateObject){
	var template = Handlebars.compile(templateObject.html());
	var html = template(list);
	$('.lookupTbody').remove();
	target.append(html);
}

// 과거 처방 이력 출력 핸들바스 생성
function printDataPreList(list,target,templateObject){
	btnDisabled();
	var template = Handlebars.compile(templateObject.html());
	var html = template(list);
	$('.preListTr').remove();
	target.append(html);
}

// 환자 클릭하고 과거 처방 이력 출력
function preList(data){
	fixLineChemist(data);

	$("#readyList .readyListTr").each(function(i,v){
		$(v).removeClass("test");
	});

	$(data).addClass("test");

	btnDisabled();

	var ptCode = data.getAttribute('val');
	var ptNo = $(data).find('td:eq(0)').text();
	var ptName = $(data).find('td:eq(1)').text();

	$('#newPreBtn').attr('disabled', false);

	// 클릭한 환자의 데이터를 table에 넣기
	$('#prescriptTable').attr('val', ptCode);
	$('#prescriptTable').attr('base-value', ptName);

	// 과거처방이력 옆에 클릭한 환자의 데이터 표시하기
	$('#prescriptSpanNo').text(ptNo);
	$('#prescriptSpanName').text(ptName);

	$.ajax({
		url:"preList.do",
		type:"post",
		data: {"ptCode":ptCode},
		success:function(data){
			if(data == ""){
				$('.preListTr').remove();
				var str = "<tr class='preListTr'><td colspan='9'>조회 결과가 없습니다.</td></tr>";
				$('#preList').append(str)
			}else{
				printDataPreList(data,$('#preList'),$('#preList-list-template'))
			}
		},
		error:function(error){
			alert('과거 내역 조회에 실패하였습니다.')
		}
	});
}
</script>

<script>

 var readyListCount = 0;
 // 대기열 추가
 function readyListInsert(ptName, ptCode){

	 var overlapCheck = new Array();
	 overlapCheck = document.getElementsByClassName('readyListTr');
	 //console.log('확인', overlapCheck.length);

	 // 쿠키와 숫자 중복 방지
	 if(overlapCheck.length > 0){
		readyListCount = overlapCheck[overlapCheck.length - 1].children[0].innerText;
	 }

	 // 환자 중복 등록 방지
	 if(overlapCheck.length > 0){
		 for(let i = 0; i < overlapCheck.length; i++){
			 if(overlapCheck[i].getAttribute('val') == ptCode){
				 alert('이미 대기열에 등록된 환자입니다,');
				return;
			 }
		 }
	 }
	 // 대기열 숫자 증가
	 readyListCount++;

	 var str = "<tr val="+ ptCode +" class='readyListTr' style='cursor:pointer' onclick='preList(this)' ondblclick='listDelete("+'"'+ ptName +'"'+", this)'><td>"+ readyListCount +"</td><td>" + ptName + "</td></tr>";
	 $('#readyList').append(str);

	 forJson(overlapCheck);
 }

 function forJson(data){
	 for(let j = 0; j < data.length; j++){
		 var readyData = "";
		 for(let i = 0; i < data.length; i++){
			 if(i != 0){
			 	readyData += ",";
			 }
			 var readyCount = data[i].children[0].innerText;
			 var readyName = data[i].children[1].innerText;
			 var readyCode = data[i].getAttribute('val')

			 readyData += '{"count" : "' + readyCount + '"';
			 readyData += ', "name" : "' + readyName + '"';
			 readyData += ', "code" : "' + readyCode + '"}';
		 }
		 var readyJson = "[" + readyData + "]";
	 }

// 	 console.log(readyJson);
// 	 console.log(JSON.stringify(readyJson));
	 setInstantCookie('readyList', readyJson);
 }

</script>

<script>
// 약국 대기목록에서 대기 환자 삭제
function listDelete(name, data){
	var deleteCheck = confirm(name +' 환자를 대기열에서 지우시겠습니까?')

	if(deleteCheck){
		data.remove();
		alert(name + ' (님)이 대기 목록에서 삭제되었습니다.');
		var overlapCheck = new Array();
		overlapCheck = document.getElementsByClassName('readyListTr');
		forJson(overlapCheck);
	}else{
		alert('작업이 취소되었습니다.');
	}
}
</script>

<script>
// 브라우저가 닫히면 없어지는 쿠키 생성
function setInstantCookie(cName, cValue){
	var expire = new Date();
	cookies = cName + '=' + escape(cValue)+";"; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
	document.cookie = cookies;
// 	alert(JSON.parse(document.cookie));
//	alert(document.cookie);
}

// 쿠키 가져오기 함수
function getCookie(cName) {
	cName = cName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cName);
	var cValue = '';
	if(start != -1){
		start += cName.length;
		var end = cookieData.indexOf(';', start);
			if(end == -1)end = cookieData.length;
		cValue = cookieData.substring(start, end);
	}
	//console.log(cValue);
// 	console.log(unescape(cValue));
// 	console.log('테스트',JSON.parse(unescape(cValue)));
	//console.log('테스트',JSON.parse(unescape(cValue))[0].name);
	//console.log('테스트2',JSON.parse(unescape(cValue)).length);
	if(unescape(cValue)){
		var result = JSON.parse(unescape(cValue));
		var resultStr = "";
		var count = 0;

		for(let i = 0; i < result.length; i++){
			resultStr += "<tr val="+ result[i].code +" class='readyListTr' style='cursor:pointer;' onclick='preList(this)' ondblclick='listDelete("+'"'+ result[i].name +'"'+", this)'><td>"+ result[i].count +"</td><td>" + result[i].name + "</td></tr>";
			count = result[i].count;
		}

		$('#readyList').append(resultStr)
	}
	return count;
	}

</script>


<!-- 약사 창에서 [등록]버튼 클릭 : 환자 등록 창 오픈 -->
<script>
	function memberInsert(){
		window.open('<%=request.getContextPath() %>/pharmacist/addPatient.do','환자등록','width=400,height=270,left=600,top=300,location=no,status=no,scrollbars=yes');
	}

</script>

<!-- 헤지 : 약사 수정요청 -->
<script>
	function requestUpdatePre() {
		// window.name = "부모창 이름"; 
		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
		var openWin2 = window.open('<%=request.getContextPath() %>/pharmacist/requestUpdatePrescription.do','처방수정요청','width=500,height=400,left=600,top=150,location=no,status=no,scrollbars=yes');

// 		console.log("하이 : " + document.getElementById("preHospitalName").value)

		// 병원명
		var hosName = document.getElementById("preHospitalName").value;
		// 의사명
		var doctorName = document.getElementById("preDoctorName").value;
		// 약사명
		var chemistName = document.getElementById("sessionChemistName").value;
		// 약국명
		var pharmacyName = document.getElementById("sessionPharmacyName").value;
		// 환자코드
		var ptCode = $('#prescriptTable').attr('val');
		// 약사코드
		var cmCode = document.getElementById("sessionChemistCode").value;
		// 약국코드
		var pcCode = document.getElementById("sessionPharmacyCode").value;
		// 처방전코드
		var psCode = $('#prePsCode').attr('value');
		// 환자이름
		var patientName = $('#prescriptTable').attr('base-value');


// 		console.log("환자코드 : " + ptCode);
// 		console.log("환자이름 : " + patientName);
// 		console.log("약사코드 : " + cmCode);
// 		console.log("약국코드 : " + pcCode);
// 		console.log("처방전코드 : " + psCode);

		setTimeout(() => {
// 			console.log(openWin2.document.getElementById("hosNameRequest"));
// 			console.log(openWin2.$('#hosNameRequest'));

			// 병원명
			openWin2.document.getElementById("hosNameRequest").value = hosName;
			// 의사명
			openWin2.document.getElementById("DoctorNameRequest").value = doctorName;
			// 환자코드
			openWin2.document.getElementById("PatientCodeRequest").value = ptCode;
			// 환자이름
			openWin2.document.getElementById("PatientNameRequest").value = patientName;
			// 처방전코드
			openWin2.document.getElementById("PrescriptionRequest").value = psCode;
			// 약사명
			openWin2.document.getElementById("ChemistNameRequest").value = chemistName;
			// 약사코드
			openWin2.document.getElementById("ChemistCodeRequest").value = cmCode;
			// 약국명
			openWin2.document.getElementById("PharmacyNameRequest").value = pharmacyName;
			// 약국코드
			openWin2.document.getElementById("PharmacyCodeRequest").value = pcCode;
		}, 800);



// 		openWin2.document.getElementById("hosNameRequest").value = hosName;
	}
</script>

<!-- 헤지 : 약사가 [새처방]클릭 -->
<script>
	function newPreForChemist(){
		// 처방상세내역 비우기
		$('.preDetailList').remove();
		// 처방전코드 비우기
		$('#prePsCode').attr("value"," -");
		// 처방전상태 비우기
		$('#prePsStatus').attr("value"," -");

		window.open('<%=request.getContextPath()%>/pharmacist/addMedicinalChemist.do','약등록','width=748,height=950,left=600,top=600,location=no,status=no,scrollbars=yes');
	}
</script>

<script>
	function btnDisabled(){

		// 버튼들 비활성화하기
		$('#newMedicineForChemist').attr("disabled",true);
		$('#deleteMediBtnForChemist').attr("disabled",true);
		$('#saveNewMedicineForChemist').attr("disabled",true);
		$('#newMedicineCancelForChemist').attr("disabled",true);

		// 버튼들 배경색  : 파란색 -> 회색
		$('#newMedicineForChemist').css('background', '#6c757d');
		$('#deleteMediBtnForChemist').css('background', '#6c757d');
		$('#saveNewMedicineForChemist').css('background', '#6c757d');
		$('#newMedicineCancelForChemist').css('background', '#6c757d');
	}
</script>

<!-- 헤지 : [추가] -->
<script>
	function newMedicineForChemist(){
		window.open('<%=request.getContextPath()%>/pharmacist/addMedicinalChemist.do','약등록','width=748,height=950,left=600,top=600,location=no,status=no,scrollbars=yes');
	}
</script>


<!-- [삭제]버튼 클릭시... -->
<script>
	function deleteMediBtnForChemist(){
		$("input:checkbox[name='deleteChk']:checked").each(function(index,obj){

			console.log("삭제 : " + obj.parentElement.parentElement);

			var grandparents = obj.parentNode.parentNode;

			console.log("부모" + grandparents);

			deleteMedicineTr(grandparents);

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

<!-- [저장]버튼 눌렀을때... -->
<script>
	function saveNewMedicineForChemist(){
// 		alert("저장");

		// 버튼비활성화
		btnDisabled();

		// 횟수, 일수 비활성화
		$('.registCountForChemist').attr("readonly", true);
		$('.registDayForChemist').attr("readonly", true);
		// 횟수, 일수 글자색 검정
		$('.registCountForChemist').css('color', 'black');
		$('.registDayForChemist').css('color', 'black');

		// 체크박스 비활성화
		$('.deleteChk').attr("disabled", true);

		// 약사코드
		var chemistCode = $('#sessionChemistCode').val();
// 		console.log("약사코드 : " + chemistCode);

		// 약국코드
		var pharmacyCode = $('#sessionPharmacyCode').val();
// 		console.log("약국코드 : " + pharmacyCode);

		// 환자코드
		var patientCode = $('#prescriptTable').attr('val');
// 		console.log("환자코드 : " + patientCode);

		// 약번호
		var mdNo = document.querySelectorAll(".mdNo");

		// 횟수
		var count = document.getElementsByClassName("registCountForChemist");
		// 일수
		var day = document.getElementsByClassName("registDayForChemist");

		var arr = [];

		for(var i = 0; i < mdNo.length; i++){
			var obj = "";

			var mediNo = $(mdNo[i]).attr("value");
			// 횟수
			var countfor = count[i].value;
			// 일수
 			var dayfor = day[i].value;

			obj += '{"mdNo" : "' + mediNo + '"';
			obj += ', "patientCode" : "' + patientCode + '"'
			obj += ', "chemistCode" : "' + chemistCode + '"'
			obj += ', "pharmacyCode" : "' + pharmacyCode + '"'
			obj += ', "preDrugCount" : "' + countfor + '"'
			obj += ', "preDrugDay" : "' + dayfor + '"}';

			arr.push(obj);
		}

		console.log("JSON.registArr" + JSON.parse(JSON.stringify(arr)));

		var patientName = $('#prescriptTable').attr("base-value");
		console.log("환자이름 : " + patientName);

// 		window.location.reload();
// 		preList(patientName);

		$.ajax({
			url:"newMedicineInsertForChemicist.do",
			data:JSON.stringify(arr),
			contentType : "application/json",
			type:"post",
			success:function(res){
// 				console.log("res : " + res);
				alert("처방전 작성 완료");
				$("#readyList .test").trigger("click");
// 				window.location.reload();
// 				preListDetail(code);

			},
			error:function(){
				alert("에러ㅓㅓㅓㅓㅓㅓㅓㅓㅓ");
			}
		})

// 		console.log("약번호 : " + mdno);
// 		console.log("처방전코드 : " + psCode);

		var mdName = document.querySelectorAll(".mdName");

		var nameArr = [];

		for(var i = 0; i < mdName.length; i++){
			var nameObj = "";

			var mediName = $(mdName[i]).attr("value");

			nameObj += '{"mdName" : "' + mediName + '"}';

			nameArr.push(nameObj);
		}
	}
</script>

<!-- [취소]버튼 눌렀을때... -->
<script>
	function newMedicineCancelForChemist(){
		btnDisabled();
		$('.preDetailList').remove();
		$('#prePsDate').attr("value", " -");
	}
</script>

<!-- 결제API 시작 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
function payment(){
	var payTotal = $('#receiptRightPatientTotal').attr("value");
	var patientName = $('#prescriptTable').attr("base-value");
	var patientId = $('#prescriptTable').attr("val");
	var pharmacyName = $('#sessionPharmacyName').val();
// 	var psCode = $('#prePsCode').attr('value');

	// 결제
	$('.paymentBtn').attr("disabled",true);
	// 조제완료버튼 활성화
	$('.successBtn').attr("disabled",false);
	$('.successBtn').css('background', '#1E82FF');
	// 수정버튼비활성화
	$('.preUpdateBtn').attr("disabled",true);
	// 새처방버튼 비활성화
	$('.newPreBtn').attr("disabled", true);

	const min=0;
    const max=100000;
    let randomNumber = Math.floor(Math.random() * (max-min)) + min;

	var IMP = window.IMP;
    IMP.init('imp14750440');

	IMP.request_pay({
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: randomNumber,	// 처방전코드
        name: pharmacyName,
        amount: payTotal,
        buyer_id: "gildong@gmail.com",
        buyer_name: patientName,
//         buyer_tel: "010-4242-4242",
//         buyer_addr: "서울특별시 강남구 신사동",
//         buyer_postcode: "01181"
    }, function (rsp) {
        if (rsp.success) {
			// 결제
			$('.paymentBtn').attr("disabled",true);
			// 조제완료버튼 활성화
			$('.successBtn').attr("disabled",false);
			$('.successBtn').css('background', '#1E82FF');
			// 수정버튼비활성화
			$('.preUpdateBtn').attr("disabled",true);
			// 새처방버튼 비활성화
			$('.newPreBtn').attr("disabled", true);

			// 환자, 처방전 클릭 비활성화
			$('.readyListTr').attr("onclick",false);
			$('.preListTr').attr("onclick",false);
        } else {
        	alert("결제 실패(취소)했습니다.");
        }
		console.log(rsp);
    });
}
</script>
<!-- 결제API 끝~~ -->

<!-- [조제완료]버튼 -->
<script>
	function paySuccess(){
		// 처방전코드O, 약사코드O, 약국코드O, 환자코드O, 약번호O, 약갯수O, 약의 각 판매가, 총 판매가

		// 처방전코드
		var psCode = $('#prePsCode').attr('value');
		// 환자코드
		var ptCode = $('#prescriptTable').attr('val');
		// 약사코드
		var cmCode = document.getElementById("sessionChemistCode").value;
		// 약국코드
		var pcCode = document.getElementById("sessionPharmacyCode").value;
		// 약번호
		var mdNo = document.querySelectorAll(".mdNo");
		// 일수
		var mediDay = document.querySelectorAll(".preDrugDay");
		// 횟수
		var mediCount = document.querySelectorAll(".preDrugCount");
		// 약의 각각 가격
		var mediPrice = document.querySelectorAll(".mdPrice");
		// 총 결제금액
		var totalPrice = $('#receiptRightPatientTotal').attr('value');

		var mediArr = [];

		for(var i = 0; i < mediCount.length; i++){
			var mediObj = "";

			var mediNo = $(mdNo[i]).attr("value");
			var mediCountVal = $(mediCount[i]).attr("value");
			var mediDayVal = $(mediDay[i]).attr("value");
			var mediNum = mediCountVal * mediDayVal;
			var mediPriceVal = $(mediPrice[i]).attr("value");

			mediObj += '{"psCode" : "' + psCode + '"';	// 처방전코드
			mediObj += ', "chemistCode" : "' + cmCode + '"'	// 약사코드
			mediObj += ', "pharmacyCode" : "' + pcCode + '"'	// 약국코드
			mediObj += ', "patientCode" : "' + ptCode + '"'	// 환자코드
			mediObj += ', "mdNo" : "' + mediNo + '"'	// 약번호
			mediObj += ', "mediNum" : "' + mediNum + '"';	// 약 갯수
			mediObj += ', "saleCartPrice" : "' + mediPriceVal + '"'	// 약의 각각 가격
			mediObj += ', "salePrice" : "' + totalPrice + '"}';	// 총 판매가

			mediArr.push(mediObj);
		}

		console.log("JSON.registArr" + JSON.parse(JSON.stringify(mediArr)));

		$.ajax({
			url:"chemistPrescriptionComplete.do",
			data:JSON.stringify(mediArr),
			contentType : "application/json",
			type:"post",
			success:function(res){
// 				console.log("res : " + res);
				alert("[처방전 조제 완료]");

				// 선택한 환자의 대기번호
				var readyNo = document.getElementById("prescriptSpanNo").innerText;

				var overlapCheck = new Array();
				overlapCheck = document.getElementsByClassName('readyListTr');

				for(var i = 0; i < overlapCheck.length; i++){
					var cells = overlapCheck[i].getElementsByTagName("td");

		      		var cell_1 = cells[0].firstChild.data;	// 대기환자번호
//		       		console.log("cell_1 -> " + cell_1);

		      		if(readyNo == cell_1){
		      			overlapCheck[i].remove();
		      		}

		      		forJson(overlapCheck);
				}

				window.location.reload();
// 				preListDetail(code);
				$('.readyListTr')
			},
			error:function(){
				alert("[처방전 조제 실패]");
			}
		})

// 		alert("조제완료");
	}
</script>



