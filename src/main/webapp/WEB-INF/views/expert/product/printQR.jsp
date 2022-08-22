<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<style>
.btn-block+.btn-block {
	margin-top: 0px;
}
</style>
</head>
<body>
		<div class="card card-primary  card-outline tableScroll" style="margin: 1rem; min-height: 930px;">  
			<div class="card-header" style="text-align: center; height: 80px;">
				<span style="font-size: 20px; font-weight: bold;">${fn:substring(receiveCartList[0].receiveDate,0,4)}.${fn:substring(receiveCartList[0].receiveDate,5,10)} 입고장</span><br>
				<div class="buttons" style="height: 50px;">
					<span
						style="font-size: 16px; font-weight: bold; margin-left: 190px;">- QR태그 출력 -</span>
					<button type="button" class="btn btn-block btn-danger"
						style="width: 90px; float: right; margin-left: 10px;" onclick="closePage();">취소</button>
					<button type="button" class="btn btn-block btn-info"
						style="width: 90px; float: right;" onclick="printQR();">출력하기</button>
				</div>
			</div>
			<div class="card-body" style="height: auto;">
				<c:forEach items="${receiveCartList}" var="receiveList" varStatus="status" >
				  <div class="QRdiv" id="${receiveList.receiveNo}-${receiveList.mdNo}">
					<p class="mediInfo" style="font-weight: bolder; color: dodgerblue; margin:0px">
					${status.index + 1}.${receiveList.miCompany} - ${receiveList.mdName} (${receiveList.receiveShelfLife}) </p>	
					<img src="<%=request.getContextPath()%>/QR/${fn:substring(receiveCartList[0].receiveDate,0,4)}/${fn:substring(receiveCartList[0].receiveDate,5,10)}/${receiveList.productQr}.png" 
						 style="width:300px; height:300px;" class="${receiveList.productQr}">
					<span>출력할 QR태그 수량</span> 
					<input type="text" name="${receiveList.mdName}" id="${receiveList.productQr}" class="receiveListInput" placeholder="개수 입력" style="width:75px; height:25px;">	    
				  	<input type="hidden" class="year" value="${fn:substring(receiveCartList[0].receiveDate,0,4)}">
				  	<input type="hidden" class="date" value="${fn:substring(receiveCartList[0].receiveDate,5,10)}">
				  </div>		  	
				</c:forEach>
			</div>
		</div>
		
		<div>
			<form id="qrDataForm">
			  <c:forEach items="${receiveCartList}" var="receiveList" varStatus="status" >
				<input type="hidden" class="mdName" value="${status.index + 1}.${receiveList.miCompany} - ${receiveList.mdName} (${receiveList.receiveShelfLife})"> 
				<input type="hidden" class="qrName" value="<%=request.getContextPath()%>/QR/${fn:substring(receiveCartList[0].receiveDate,0,4)}/${fn:substring(receiveCartList[0].receiveDate,5,10)}/${receiveList.productQr}.png">
				<input type="hidden" class="hiddenNumInput" value=""> 
			  </c:forEach>			
			</form>
		</div>

	
	<script>
	function printQR(){
		var qrDataForm = $('#qrDataForm');
		var num = $();
		
		var arr = document.getElementsByClassName('receiveListInput');
		var mediInfo = document.getElementsByClassName('mediInfo');		
		var yearQR = document.getElementsByClassName('year');
		var dateQR = document.getElementsByClassName('date');
		var count = arr.length;
		var qrData=[];
		var qrData2=[];

		
		for(let i = 0; i < count; i++){
			var obj="";
			var obj2="";
			var mdName = arr[i].getAttribute('name');
			var qrName = arr[i].getAttribute('id'); 
			var mdNum = arr[i].value;
			var medi = mediInfo[i].innerText;
			var year = yearQR[i].value;
			var date = dateQR[i].value;

			obj += '{"mdName" : "' + mdName + '"';
			obj += ', "year" : "' + year + '"';
			obj += ', "date" : "' + date + '"';
			obj += ', "medi" : "' + medi + '"';
			obj += ', "qrName" : "' + qrName + '"';
			obj += ', "mdNum" : "' + mdNum + '"}';
			
		for(var j = 0; j < mdNum; j++){
			obj2 = {"mdName":mdName,"year":year,"date":date,"medi":medi,"qrName":qrName,"mdNum":mdNum};
			qrData2.push(obj2);
		}
			qrData.push(obj);
		}
		$.ajax({
			url:"finalOpenQR.do",
			data:JSON.stringify(qrData),
			contentType : "application/json",
			type:"post",
			success:function(res){ 
				var resLength = res.length; 

				var cnt = 0;
				for(let i = 0; i < resLength; i++){ 
					var arr = [];
						for(var j = 0; j < res[i].mdNum; j++){
							arr.push(qrData2[cnt]);
							cnt++;
						}
							console.log(arr);
							res[i].mdNum = arr;
				}



			    var fQR = window.open('finalPrintQR.do','QR출력기','width=748,height=950,left=600,top=600,location=no,status=no,scrollbars=yes');
			    
			    setTimeout(function(){
			    	
			    	printQRPage(res, fQR.$("#fQRdiv"), $('#receiveCartQR-list-template'));
			    	
		 		}, 1000);
		 		
			},
			error:function(){}
		});
		
	}
	 
	function closePage(){
		if(confirm("QR태그 출력을 취소하시겠습니까?") == true){
			self.close();
		}
	}
	
	
	function printQRPage(list,target,templateObject){
		var template = Handlebars.compile(templateObject.html());
		var html = template(list);
		target.append(html);
	}
		
	</script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
	<script type="text/x-handlebars-template"  id="receiveCartQR-list-template">
	{{#each this}}
      <div class="QRdiv">
		 <p style="font-weight: bolder; color: dodgerblue; margin:0px">{{medi}}</p>
		{{#each mdNum}}
	     <img src="/annapharm/QR/{{year}}/{{date}}/{{qrName}}.png" style="width:150px; height:150px;" class="${qrName}">
		{{/each}}
	  </div>	
	{{/each}}
	</script>
	

</body>










