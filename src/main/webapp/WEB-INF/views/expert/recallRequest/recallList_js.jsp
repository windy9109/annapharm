<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<script>
window.onload = function(){
	recallDateFix();
}

</script>

<script>
function recallDateFix(){
   var end = new Date();
   var endDate = $('#endDate').val(end.toISOString().substring(0, 10));
   var start = new Date();
   start = new Date(start.setMonth(start.getMonth() - 1));
   var startDate = $('#startDate').val(start.toISOString().substring(0, 10));

   $('#endDate').attr('max',end.toISOString().substring(0, 10));
   $('#startDate').attr('max',end.toISOString().substring(0, 10));

   $('#endDate').change(function(){
      var changeEnd = $(this).val();
      $('#startDate').attr('max',changeEnd);

      var endDate = $('#endDate').val();
      var startDate = $('#startDate').val();

      if(!compareDate(startDate,endDate)){
         $('#startDate').val(endDate);
      }
   })
}
</script>
<script type="text/javascript">
		function enterkey() {
			if (window.event.keyCode == 13) {
				recallList_go(1);
			}
		}
</script>

<script type="text/javascript">
	function recallList_go(page, url) {
		if (!url)
			url = "<%=request.getContextPath()%>/retrieveList/list.do";

		var recallListForm = $('#recallListForm');
		recallListForm.find("[name='page']").val(page);

		recallListForm.find("[name='startDate']").val($('input[name="startDate"]').val());
		recallListForm.find("[name='endDate']").val($('input[name="endDate"]').val());
		recallListForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());

		recallListForm.attr({
			action : url,
			method : 'get'
		}).submit();

	}
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"  ></script>
<!-- 이름과 생년월일로 조회된 회원을 출력하는 기능 -->
<script  type="text/x-handlebars-template"  id="retrieve-list-detail-template">
	{{#each .}}
		<tr class="lookupTbody">
			<td>{{inc @index}}</td>
			<td  style="text-align:left;">{{rlName}}</td>
			<td style="min-width: 220px;">{{rlQr}}</td>
			<td>{{rlCode}}</td>
			<td style="text-align: right;">{{rlNum}}</td>
			<td>{{miUnit}}</td>
			<td style="text-align:left;">{{rlReason}}</td>
		</tr>
	{{/each}}
</script>

<script>
function recallPrintData(list,target,templateObject){
	var template = Handlebars.compile(templateObject.html());
	var html = template(list);
	$('#recallDetail').empty();
	target.append(html);
}

</script>
<script>
function recallrequestDetail(retrieveNo,clickTr){
	//alert(code + " 확인");
    var tr = clickTr.parentNode.querySelectorAll('tr');
    tr.forEach(function(obj){
       obj.style.backgroundColor = 'white';
       obj.style.fontWeight = 'normal';
    });
    clickTr.style.backgroundColor = 'skyblue';
    clickTr.style.fontWeight = 'bold';

	console.log(retrieveNo);
	$.ajax({
		url : "<%=request.getContextPath()%>/retrieve/recallrequestDetail.do",
		type : "post",
		data : {"retrieveNo":retrieveNo},
		success : function(res){
			recallPrintData(res,$('#recallDetail'),$('#retrieve-list-detail-template'));
		},
		error : function(){
			alert("실패~");
		}
	})
}
</script>