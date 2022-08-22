<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼 (의사 회원)</title>

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

.select2-container--default .select2-selection--single {
	padding: 2px;
}
/* START TOOLTIP STYLES */
[tooltip] {
  position: relative; /* opinion 1 */
}

/* Applies to all tooltips */
[tooltip]::before,
[tooltip]::after {
  text-transform: none; /* opinion 2 */
  font-size: .9em; /* opinion 3 */
  line-height: 1;
  user-select: none;
  pointer-events: none;
  position: absolute;
  display: none;
  opacity: 0;
}
[tooltip]::before {
  content: '';
  border: 5px solid transparent; /* opinion 4 */
  z-index: 1001; /* absurdity 1 */
}
[tooltip]::after {
  content: attr(tooltip); /* magic! */

  text-align: center;

  min-width: 3em;
  max-width: 21em;
  white-space: nowrap;

  text-overflow: ellipsis;
  padding: 1ch 1.5ch;
  border-radius: .3ch;
  box-shadow: 0 1em 2em -.5em rgba(0, 0, 0, 0.35);
  background: #333;
  color: #fff;
  z-index: 1000; /* absurdity 2 */
}

/* Make the tooltips respond to hover */
[tooltip]:hover::before,
[tooltip]:hover::after {
  display: block;
}

/* don't show empty tooltips */
[tooltip='']::before,
[tooltip='']::after {
  display: none !important;
}



/* FLOW: LEFT */
[tooltip][flow^="left"]::before {
  top: 50%;
  border-right-width: 0;
  border-left-color: #333;
  left: calc(0em - 5px);
  transform: translate(-.5em, -50%);
}
[tooltip][flow^="left"]::after {
  top: 50%;
  right: calc(100% + 5px);
  transform: translate(-.5em, -50%);
}



/* KEYFRAMES */
@keyframes tooltips-vert {
  to {
    opacity: .9;
    transform: translate(-50%, 0);
  }
}

@keyframes tooltips-horz {
  to {
    opacity: .9;
    transform: translate(0, -50%);
  }
}

/* FX All The Things */
[tooltip]:not([flow]):hover::before,
[tooltip]:not([flow]):hover::after {
  animation: tooltips-vert 300ms ease-out forwards;
}

[tooltip][flow^="left"]:hover::before,
[tooltip][flow^="left"]:hover::after{
  animation: tooltips-horz 300ms ease-out forwards;
}


</style>
</head>
<body style="background-color: rgba(224, 224, 224, 0.55) !important; font-size: 14px;">
	<div style="width: 1200px; margin: 0px auto; font-size: 14px;">
		<!-- 로고 -->
		<div style="text-align: center; margin-top: 50px;">
			<img src="<%=request.getContextPath()%>/resources/img/logo.png" style="width: 150px; margin: 0px auto; margin-top: 20px;" onclick="location.href='<%=request.getContextPath()%>/'">
		</div>
		<!-- 회원가입폼 -->

		<div style="margin: 0px auto; margin-top: 40px; width: 500px; background-color: white; margin-bottom: 80px;">
			<div style="padding-top: 35px; margin-left: 20px;">
				<span style="font-weight: bold; font-size: 1.2em;">기본정보(의사)</span>
			</div>
			<div style="margin-left: 20px; margin-right: 20px;">
				<hr style="margin-bottom: 15px; border: 1px solid;">
				<div class="container">
					<div class="row">
						<div class="col-3" style="padding-top: 5px; height: 30px; line-height: 40px;">
							<span tooltip="20자 이내의 대,소문자로 입력해주세요!" flow="left">
							<i class="fa fa-question-circle-o" style="color:red;"></i>
							<span >아이디</span>
						</span>
						</div>
						<div class="col-6">
							<input type="text" class="form-control form-control-border id" placeholder="아이디를 입력해주세요" value="" style="margin-top: 5px; width: 100%;" onkeypress="changeId()">
							<div id="idCheck" style="margin-top: 3px; margin-left: 5px;"></div>
						</div>
						<div class="col-3">
							<input id="abc" type="button" value="중복검사" class="from_btn" style="width: 100%; margin-top: 10px;" onclick="idCheck()">
						</div>
					</div>
					<div class="row">
						<div class="col-3" style="padding-top: 5px; height: 30px; line-height: 40px;">
							<span tooltip="영문, 숫자, 특수기호 조합으로 입력해주세요!" flow="left">
								<i class="fa fa-question-circle-o" style="color: red;"></i>
								<span>비밀번호</span>
							</span>
						</div>
						<div class="col-9">
							<input type="password" class="form-control form-control-border pwd" placeholder="비밀번호를 입력해주세요" style="margin-top: 5px;" onkeyup="passCheck()">
							<div id="validation" style="margin-top: 3px; margin-left: 5px;"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-3">
							<span style="padding-top: 5px; height: 30px; line-height: 40px;">비밀번호 재입력</span>
						</div>
						<div class="col-9">
							<input type="password" class="form-control form-control-border pwdRe" placeholder="비밀번호를 한번더 입력해주세요" style="margin-top: 5px;" onkeyup="passCheck()">
							<div id="passCheck" style="margin-top: 3px; margin-left: 5px;"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-3">
							<span style="padding-top: 5px; height: 30px; line-height: 40px;">이름</span>
						</div>
						<div class="col-9">
							<input type="text" class="form-control form-control-border name" placeholder="이름을 입력해주세요" style="margin-top: 5px;">
						</div>
					</div>
					<div class="row">
						<div class="col-3">
							<span style="padding-top: 5px; height: 30px; line-height: 40px;">주민등록 번호</span>
						</div>
						<div class="col-4">
							<input type="text" class="form-control form-control-border regNum1" maxlength="6" style="margin-top: 5px; width: 100%;">

						</div>
						<div class="col-1" style="text-align: center;">
							<span style="padding-top: 5px; height: 30px; line-height: 40px;">-</span>
						</div>
						<div class="col-4">
							<input type="text" class="form-control form-control-border regNum2" maxlength=7 " style="margin-top: 5px; width: 100%;">
						</div>
					</div>
					<div class="row">
						<div class="col-3">
							<span tooltip="의사면허번호는 대한 의사협회 등록 기준" flow="left">
							<i class="fa fa-question-circle-o" style="color: red;"></i>
							<span>의사면허번호</span>
							</span>
