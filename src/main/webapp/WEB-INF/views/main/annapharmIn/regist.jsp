<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>일반사용자 - 약사IN 등록</title>

<style>
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

th {
	background-color: #343a40;
	background: #343a40;
	color: white;
	text-align: center;
	font-weight: bold;
}

td {
	text-align: center;
	font-size: 15px;
	color: black;
}

tr:hover {
	background-color: #c4e2ff;
	cursor: pointer;
}

.tableText {
	text-align: left;
}

.select2 {
	width: 140px;
}

.searchBox {
	padding-top: 30px;
	align-items: center;
	background: white;
	background-color: white;
	text-align: center;
	width: auto;
	margin-right: 10px;
	margin-left: 10px;
	padding-bottom: 10px;
}

.pageTitle {
	font-size: 25px;
	font-weight: bold;
	color: black;
	text-align: left;
	padding-left: 30px;
}

.select2-container--default .select2-selection--single {
	padding: 3px;
}

.searchBtn {
	height: 30px;
}

.searchDiv {
	width: 300px;
}

.form-group {
	margin: 0px;
}

.pagination {
	justify-content: center;
}

.btn_detail {
	width: 60px;
	height: 30px;
	margin: 10px;
	padding: 4px;
	float: right;
	font-weight: bold;
	font-size: 14px;
}

.col-lg-1 {
	padding-top: 8px;
}

.form-check-label {
	margin-right: 10px;
	font-size: 14px;
}

.subTitle {
	font-size: 14px;
}

.direct-chat-text {
	margin-top: 36px;
	margin-left: 0px;

	background-color: #d1dffb;
    border: 1px solid #d1dffb;
}

