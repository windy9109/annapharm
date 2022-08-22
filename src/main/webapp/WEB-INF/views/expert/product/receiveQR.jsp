<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>

<meta charset="utf-8">

<title>:: jsQR 테스트 ::</title>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jsQR.js"></script>

<style type="text/css">
main {
	width: 100%;
	height: 100%;
	text-align: center;
}

div#frame {
	border: 2px solid #005666;
	background-color: #FFFFFF;
	margin-top: 10px;
	margin-left: 10px;
	margin-right: 10px;
	padding-left: 8px;
	padding-right: 8px;
	padding-top: 8px;
	padding-bottom: 8px;
	text-align:center;
}

div#outputLayer {
	text-align: left; 
}

canvas {
	height: 400px;
	width: 400px;
}
</style>

</head>

<body>

<div class="card card-primary" style="margin:15px;">
	<div class="card-header" style=height:40px;>
		<p>입고품 추가 (QR스캔)</p> 
 	</div>
 	<div class="card-body" style="height:40px; text-align: right;">
 			<button class="btn btn-primary btn-sm" onclick="addMedi()">추가하기</button>
 	</div>
	<div class="qrScanDiv">
		<div id="frame" style="width:424px; margin-left:190px;">

			<div id="loadingMessage">
				🎥 비디오 스트림에 액세스 할 수 없습니다<br />웹캠이 활성화되어 있는지 확인하십시오
			</div>

			<canvas id="canvas"></canvas>

		</div>
	</div>

	<div id="test">

		<div id="output"></div>

			<div id="outputMessage"></div>
				<span id="outputData" hidden="hidden"></span>
				<div class="card-body" style="padding: 0px; overflow:auto; margin-top:20px;">	
			<table id="addMediTable" class="table table-bordered" 
				style="overflow: auto; font-size: 12px; border:0px; "> 
				<thead class=" card-outline">
					<tr style="background-color:#E8F5FF;">
						<th style="padding: 10px 0px 10px 0px; width: 55px; text-align:center;">거래처</th>
						<th style="padding: 10px 0px 10px 0px; width: 50px; text-align:center;">약번호</th>
						<th style="padding: 10px 0px 10px 0px; width: 100px; text-align:center;">약명</th>
						<th style="padding: 10px 0px 10px 0px; width: 40px; text-align:center;">단위</th>
						<th style="padding: 10px 0px 10px 0px; width: 40px; text-align:center;">금액(개당)</th>
						<th style="padding: 10px 0px 10px 0px; width: 40px; text-align:center;">유통기한</th>
					</tr>
				</thead>
				<tbody id="readyMedicine" style="max-height: 200px;">
					<tr>
						<th id="miCompany" style="padding: 10px 0px 10px 0px; width: 55px;"></th>
						<th id="mdNo" style="padding: 10px 0px 10px 0px; width: 50px;"></th>
						<th id="mdName" style="padding: 10px 0px 10px 0px; width: 100px;"></th>
						<th id="miUnit" style="padding: 10px 0px 10px 0px; width: 40px;"></th>
						<th id="miPrice" style="padding: 10px 0px 10px 0px; width: 40px;"></th>
						<th id="mdTerm" style="padding: 10px 0px 10px 0px; width: 40px;"></th>
					</tr>
				</tbody>
				</table>
				</div>
	</div>
		
