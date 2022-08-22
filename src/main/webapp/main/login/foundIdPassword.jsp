<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
</head>
<body>
	<div class="content-wrapper" style="background:url( '<%=request.getContextPath()%>/resources/img/mainImg.png'); background-size: cover;">
		<div style="padding-top: 120px; margin: 0px auto;">
			<div style="background-color: white; width: 450px; margin: 0px auto; font-size: 14px;">
				<div style="padding: 30px 40px;">
					<img src="/annapharm/resources/img/logo.png" style="width: 100px;">
					<span style="float: right; margin-top: 20px;">아이디 찾기</span>
					<hr>
					<div class="container">
						<div class="row">
							<div class="col-3" style="line-height: 40px;">
								<span style="font-weight: bold;">이름</span>
							</div>
							<div class="col-9">
								<input class="form-control form-control-border" type="text" style="width: 100%;" placeholder="이름을 입력해주세요">
							</div>
						</div>
						<div class="row">
							<div class="col-3" style="line-height: 40px;">
								<span style="font-weight: bold;">휴대폰 번호</span>
							</div>
							<div class="col-5">
								<input class="form-control form-control-border" type="text" style="width: 100%;" placeholder="휴대폰 번호(-제외)">
							</div>
							<div class="col-4" style="line-height: 40px;">
								<button class="btn btn-default" style="padding: 6px 10px; width: 100%;">인증번호받기</button>
							</div>
						</div>
						<div class="row">
							<div class="col-3" style="line-height: 40px;">
								<span style="font-weight: bold;">인증번호</span>
							</div>
							<div class="col-9">
								<input class="form-control form-control-border" type="text" style="width: 100%;" placeholder="인증번호를 입력해주세요">
							</div>
						</div>
						<div class="row" style="margin-top: 5px;">
							<div class="col-12">
								<button class="btn btn-default" style="width: 100%; background-color: #3D435F; color: white; "> 아이디 찾기 확인</button>
							</div>
						</div>
					</div>
					<span style="float: right; margin-top: 20px;">비밀번호 찾기</span>
					<br><br>
					<hr>
					<div class="container">
						<div class="row">
							<div class="col-3" style="line-height: 40px;">
								<span style="font-weight: bold;">아이디</span>
							</div>
							<div class="col-9">
								<input class="form-control form-control-border" type="text" style="width: 100%;" placeholder="아이디를 입력해주세요">
							</div>
						</div>
						<div class="row">
							<div class="col-3" style="line-height: 40px;">
								<span style="font-weight: bold;">이름</span>
							</div>
							<div class="col-9">
								<input class="form-control form-control-border" type="text" style="width: 100%;" placeholder="이름을 입력해주세요">
							</div>
						</div>
						<div class="row">
							<div class="col-3" style="line-height: 40px;">
								<span style="font-weight: bold;">휴대폰 번호</span>
							</div>
							<div class="col-5">
								<input class="form-control form-control-border" type="text" style="width: 100%;" placeholder="휴대폰 번호(-제외)">
							</div>
							<div class="col-4" style="line-height: 40px;">
								<button class="btn btn-default" style="padding: 6px 10px; width: 100%;">인증번호받기</button>
							</div>
						</div>
						<div class="row">
							<div class="col-3" style="line-height: 40px;">
								<span style="font-weight: bold;">인증번호</span>
							</div>
							<div class="col-9">
								<input class="form-control form-control-border" type="text" style="width: 100%;" placeholder="인증번호를 입력해주세요">
							</div>
						</div>
						<div class="row" style="margin-top: 5px;">
							<div class="col-12">
								<button class="btn btn-default" style="width: 100%; background-color: #3D435F; color: white; "> 비밀번호 찾기 확인</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="margin: 10px; text-align: center;">
				<span style="color: white; font-size: 0.8em;">귀하의 정보는 동의없이 공개되지 않으며,개인정보보호정책에 의해 보호받고있습니다.</span>
			</div>
		</div>
	</div>
</body>
</html>