a {
	color: #007bff;
	text-decoration: none;
	background-color: transparent;
}
</style>
</head>
<body>
	<div class="content-wrapper" style="background-color: white">
		<div class="row searchBox">
			<div class="col-lg-4 pageTitle">
				<span class="mainTitle">약사</span><span class="mainTitle" style="color: #0069d9;">IN</span> <span style="font-weight: normal;">등록</span>
			</div>
			<div class="col-lg-8">
				<button type="button" class="btn btn-primary btn_detail" onclick="regist_go();">등록</button>
				<button type="button" class="btn btn-secondary btn_detail" onclick="history.back(-1);">취소</button>
			</div>
		</div>
		<div class="row" style="margin-left: 10px; margin-right: 10px;">
			<div class="col-lg-12">
				<div class="card">
				<form role="form" method="post" action="regist.do" name="registForm">
					<div class="card card-secondary card-outline" style=" box-shadow: none; border-top: 3px solid #007bff;">
						<div class="card-header" style="border: 0;">
							<div class="row">
								<!-- 작성자 -->
								<input type="hidden" id="writer" readonly
									name="memId" class="form-control" value="${loginUser.memId}">
								<input type="hidden" id="chemistInReplyCnt" readonly
									name="chemistInReplyCnt" class="form-control" value="0">

								<!-- 환자코드 -->
								<input type="hidden" id="patientCode" readonly
									name="patientCode" class="form-control" value="${loginUser.patientCode}">
								<div class="col-lg-1">
									<h5 class="card-title" style="font-size: 14px; font-weight: bold;">제목</h5>
								</div>

								<div class="col-lg-11">
									<input type="text" id="chemistInTitle" class="form-control form-control-lg" style="height: 35px; font-size: 14px;" name="chemistInTitle" placeholder="제목을 입력하세요." value="">
								</div>
							</div>
						</div>
						<div class="card-body card-secondary card-outline" style="border-top: 0; ">
							<div class="row">
								<div class="col-lg-1">
									<h5 class="card-title" style="font-size: 14px; font-weight: bold;">카테고리</h5>
									<br>
									<h5 class="card-title" style="margin-top: 20px; font-size: 14px; font-weight: bold;">내용</h5>
								</div>
								<div class="col-lg-9">



									<ul class="nav nav-tabs" id="custom-content-above-tab" role="tablist">

										<li class="nav-item">
										<a class="nav-link active" id="custom-content-above-home-tab" data-toggle="pill" href="#custom-content-above-home" role="tab" onClick="ridio01(this);" aria-controls="custom-content-above-home" aria-selected="true" style="font-size: 14px; font-weight: bold;"><input type="radio" name="chemistInType" value="복약지도" id="iqw1" checked="checked" >복약지도</a></li>

										<li class="nav-item">
										<a class="nav-link" id="custom-content-above-profile-tab" data-toggle="pill" href="#custom-content-above-profile" role="tab" onClick="ridio01(this);" aria-controls="custom-content-above-profile" aria-selected="false" style="font-size: 14px; font-weight: bold;"><input type="radio" name="chemistInType" id="iqw1" value="처방">처방</a></li>

										<li class="nav-item">
										<a class="nav-link" id="custom-content-above-profile-tab" data-toggle="pill" href="#custom-content-above-profile" role="tab" onClick="ridio01(this);" aria-controls="custom-content-above-profile" aria-selected="false" style="font-size: 14px; font-weight: bold;"><input type="radio" name="chemistInType" id="iqw1" value="성분">성분</a></li>


										<li class="nav-item">
										<a  class="nav-link" id="custom-content-above-settings-tab" data-toggle="pill" href="#custom-content-above-settings" onClick="ridio01(this);" role="tab" aria-controls="custom-content-above-settings" aria-selected="false" style="font-size: 14px; font-weight: bold;"><input type="radio" name="chemistInType" id="iqw1" value="기타">기타</a></li>

									</ul>
									<textarea class="textarea" name="chemistInContent" id="content" class="summernote" rows="20" cols="90" placeholder="1000자 내외로 작성하세요."></textarea>
								</div>
								<div class="col-lg-2">
									<div class="tab-content direct-chat-text" id="custom-content-above-tabContent" style="font-size: 14px;">
										<div class="tab-pane fade show active" id="custom-content-above-home" role="tabpanel" aria-labelledby="custom-content-above-home-tab">
											<h4 style="font-size: 14px; font-weight: bold;">복약지도</h4>
											복약지도는........카테고리입니다.
										</div>
										<div class="tab-pane fade" id="custom-content-above-profile" role="tabpanel" aria-labelledby="custom-content-above-profile-tab">
											<h4 style="font-size: 14px; font-weight: bold;">처방</h4>
											처방은........카테고리입니다.
										</div>
										<div class="tab-pane fade" id="custom-content-above-profile" role="tabpanel" aria-labelledby="custom-content-above-profile-tab">
											<h4 style="font-size: 14px; font-weight: bold;">처방</h4>
											성분은........카테고리입니다.
										</div>
										<div class="tab-pane fade" id="custom-content-above-settings" role="tabpanel" aria-labelledby="custom-content-above-settings-tab">
											<h4 style="font-size: 14px; font-weight: bold;">기타</h4>
											기타는........카테고리입니다.
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					</form>

				</div>
			</div>
		</div>
	</div>

	<script>
	window.onload=function(){
		summernote_go($('textarea[name="chemistInContent"]'),'<%=request.getContextPath()%>');
	}
	</script>


	<script>
window.onload=function(){
	summernote_go($('#content'),'<%=request.getContextPath()%>');
}
function regist_go(){
	var form = document.registForm;
	if(form.chemistInTitle.value==""){
		alert("제목은 필수입니다.");
		return;
	}

	form.submit();
}


function ridio01(ge) {

    $(ge.firstChild).prop('checked', true);

}



/*
$('.summernote').summernote({
	height: 300,                 // 에디터 높이
	minHeight: null,             // 최소 높이
	maxHeight: null,             // 최대 높이
	focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	lang: "ko-KR",					// 한글 설정
	placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
	callbacks: {	//여기 부분이 이미지를 첨부하는 부분
		onImageUpload : function(files) {
			uploadSummernoteImageFile(files[0],this);
		},
		onPaste: function (e) {
			var clipboardData = e.originalEvent.clipboardData;
			if (clipboardData && clipboardData.items && clipboardData.items.length) {
				var item = clipboardData.items[0];
				if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
					e.preventDefault();
				}
			}
		}
	}
});



/**
* 이미지 파일 업로드
*/
/* function uploadSummernoteImageFile(file, editor) {
data = new FormData();
data.append("file", file);
$.ajax({
data : data,
type : "POST",
url : "/uploadSummernoteImageFile",
contentType : false,
processData : false,
success : function(data) {
	//항상 업로드된 파일의 url이 있어야 한다.
	$(editor).summernote('insertImage', data.url);
}
});
}  */
</script>


</body>
</html>