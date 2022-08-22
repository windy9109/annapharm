<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 유형 선택 페이지</title>
</head>
<body>
	<div class="content-wrapper" style="background:url( '<%=request.getContextPath()%>/resources/img/mainImg.png'); background-size: cover;">

		<div style="padding: 50px;">

			<img src='<%=request.getContextPath()%>/resources/img/logo_white.png' style="width: 120px;"> <span style="float: right; font-weight: bold; color: white; list-style: 10px;">Sign Up</span>

			<hr style="border: 1px solid white;">
			<div style="text-align: center; margin: 0px auto; color: white; margin-top: 80px;">
				<span style="font-weight: bold; font-size: 1.2em; display: inline-block; margin-bottom: 10px;">해당하는 회원가입 방식을 선택해주세요</span><br> <span> 회원가입구분에 따라 가입절창 차이가 있으니 반드시 본인에 해당하는 경우를 선택해 주시기 바랍니다. </span>
			</div>
			<div style="width: 900px; margin: 0px auto; background-color: white; margin-top: 80px;">
				<div class="container">
					<div class="row">
						<div class="col-4" style="padding: 30px; text-align: center;">
							<div style="border: 0.5px solid; padding: 30px 0px; background-color: rgba(107, 135, 173, 0.1);">
								<img src="<%=request.getContextPath()%>/resources/img/doctorImg.png"> <br><br> 
								<span style="font-weight: bold;">의사<img src="<%=request.getContextPath()%>/resources/img/rightArrow.png"></span>
							</div>
						</div>
						<div class="col-4" style="padding: 30px; text-align: center;">
							<div style="border: 0.5px solid; padding: 30px 0px; background-color: rgba(107, 135, 173, 0.1);">
								<img src="<%=request.getContextPath()%>/resources/img/chemist.png"> <br> <br> 
								<span style="font-weight: bold;">약사<img src="<%=request.getContextPath()%>/resources/img/rightArrow.png"></span>
							</div>

						</div>
						<div class="col-4" style="padding: 30px; text-align: center;">
						<div style="border: 0.5px solid; padding: 30px 0px; background-color: rgba(107, 135, 173, 0.1); ">
							<img src="<%=request.getContextPath()%>/resources/img/nomal.png"> <br> <br> 
							<span style="font-weight: bold;">일반<img src="<%=request.getContextPath()%>/resources/img/rightArrow.png"></span>
						</div>
						</div>
					</div>
				</div>
			</div>
			<div style="text-align: center; margin-top: 30px;">			
				<span style="color: white; font-size: 0.8em; margin: 0px auto;">귀하의 정보는 동의없이 공개되지않으며, 개인정보보호정책에 의해 보호받고 있습니다.</span>
			</div>

		</div>


	</div>
</body>
</html>