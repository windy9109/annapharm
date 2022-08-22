<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>일반사용자 - 약사IN 게시글 수정</title>

<style>
.card-secondary.card-outline{
border-top: 3px solid #007bff;
}
.stand-by{
	background-color: #adb5bd;
	background: #adb5bd;
	color: white;
}
.stand-end{
	background-color: #007bff;
	background: #007bff;
	color: white;
}
th{
	background-color: #343a40;
	background: #343a40;
	color: white;
	text-align: center;
	font-weight: bold;
}
td{
	text-align: center;
	font-size: 15px;
	color:black;
}
tr:hover{
	background-color: #c4e2ff;
	cursor: pointer;
}
.tableText{
	text-align: left;
}
.select2{
	width: 140px;
}
.searchBox{
	padding-top: 30px;
	align-items:center;
	background: white;
	background-color:white;
	text-align: center;
	width: auto;
	margin-right: 10px;
	margin-left: 10px;

}
.pageTitle{
	font-size: 30px;
	font-weight: bold;
	color: black;
	text-align: left;
	padding-left: 30px;
}
.select2-container--default .select2-selection--single{
	padding: 3px;
}
.searchBtn{
	height: 30px;
}
.searchDiv{
	width: 300px;
}
.form-group{
	margin: 0px;
}
.pagination{
	justify-content: center;
}
.btn_detail{
	width: 60px;
	height: 30px;
	margin : 10px;
	padding : 4px;
	float: right;
}
.col-lg-1{
	padding-top: 8px;
}
.form-check-label{
	margin-right: 10px;
	font-size: 14px;
}
.subTitle{
	font-size: 14px;
}
.direct-chat-text{
	margin-top: 36px;
	margin-left: 0px;
}

</style>
</head>
<body>
	<div class="content-wrapper" style="background-color: white">
		<div class="row searchBox">
			<div class="col-lg-4 pageTitle">
				<span class="mainTitle">약사</span><span class="mainTitle" style="color:#0069d9;">IN</span>
				<span style="font-weight: normal;">수정</span>
			</div>
			<div class="col-lg-8">
				<button type="button" class="btn btn-primary btn_detail" onclick="modify_go();">수정</button>
				<button type="button" class="btn btn-secondary btn_detail" onClick="history.back(-1);">취소</button>
			</div>
		</div>
		<div class="row" style="margin-left:10px; margin-right:10px;">
			<div class="col-lg-12">
			<form role="form" method="post" action="modify.do" name="modifyForm">
				<input type="hidden" name="chemistInCode" value="${annapharmIn.chemistInCode}" />
				<div class="card">
					<div class="card card-secondary card-outline">
						<div class="card-header" style="border: 0;">
							<div class="row">
							<input type="hidden" id="writer" readonly	name="chemistInWriter" class="form-control"  value="${annapharmIn.chemistInWriter}">
