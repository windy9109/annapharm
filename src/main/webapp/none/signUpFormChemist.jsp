<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼 (약사 회원)</title>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet"href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet"href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
<link rel="stylesheet"href="<%=request.getContextPath()%>/resources/css/main_aside.css">
<link rel="stylesheet"href="<%=request.getContextPath()%>/resources/css/menu.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/select2/css/select2.min.css">
<style type="text/css">
.from_btn {
	width: 130px;
	background-color: #2F88FF;
	color: white;
	border: none;
	border-radius: 5px;
	height: 30px;
	line-height: 30px;
}

.btn_signup, .btn_cancel {
	border: none;
	border-radius: 5px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	padding: 0px 30px;
}
.select2-container--default .select2-selection--single{
	padding:2px;
}
</style>
</head>
<body style="background-color: rgba(224, 224, 224, 0.55) !important;">
	<div style="width: 1200px; margin: 0px auto;">
		<!-- 로고 -->
		<div style="text-align: center; margin-top: 50px;">
			<img src="<%=request.getContextPath()%>/resources/img/logo.png"
				style="width: 200px; margin: 0px auto; margin-top: 20px;">
		</div>
		<!-- 회원가입폼 -->
		<div
			style="margin: 0px auto; margin-top: 40px; width: 600px; background-color: white; margin-bottom: 80px;">
			<div style="padding-top: 35px; margin-left: 20px;">
				<span style="font-weight: bold; font-size: 1.2em;">기본정보(약사)</span>
			</div>
			<div style="margin-left: 20px; margin-right: 20px;">
				<hr style="margin-bottom: 15px; border: 1px solid;">
				<span style="width: 150px; display: inline-block; margin-top: 5px;">아이디</span>
				<input type="text" class="form-control form-control-border"
					placeholder="아이디를 입력해주세요"
					style="margin-top: 5px; display: inline-block; width: 270px;">
				<input type="button" value="중복검사" class="from_btn"> <span
					style="width: 150px; display: inline-block; margin-top: 5px;">비밀번호</span>
				<input type="password" class="form-control form-control-border"
					placeholder="비밀번호를 입력해주세요"
					style="margin-top: 5px; display: inline-block; width: 400px;">
				<br> <span
					style="width: 150px; display: inline-block; margin-top: 5px;">비밀번호
					재확인</span> <input type="password" class="form-control form-control-border"
					placeholder="비밀번호를 한번 더 입력해주세요"
					style="margin-top: 5px; display: inline-block; width: 400px;">

				<span style="width: 150px; display: inline-block; margin-top: 5px;">이름</span>
				<input type="password" class="form-control form-control-border"
					placeholder="비밀번호를 한번 더 입력해주세요"
					style="margin-top: 5px; display: inline-block; width: 400px;">

				<span style="width: 150px; display: inline-block; margin-top: 5px;">생년월일</span>
				<div class="row" style="display: inline-block; width: 420px;">
					<div class="col-3.5"
						style="display: inline-block; margin-left: 10px; margin-top: 5px;">
						<select class="form-control">
							<c:forEach var="i" begin="1950" end="2022">
								<option>${i}</option>
							</c:forEach>
						</select>

					</div>
					년
					<div class="col-3.5" style="display: inline-block;">
						<select class="form-control">
							<c:forEach var="i" begin="1" end="12">
								<option>${i}월</option>
							</c:forEach>
						</select>
					</div>
					월
					<div class="col-3.5" style="display: inline-block;">
						<select class="form-control">
							<c:forEach var="i" begin="1" end="31">
								<option>${i}일</option>
							</c:forEach>
						</select>
					</div>
					일
				</div>
				<span style="width: 150px; display: inline-block; margin-top: 5px;">약사면호번호</span>
				<input type="text" class="form-control form-control-border"
					placeholder="약사면호번호를 입력해주세요"
					style="margin-top: 5px; display: inline-block; width: 270px;">
				<input type="button" value="인증하기" class="from_btn"> <span
					style="width: 150px; display: inline-block; margin-top: 5px;">본인확인
					이메일</span> <input type="email" class="form-control form-control-border"
					placeholder="이메일을 입력해주세요"
					style="margin-top: 5px; display: inline-block; width: 400px;">
				<span style="width: 150px; display: inline-block; margin-top: 5px;">휴대전화</span>
				<input type="text" class="form-control form-control-border"
					placeholder="전화번호를 입력해주세요"
					style="margin-top: 5px; display: inline-block; width: 270px;">
				<input type="button" value="인증번호 받기" class="from_btn"> <input
					type="email" class="form-control form-control-border"
					placeholder="인증번호를 입력해주세요"
					style="margin-top: 5px; margin-left: 155px; display: inline-block; width: 400px;">
				<span style="width: 150px; display: inline-block; margin-top: 5px;">주소</span>
				<input type="text" class="form-control form-control-border"
					placeholder="우편번호"
					style="margin-top: 5px; display: inline-block; width: 270px;">
				<input type="button" value="우편번호 찾기" class="from_btn"> <input
					type="email" class="form-control form-control-border"
					placeholder="도로명 주소"
					style="margin-top: 5px; margin-left: 155px; display: inline-block; width: 400px;">
				<input type="email" class="form-control form-control-border"
					placeholder="나머지 주소"
					style="margin-top: 5px; margin-left: 155px; display: inline-block; width: 400px;">

				<span style="width: 150px; display: inline-block; margin-top: 5px;">근무약국</span>

				<section class="content" style="display: inline-block; width: 400px; margin-top: 5px;">
					<div class="form-group">
						<select class="select2" style="width: 100%; line-height: 10px;">
							<option selected>새봄약국</option>
							<option>세운약국</option>
							<option>행운약국</option>
							<option>한사랑대흥약국</option>
							<option>우리네약국</option>
							<option>한솔약국</option>
							<option>태화당약국</option>
						</select>
					</div>
				</section>








				<div class="row" style="width: 100%; margin: 0px; margin-top: 70px; padding-bottom: 50px;">
					<div class="col btn_cancel"
						style="margin-right:5px; background-color: lightgray;">취소</div>
					<div class="col btn_signup"
						style="margin-left:5px; background-color: #2F88FF; color: white; ">가입하기
					</div>
				</div>
			</div>
			</div>
		</div>
	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/adminlte.min.js"></script>

	<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>

	<script src="<%=request.getContextPath()%>/resources/js/menu.js"></script>
	
	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/select2/js/select2.full.min.js"></script>
	
	<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/adminlte.min.js?v=3.2.0"></script>
	
	
	<script>
    $(function () {
      $('.select2').select2()
    });
	</script>
</body>

</html>