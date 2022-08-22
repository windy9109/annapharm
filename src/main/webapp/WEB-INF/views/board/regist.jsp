<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 - 공지사항 등록</title>

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
	width: 1280px;
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
}

.col-lg-1 {
	padding-top: 8px;
}

.form-check-label {
	margin-right: 10px;
	font-size: 14px;
}

textarea {
	width: 100%;
	border: 0.3px solid lightgray;
	border-radius: 5px;
	resize: none;
	padding: 10px;
}

textarea:focus {
	outline: none;
}
</style>
</head>
<body>
	<div class="content-wrapper" style="background-color: white;">
		<div class="row searchBox">
			<div class="col-lg-4 pageTitle">
				<span>공지사항</span> <span style="font-weight: normal;">등록</span>

			</div>
			<div class="col-lg-8">
				<button type="button" class="btn btn-primary btn_detail" onclick="regist_go()">등록</button>
				<button type="button" class="btn btn-secondary btn_detail" onclick="history.back()">취소</button>
			</div>
		</div>
		<div class="row" style="margin-left: 10px; margin-right: 10px; font-size: 14px;">
			<div class="col-lg-12">
				<div class="card">
					<div class="card card-secondary card-outline">
						<div class="card-header">
							<div class="row">
								<div class="col-lg-1">
									<h5 class="card-title" style="font-size: 14px; font-weight: bold;">제목</h5>
								</div>
								<div class="col-lg-11">
									<input type="text" class="form-control form-control-lg boardTitle" style="height: 35px; font-size: 14px; outline: none;" placeholder="제목을 입력하세요." value="">
								</div>
							</div>
						</div>
						<div class="card-body card-secondary ">
							<div class="row">
								<div class="col-lg-1">
									<h5 class="card-title " style="font-size: 14px; font-weight: bold;">내용</h5>
								</div>
								<div class="col-lg-11">
									<textarea class="textarea" name="content" id="content" rows="20" cols="90" placeholder="1000자 내외로 작성하세요."></textarea>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-1">
									<span class="card-title" style="width: 70px; font-size: 14px; font-weight: bold;">첨부파일</span>
								</div>
								<div class="col-lg-11">
									<button type="button" class="btn btn-secondary" onclick="uploadfile()">파일 가져오기</button>
									<div class="card-footer fileInput"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="card-footer card-secondary ">
						<h6 style="font-size: 14px; font-weight: bold;">설정</h6>
						<div class="row" style="margin: 10px">
							<div class="col-lg-2">
								<span class="card-title" style="font-size: 14px;">공지대상 설정</span>
							</div>
							<div class="col-lg-10" style="display: flex">
								<div class="form-check">
									<input class="form-check-input" value="A" type="radio" name="boardType"> <label class="form-check-label" style="font-size: 14px;"> 전체</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" value="P" type="radio" name="boardType"> <label class="form-check-label" style="font-size: 14px;">약사</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" value="D" type="radio" name="boardType"> <label class="form-check-label" style="font-size: 14px;">의사</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" value="T" type="radio" name="boardType"> <label class="form-check-label" style="font-size: 14px;">일반</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<form id="hiddendata">


	</form>

	<form id="boardRegist">
		<input type="hidden" name="memIdManager" value="" /> <input type="hidden" name="boardTitle" value="" /> <input type="hidden" name="boardContent" value="" /> <input type="hidden" name="boardType" value="" />
	</form>

	<script>
	window.onload=function(){
		summernote_go($('textarea[name="content"]'),'<%=request.getContextPath()%>');
		}
	</script>
	<script>
		function regist_go() {

			var memIdManager = 'admin';
			var boardTitle = $('.boardTitle').val();
			var boardContent = $('#content').text();
			var boardType = $("input[type=radio][name=boardType]:checked")
					.val();

			console.log(memIdManager);
			console.log(boardTitle);
			console.log(boardContent);
			console.log(boardType);

			if (boardTitle == "") {
				alert("제목을 입력해주세요!");
				return;
			}
			if (boardContent == "") {
				alert("내용을 입력해주세요!");
				return;
			}
			if (boardType == "") {
				alert("공개범위를 선택해주세요!");
				return;
			}

			// 			var boardRegist = $('#boardRegist');
			// 			boardRegist.attr({
			// 				action : "regist.do",
			// 				method : 'post'
			// 			}).submit();
		}
	</script>
	<script type="text/javascript">
		var filenum = 0;

		function uploadfile() {

			var str = "<input type='file' class='form-control inputtext text"+filenum+"' style='display:none' name='textFile'  >";

			$('#hiddendata').append(str);

			$('.text' + filenum).trigger('click');

		}

		function addFile_go() {
			if ($('input[name="uploadFile"]').length >= 5) {
				alert("파일추가는 5개까지만 가능합니다.");
				return;
			}

			var div = $('<div>').addClass("inputRow").attr("data-no", dataNum);
			var input = $('<input>').attr({
				"type" : "file",
				"name" : "uploadFile"
			}).css("display", "inline");
			div
					.append(input)
					.append(
							"<button onclick='remove_go("
									+ dataNum
									+ ");' style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>");

			$('.fileInput').append(div);

			dataNum++;
		}

		function remove_go(dataNum) {
			//alert(dataNum);
			$('div[data-no="' + dataNum + '"]').remove();
		}
	</script>
</body>
</html>