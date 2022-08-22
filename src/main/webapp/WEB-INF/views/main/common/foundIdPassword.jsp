<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>

</head>

<body>
	<div class="content-wrapper" style="margin: 0px; background-size: cover;">
		<div style="padding-top: 16%; margin: 0px auto;">
			<div style="background-color: white; width: 920px; margin: 0px auto; font-size: 14px; border-radius: 5px;">
				<div style="padding: 30px 20px;">
					<img src="/annapharm/resources/img/logo.png" style="width: 100px;" onclick="javascript:location.href='<%=request.getContextPath()%>/index.do'"> <br> <br> <span style="font-size: 15px; font-weight: bold; margin-left: 5px;">아이디/비밀번호
						찾기</span>
					<hr style="border: 0.5px solid;">
					<div class="container">
						<div class="row" style="margin-top: 5px;">
							<div class="col-6">
								<span style="margin-top: 10px; font-size: 12px;">아이디 찾기</span>
								<hr>
								<div class="row">
									<div class="col-3" style="line-height: 40px;">
										<span style="font-weight: bold;">이름</span>
									</div>
									<div class="col-9">
										<input class="form-control form-control-border idname" type="text" style="width: 100%;" placeholder="이름을 입력해주세요">
									</div>
								</div>
								<div class="row">
									<div class="col-3" style="line-height: 40px;">
										<span style="font-weight: bold;">휴대폰 번호</span>
									</div>
									<div class="col-5">
										<input class="form-control form-control-border idtel" type="text" style="width: 100%;" placeholder="휴대폰 번호(-제외)">
									</div>
									<div class="col-4" style="line-height: 40px;">
										<button class="btn btn-default idtelCheck" style="padding: 6px 10px; width: 100%;" onclick="telCheck1()">인증번호받기</button>
									</div>
								</div>
								<div class="row">
									<div class="col-3" style="line-height: 40px;">
										<span style="font-weight: bold;">인증번호</span>
									</div>
									<div class="col-5">
										<input class="form-control form-control-border idrandNum" type="text" style="width: 100%;" placeholder="인증번호">
									</div>
									<div class="col-4" style="line-height: 40px;">
										<button class="btn btn-default idrandNumCheck" style="padding: 6px 10px; width: 100%; background-color: lightgray; color: white;" onclick="randNumCheck1()" disabled>인증번호확인</button>
									</div>
								</div>
								<div class="row" style="margin-top: 45px;">
									<div class="col-12">
										<button class="btn btn-default btn_foundId" style="background-color: #007bff; font-weight: bold; width: 100%; color: white;" onclick="foundId()">아이디 찾기 확인</button>
									</div>
								</div>
<!-- 								<div class="row showId" style="margin-top: 5px; display: none;"> -->

<!-- 									<span id="idResult" style="font-weight: bold; padding: 7.5px; float: left;"> </span> -->
<!-- 									<div style="width: 73%;"></div> -->
<!-- 								</div> -->
								<div class="showId" style="margin-top: 20px; display: none;">
									<span style="line-height: 30px;">고객님의 정보와 일치하는 아이디 목록입니다.</span> <a href="<%=request.getContextPath()%>/common/loginForm.do" style="float: right; font-weight: bold; padding: 7.5px;">&gt; 로그인하러가기</a> <br>
									<div style="border-radius: 3px; border: 0.1px solid lightgray; margin: 10px 0px; padding: 10px 5px;">
										<div class="row" style="width: 70%; margin: 0px auto;">
											<span id="idResult" style="font-weight: bold; margin-right: 15px; width: 50%;">아이디 </span> 가입&nbsp;:&nbsp; <span id="regDateResult"></span>
										</div>
									</div>
								</div>


							</div>
							<!-- 아이디 찾기 끝! -->
							<div class="col-6">
								<span style="margin-top: 20px; font-size: 12px;">비밀번호 찾기</span>
								<hr>
								<form action="<%=request.getContextPath()%>/foundPassword.do" method="post">
									<div class="row">
										<div class="col-3" style="line-height: 40px;">
											<span style="font-weight: bold;">아이디</span>
										</div>
										<div class="col-9">
											<input class="form-control form-control-border id" name="memId" type="text" style="width: 100%;" placeholder="아이디를 입력해주세요">
										</div>
									</div>
									<div class="row">
										<div class="col-3" style="line-height: 40px;">
											<span style="font-weight: bold;">이름</span>
										</div>
										<div class="col-9">
											<input class="form-control form-control-border pwdname" name="memName" type="text" style="width: 100%;" placeholder="이름을 입력해주세요">
										</div>
									</div>
									<div class="row">
										<div class="col-3" style="line-height: 40px;">
											<span style="font-weight: bold;">휴대폰 번호</span>
										</div>
										<div class="col-5">
											<input class="form-control form-control-border pwdtel" name="memTel" type="text" style="width: 100%;" placeholder="휴대폰 번호(-제외)">
										</div>
										<div class="col-4" style="line-height: 40px;">
											<button type="button" class="btn btn-default pwdtelCheck" style="padding: 6px 10px; width: 100%;" onclick="telCheck2()">인증번호받기</button>
										</div>
									</div>
									<div class="row">
										<div class="col-3" style="line-height: 40px;">
											<span style="font-weight: bold;">인증번호</span>
										</div>
										<div class="col-5">
											<input class="form-control form-control-border pwdrandNum" type="text" style="width: 100%;" placeholder="인증번호">
										</div>
										<div class="col-4" style="line-height: 40px;">
											<button type="button" class="btn btn-default pwdrandNumCheck" style="padding: 6px 10px; width: 100%; background-color: lightgray; color: white;" onclick="randNumCheck2()" disabled>인증번호확인</button>
										</div>
									</div>
									<div class="row" style="margin-top: 5px;">
										<div class="col-12">
											<button type="button" class="btn btn-default" style="width: 100%; background-color: #007bff; font-weight: bold; color: white; " onclick="foundPassword()">비밀번호 찾기 확인</button>
										</div>
									</div>
								</form>
								<div class="showPassword" style=" margin-top: 20px; display: none;">
									<span style="line-height: 30px; padding-left: 7.5px;">등록된 전화번호로 비밀번호를 전송했습니다.</span> <a href="<%=request.getContextPath()%>/common/loginForm.do" style="float: right; font-weight: bold; padding: 7.5px;">&gt; 로그인하러가기</a> <br>

								</div>

							</div>

						</div>
					</div>
					<div class="container"></div>
				</div>
			</div>
			<div style="margin: 10px; text-align: center;">
				<span style="font-size: 0.8em;">귀하의 정보는 동의없이 공개되지 않으며,개인정보보호정책에 의해 보호받고있습니다.</span>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/main/common/common_js.jsp"%>

	<c:if test="${!empty error }">
		<script type="text/javascript">
			alert('${error}');
		</script>
	</c:if>

</body>
</html>