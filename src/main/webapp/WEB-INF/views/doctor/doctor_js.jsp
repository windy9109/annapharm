<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>
<!-- 헤지 : 의사)처방완료환자목록  -->
<script  type="text/x-handlebars-template"  id="psStatusReadyPatientList-list-template">
		{{#each .}}
			<tr class="psStatusReadyPatientListTr" value="{{patientCode}}" onclick="patientClick('{{patientCode}}', this)" style="height:26px;">
				<td>{{no}}</td>
				<td>{{patientName}}</td>
				<td>{{patientBirth}}</td>
				<td>{{psTime}}</td>
			</tr>
		{{/each}}
</script>

<script type="text/x-handlebars-template"  id="psStatusReadyPatientList-pagination-template" >
<ul id="pagination" class="pagination pagination-sm justify-content-center m-0" >
	<li class="paginate_button page-item">
		<a href="javascript:doctorReady(1);" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-double-left'></i>
		</a>
	</li>
	<li class="paginate_button page-item">
		<a href="javascript:doctorReady({{#if prev}}{{prevPageNum}}{{else}}1{{/if}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-left'></i>
		</a>
	</li>
	{{#each pageNum}}
	<li class="paginate_button page-item {{signActive2 this}}">
		<a href="javascript:doctorReady({{this}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			{{this}}
		</a>
	</li>
	{{/each}}

	<li class="paginate_button page-item ">
		<a href="javascript:doctorReady({{#if next}}{{nextPageNum}}{{else}}{{realEndPage}}{{/if}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-right'></i>
		</a>
	</li>
	<li class="paginate_button page-item">
		<a href="javascript:doctorReady({{realEndPage}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-double-right'></i>
		</a>
	</li>
</ul>
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
				<input type="number" baseValue="{{preDrugCount}}" class="preDrugCount" value="{{preDrugCount}}" onchange="drugCount(this)" min="1" readonly=true style="width: 35px;">
			</td>
			<td>
				<input type="number" baseValue="{{preDrugDay}}" class="preDrugDay" value="{{preDrugDay}}" onchange="drugDay(this)" min="1" readonly=true style="width: 35px;">
			</td>
			<td>급여</td>
			<td><input type="checkbox" class="deleteChk" name="deleteChk" value="{{mdNo}}" disabled=true ></td>
		</tr>
	{{/each}}
</script>

<!-- 선택환자 처방전 출력하는 기능 -->
<script  type="text/x-handlebars-template"  id="prescription-list-template">
	{{#each .}}
		<tr class="prescription_tboy" val="{{psStatus}}" id="prescription_tboy" id="{{psCode}}" onClick="preClick({{psCode}}, '{{psStatus}}', this)" style="cursor:pointer">
			<td>{{inc @index}}</td>
			<td>{{psCode}}</td>
			<td>{{prettifyDate psDate}}</td>
			<td style="text-align: left;">{{medicineName}}</td>
			<td>{{hospitalName}}</td>
			<td>{{memName}}</td>
			{{#eq psStatus "조제완료" }}
				<td class="psStatus statusEnd">{{psStatus}}</td>
			{{else eq psStatus "조제대기"}}
				<td class="psStatus statusReady">{{psStatus}}</td>
			{{else}}
				<td class="statusUpdate" val="update">{{psStatus}}</td>
			{{/eq}}
		</tr>
	{{/each}}
</script>


<!-- 환자 선택 후 해당 환자 정보 출력 -->
<script>
// 처방 완료 환자 목록 출력
function doctorReady(page){

	if(page) nowPage2 = page;

	var doctorCode = $('#doctorCode').val();

	console.log("의사코드 : " + doctorCode);

	// 처방완료환자목록
	$.ajax({
		url : "psStatusReadyPatient",
		data : {
			"doctorCode" : doctorCode,
			"page" : nowPage2
		},
		type : "post",
		success : function(res) {
			console.log(res)
			printPatientDoctor(res.patientList, $('#psStatusReadyPatientList'), $('#psStatusReadyPatientList-list-template'))
			printPaginationDoctor(res.pageMaker,$('#psStatusReadyPatientPagenation'),$('#psStatusReadyPatientList-pagination-template'));
		},
		error : function() {
			alert("처방 완료 환자 목록 에러");
		}
	})
}

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

<!-- [삭제]버튼 클릭(새처방작성) -->
<script>
	function deleteMediBtn(){
		$("input:checkbox[name='deleteNewChk']:checked").each(function(index,obj){

			//console.log("삭제 : " + obj.parentElement.parentElement);

			var grandparents = obj.parentNode.parentNode;

			//console.log("부모" + grandparents);

			deleteMedicineTr(grandparents);

// 			$("input:checkbox[name='deletechk']").prop("checked", false);
		})
	}

	// 약 삭제 함수
	function deleteMedicineTr(data){

		var a = data;
		var b = a.children;

// 		console.log("데이터 : " + b);

		for(var i=0; i<b.length; i++){
			//console.log(b[i].innerText);
		}

		data.remove();
	}
</script>

<!-- [취소]버튼 클릭(새처방작성) -->
<script>
	function newMedicineCancel(){
		$( '#registTable > tbody').empty();

	}
</script>

<!-- [약추가]버튼 클릭(새처방작성) -->
<script>
	function newMedicine(){
		window.open('<%=request.getContextPath()%>/addNewMedicinalDoctor.do','약등록','width=748,height=950,left=600,top=600,location=no,status=no,scrollbars=yes');
	}
</script>

<!-- [저장]버튼 클릭(새처방작성) -->
<script>
	function saveNewMedicine(){
// 		alert("작성완료");

		//환자코드/닥터코드/약번호/횟수/일수

		// 환자코드
		var patientCode = $('#registTable').attr("val");
		console.log("환자코드 : " + patientCode);

		// 의사코드
		var doctorCode = $('#doctorCode').val();
		console.log("의사코드:" , doctorCode);

		// 약번호
		var miCode = document.querySelectorAll(".miCode");

		// 횟수
		var count = document.getElementsByClassName("registCount");
		// 일수
		var day = document.getElementsByClassName("registDay");

		console.log("약횟수 : " + count);
		console.log("약횟수 : " + day);

		var registArr = [];

		for(var i = 0; i < miCode.length; i++){
			var registObj = "";
			// 약코드
			var code = $(miCode[i]).attr("value");
			// 횟수
			var countfor = count[i].value;
			// 일수
 			var dayfor = day[i].value;

			console.log("countfor : " + countfor)
			console.log("dayfor : " + dayfor)

			registObj += '{"patientCode" : "' + patientCode + '"';
			registObj += ', "doctorCode" : "' + doctorCode + '"';
			registObj += ', "mdNo" : "' + code + '"';
			registObj += ', "preDrugCount" : "' + countfor + '"'
			registObj += ', "preDrugDay" : "' + dayfor + '"}';

			registArr.push(registObj);
		}

		console.log("registArr" + registArr);
		console.log("JSON.registArr" + JSON.parse(JSON.stringify(registArr)));

		$.ajax({
			url:"newMedicineInsert.do",
			data:JSON.stringify(registArr),
			contentType : "application/json",
			type:"post",
			success:function(res){
// 				console.log("res : " + res);
				alert("[처방전 작성 완료]");
				window.location.reload();
			},
			error:function(){
				alert("[처방전 작성 실패]");
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

<!-- '수정요청'처방전 변경 후 저장 (처방전상태 변경, 대기열에서 환자 제거) -->
<script>
	function modifyUpdatePre(){

		var psStatus = $('.prescription_tboy').attr('val');

		var tableId = $('#psCodeUpdate').attr('val');
		var test = document.getElementsByClassName('prescription_tboy');
		var test2 = [];

		var psCode = "";

		for(let i = 0; i < test.length; i++){
			var res = $(test)[i].childNodes[3].innerHTML;

			if(res == tableId){
				psCode = $(test)[i].childNodes[3].innerHTML;
			}
		}


		// 처방전코드

		// 환자코드
// 		var patientCode = $('.patientTr').attr('value');
		var patientCode = $('#registTable').attr("val");
// 		console.log("환자 : " + patientCode);

		var data = {
				"psCode":psCode ,
				"patientCode":patientCode
				}
		console.log("data : "+JSON.stringify(data));

		$.ajax({
			url : "updatePsStatus",
			type : "post",
			data : JSON.stringify(data),
			contentType:"application/json",
			success : function(res){
// 				console.log("수정")
				window.location.reload();
			},
			error : function(error){
				alert("수정실패했습니다.")
			}
		})
	}

</script>

<!-- [저장]버튼 클릭시 -->
<script>
	function savePre(){

		var psStatus = $('.prescription_tboy').attr('val');

		var tableId = $('#psCodeUpdate').attr('val');
		var test = document.getElementsByClassName('prescription_tboy');
		var test2 = [];

		for(let i = 0; i < test.length; i++){
			var res = $(test)[i].childNodes[3].innerHTML;

			if(res == tableId){
				var statusCheck = $(test)[i].childNodes[13].innerHTML;
				if(statusCheck == "수정요청"){
					modifyUpdatePre();
				}
			}
		}

// 		console.log("처방전상태 : " + psStatus);

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

<!-- [수정]버튼을 클릭했을때... -->
<script>

// 횟수, 일수 변경하면 색상 변경됨.
// 횟수
function drugCount(obj) {  

	var objChange = obj.value;
	var objOriginal = $(obj).attr("baseValue");

	if(objChange > objOriginal){
		obj.style.color = 'red';
	}else if(objChange < objOriginal){
		obj.style.color = 'blue';
	}else{
		obj.style.color = 'black';
	}
}

// 일수
function drugDay(obj) {  
// 	console.log("obj1 : " + obj.value);
// 	console.log("obj2 : " + $(obj).attr("base-value"));

	var objChange = obj.value;
	var objOriginal = $(obj).attr("baseValue");

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

<script>

	function preUpdateRequest(psCode){
// 		console.log("코드 : "+ psCode);
		var url = "<%=request.getContextPath() %>/patient/preUpdateRequest.do?psCode="+psCode;

		var openWin2 = window.open(url,'처방수정요청','width=500,height=400,left=600,top=150,location=no,status=no,scrollbars=yes');
	}

</script>

<script>
// $(document.body).tooltip({
// 	   selector : "[data-toggle='tooltip']"
// 	})
</script>

<!-- 환자 선택 후 해당 환자 정보 출력 -->
<script>

$("select[name=select]").change(function(){
// 	  $('#selectDoctor').attr("value",$(this).val()); //value값 가져오기
// 	  console.log($(this).val());
// 	  console.log($(this).attr('data-code'));
	  var psTime = $(this).val();
	  var patientCode = $(this).attr('data-code');
	  patientClick(patientCode, 'flag',psTime)

});

function patientClick(patientCode, target, psTime){

	if(target != "flag"){
		var patinetClickList = document.getElementsByClassName('patientTr');
		var patinetClickList2 = document.getElementsByClassName('psStatusReadyPatientListTr');

		if(patinetClickList != null || patinetClickList != ""){
			for(let i = 0; i < patinetClickList.length; i++){
				patinetClickList[i].style.backgroundColor = 'white';
				patinetClickList[i].style.fontWeight = 'normal';
			}
		}

		if(patinetClickList2 != null || patinetClickList2 != ""){
			for(let i = 0; i < patinetClickList2.length; i++){
				patinetClickList2[i].style.backgroundColor = 'white';
				patinetClickList2[i].style.fontWeight = 'normal';
			}
		}
		fixLineDoctor(target);
	}


	var time = 365;
	if(psTime) time = psTime;

	document.querySelector('#selectDoctor').setAttribute('data-code',patientCode);

	console.log("환자코드 : " + patientCode);
	console.log("time : " + time);


	$('#registTable').attr("val",patientCode);

	$.ajax({
		url:"readCode.do",
		data : {
			"patientCode":patientCode,
			"psTime" : time

		},
		type:"post",
		success:function(res){
// 			선택 환자 정보
			console.log(res.patientInfo);
// 			console.log(res.preInfo.patient_name);
// 			console.log(res.preInfo.patient_birth);
// 			console.log(res.preInfo.patient_phone);
// 			console.log(res.preInfo.patient_addr);

			// 선택한 환자 정보 출력
			$('#patient_name').attr('value', res.patientInfo[0].patientName);
			$('#patient_birth').attr('value', res.patientInfo[0].patientBirth);
			$('#patient_phone').attr('value', res.patientInfo[0].patientPhone);
			$('#patient_addr').attr('value', res.patientInfo[0].patientAddr);

			// textArea에 주소 출력
			var txt = document.getElementById('patient_addr2');
			txt.innerHTML = res.patientInfo[0].patientAddr;


			//console.log('res : ',res);

			//console.log('preinfo : ', res.preInfo);

			// 하나의 처방전의 약 갯수 세기
			//console.log(res.medicineName.length);

			// 하나의 처방전에 약 명 출력하기
			// console.log(1, res.medicineName);

			// 과거처방이력이 없는 환자일 경우...
			if(res.preInfo == null){
				var str = "<tr><td colspan='7'>과거 처방 이력이 없습니다.</td></tr>";
				$('#prescriptionList').append(str);
			}else{
				printData2(res.preInfo,$('#prescriptionList'),$('#prescription-list-template'))
			}

			//과거 처방 이력 목록

			// 다른 환자 선택시 처방 상세 내역 비우기
			$( '#psCodeUpdate > tbody').empty();

			// 다른 환자 선택시 [수정]버튼 비활성화
			$('#abc').attr("disabled",true);
			$('#abc').css('background', '#6c757d');

			// 다른 환자 선택시 [추가], [삭제], [취소], [저장] 버튼들 비활성화
			$('#addBtn').attr("disabled",true);
			$('#storeBtn').attr("disabled",true);
			$('#cancelBtn').attr("disabled",true);
			$('#deleteBtn').attr("disabled",true);

			// 수정버튼 클릭전 버튼들 배경색  : 파란색 -> 회색
			$('#addBtn').css('background', '#6c757d');
			$('#storeBtn').css('background', '#6c757d');
			$('#cancelBtn').css('background', '#6c757d');
			$('#deleteBtn').css('background', '#6c757d');

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

			// [삭제]
			$('#deleteMediBtn').attr("disabled", false);
			$('#deleteMediBtn').css('background', '#007bff');

		},
		error:function(){
			alert("오류입니다.");
		}
	});

}
</script>
<!-- 헤지 : 과거 처방 이력에서 처방전 하나 선택 -> 처방 상세 내역 출력 -->
<script>
	function preClick(psCode, psStatus, target){
 		console.log(psCode);
 		console.log(psStatus);


 		$('#psCodeUpdate').attr("val",psCode);

		$.ajax({
			url:"readPre.do",
			data : {"psCode":psCode,
				    "psStatus":psStatus},
			type:"post",
			success:function(res){

				fixLineDoctor(target);

				// (수정필요)과거 처방 이력이 없을시...
// 				if(data == ""){
// 					var str = "<tr class='lookupTbody'><td colspan='4'>조회 결과가 없습니다.</td></tr>";
// 					$('#lookupList').append(str)
// 				}else{
// 					printData(data,$('#lookupList'),$('#lookUp-list-template'))
// 				}

				printData3(res.detailInfo,$('#prescriptionDetail'),$('#prescriptionDetail-list-template'))

				console.log("res : " + res.psStatus);

				if(res.psStatus == "조제대기" || res.psStatus == "수정요청"){
					$('#abc').attr("disabled",false);
					$('#abc').css('background', '#007bff');
					if(res.psStatus == "수정요청"){
						preUpdateRequest(psCode);
					}
				}else if(res.psStatus == "조제완료"){
					$('#addBtn').attr("disabled",true);
					$('#storeBtn').attr("disabled",true);
					$('#cancelBtn').attr("disabled",true);
					$('#deleteBtn').attr("disabled",true);

					// 수정버튼 클릭전 버튼들 배경색  : 파란색 -> 회색
					$('#addBtn').css('background', '#6c757d');
					$('#storeBtn').css('background', '#6c757d');
					$('#cancelBtn').css('background', '#6c757d');
					$('#deleteBtn').css('background', '#6c757d');

					$('#abc').attr("disabled",true);
					$('#abc').css('background', '#6c757d');
				}

			},
			error:function(){
				alert("오류입니다.");
			}
		});
	}

</script>



<script>
/* pagination */
function printPaginationDoctor(pageMaker,target,templateObject){
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

<script>
//선택한 행 고정!!!!
function fixLineDoctor(target){
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

