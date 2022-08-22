<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
<!-- 처방전 상세내역 출력 핸들바스 -->
<script  type="text/x-handlebars-template"  id="SA-prescription-list-template">
	{{#each .}}
		<tr class="SA-PrescriptionTr">
			<td class="dtr-control sorting_1 stringType" tabindex="0" data-toggle="tooltip" title="{{mdName}}">
				{{mdName}}
			</td>
			<td data-toggle="tooltip" title="{{miCompany}}" >{{miCompany}}</td>
			<td>{{miUse}}</td>
			<td>{{insurance}}</td>
			<td class="number">{{preDrugNum}}</td>
			<td class="number">{{preDrugCount}}</td>
			<td class="number">{{preDrugDay}}</td>
			<td class="number" data-toggle="tooltip" title="{{miPrice}}">{{miPrice}}</td>
			<td class="number" data-toggle="tooltip" title="{{total}}">{{total}}</td>
		</tr>
	{{/each}}
</script>
<!-- 저장/출력 클릭시 매출 목록에 출력되는 화면  -->
<script  type="text/x-handlebars-template"  id="saveAndPrint-list-template">
	{{#each .}}
		<tr onclick="salesAnalysisDetail('{{psCode}}', this)" psCode="{{psCode}}" class="salesListTr">
			<td style="width: 83px; max-width: 83px;" class="dtr-control sorting_1" tabindex="0"> {{psCompleteDate }} </td>
			<td style="width: 65px; max-width: 65px;">{{psType }}</td>
			<td style="width: 65px; max-width: 65px;">{{patientName }}</td>
			<td style="width: 65px; max-width: 65px;">{{chemistName }}</td>
			<td style="width: 90px; max-width: 90px;" class="number" data-toggle="tooltip" title="{{totalMedicienBill }}">{{totalMedicienBill }}</td>
			<td style="width: 85px; max-width: 85px;" class="number" data-toggle="tooltip" title="{{charge }}">{{charge }}</td>
			<td style="width: 65px; max-width: 65px;" class="number" data-toggle="tooltip" title="{{patientCharge }}">{{patientCharge }}</td>
			<td style="width: 65px; max-width: 65px;" class="number" data-toggle="tooltip" title="{{deposit }}">{{deposit }}</td>
			<td style="width: 65px; max-width: 65px;" class="number" data-toggle="tooltip" title="{{compoundingFee }}">{{compoundingFee }}</td>
			<td style="width: 85px; max-width: 85px;" class="number" data-toggle="tooltip" title="{{medicienBill }}">{{medicienBill }}</td>
			<td style="width: 50px; max-width: 50px;">
				<div class="icheck-primary">
					<input type="checkbox" class="abled" checked="checked" onchange="findListChecked()">
				</div>
			</td>
		</tr>

	{{/each}}
</script>

<!-- 토글 생성 -->
<script>
	window.onload = function(){
		$('[data-toggle="tooltip"]').tooltip();
		findListChecked();

		console.log("start",$('#startDate').val());
		if($('#startDate').val() == "" || $('#startDate').val() == null){
			salesDayDefult();
		}
	}
</script>

<script>
	//compare_js에 같은 기능 등록
	function salesDayDefult(){
		// input 달력에 데이터 미리 넣어놓기
		var date = new Date();
		var currentDate = date.toISOString();
		var lastMonth = new Date(date.setMonth(date.getMonth()-1));
// 		console.log(1,lastMonth.toISOString().substring(0, 10));
// 		console.log(2,currentDate.substring(0, 10));
		// 현재부터 한달 전 날짜 입력
		document.getElementById('startDate').value = lastMonth.toISOString().substring(0, 10);
		document.getElementById("startDate").setAttribute("max", document.getElementById('endDate').value);
		// 현재 날짜 입력
		document.getElementById('endDate').value = currentDate.substring(0, 10);
		document.getElementById("endDate").setAttribute("max", currentDate.substring(0, 10));

		dayflag = false;
	}

</script>

<script>
	// 조회버튼 클릭시 이벤트
	function salesAnalsisSearch(){
		url="search";

		var salesForm = $('#salesForm');
		console.log(1,$('select[name="searchType"]').val());
		console.log(2,$('input[name="startDate"]').val());
		console.log(3,$('input[name="endDate"]').val());

		salesForm.find("[name='searchType']").val($('select[name="searchType"]').val());
		salesForm.find("[name='startDate']").val($('input[name="startDate"]').val());
		salesForm.find("[name='endDate']").val($('input[name="endDate"]').val());

		salesForm.attr({
			action:url,
			method:'get'
		}).submit();
	}
</script>

<script>
	// 매출목록 클릭 시 해당하는 처방전의 상세 내역을 가져오는 ajax
	function salesAnalysisDetail(psCode, target){

		salesAnalysisFixLine(target);

		$.ajax({
			url:"read",
			type:"get",
			data:{"psCode":psCode},
			success:function(res){
				// 핸들바스 생성
				printSAPrescription(res,$('#SA-PrescriptionTbody'),$('#SA-prescription-list-template'))

				var totalFee = res[0].prescriptTotalFee + '(￦)';
				// 합계 금액 계산
				$('#totalFee').html(totalFee);
			},
			error:function(error){
				alert("처방전 조회에 실패하였습니다.");
			}
		});
	}
</script>

<script>
	// 저장,출력 내역을 눌렀을 때 데이터를 지우는 명령어
	function saveListDelete(pslogNum){
		var deleteCheck = confirm('정말로 삭제하시겠습니까?');

		var data = {
			"pslogNum":pslogNum
		}

		if(deleteCheck){
			$.ajax({
				url:"printAndSaveDelete",
				type:"get",
				data:data,
				async: false,
				success: function(){
					alert('삭제되었습니다.');
				},
				error: function(){
					alert("삭제에 실패하였습니다.")
				}
			})
		}else{
			alert('삭제가 취소되었습니다.');
		}
		window.location.reload();
		event.stopPropagation();
	}

	// 저장,출력 내역을 눌렀을 때 목록을 출력하는 명령어
	function saveListRead(pslogNum, target){
		console.log(pslogNum);
		salesAnalysisFixLine(target);

		var data = {
			"pslogNum":pslogNum
		}

		$.ajax({
			url:"printAndSaveRead",
			type:"get",
			data:data,
			success: function(res){
				console.log("저장/출력",res);
				printSaveAndScriptList(res,$('#salesAnalysisTable'),$('#saveAndPrint-list-template'));
				$('#checkboxTotal').text(res.length);
				document.getElementById("allButtonCheck").addEventListener("click",checkboxAll());
			},
			error: function(){
				alert("실패");
			}
		});

	}
</script>

<script>
	// 임시저장
	function temporarilySave(){
		var arr = []; // 체크된 데이터를 담는 배열
		var chemistName = []; // 약사 이름을 담는 배열
		var prescriptArr = [];
		var check = document.getElementsByClassName('abled');
		var count = 0; // 청구건수를 담을 변수


		// 목록 전체에서 체크된 checkbox 찾고 배열에 넣기
		for(let i = 0; i < check.length; i++){
			if(check[i].checked){
				arr.push(check[i]);
			}
		}

		count = arr.length;

		if(count == 0){
			alert('1개 이상의 데이터를 선택해주세요.')
			return;
		}

		// 체크한 값의 정보를 갖고 오기
		for(let i = 0; i < arr.length; i++){
			var main = arr[i].parentNode.parentNode.parentNode;
			prescriptArr.push(main.getAttribute('psCode')); // 처방전 코드 뽑기
			chemistName.push($(main).find('td:eq(3)').text()); // 약사 이름 뽑기
		}

		// 약국코드 (추후 세션으로부터 받는다.)
		var pharmacyCode = 'C2104147';

		// 약사 이름(중복되는 결과 제외)
		var setArr = new Set(chemistName);
		// set 객체를 배열로 바꿔주기
		var nonoverlap = Array.from(setArr)
		// DB에 들어갈 약사 이름
		var setChemistName = "";

		for(let i = 0; i < nonoverlap.length; i++){
			if(i != 0){
				setChemistName += ",";
			}
			setChemistName += nonoverlap[i];
		}

		console.log('청구건수', count)
		console.log('약사명', setChemistName)
		console.log('약국코드', pharmacyCode)
		console.log('처방전 코드', prescriptArr)

		var saveData = {
			"prescriptArr":prescriptArr,
			"pharmacyCode":pharmacyCode,
			"chemistName":setChemistName,
			"count":count
		}

// 		console.log(JSON.stringify(prescriptArr));

		$.ajax({
			url: "temporarilyPrintAndSave",
			type:"post",
			data:saveData,
			success: function(){
				alert('임시 저장 성공')
				window.location.reload();

			},
			error: function(){
				alert("저장 실패");
			}
		});

	}
</script>

<script>
	// Excel에 데이터 넣기
	function excelmaker(){

// 		//alert('선택한 데이터를 excel로 저장하시겠습니까?');

// 		var arr = []; // 체크데이터를 담을 배열
// 		var arrJson = [] // 서버로 보낼 데이터를 담을 배열
// 		var check = document.getElementsByClassName('abled');

// 		// 목록 전체에서 체크된 checkbox 찾고 배열에 넣기
// 		for(let i = 0; i < check.length; i++){
// 			if(check[i].checked){
// 				arr.push(check[i]);
// 			}
// 		}

// 		var psCompleteDate			// 작업일자
// 		var psType          	  	// 구분
// 		var patientName         	// 환자명
// 		var chemistName           	// 조제약사
// 		var totalMedicienBill   	// 약제비/판매익
// 		var charge               	// 청구액
// 		var patientCharge       	// 본인부담금
// 		var deposit              	// 입금액
// 		var compoundingFee     		// 조제료
// 		var medicienBill     		// 약가

// 		// 체크한 값의 json형태로 바꾸기
// 		for(let i = 0; i < arr.length; i++){
// 			var main = arr[i].parentNode.parentNode.parentNode;
// 			var obj = "";

// 			psCompleteDate = $(main).find('td:eq(0)').text();
// 			psType = $(main).find('td:eq(1)').text();
// 			patientName = $(main).find('td:eq(2)').text();
// 			chemistName = $(main).find('td:eq(3)').text();
// 			totalMedicienBill = parseInt($(main).find('td:eq(4)').text().replace(/,/g,""));
// 			charge = parseInt($(main).find('td:eq(5)').text().replace(/,/g,""));
// 			patientCharge = parseInt($(main).find('td:eq(6)').text().replace(/,/g,""));
// 			deposit = parseInt($(main).find('td:eq(7)').text().replace(/,/g,""));
// 			compoundingFee = parseInt($(main).find('td:eq(8)').text().replace(/,/g,""));
// 			medicienBill = parseInt($(main).find('td:eq(9)').text().replace(/,/g,""));

// 			obj ={"psCompleteDate":psCompleteDate,"psType":psType,"patientName":patientName,"chemistName":chemistName,"totalMedicienBill":totalMedicienBill,"charge":charge,"patientCharge":patientCharge,"deposit":deposit,"compoundingFee":compoundingFee,"medicienBill":medicienBill}
// 			arrJson.push(obj);
// 		}
// 		console.log(1,arrJson);
// 		console.log(2,JSON.stringify(arrJson));
// 		console.log(3,JSON.parse(JSON.stringify(arrJson)));

		console.log(2,$('input[name="startDate"]').val());
		console.log(3,$('input[name="endDate"]').val());

		var startDate = $('input[name="startDate"]').val();
		var endDate = $('input[name="endDate"]').val()

		var data = {
			"startDate":startDate,
			"endDate":endDate
		}

		console.log('data',data);

		location.href="excel?startDate=" + startDate + "&endDate=" + endDate;

		/* $.ajax({
			url:"excel",
			data:JSON.stringify(data),
			type:"post",
			contentType : "application/json",
			success:function(res){
			},
			error:function(){
				alert('Excel 다운에 실패했습니다.');
			}
		});
 */
	}
</script>

<script>
//선택한 행 고정!!!!
function salesAnalysisFixLine(target){
	console.log(target);
// 	console.log(target.parentNode.querySelectorAll('tr'));
	var tr = target.parentNode.querySelectorAll('tr');
	tr.forEach(function(obj){
		obj.style.backgroundColor = 'white';
		obj.style.fontWeight = 'normal';
	});
	target.style.backgroundColor = 'skyblue';
	target.style.fontWeight = 'bold';
}
</script>


<script>
	// 체크박스 전체 선택버튼 클릭
	function checkboxAll(){
		// 버튼 클릭시 check박스 값이 들어간 뒤 findListChecked()가 실행되도록 지연시간을 둠
		setTimeout(() => findListChecked(), 1);
		console.log('check', '확인');
	}

	// 체크 여부 확인 후 항목합계에 데이터를 넣은 함수
	function findListChecked(){

		var arr = [];
		var check = document.getElementsByClassName('abled');

		// 목록 전체에서 체크된 checkbox 찾고 배열에 넣기
		for(let i = 0; i < check.length; i++){
			if(check[i].checked){
				arr.push(check[i]);
			}
		}

		var count = 0;			// 총 매출건
		var total = 0;			// 약제비/판매액
		var charge = 0;			// 청구액
		var patientCharge = 0;	// 본인부담금
		var deposit = 0;		// 입금액
		var compoundingFee = 0;	// 조제료
		var medicienBill = 0;	// 약가

		// 체크한 값의 항목	합계를 모두 더하기
		for(let i = 0; i < arr.length; i++){
			var main = arr[i].parentNode.parentNode.parentNode;

			total += parseInt($(main).find('td:eq(4)').text().replace(/,/g,""));
			charge += parseInt($(main).find('td:eq(5)').text().replace(/,/g,""));
			patientCharge += parseInt($(main).find('td:eq(6)').text().replace(/,/g,""));
			deposit += parseInt($(main).find('td:eq(7)').text().replace(/,/g,""));
			compoundingFee += parseInt($(main).find('td:eq(8)').text().replace(/,/g,""));
			medicienBill += parseInt($(main).find('td:eq(9)').text().replace(/,/g,""));
		}

		// 항목합계에 데이터 넣기
		count = arr.length;
		$('#total_salesCount').val(count.toLocaleString('ko-KR') + '(건)');
		$('#total_salesFee').val(total.toLocaleString('ko-KR') + '(￦)');
		$('#total_compoundingFee').val(compoundingFee.toLocaleString('ko-KR') + '(￦)');
		$('#total_carge').val(charge.toLocaleString('ko-KR') + '(￦)');
		$('#total_salesDrugFee').val(medicienBill.toLocaleString('ko-KR') + '(￦)');
		$('#total_copay').val(patientCharge.toLocaleString('ko-KR') + '(￦)');
		$('#total_deposit').val(deposit.toLocaleString('ko-KR') + '(￦)');

		// 표 아래 값 표시
		$('#checkboxCount').text(count);
	}

</script>

<script>
// 처방전 상세내역 출력 핸들바스 생성
function printSAPrescription(list,target,templateObject){
	var template = Handlebars.compile(templateObject.html());
	var html = template(list);
	$('.SA-PrescriptionTr').remove();
	target.append(html);
}

// 매출 목록 출력 핸들바스 생성
function printSaveAndScriptList(list,target,templateObject){
	var template = Handlebars.compile(templateObject.html());
	var html = template(list);
	$('.salesListTr').remove();
	target.append(html);
}
</script>

<script>
	// 매출 목록에서 체크한 데이터를 청구서에 등록
	function registBill(){

		var UrlStr = "bill";
		var WinTitle = "청구서"
		var WinWidth = 1200;
		var WinHeight = 900;

		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", "
								+"height="+ WinHeight +", top="+ wintop +", left="
								+ winleft +", resizable=yes, status=yes"  );
		win.focus();


 		 setTimeout(function(){billWriter(win)}, 1000);


	}

	function billWriter(win){
		var day = new Date();

		// 날짜 넣기
		win.document.getElementById("todayYear").innerHTML = day.getFullYear();
		win.document.getElementById("todayMonth").innerHTML = day.getMonth() + 1;
		win.document.getElementById("todayDay").innerHTML = ('0' + day.getDate()).slice(-2);

		// 이름넣기
		var loginUser = '김약사';
		win.document.getElementById("loginUserName").innerHTML = loginUser;

		// 로그인 유저의 ID값(임의 지정)
		var loginId = 'chemist01';

		// 유저 아이디로 약국 정보를 받아 오는 ajax;
		$.ajax({
			url: "readLoginPharmacy",
			type: "get",
			data: {
				"loginId":loginId
			},
			success: function(res){
				win.$('#num2').text(res.piDutyname);	// 명칭
				win.$('#num3').text(res.piDutytel1);	// 전화번호
				win.$('#num5').text(res.piDutyaddr);	// 소재지
				win.$('#num6').text(res.piPostcdn);	// 우편번호
				win.$('#num7').text(res.memName);	// 성명
				win.$('#num8').text(res.memRegnum);	// 생년월일
			},
			error: function(error){
				alert("약국 정보를 불러오는데 실패하였습니다.")
			}
		})

		// 체크된 데이터를 청구서에 넣는 함수
		registBillListChecked(win)

	}

</script>

<script>
// 체크된 데이터를 청구서에 넣는 함수
function registBillListChecked(win){
	var arr = [];
	var check = document.getElementsByClassName('abled');

	// 목록 전체에서 체크된 checkbox 찾고 배열에 넣기
	for(let i = 0; i < check.length; i++){
		if(check[i].checked){
			arr.push(check[i]);
		}
	}

	var preArr = []; // 처방 조제를 담는 배열
	var nonArr = []; // 비처방 조제를 담는 배열

	var billCompoundingFee = 0;	// 요양급여비용총액1(조제료 총액)-처방
	var billCharge = 0;			// 청구액-처방
	var billExCharge = 0;		// 차등수가청구액(청구액-조제료)-처방
	var billPatientCharge = 0;	// 본인부담금-처방

	var billCompoundingFeeNone = 0;	// 요양급여비용총액1(조제료 총액)-비처방
	var billChargeNone = 0;			// 청구액-비처방
	var billExChargeNone = 0;		// 차등수가청구액(청구액-조제료)-비처방
	var billPatientChargeNone = 0;	// 본인부담금-비처방

	// 처방조제와 비처방조제 구분
	for(let i = 0; i < arr.length; i++){
		var main = arr[i].parentNode.parentNode.parentNode;

		if($(main).find('td:eq(1)').text() == '처방'){
			preArr.push(main);
		}else{
			nonArr.push(main);
		}
	}

	var preSize = preArr.length;
	var nonSize = nonArr.length;

	win.$('#prenum1').text(preSize + '건');
	win.$('#nonnum1').text(nonSize + '건');

	// 처방조제 합 계산
	for(let i = 0; i < preSize; i++){
		var premain = preArr[i]
		billCompoundingFee += parseInt($(premain).find('td:eq(8)').text().replace(/,/g,""));
		billCharge += parseInt($(premain).find('td:eq(5)').text().replace(/,/g,""));
		billPatientCharge += parseInt($(premain).find('td:eq(6)').text().replace(/,/g,""));
	}
	billCompoundingFee = Math.floor(billCompoundingFee / 10) * 10; /* 10원이하 절삭 */
	billExCharge = billCharge - billCompoundingFee;

	// 처방조제 데이터 넣기
	win.$('#prenum2').text(billCompoundingFee.toLocaleString('ko-KR') + '(￦)');
	win.$('#prenum5').text(billCharge.toLocaleString('ko-KR') + '(￦)');
	win.$('#prenum6').text(billExCharge.toLocaleString('ko-KR') + '(￦)');
	win.$('#prenum8').text(billCompoundingFee.toLocaleString('ko-KR') + '(￦)');
	win.$('#prenum10').text(billPatientCharge.toLocaleString('ko-KR') + '(￦)');

	// 비처방조제 합 계산
	for(let i = 0; i < nonSize; i++){
		var nonmain = nonArr[i]
		billCompoundingFeeNone += parseInt($(nonmain).find('td:eq(8)').text().replace(/,/g,""));
		billChargeNone += parseInt($(nonmain).find('td:eq(5)').text().replace(/,/g,""));
		billPatientChargeNone += parseInt($(nonmain).find('td:eq(6)').text().replace(/,/g,""));
	}
	billCompoundingFeeNone = Math.floor(billCompoundingFeeNone / 10) * 10; /* 10원이하 절삭 */
	billExChargeNone = billChargeNone - billCompoundingFeeNone;

	// 처방조제 데이터 넣기
	win.$('#nonnum2').text(billCompoundingFeeNone.toLocaleString('ko-KR') + '(￦)');
	win.$('#nonnum5').text(billChargeNone.toLocaleString('ko-KR') + '(￦)');
	win.$('#nonnum6').text(billExChargeNone.toLocaleString('ko-KR') + '(￦)');
	win.$('#nonnum8').text(billCompoundingFeeNone.toLocaleString('ko-KR') + '(￦)');
	win.$('#nonnum10').text(billPatientChargeNone.toLocaleString('ko-KR') + '(￦)');

}

</script>