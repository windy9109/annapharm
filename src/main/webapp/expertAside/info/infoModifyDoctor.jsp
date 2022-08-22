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
		<div class="body" style="padding: 30px;">
			<span style="font-weight: bold;">내 정보 수정</span>
			<hr style="border: 1px solid;">
			<div style="margin-top: 20px;">
				<div class="container" style="width:500px; margin: 0px;">
					
				<span style="font-weight: bold;">기본정보</span> <br>
					<div class="row" style="margin-top: 20px;">
						<div class="col-4" style="line-height: 25px;">
							이름
						</div>
						<div class="col-8">
							<input type="text" class="form-control form-control-border" value="김네모" style="width: 100%; height: 25px;">
						</div>
					</div>
					<div class="row" style="margin-top: 10px;">
						<div class="col-4" style="line-height: 25px;">
							생년월일
						</div>
						<div class="col-8">
							<div class="row" style="padding-left: 10px;">
								<div class="col-4" style="padding-left: 0px; display: inline-block;">
									<select class="form-control">
										<c:forEach var="i" begin="1950" end="2022">
											<option>${i}년</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-4">
									<select class="form-control">
										<c:forEach var="i" begin="1" end="11">
											<option>${i}월</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-4">
									<select class="form-control">
										<c:forEach var="i" begin="1" end="31">
											<option>${i}일</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row" style="margin-top: 10px;">
						<div class="col-4" style="line-height: 25px;">
							본인확인 이메일
						</div>
						<div class="col-8">
							<input type="text" class="form-control form-control-border" style="width: 100%; height: 25px;" value="email@naver.com">
						</div>
					</div>
					<div class="row" style="margin-top: 10px;">
						<div class="col-4" style="line-height: 25px;">
							휴대전화
						</div>
						<div class="col-8">
						
							<input type="text" class="form-control form-control-border" style="width: 60%; height: 25px; display: inline-block;" value="010-0000-0000">
							<!-- <input type="button" class="btn_form" value="인증번호 받기" style="width: 38%; height: 25px;" > -->
							<button type="button" class="btn btn-block btn-default" style="width: 38%; height: 25px;  display: inline-block; padding: 0px; text-align: center;">인증번호 받기</button>
							<input type="text" class="form-control form-control-border" style="margin-top:10px; width: 100%; height: 25px;" value="">
						</div>
					</div>
					<div class="row" style="margin-top: 10px;">
						<div class="col-4" style="line-height: 25px;">
							주소
						</div>
						<div class="col-8">
						
							<input type="text" class="form-control form-control-border" style="width: 60%; height: 25px; display: inline-block;" value="000000">
							<button type="button" class="btn btn-block btn-default" style="width: 38%; height: 25px;  display: inline-block; padding: 0px; text-align: center;">우편번호 찾기</button>
							<input type="text" class="form-control form-control-border" style="margin-top:10px; width: 100%; height: 25px;" value="대전 중구 목동로..">
							<input type="text" class="form-control form-control-border" style="margin-top:10px; width: 100%; height: 25px;" value="103동 ---호">
						</div>
					</div>
					<div class="row" style="margin-top: 10px;">
						<div class="col-4" style="line-height: 25px;">
							근무병원
						</div>
						<div class="col-8">
							<section class="content"
								style="display: inline-block; width: 100%;; margin-top: 5px;">
								<div class="form-group">
									<select class="select2" style="width: 100%; line-height: 10px;">
										<option selected>대전선병원</option>
										<option>새손병원</option>
										<option>튼튼병원</option>
										<option>박사구두병원</option>
										<option>참다남병원</option>
										<option>신정병원</option>
										<option>이마음의원</option>
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
</html>