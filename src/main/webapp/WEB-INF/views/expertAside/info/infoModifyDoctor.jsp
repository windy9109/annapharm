<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정(의사)</title>
<style type="text/css">
.select2-container--default .select2-selection--single{
	padding:2px;
}
</style>
</head>
<body >
	<div class="content-wrapper" style="background-color: white;">
		<div class="body" style="padding: 30px; font-size: 14px;" >
			<span style="font-weight: bold;">내 정보 수정</span>
			<hr style="border: 1px solid;">
			<div style="margin-top: 20px;">
				<div class="container" style="width:500px; margin: 0px;">

				<span style="font-weight: bold;">기본정보</span> <br>
					<div class="row" style="margin-top: 20px;">
						<div class="col-3" style="line-height: 25px;">
							이름
						</div>
						<div class="col-9">
							<input type="text" class="form-control form-control-border" <%-- value='${loginUser.memName }' --%> style="width: 100%; height: 25px;">
						</div>
					</div>

					<div class="row" style="margin-top: 10px;">
						<div class="col-3" style="line-height: 25px;">
							본인확인 이메일
						</div>
						<div class="col-9">
<%-- 							<input type="text" class="form-control form-control-border" style="width: 100%; height: 25px;" value='${loginUser.memEmail }' > --%>
						</div>
					</div>

					<div class="row">
						<div class="col-3">
							<span style="padding-top: 5px; height: 30px; line-height: 40px;">휴대전화</span>
						</div>
						<div class="col-6">
							<input type="tel" class="form-control form-control-border tel" placeholder="(-)제외하고 입력해주세요"<%--  value='${loginUser.memTel }' --%> style="margin-top: 5px; width: 100%;">
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
							<input id="zcode" type="text" class="form-control form-control-border zcode" placeholder="우편번호" <%-- value='${loginUser.memZipcode }' --%> style="margin-top: 5px; width: 100%;" disabled>
						</div>
						<div class="col-3">
							<input id="btn_adress" onclick="click2()" type="button" value="우편번호 찾기" class="from_btn"  style="width: 100%; margin-top: 10px;">
						</div>
					</div>

					<div class="row">
						<div class="col-3"></div>
						<div class="col-9">
							<input id="text_adress" type="text" class="form-control form-control-border addr1" placeholder="도로명 주소" <%-- value='${loginUser.memAddr }' --%> style="margin-top: 5px;  width: 100%;" disabled>
						</div>
					</div>
					<div class="row">
						<div class="col-3"></div>
						<div class="col-9">
							<input name="address_detail" type="text" class="form-control form-control-border addr2"  placeholder="나머지 주소" <%-- value="${loginUser.memAddr2 }" --%> style="margin-top: 5px; width: 100%;">
						</div>
					</div>
					<div class="row">
						<div class="col-3">
							<span style=" padding-top: 5px; height: 30px; line-height: 40px;">근무 병원</span>
						</div>
						<div class="col-9">
							<section class="content" style=" width: 100%; margin-top: 5px; line-height: 40px;">
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
					<div class="row" style="margin-top:60px;">
						<div class="col-4">
							<span style="font-weight: bold; margin-top: 30px;">비밀번호</span>
						</div>
						<div class="col-8">
							<button type="button" class="btn btn-block btn-default"
								style="width: 38%; height: 25px; padding: 0px; text-align: center;">변경하기</button>
						</div>
					</div>

					<div class="row" style="margin-top: 30px;">
						<div class="col-6" style="line-height: 25px;">
							<button class="btn btn-block" style="background-color: lightgray; color: white;" >취소</button>
						</div>
						<div class="col-6">
							<button class="btn btn-block" style="background-color: #2F88FF; color: white;" >수정</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>