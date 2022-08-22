<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	function enterkey() {
		if (window.event.keyCode == 13) {
			retrieveList_go(1);
		}
	}
</script>

<script type="text/javascript">
	function retrieveList_go(page, url) {
		if (!url)
			url = "<%=request.getContextPath()%>/retrieve/productListIframe.do";

		var retrieveForm = $('#retrieveForm');
		retrieveForm.find("[name='page']").val(page);

		var checkboxValue;

		if (document.querySelector("input[type='checkbox']").checked) {
			checkboxValue = document.querySelector("input[type='checkbox']").value
			console.log(checkboxValue);
			retrieveForm.find("[name='searchType']").val(checkboxValue);
		} else {
			checkboxValue = document.querySelector("input[type='checkbox']").value
			retrieveForm.find("[name='searchType']").val("");
		}

		retrieveForm.find("[name='endDate']").val(
				$('input[name="endDate"]').val());
		retrieveForm.find("[name='keyword']").val(
				$('div.input-group>input[name="keyword"]').val());

		retrieveForm.attr({
			action : url,
			method : 'get'
		}).submit();

	}
</script>


<script type="text/javascript">
	function md_detailGo(clickTr) {

		var tr = clickTr.parentNode.querySelectorAll('tr');
		tr.forEach(function(obj) {
			obj.style.backgroundColor = 'white';
			obj.style.fontWeight = 'normal';
		});
		clickTr.style.backgroundColor = 'skyblue';
		clickTr.style.fontWeight = 'bold';

		//목록에서 선택 시 값 가져와 출력
		var productNo = $(clickTr).find('.productNo').text();
		var productName = $(clickTr).find('.productName').text();
		var productQr = $(clickTr).find('.productQr').text();
		var productOwnnum = $(clickTr).find('.productOwnnum').text();

		console.log(clickTr);
		console.log(productNo);
		console.log(productName);
		console.log(productQr);
		console.log(productOwnnum);

		var parent = window.parent.document;

		parent.querySelector('.miNum').setAttribute("max", productOwnnum);
		parent.querySelector('.miNum').value = productOwnnum;
		var productUnit = $(clickTr).find('.productUnit').text();
		console.log(productUnit);

		parent.querySelector('.miName').value = productName;
		parent.querySelector('.miCode').value = productNo;
		parent.querySelector('.miQr').value = productQr;
		parent.querySelector('.miUnit').value = productUnit;

	}
</script>