</div>

	<script type="text/javascript">
		document.addEventListener("DOMContentLoaded", function() {
 
			var video = document.createElement("video");

			var canvasElement = document.getElementById("canvas");

			var canvas = canvasElement.getContext("2d");

			var loadingMessage = document.getElementById("loadingMessage");

			var outputContainer = document.getElementById("output");

			var outputMessage = document.getElementById("outputMessage");

			var outputData = document.getElementById("outputData");

			function drawLine(begin, end, color) {

				canvas.beginPath();

				canvas.moveTo(begin.x, begin.y);

				canvas.lineTo(end.x, end.y);

				canvas.lineWidth = 4;

				canvas.strokeStyle = color;

				canvas.stroke();

			}

			// 카메라 사용시

			navigator.mediaDevices.getUserMedia({
				video : {
					facingMode : "environment"
				}
			}).then(function(stream) {

				video.srcObject = stream;

				video.setAttribute("playsinline", true); // iOS 사용시 전체 화면을 사용하지 않음을 전달

				video.play();

				requestAnimationFrame(tick);

			});

			function tick() {

				loadingMessage.innerText = "⌛ 스캔 기능을 활성화 중입니다."

				if (video.readyState === video.HAVE_ENOUGH_DATA) {

// 					loadingMessage.hidden = true;

// 					canvasElement.hidden = false;

// 					outputContainer.hidden = false;

					// 읽어들이는 비디오 화면의 크기

					canvasElement.height = video.videoHeight;

					canvasElement.width = video.videoWidth;

					canvas.drawImage(video, 0, 0, canvasElement.width,
							canvasElement.height);

					var imageData = canvas.getImageData(0, 0,
							canvasElement.width, canvasElement.height);

					var code = jsQR(imageData.data, imageData.width,
							imageData.height, {

								inversionAttempts : "dontInvert",

							});

					// QR코드 인식에 성공한 경우

					if (code) {

						// 인식한 QR코드의 영역을 감싸는 사용자에게 보여지는 테두리 생성

						drawLine(code.location.topLeftCorner,
								code.location.topRightCorner, "#FF0000");

						drawLine(code.location.topRightCorner,
								code.location.bottomRightCorner, "#FF0000");

						drawLine(code.location.bottomRightCorner,
								code.location.bottomLeftCorner, "#FF0000");

						drawLine(code.location.bottomLeftCorner,
								code.location.topLeftCorner, "#FF0000");

// 						outputMessage.hidden = true;

// 						outputData.parentElement.hidden = false;
						// QR코드 메시지 출력
							outputData.innerHTML = code.data;
							var qrData = JSON.parse(outputData.innerHTML);
							console.log(qrData);
							$('#miCompany').text(qrData.miCompany);
							$('#mdNo').text(qrData.mdNo);
							$('#mdName').text(qrData.mdName);
							$('#miUnit').text(qrData.miUnit);
							$('#miPrice').text(qrData.miPrice);
							$('#mdTerm').text(qrData.mdTerm);
						// return을 써서 함수를 빠져나가면 QR코드 프로그램이 종료된다.
						// return;
						
// 						$('#test2').text('테스트');
						
						
					}
					// QR코드 인식에 실패한 경우 
					else {
// 						outputMessage.hidden = false;
// 						outputData.parentElement.hidden = true;
					}
				}
				requestAnimationFrame(tick);
			}
		});
	</script>
	
	<script>
		function addMedi(){
			var miCompany = $('#miCompany').text();
			var mediNo = $('#mdNo').text();
			var mediName = $('#mdName').text();
			var miUnit = $('#miUnit').text();
			var miPrice = $('#miPrice').text();
			var mdTerm = $('#mdTerm').text();
			
			
			var str = `<tr class="readyMedicineTr" value='\${mediNo}' ondblclick="deleteMedicineTr(this)">
					   		<td data-toggle="tooltip" title="\${miCompany}">\${miCompany}</td>
					   		<td>\${mediNo}</td>
					   		<td data-toggle="tooltip" title="\${mediName}" style="text-align: left;">\${mediName}</td>
					   		<td><input type="date" style="width:94px;"></td>
					   		<td><input type="text" class="mdNum" style="width:35px; height:20px;"></td>
					   		<td>\${miUnit}</td>
					   		<td><input type="text" style="width:35px; height:20px;"></td>
					   		<td><input type="text" class="mediPrice" style="width:72px; height:20px; border:0px;" readonly price="\${miPrice}" value='0'></td>
					   		<td style="text-align:center;"><input class="deleteCheck" name="deletechk" value="\${mediNo}" type="checkbox" style="width:17px; height:17px;"/>
					   		<input type="hidden" class="mdTerm" value="\${mdTerm}" name="\${mdTerm}" /></td>
					   </tr>`;
			
			opener.$('#readyMedicine').append(str);
			opener.$(".mdNum").on("change keyup paste",function(){ 
		    	miPrice = $(this).parent('td').parent('tr').find('td:eq(7)').find('input').attr('price');
		       $(this).parent('td').parent('tr').find('td:eq(7)').find('input').val(($(this).val() * miPrice).toLocaleString('ko-KR')); // 추가된 약목록에서 금액부분
		       $(this).parent('td').parent('tr').find('td:eq(7)').find('input').attr('price',(miPrice)); // input 태그에 price로 ,안 붙인 금액 저장
		       $(this).parents('div').find('div').find(opener.$('.priceSumDiv')).find('input').val(sum()+"원"); // 약목록 맨아래 합계 금액 출력
		    });
			
		}
		
		function sum(){ // 각 약들의 수량*약값 들을 총 합해주는 함수
			var a = opener.$('.mdNum').length; // 추가된 약목록의 tr을 가져옴
			var b = 0; // 약들의 금액을 더할 변수
			for(var i = 0 ; i < a; i++){
				b += parseInt(opener.$('.mdNum').parent('td').parent('tr').find('td:eq(7)').find('input')[i].value.replaceAll(',',''));
			}
			return b.toLocaleString('ko-KR');
		}
	</script>

</body>



