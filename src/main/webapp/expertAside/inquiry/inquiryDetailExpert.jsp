<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약사 문의하기 상세(답글이 있는 경우)</title>
<style type="text/css">
.btn_modify, .btn_remove {
	border: none;
	border-radius: 5px;
	height: 25px;
	line-height: 25px;
	text-align: center;
	padding: 0px 30px;
	background-color: #2F88FF;
	color: white;
}

.btn_back {
	border: 0.5px;
	background-color: white;
}

</style>
</head>
<body>
	<div class="content-wrapper" style=" background-color: white;">
	
	<span ><input type="button" value="< &nbsp; 돌아가기" class="btn_back " style=" padding: 30px; font-weight: bold;"></span>
	<br>
		<div style="padding: 50px 130px; padding-bottom: 20px;">

			<span style="font-weight: bold; color: #2F88FF; font-size: 3.0em;">Q</span>
			<span style="font-weight: bold; font-size: 1.5em; margin-left: 20px;">문의사항 제목</span>
			
			<!-- 답변이 안달렸을 경우 활성화 -->
			<div style="float: right; margin-top: 20px;">
				<button type="button" class="btn btn-block btn-primary modify" style="width: 70px; display: inline-block;">수정</button>
				<button type="button" class="btn btn-block btn-danger delete" style="width: 70px; display: inline-block; margin: 0px;">삭제</button>
			</div>
			
			<div style="margin : 40px 0px;">
				갑 속에 든 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을
				생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며
				얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 따뜻한 봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의
				끓는 피다 청춘의 피가 뜨거운지라 인간의 품으며 그들의 이상은 아름답고 소담스러운 열매를 맺어 우리 인생을 풍부하게 하는
				것이다 보라 청춘을 ! 그들의 몸이 얼마나 튼튼하며 그들의 피부가 얼마나 생생하며 그들의 눈에 무엇이 타오르고 있는가?
			</div>
			<div style="margin-bottom: 30px;">
				<span style="font-weight: bold;">김동글</span>
				<span style="margin-left: 20px;">22.07.05</span>
			</div>
			
		</div>
		<div
			style="background-color: lightgray; padding-top: 50px; padding-bottom: 50px;">
			
			<div style="margin: 20px 100px; background-color: white; padding-top: 20px; padding-bottom: 20px;">
				<div style="margin: 30px; margin-top: 10px;">
			<span style="font-weight: bold; color: #2F88FF; font-size: 3.0em; ">A</span>
					<span style="font-weight: bold;">&nbsp;&nbsp;&nbsp;관리자</span><br>
				    <p style="margin-top: 30px;">
				       	갑 속에 든 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나
						쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃
						피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 따뜻한 봄바람이다
						인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 품으며 그들의 이상은 아름답고
						소담스러운 열매를 맺어 우리 인생을 풍부하게 하는 것이다 보라 청춘을 ! 그들의 몸이 얼마나 튼튼하며 그들의 피부가
						얼마나 생생하며 그들의 눈에 무엇이 타오르고 있는가?
					</p>
				<hr>
				2022.07.06
				</div>
			</div>
		</div>
	</div>
</body>
</html>