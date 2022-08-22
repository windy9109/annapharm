<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="boardList" value="${dataMap.boardList }" />

<head>
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
	font-size: 14px;
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
	margin: 0px;
	padding-bottom: 10px;
}

.pageTitle {
	font-size: 30px;
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
}
/* select 박스 관련 설정 */
.input-group
:not

(
.has-validation

)
>
.form-control
:not

(
:last-child

){
height
:

35
px
;


}
.select2-container--default .select2-selection--single .select2-selection__arrow
	{
	height: 33px;
}

.divideMember-select {
	background-color: #0069d9;
	font-weight: bold;
	color: white;
}

.divideMember {
	font-weight: bold;
}
</style>
</head>

<title>공지목록 일반</title>

<body>
	<!-- header content -->
	<div class="content-wrapper" style="margin: 0px; font-size: 14px;">
		<div class="row searchBox">
			<div class="col-lg-4 pageTitle">
				<span style="font-size: 25px;">공지사항</span>
			</div>
			<div class="col-8"></div>
		</div>

		<!-- Main content -->
		<section class="content">
			<div class="card">
				<div class="card-header with-border">
					<div id="keyword" class="card-tools" style="width: 540px;">
						<div class="input-group row">
							<select class="form-control col-md-2" style="font-size: 14px;" name="searchType" id="searchType" onchange="list_go(1);">
								<option value="A" ${cri.searchType eq "A" ? "selected" : "" }>전체</option>
								<option value="P" ${cri.searchType eq "P" ? "selected" : "" }>약사</option>
								<option value="D" ${cri.searchType eq "D" ? "selected" : "" }>의사</option>
								<option value="T" ${cri.searchType eq "T" ? "selected" : "" }>일반</option>
							</select> <select class="form-control col-md-2" style="font-size: 14px;" name="searchType2" id="searchType2">
								<!-- <select class="form-control col-md-2" name="searchType" id="searchType"> -->
								<option value="tc" ${cri.searchType2 eq 'tc' ? 'selected':'' }>전 체</option>
								<option value="t" ${cri.searchType2 eq 't' ? 'selected':'' }>제 목</option>
								<option value="c" ${cri.searchType2 eq 'c' ? 'selected':'' }>내 용</option>
							</select> <input type="search" class="form-control form-control-lg" name="keyword" style="font-size: 14px; height: 38px" placeholder="검색어를 입력하세요." value="${param.keyword }" onkeypress="enterKey()">
							<div class="input-group-append">
								<button type="button" class="btn btn-lg btn-default searchBtn" style="padding-top: 3px; height: 38px" onclick="list_go(1);" data-card-widget="search">
									<i class="fa fa-search"></i>
								</button>
							</div>
							<c:if test="${!empty  loginUser}">
								<c:if test='${loginUser.memAuthority eq "관리자" }'>
									<button type="button" class="btn btn-primary btn_detail" style="font-size: 14px; font-weight: bold; margin: 0px; margin-left: 20px; width: 90px; height: 38px;" onclick="location.href='<%=request.getContextPath()%>/board/registForm.do'">등록</button>
								</c:if>
							</c:if>

						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-lg-1">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>구분</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="divideMember" id="A" onclick="changeSearchType(this)">전체</td>
									</tr>
									<tr>
										<td class="divideMember" id="P" onclick="changeSearchType(this)">약사</td>
									</tr>
									<tr>
										<td class="divideMember" id="D" onclick="changeSearchType(this)">의사</td>
									</tr>
									<tr>
										<td class="divideMember" id="T" onclick="changeSearchType(this)">일반</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="col-lg-11">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th style="width: 50px;">NO</th>
										<th style="width: 40px;">구분</th>
										<th>제목</th>
										<th style="width: 120px;">작성일</th>
										<th style="width: 80px;">첨부파일</th>
										<th style="width: 70px;">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty boardList }">
										<tr>
											<td colspan="6"><strong>해당 내용이 없습니다.</strong></td>
										</tr>
									</c:if>
									<c:forEach items="${boardList }" var="board">
										<tr>
											<td>${board.boardCode }</td>
											<td><c:if test="${board.boardType eq 'A' }">
													<span class="badge bg-dark">전체</span>
												</c:if> <c:if test="${board.boardType eq 'P' }">
													<span class="badge bg-success">약사</span>
												</c:if> <c:if test="${board.boardType eq 'D' }">
													<span class="badge bg-info">의사</span>
												</c:if> <c:if test="${board.boardType eq 'T' }">
													<span class="badge bg-light">일반</span>
												</c:if></td>
											<td class="tableText" onclick="location.href='<%=request.getContextPath()%>/board/detail.do?from=list&boardCode=${board.boardCode }'">${board.boardTitle }</td>
											<td><fmt:formatDate value="${board.boardLastdate }" pattern="yyyy-MM-dd" /></td>
											<td><i class="fa-solid fa-file-arrow-down fa-2xl" style="font-size: 18px;"></i></td>
											<td>${board.boardViewcount }</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="card-footer clearfix">
					<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
				</div>

			</div>

		</section>
	</div>

	<c:if test="${from eq 'regist'}">
		<script>
			alert("공지사항 등록이 성공했습니다.");
			window.opener.location.reload();
			window.close();
		</script>
	</c:if>


	<script type="text/javascript">
		function enterKey() {
			if (window.event.keyCode == 13) {
				list_go(1);
			}
		}
		window.onload = function() {
			var searchType = $('#searchType option:selected').val();
			console.log(searchType);
			var select = document.getElementById(searchType);
			$(select).attr('class', 'divideMember-select');
		};
	</script>

	<script type="text/javascript">
		function changeSearchType(clickThis) {
			if (clickThis != "divideMember-select") {
				$(".divideMember-select").attr("class", "divideMember");
				$(clickThis).attr("class", "divideMember-select");
			}
			var clickId = $(clickThis).attr("id");
			console.log(clickId);

			$("#searchType").val(clickId).prop("selected", true);
			list_go(1);
		}
	</script>


</body>

