<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>약사 - 문의사항 등록</title>

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
	width: 1037px;
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
.hoverIcon:hover{
	cursor: pointer;
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
		<div class="row">
			<div class="col-lg-12">
				<div class="card-header">
					<h3 class="card-title">
						<i class="fa-solid fa-house-chimney hoverIcon" style="color:#007bff;"></i>&nbsp;&nbsp;
						<i class="fas fa-angle-right"></i>&nbsp;&nbsp; MyPage
						<i class="fas fa-angle-right"></i>&nbsp;&nbsp; 문의하기
					</h3>
				</div>
			</div>
		</div>
		<div class="row searchBox">
			<div class="col-lg-4 pageTitle">
				<span style="color:#007bff; font-size:1.5em;">Q</span>
				<span>문의사항</span> 
				<span style="font-weight: normal;">등록</span>
			</div>
			<div class="col-lg-8">
				<button type="button" class="btn btn-primary btn_detail">등록</button>
				<button type="button" class="btn btn-secondary btn_detail">취소</button>
			</div>
		</div>
		<div class="row" style="margin-left:10px; margin-right:10px; margin-top:20px;">
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
									<h5 class="card-title">내용</h5>
								</div>
								<div class="col-lg-11">
									<textarea class="textarea" name="content" id="content" rows="20" cols="90" placeholder="1000자 내외로 작성하세요." ></textarea>
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