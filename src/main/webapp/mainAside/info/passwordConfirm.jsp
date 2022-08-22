<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<style type="text/css">
.btn_regist {
	border: none;
	border-radius: 5px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	padding: 0px 30px;
	background-color: #2F88FF;
	color: white;
}

.stand-by {
	background-color: #adb5bd;
	background: #adb5bd;
	color: white;
}

.stand-end {
	background-color: #007bff;
	background: #007bff;
	color: white;
}

.goListBtnDiv {
	width: 100%;
	height: 50px;
	text-align: center;
	padding-left: 90%;
}

/* 목록으로 버튼 */
.goListBtn {
	height: 30px;
	width: 90px;
	display: block;
	position: relative;
	float: left;
	padding: 0;
	/* margin: 10px 20px 10px 0; */
	text-align: center;
	line-height: 30px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
	border: 0;
	background: #1E90FF;
}

.goListBtn:hover {
	background: #1478FF;
	color: #FFF;
}

/* 비밀번호 확인 div */
.mainDiv {
	border: 2px solid lightgray;
	width: 87%;
	height: 250px;
	padding: 70px;
}

.memId {
	font-size: 26px;
	margin-bottom: 13px;
}

.memPass {
	font-size: 26px;
	margin-left: 24px;
}

.idInput {
	width: 50%;
	height: 44px;
    font-size: 22px;
    padding-left: 10px;
}

.passInput {
	width: 52%;
	height: 44px;
    font-size: 22px;
    padding-left: 10px;
}

a.button {
	position: relative;
	padding: 0;
	font-weight: 600;
	line-height: 90px;
	color: #FFF;
	border-radius: 5px;
	transition: all 0.2s;
	display: flex;
	left: 70%;
	bottom: 100px;
	width: 120px;
	height: 100px;
	margin-left: 17px;
	margin-right: 20px;
}

/* 처방전상세내역버튼(추가, 저장, 취소) */
.preDetailBtn {
	background-color: #6e6e6e;
}

.btnBlueGreen {
	background: #1E82FF;
}

.btnFade.btnBlueGreen:hover {
	background: #0A6EFF;
}

.okSpan {
	margin-left: 43px;
}
</style>
</head>
<body>
	<div class="content-wrapper">
		<div class="body" style="padding: 30px; margin-left: 20px; padding-top: 11%;">
			<div class="title">
				<span style="font-weight: bold; font-size: 1.4em; margin-top: 80px;">회원비밀번호
					확인</span>
			</div>

			<hr style="width: 229px;">

			<div>
				<p>
					<span style="color: #2F88FF">비밀번호를 한번 더 입력해주세요.</span> <br> <span>회원님의
						정보를 안전하게 보호하기 위해 비밀번호를 한번 더 확인합니다.</span>
				</p>
			</div>
			<div style="margin-top: 20px;">
				<br>
				<!-- 비밀번호 확인  -->
				<div class="mainDiv">
					<div class="memId">
						회원아이디 <input type="text" value="ID1234" class="idInput">
					</div>
					<div class="memPass">
						비밀번호 <input style="" type="text" value="" class="passInput">
					</div>
					<div class="okBtn">
						<a href="" class="button btnFade btnBlueGreen"><span
							class="okSpan">확인</span></a>
					</div>
				</div>
			</div>

		</div>


	</div>
</body>
</html>