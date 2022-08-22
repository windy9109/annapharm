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
				<span style="font-size: 24px; font-weight: bold;">QR태그 출력</span>
				<div class="buttons" style="height: 50px;">
					<button type="button" class="btn btn-block btn-danger"
						style="width: 90px; float: right; margin-left: 10px;" onclick="closePage();">취소</button>
					<button type="button" class="btn btn-block btn-info"
						style="width: 90px; float: right;" onclick="pdfDownload();">PDF 저장</button>
				</div>
			</div>
			<div class="card-body" style="height: auto;">
				  <div class="fQRdiv" id="fQRdiv" val="abc">
				  </div>		  	
			</div>
		</div>
	<script>
	
	function closePage(){
		if(confirm("QR태그 출력을 취소하시겠습니까?") == true){
			self.close();
		}
	}
	</script>
	
	<!-- pdf 다운 -->
	<script src="<%=request.getContextPath() %>/resources/pdf/html2canvas.js"></script>
	<script src="<%=request.getContextPath() %>/resources/pdf/jspdf.min.js"></script>

	<script>
		// pdf로 저장 할 수 있도록 하는 함수
		function pdfDownload(){

			 html2canvas($('#fQRdiv')[0]).then(function(canvas) { //저장 영역 div id

		    // 캔버스를 이미지로 변환
		    var imgData = canvas.toDataURL('image/png');

		    var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
		    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
		    var imgHeight = canvas.height * imgWidth / canvas.width;
		    var heightLeft = imgHeight;
		    var margin = 10; // 출력 페이지 여백설정
		    var doc = new jsPDF('p', 'mm');
		    var position = 20;

		    // 첫 페이지 출력
		    doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
		    heightLeft -= pageHeight;

		    // 한 페이지 이상일 경우 루프 돌면서 출력
		    while (heightLeft >= 20) {
		        position = heightLeft - imgHeight;
		        doc.addPage();
		        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
		        heightLeft -= pageHeight;
		    }

// 		    // 오늘 날짜
// 		    var day = new Date();
// 		    day = day.toLocaleDateString();

// 		    // 약국 이름
// 		    var name = $('#num2').text();
		    // 파일 저장
		    doc.save('QR.pdf');
			 });
		}
		</script>

</body>