<!-- 							<span style="padding-top: 5px; height: 30px; line-height: 40px;">의사면허번호</span> -->
						</div>
						<div class="col-6">
							<input type="text" class="form-control form-control-border doctorNum" placeholder="의사면허번호를 입력해주세요" style="margin-top: 5px; width: 100%;">
						</div>
						<div class="col-3">
							<input type="button" value="인증하기" class="from_btn" style="width: 100%; margin-top: 10px;" onclick="doctorCheck()">
						</div>
					</div>
					<div class="row">
						<div class="col-3">
							<span style="padding-top: 5px; height: 30px; line-height: 40px;">본인확인 이메일</span>
						</div>
						<div class="col-9">
							<input type="email" class="form-control form-control-border email" placeholder="이메일을 입력해주세요" style="margin-top: 5px; width: 100;">
						</div>
					</div>
					<div class="row">
						<div class="col-3">
							<span style="padding-top: 5px; height: 30px; line-height: 40px;">휴대전화</span>
						</div>
						<div class="col-6">
							<input type="tel" class="form-control form-control-border tel" placeholder="(-)제외하고 입력해주세요" style="margin-top: 5px; width: 100%;">
						</div>
						<div class="col-3">
							<input type="button" value="인증번호 받기" class="from_btn telCheck" style="width: 100%; margin-top: 10px;" onclick="telCheck()">
						</div>
					</div>
					<div class="row">
						<div class="col-3"></div>
						<div class="col-6">
							<input type="text" class="form-control form-control-border randNum" placeholder="인증번호를 입력해주세요" style="margin-top: 5px; width: 100%;">
						</div>
						<div class="col-3">
							<input type="button" value="인증번호 확인" class="from_btn randNumCheck" style="width: 100%; margin-top: 10px; background-color: lightgray;" onclick="randNumCheck()">
						</div>
					</div>
					<div class="row">
						<div class="col-3">
							<span style="padding-top: 5px; height: 30px; line-height: 40px;">주소</span>
						</div>
						<div class="col-6">
							<input id="zcode" type="text" class="form-control form-control-border zcode" placeholder="우편번호" style="margin-top: 5px; width: 100%;" disabled>
						</div>
						<div class="col-3">
							<input id="btn_adress" onclick="click2()" type="button" value="우편번호 찾기" class="from_btn" style="width: 100%; margin-top: 10px;">
						</div>
					</div>
					<div class="row">
						<div class="col-3"></div>
						<div class="col-9">
							<input id="text_adress" type="text" class="form-control form-control-border addr1" placeholder="도로명 주소" style="margin-top: 5px; width: 100%;" disabled>
						</div>
					</div>
					<div class="row">
						<div class="col-3"></div>
						<div class="col-9">
							<input name="address_detail" type="text" class="form-control form-control-border addr2" placeholder="나머지 주소" style="margin-top: 5px; width: 100%;">
						</div>
					</div>
					<div class="row">
						<div class="col-3" style="padding-top: 5px; height: 30px; line-height: 40px;">
							<span tooltip="근무병원을 이름으로 검색해주세요!" flow="left">
							<i class="fa fa-question-circle-o" style="color: red;"></i>
							<span>근무 병원</span>
							</span>

						</div>
						<div class="col-9">
							<section class="content" style="width: 100%; margin-top: 5px; line-height: 40px;">
								<div class="form-group">
									<select class=" select2 selectHospital" name="selectHospital" style="width: 100%; line-height: 10px;">
										<c:forEach items="${hospitalName }" var="name">
											<option value="${name.hospitalCode }">${name.hospitalName }</option>
										</c:forEach>
									</select>
								</div>
							</section>

						</div>
					</div>
					<div class="row" style="padding-bottom: 30px;">
						<div class="col-6">
							<button class="col btn_cancel" style="background-color: lightgray" onclick="history.back();">취소</button>
						</div>
						<div class="col-6">
							<button class="col btn_signup" style="background-color: #2F88FF; color: white;" onclick="signUp('d');">가입하기</button>
						</div>


					</div>
				</div>


				<%@ include file="/WEB-INF/views/common/signUp_js.jsp"%>

			</div>
		</div>
	</div>

	<form id="signUpForm">
		<input type="hidden" name="memId" value="" /> <input type="hidden" name="memPwd" value="" /> <input type="hidden" name="memName" value="" /> <input type="hidden" name="memRegnum" value="" /> <input type="hidden" name="memEmail" value="" /> <input
			type="hidden" name="memTel" value="" /> <input type="hidden" name="memAddr1" value=""> <input type="hidden" name="memAddr2" value=""> <input type="hidden" name="memZipcode" value=""> <input type="hidden" name="doctorNum"
			value=""> <input type="hidden" name="hospitalCode" value=""> <input type="hidden" name="hospitalName" value="">
	</form>

</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

</script>
</html>