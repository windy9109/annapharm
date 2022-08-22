<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<script type="text/javascript">
	var listNum = 1;
	function mdAdd() {
		//회수내역에 추가하기
		//추가 버튼을 눌렀을 때 이력한 정보 가져오기

		var miName = $('.miName').val();
		var miCode = $('.miCode').val();
		var miQr = $('.miQr').val();
		var miDate = $('.miDate').val().replaceAll("-",".");
		var miNum = $('.miNum').val();
		var miUnit = $('.miUnit').val();
		var reason = $('.reason').val();

		console.log(miDate);
// 		miDate.replaceAll("-",".");
		console.log(miDate);

		if (miNum == "") {
			alert("회수수량을 입력해주세요!");
			return;
		}
		if (reason == "") {
			alert("회수 사유를 입력해주세요!");
			return;
		}

		var str = "";

		str += '<tr  style="cursor:pointer;" class="nomedi" value="' + miCode + '" ondblclick="mdRemove(this);">';
		str += '	<td name="" style=" width: 35px; text-align: center;">' + listNum + '</td>';
		str += '	<td class="rlCode" value="' + miCode+'" style="width: 100px; text-align: center;">'+ miCode + '</td>';
		str += '	<td class="rlQr" value="' + miQr+'" style="min-width: 220px; text-align: center;">'+ miQr + '</td>';
		str += '	<td class="rlName"  value="' + miName+'" style=" width: 318px; text-align: left;" data-toggle="tooltip" title="'+ miName +'">'+ miName + '</td>';
		str += '	<td class="rlReason"  value="' + reason+'" style= " width: 313px; text-align: left;">'+ reason + '</td>';
		str += '	<td class="rlNum" value="' + miNum+'" style=" width: 80px; text-align: center;">'+ miNum + '</td>';
		str += '	<td class="miUnit" value="' + miUnit+'" style=" width: 80px; text-align: center;">'+ miUnit + '</td>';
		str += '	<td style="width: 80px; text-align: center;">' + miDate + '</td>';
		str += '</tr>';
		listNum = listNum + 1;
		$('#retrievelist').append(str);
		var totalNum = $('#retrievelist > tr').length
		$('.totalNum').text(totalNum);

		$('.miName').val("");
		$('.miCode').val("");
		$('.miQr').val("");
		$('.miNum').val("");
		$('.miUnit').val("");
		$('.reason').val("");

	}
	function mdRemove(clickOne) {
		$(clickOne).remove();
		var totalNum = $('#retrievelist > tr').length

		console.log(totalNum);
		$('.totalNum').text(totalNum);
	}
</script>

<script type="text/javascript">
	function retrieveAdd() {

		var trAll = $('#retrievelist > tr');
		var i;
		for (i = 0; i < trAll.length; i++) {

			var rlName = trAll.eq(i).find('.rlName').text();
			var rlCode = trAll.eq(i).find('.rlCode').text();
			var rlReason = trAll.eq(i).find('.rlReason').text();
			var rlNum = trAll.eq(i).find('.rlNum').text();
			var rlQr = trAll.eq(i).find('.rlQr').text();
			var miUnit = trAll.eq(i).find('.miUnit').text();

			data={
				"flag" : i,
				"rlName" : rlName,
				"rlCode" : rlCode,
				"rlReason" : rlReason,
				"rlNum" : rlNum,
				"rlQr" : rlQr,
				"miUnit" : miUnit
			}

			console.log(data);

			$.ajax({
				url : "<%=request.getContextPath()%>/retrieve/registRetrieve",
				async : false,
				type : "post",
				data : JSON.stringify(data),
				contentType : "application/json",
				success : function(data) {
				},
				error : function(error) {
				}
			});
		}
		trAll.remove();
		$('.totalNum').text("0");
		listNum = 1;
		alert("등록완료되었습니다!");
	}
</script>