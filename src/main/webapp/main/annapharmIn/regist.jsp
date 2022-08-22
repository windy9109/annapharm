<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>일반사용자 - 약사IN 등록</title>

<style>
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
				<span class="mainTitle">약사</span><span class="mainTitle" style="color:#0069d9;">IN</span>
				<span style="font-weight: normal;">등록</span>
			</div>
			<div class="col-lg-8">
				<button type="button" class="btn btn-primary btn_detail">등록</button>
				<button type="button" class="btn btn-secondary btn_detail">취소</button>
			</div>
		</div>
		<div class="row" style="margin-left:10px; margin-right:10px;">
			<div class="col-lg-12">
				<div class="card">
					<div class="card card-secondary card-outline">
						<div class="card-header">
							<div class="row">
								<div class="col-lg-1">
									<h5 class="card-title">제목</h5>
								</div>
								<div class="col-lg-11">
									<input type="text" class="form-control form-control-lg" style="height: 35px;" placeholder="제목을 입력하세요." value="">
								</div>							
							</div>
						</div>
						<div class="card-body card-secondary card-outline">
							<div class="row">
								<div class="col-lg-1">
									<h5 class="card-title">카테고리</h5>
									<h5 class="card-title" style="margin-top:20px;">내용</h5>
								</div>
								<div class="col-lg-9">
									<ul class="nav nav-tabs" id="custom-content-above-tab" role="tablist">
										<li class="nav-item"><a class="nav-link active"
											id="custom-content-above-home-tab" data-toggle="pill"
											href="#custom-content-above-home" role="tab"
											aria-controls="custom-content-above-home" aria-selected="true">복약지도</a>
										</li>
										<li class="nav-item"><a class="nav-link"
											id="custom-content-above-profile-tab" data-toggle="pill"
											href="#custom-content-above-profile" role="tab"
											aria-controls="custom-content-above-profile"
											aria-selected="false">처방</a></li>
										<li class="nav-item"><a class="nav-link"
											id="custom-content-above-settings-tab" data-toggle="pill"
											href="#custom-content-above-settings" role="tab"
											aria-controls="custom-content-above-settings"
											aria-selected="false">기타</a></li>
									</ul>	
									<textarea class="textarea" name="content" id="content" rows="20" cols="90" placeholder="1000자 내외로 작성하세요." ></textarea>
								</div>
								<div class="col-lg-2">
									<div class="tab-content direct-chat-text" id="custom-content-above-tabContent">
										<div class="tab-pane fade show active"
											id="custom-content-above-home" role="tabpanel"
											aria-labelledby="custom-content-above-home-tab">
											<h4>복약지도</h4>
											복약지도는........카테고리입니다.
										</div>
										<div class="tab-pane fade" id="custom-content-above-profile"
											role="tabpanel"
											aria-labelledby="custom-content-above-profile-tab">
											<h4>처방</h4>
											 처방은........카테고리입니다.
										</div>
										<div class="tab-pane fade" id="custom-content-above-settings"
											role="tabpanel"
											aria-labelledby="custom-content-above-settings-tab">
											<h4>기타</h4>
											 기타는........카테고리입니다.
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<script>
	window.onload=function(){
		summernote_go($('textarea[name="content"]'),'<%=request.getContextPath()%>');
	}   
</script>
</body>
</html>