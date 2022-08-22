<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
	<div class="content-wrapper" style="background:url( '<%=request.getContextPath()%>/resources/img/mainImg.png'); background-size: cover;">
		<div style="padding-top: 200px; margin: 0px auto;">
			<div style="background-color: white; width: 500px; margin: 0px auto; font-size: 14px;">
				<div style="padding: 30px 40px;">
					<img src="/annapharm/resources/img/logo.png" style="width: 100px;">
					<span style="float: right; margin-top: 20px;">비밀번호 변경</span>
					<hr>
					<div class="container">
						<div class="row">
							<div class="col-4" style="line-height: 40px;">
								<span style="font-weight: bold;">비밀번호</span>
							</div>
							<div class="col-8">
								<input class="form-control form-control-border" type="text" style="width: 100%;" placeholder="비밀번호를 입력해주세요">
							</div>
						</div>
						<div class="row">
							<div class="col-4" style="line-height: 40px;">
								<span style="font-weight: bold;">비밀번호 재입력</span>
							</div>
							<div class="col-8">
								<input class="form-control form-control-border" type="text" style="width: 100%;" placeholder="비밀번호를 재입력해주세요">
							</div>
						</div>
						<br>
						<div style="text-align: center;">
						<span style="color: #ff0000; font-size: 0.8em;">8~16자 영문 대소문자, 숫자, 특수문자를 사용해서 변경해주세요</span>
						</div>
						<br><br>
						<div class="row" style="margin-top: 5px;">
							<div class="col-12">
								<button class="btn btn-default" style="width: 100%; background-color: #3D435F; color: white; "> 확인</button>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>