<%-- 							<div class="form-group">
								<label for="writer">작성자</label>
								<input type="text" id="writer" readonly	name="chemistInWriter" class="form-control"  value="${annapharmIn.chemistInWriter}">
							</div> --%>
							<input type="hidden" id="chemistInReplyCnt" readonly name="chemistInReplyCnt" class="form-control" value="0">
								<div class="col-lg-1">
									<h5 class="card-title">제목</h5>
								</div>
								<div class="col-lg-11">
									<input type="text" class="form-control form-control-lg" style="height: 35px;" placeholder="제목을 입력하세요." name="chemistInTitle" value="${annapharmIn.chemistInTitle}">
								</div>
							</div>
						</div>
						<div class="card-body card-secondary card-outline" style="border-top:0;">
							<div class="row">
								<div class="col-lg-1">
									<h5 class="card-title">카테고리</h5>
									<h5 class="card-title" style="margin-top:20px;">내용</h5>
								</div>
								<div class="col-lg-9">
									<ul class="nav nav-tabs" id="custom-content-above-tab" role="tablist">

									<c:if test="${annapharmIn.chemistInType eq '복약지도'}">
										<li class="nav-item">
										<a class="nav-link active" id="custom-content-above-home-tab" data-toggle="pill" href="#custom-content-above-home" role="tab" onClick="ridio01(this);" aria-controls="custom-content-above-home" aria-selected="true" style="font-size: 14px; font-weight: bold;"><input type="radio" name="chemistInType" value="복약지도" id="iqw1" checked="checked">복약지도</a></li>
										<li class="nav-item">
										<a class="nav-link" id="custom-content-above-profile-tab" data-toggle="pill" href="#custom-content-above-profile" role="tab" onClick="ridio01(this);" aria-controls="custom-content-above-profile" aria-selected="false" style="font-size: 14px; font-weight: bold;"><input type="radio" name="chemistInType" id="iqw1" value="처방" >처방</a></li>
										<li class="nav-item">
										<a class="nav-link" id="custom-content-above-profile-tab2" data-toggle="pill" href="#custom-content-above-profile2" role="tab" onClick="ridio01(this);" aria-controls="custom-content-above-profile" aria-selected="false" style="font-size: 14px; font-weight: bold;"><input type="radio" name="chemistInType" id="iqw1" value="성분">성분</a></li>
										<li class="nav-item">
										<a  class="nav-link" id="custom-content-above-settings-tab" data-toggle="pill" href="#custom-content-above-settings" onClick="ridio01(this);" role="tab" aria-controls="custom-content-above-settings" aria-selected="false" style="font-size: 14px; font-weight: bold;"><input type="radio" name="chemistInType" id="iqw1" value="기타">기타</a></li>
									</c:if>

									<c:if test="${annapharmIn.chemistInType eq '처방'}">
										<li class="nav-item">
										<a class="nav-link" id="custom-content-above-home-tab" data-toggle="pill" href="#custom-content-above-home" role="tab" onClick="ridio01(this);" aria-controls="custom-content-above-home" aria-selected="false" style="font-size: 14px; font-weight: bold;"><input type="radio" name="chemistInType" value="복약지도" id="iqw1" >복약지도</a></li>
										<li class="nav-item">
										<a class="nav-link active" id="custom-content-above-profile-tab" data-toggle="pill" href="#custom-content-above-profile" role="tab" onClick="ridio01(this);" aria-controls="custom-content-above-profile" aria-selected="true" style="font-size: 14px; font-weight: bold;"><input type="radio" name="chemistInType" id="iqw1" value="처방"  checked="checked">처방</a></li>
										<li class="nav-item">
										<a class="nav-link" id="custom-content-above-profile-tab2" data-toggle="pill" href="#custom-content-above-profile2" role="tab" onClick="ridio01(this);" aria-controls="custom-content-above-profile" aria-selected="false" style="font-size: 14px; font-weight: bold;"><input type="radio" name="chemistInType" id="iqw1" value="성분">성분</a></li>
										<li class="nav-item">
										<a  class="nav-link" id="custom-content-above-settings-tab" data-toggle="pill" href="#custom-content-above-settings" onClick="ridio01(this);" role="tab" aria-controls="custom-content-above-settings" aria-selected="false" style="font-size: 14px; font-weight: bold;"><input type="radio" name="chemistInType" id="iqw1" value="기타">기타</a></li>
									</c:if>

									<c:if test="${annapharmIn.chemistInType eq '성분'}">
										<li class="nav-item">
										<a class="nav-link" id="custom-content-above-home-tab" data-toggle="pill" href="#custom-content-above-home" role="tab" onClick="ridio01(this);" aria-controls="custom-content-above-home" aria-selected="false" style="font-size: 14px; font-weight: bold;"><input type="radio" name="chemistInType" value="복약지도" id="iqw1" >복약지도</a></li>
										<li class="nav-item">
										<a class="nav-link" id="custom-content-above-profile-tab" data-toggle="pill" href="#custom-content-above-profile" role="tab" onClick="ridio01(this);" aria-controls="custom-content-above-profile" aria-selected="false" style="font-size: 14px; font-weight: bold;"><input type="radio" name="chemistInType" id="iqw1" value="처방" >처방</a></li>
										<li class="nav-item ">
										<a class="nav-link active" id="custom-content-above-profile-tab2" data-toggle="pill" href="#custom-content-above-profile2" role="tab" onClick="ridio01(this);" aria-controls="custom-content-above-profile" aria-selected="true" style="font-size: 14px; font-weight: bold;"><input type="radio" name="chemistInType" id="iqw1" value="성분" checked="checked">성분</a></li>
										<li class="nav-item">
										<a  class="nav-link" id="custom-content-above-settings-tab" data-toggle="pill" href="#custom-content-above-settings" onClick="ridio01(this);" role="tab" aria-controls="custom-content-above-settings" aria-selected="false" style="font-size: 14px; font-weight: bold;"><input type="radio" name="chemistInType" id="iqw1" value="기타">기타</a></li>
									</c:if>

									<c:if test="${annapharmIn.chemistInType eq '기타'}">
										<li class="nav-item">
										<a class="nav-link" id="custom-content-above-home-tab" data-toggle="pill" href="#custom-content-above-home" role="tab" onClick="ridio01(this);" aria-controls="custom-content-above-home" aria-selected="false" style="font-size: 14px; font-weight: bold;"><input type="radio" name="chemistInType" value="복약지도" id="iqw1" >복약지도</a></li>
										<li class="nav-item">
										<a class="nav-link" id="custom-content-above-profile-tab" data-toggle="pill" href="#custom-content-above-profile" role="tab" onClick="ridio01(this);" aria-controls="custom-content-above-profile" aria-selected="false" style="font-size: 14px; font-weight: bold;"><input type="radio" name="chemistInType" id="iqw1" value="처방" >처방</a></li>
										<li class="nav-item">
										<a class="nav-link" id="custom-content-above-profile-tab2" data-toggle="pill" href="#custom-content-above-profile2" role="tab" onClick="ridio01(this);" aria-controls="custom-content-above-profile" aria-selected="false" style="font-size: 14px; font-weight: bold;"><input type="radio" name="chemistInType" id="iqw1" value="성분">성분</a></li>
										<li class="nav-item">
										<a  class="nav-link active" id="custom-content-above-settings-tab" data-toggle="pill" href="#custom-content-above-settings" onClick="ridio01(this);" role="tab" aria-controls="custom-content-above-settings" aria-selected="true" style="font-size: 14px; font-weight: bold;"><input type="radio" name="chemistInType" id="iqw1" value="기타" checked="checked">기타</a></li>
									</c:if>

									</ul>
									<!-- 내용입력 -->
									<textarea class="textarea" id="content" rows="20" cols="90" placeholder="1000자 내외로 작성하세요." name="chemistInContent">${annapharmIn.chemistInContent}</textarea>
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
										<div class="tab-pane fade" id="custom-content-above-profile2" role="tabpanel" aria-labelledby="custom-content-above-profile-tab">
											<h4 style="font-size: 14px; font-weight: bold;">성분</h4>
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
				</div>
				</form>
			</div>
		</div>
	</div>

<script>
	window.onload=function(){
		summernote_go($('textarea[name="chemistInContent"]'),'<%=request.getContextPath()%>');

	}

	function modify_go(){
		$("form[role='form']").submit();
	}

	function ridio01(ge) {

	    $(ge.firstChild).prop('checked', true);

	}
</script>
</body>
</html>