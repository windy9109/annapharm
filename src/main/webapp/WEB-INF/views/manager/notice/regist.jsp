<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 - 공지사항 등록</title>

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

</style>
</head>
<body>
	<div class="content-wrapper" style="background-color: white">
		<div class="row searchBox">
			<div class="col-lg-4 pageTitle">
				<span>공지사항</span> <span style="font-weight: normal;">등록</span>
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
									<h5 class="card-title">내용</h5>
								</div>
								<div class="col-lg-11">
									<textarea class="textarea" name="content" id="content" rows="20" cols="90" placeholder="1000자 내외로 작성하세요." ></textarea>
								</div>							
							</div>
							<div class="row">
								<div class="col-lg-1">
									<span class="card-title" style="width:70px;">첨부파일</span>
								</div>
								<div class="col-lg-11">
									<button type="button" class="btn btn-secondary">파일 가져오기</button>
								</div>
							</div>
						</div>
					</div>
					<div class="card-footer card-secondary card-outline">
						<h6>설정</h6>
						<!-- <div class="row" style="margin:10px">
							<div class="col-lg-2">
								<span class="card-title">공개여부</span>
							</div>
							<div class="col-lg-10">
								<input type="checkbox">
							</div>
						</div> -->
						<div class="row" style="margin:10px">
							<div class="col-lg-2">
								<span class="card-title">공개대상 설정</span>
							</div>
							<div class="col-lg-10" style="display:flex">
								<div class="form-check">
									<input class="form-check-input" type="radio" name="radio1">
									<label class="form-check-label">전체</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="radio1">
									<label class="form-check-label">약사</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="radio1">
									<label class="form-check-label">의사</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="radio1">
									<label class="form-check-label">일반</label>
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