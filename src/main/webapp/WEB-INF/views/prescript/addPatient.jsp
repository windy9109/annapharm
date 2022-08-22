<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자 등록</title>

<style>


.button {
	width: 55px;
	height: 25px;
	padding: 0;
	/* margin: 10px 20px 10px 0; */
	font-weight: 600;
	text-align: center;
	line-height: 25px;
	color: #FFF;
	border-radius: 5px;
	border: 0px;
	transition: all 0.2s;
}


/* 처방전상세내역버튼(추가, 저장, 취소) */
.btnBlueGreen {
	background: #1E82FF;
}

.btnFade.btnBlueGreen:hover {
	background: #0A6EFF;
}


</style>

</head>
<body>
	<div class="content-wrapper">
		<div class="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="card card-outline"></div>
					</div>
				</div>
				<div class="card card-primary card-outline" style="height: 220px;">
					<div class="card-header">
						<h5 class="card-title m-0 title">
							<i class='far fa-address-card' style='font-size: 20px'></i> 환자 등록
						</h5>
					</div>

					<div class="card card-primary">
						<div class="card-body" style="text-align: center;">
							<form method="post" action="insertMemberForPharmacist" name="registForm" id="registForm" target="_parent" style="font-size: 12px;">
								<div class="patientInfoDetail mb-3">
									<label for="total_salesCount" style="text-align: right;">이&emsp;&nbsp;름</label>
									<input type="text" class="memberName" name="memName" id="total_salesCount memberName"><br />
								</div>
								<div class="patientInfoDetail mb-3">
									<label for="total_salesFee" style="text-align: right;">주민번호</label>
									<input type="text" onkeyup="setJumin(this)"  class="memberReg" name="memRegnum" id="memRegnum" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" style="width: 154px;">&nbsp;
								</div>
								<div class="patientInfoDetail mb-3">
									<label for="total_compoundingFee" style="text-align: right;">전화번호</label>
									<input type="text" class="memberTel" name="memTel" id="memTel" onkeyup="patientEnter()" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"><br />
								</div>
								<div class="addViewBtn">
									<button class="button btnFade btnBlueGreen addBtn" type="button"
										onclick="insertMemberForPharmacist3();"class="insertMemberForPharmacist" id="insertMemberForPharmacist"
										style="width: 70px; margin-right: 25px;">등록</button>
									<button onclick="window.close()" class="button btnFade btnBlueGreen viewBtn" type="button"
										style="width: 70px;">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<c:if test="${dataMap != null}">
	
		<script type="text/javascript">
			
			window.close();
		</script>
	
	</c:if>
	
	<script>
	
	
	function insertMemberForPharmacist3(){
         
		
		$('#registForm').submit()
		
// 		window.open("about:blank","_self").close();
// 		var memName = $('input[name=memName]').val();
// 		var memReg = $('input[name=memRegnum]').val();

// 		var memReg1 = memReg.substr(0, 6);
		
// 		console.log(memName);
// 		console.log(memReg1);
		
// 		window.opener.$('#lookUpName').attr('value', memName);
// 		window.opener.$('#lookUpBirth').attr('value', memReg1);

// 		setTimeout(function() {   
// 			window.close
//          }, 100);
		
	}

	
	
	</script>

	<script>
		function setJumin(obj) {
			ju = obj.value;
			ju = ju.replace("-", "");
			if (ju.length > 6) {
				ju1 = ju.substring(0, 6);
				ju2 = ju.substring(6, 13);
// 				for (i = 1; i < ju.substring(6).length && i < 7; i++) {
// 					ju2 = ju2 + "*";
// 				}
				obj.value = ju1 + "-" + ju2;
			}

		}
	</script>
	<!-- 엔터키 이벤트  -->
	<script>
	function patientEnter(){
		if (window.event.keyCode == 13) {
			insertMemberForPharmacist3();
		}
	}
	</script>

	<%@include file="./prescript_js.jsp" %>	
</body>
</html>