<%@page import="kr.or.annapharm.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="annapharmInList" value="${dataMap.annapharmInList }" />


<head>



<style>
.my_like_tap:hover{
color: #fff;
}

.my_like_tap_box{
    text-align: right;
    margin: 20px 29px 0px 20px;
}
.my_like_tap{
background: #fff;
    padding: 15px 20px;
    display: inline-block;
    border: 1px solid #ddd;
    font-size: 12px;
    font-weight: 600;
}
.lik1{
background: #0042a5;
    color: #fff;
}
.lik1:hover{
color: #fff;
}
.lik2:hover{
color: #999;
}


html{
    background: #f4f6f9;
}
.row{
    width: 100%;
    margin: auto;
}

label:not(.form-check-label):not(.custom-file-label){

    font-size: 14px;
}
.rew011{
display: inline-block;
    float: right;
    margin-top: -14px;
    margin-right: 30px;
    line-height: 22px;
}

.input-group{
width: 70%;
    float: right;
}

.table thead th{

}

.table-bordered td, .table-bordered th{
    border: 0;
    border-bottom: 1px solid #d9d9d9;
    display: table-cell;
    vertical-align: middle;

}

.table-bordered{
border: 0;
}

.table-bordered thead td, .table-bordered thead th{
    width: 150px;
    background: #fff;
    color: #0069d9;
    font-size: 14px;
    border-bottom: 1px solid #0069d9;

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
	text-overflow: ellipsis;
}
.tableNum{
	text-align: right;
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
	margin: 0px;
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
	height: 30px;
	margin : 10px;
	margin-right: 30px;
	padding : 4px;
	float: right;
}
/* select 박스 관련 설정 */
.input-group:not(.has-validation)>.form-control:not(:last-child){
	height: 35px;
}
.select2-container--default .select2-selection--single .select2-selection__arrow{
	height: 33px;
}
.divideMember-select{
	background-color: #0069d9;
	font-weight: bold;
	color:white;
}
.divideMember{
	font-weight: bold;
}
.mainTitle{
	    font-size: 20px;
    font-weight: 600;
}
.subTitle{
	font-size: 14px;
}
.sort_list_module li {
    float: left;
    margin-left: 4px;
}
.mainRadio{
	float:right;
	margin-right: 5px;
}


.title{
   text-align:center;
   display:block;
   font-size: 30px;
   color: #222;
   margin-bottom:10px
 }

 .number100, .number000 {
    text-align: center;
    line-height: 40px;
    margin: 0 auto;
    font-size: 16px;
    color: #3f79f6;
    border-radius: 50%;
    display: inline-block;
    font-weight: 600;
    margin-right: 4px;
}
.tableNum{
    text-align: center;
}

</style>

</head>

<title>약사IN 목록</title>

<body>

	 <!-- header content -->
	<div class="content-wrapper">
		<div class="row searchBox" style="padding-top: 0px;">
			<div class="col-lg-12 pageTitle">


<%--  					<c:if test="${loginUser.memAuthority eq '일반'}">
						<button type="button" class="btn btn-primary btn_detail" onClick="location.href='registForm.do'">약사IN 등록</button>
					</c:if> --%>

			</div>
		</div>

	<!-- Main content -->
    <section class="content">
 	    <div class="my_like_tap_box">
		    <a href="#" class="my_like_tap lik1">내 약사IN 답변 확인</a>
		    <a href="#" class="my_like_tap lik2">좋아요/관심 해시태그</a>
		    <a href="#" class="my_like_tap lik3">답변신청함</a>
		</div>
		<div class="card" style="    background: #fff;   margin-top: 0px; margin-right: 30px;  margin-left: 30px;  border-radius: 0.25rem 0 0.25rem 0.25rem;">

			<div class="card-header with-border" style="  display: -webkit-box;   padding-top: 50px;   border-bottom: 0;">

				<div class="row">

					<!-- 알림시작 -->
					<div class="col-lg-4" style="line-height: 40px; display: inline-block;  width: auto;">
						<span class="mainTitle"> 내 약사<span class="mainTitle" style="color:#0069d9;">IN</span> 답변 확인</span><br>
						<!-- <span class="subTitle">&nbsp;&nbsp;복약과 관련한 질문을 전문 약사님들이 답변해드립니다.</span> -->
					</div>





					<div class="col-lg-8" style="display: inline-block; width: auto;">
						<div id="keyword" class="card-tools" style="width:670px; float:right;">
							<div class="input-group row">
 								<div class="form-check" style="margin-right:10px; padding-top:5px;">
									<input class="form-check-input" onchange="annapharmIn_p_go(1);" type="checkbox" value="qnaWaite" class="searchType4" name="searchType4" ${cri.searchType2 eq 'qnaWaite' ? 'checked':'' }>
									<label class="form-check-label">채택된 질문</label>

								</div>


								<select class="form-control col-md-4" name="searchType" id="searchType">
									<option value="tcw"  ${cri.searchType eq 'tcw' ? 'selected':'' }>전 체</option>
									<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>복약지도</option>
									<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>처방</option>
									<option value="tc" ${cri.searchType eq 'tc' ? 'selected':'' }>성분</option>
									<option value="cw" ${cri.searchType eq 'cw' ? 'selected':'' }>기타</option>
								</select>

								<input type="search" class="form-control form-control-lg" style="height: 35px;" placeholder="검색어를 입력하세요." value="${param.keyword}" name="keyword" onkeyup="on_enter();" />
								<div class="input-group-append" style="    display: inline-block;
								    margin: 0px;
								    padding: 0;
								    top: -1px;
								    right: -1px;">
									<button type="submit" class="btn btn-lg btn-default searchBtn" style="padding-top: 3px;height: 35px;" onClick="annapharmIn_p_go(1);">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
							<br>

						</div>
					</div>
				</div>
			</div>

<hr style=" width: 95%;
    margin: auto;"/>

<!-- padding: 1.25rem; -->

			<div class="card-body">

			<div class="alert_box" style="border: 1px solid #b9cbe1;
    width: 99%;
    background: #f2f7ff;
    border-radius: 100px;
    margin: auto;
    margin-bottom: 10px;">
				<span class="alert_box_sub" style="margin: auto;
    text-align: center;
    display: inherit;
    padding: 0 10px;
    font-size: 12px;
    color: #126ea2;">
					김동글님! 마지막 답변이
					<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
					<span class="number000">
						<c:forEach items="${annapharmInList}" var="ann">
							1700
						</c:forEach>
					</span>일 전이네요! 지금 답변을 남겨보세요! 약사인에서 <span class="number100">1700</span>개의 질문이 답변을 기다리고 있습니다.
				</span>
			</div>





			<div class="row">
				<div class="col-lg-12">
						<table class="table table-bordered">
							<thead style="border-top: 2px solid #0069d9;">
								<tr>
									<th style="width:700px">제목</th>
									<th>답변 내용</th>
									<th>카테고리</th>
									<th>조회수</th>
									<th>답변일</th>
									<th>채택유무</th>
								</tr>
							</thead>


							<tbody>
								<c:forEach items="${annapharmInList}" var="ann">
										<c:if test="${not empty loginUser }">
											<c:if test="${loginUser.memId eq ann.memId}">
												<c:if test="${empty annapharmInList }">
													<tr>
														<td colspan="6">
															<strong>해당 내용이 없습니다.</strong>
														</td>
													</tr>
												</c:if>
											</c:if>
										</c:if>
								</c:forEach>
								<c:forEach items="${annapharmInList}" var="ann">
									<c:if test="${not empty loginUser }">
									<c:if test="${loginUser.memId eq  ann.memId}">
										<tr>
			 									<td onClick="location.href='detail.do?from=list&chemistInCode=${ann.chemistInCode }&chemistInReplyCnt=${ann.chemistInReplyCnt}'" class="tableText">${ann.chemistInTitle }</td>
												<td class="tableNum">${ann.chemistInReply }</td>
												<td>${ann.chemistInType }</td>
												<td class="tableNum">${ann.chemistInViewcnt }</td>
												<td>${ann.ansDate }</td>

												<c:if test="${ann.chemistInAdopt eq 'D'}">
													<td>-</td>
												</c:if>
												<c:if test="${ann.chemistInAdopt eq 'N'}">
													<td>-</td>
												</c:if>
												<c:if test="${ann.chemistInAdopt eq 'Y'}">
													<td>-</td>
												</c:if>
										</tr>
									</c:if>
									</c:if>
								</c:forEach>

							</tbody>

						</table>
						</div>
						</div>
					</div>




		<div class="card-footer clearfix" style="background: transparent;">
			<%@ include file="./annapharmInListPagination.jsp" %>
		</div>
    </section>
    </div>


        <c:if test="${from eq 'regist'}">
		<script>
			alert("글 등록이 성공했습니다.");
			window.opener.location.reload();
			window.close();
		</script>
	</c:if>



<script>
function annapharmIn_p_go(page,url) {
	//alert(page);
	if(!url) url="listMypageP.do";

	var annapharmInForm=$('#annapharmInForm');
	annapharmInForm.find("[name='page']").val(page);
	//annapharmInForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	annapharmInForm.find("[name='searchType1']").val($('select[name="searchType1"]').val());

	var checkboxValue;

	if (document.querySelector("input[type='checkbox']").checked) {
		checkboxValue = document.querySelector("input[type='checkbox']").value
		console.log(checkboxValue);
		annapharmInForm.find("[name='searchType2']").val(checkboxValue);
	} else {
		checkboxValue = document.querySelector("input[type='checkbox']").value
		annapharmInForm.find("[name='searchType2']").val("");
	}

	annapharmInForm.find("[name='startDate']").val($('input[name="startDate"]').val());
	annapharmInForm.find("[name='endDate']").val($('input[name="endDate"]').val());
	annapharmInForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());




	annapharmInForm.attr({
		action:url,
		method:'get'
	}).submit();

}

</script>



<script>

	function on_enter(page, url) {

		if (window.event.keyCode == 13) {
			annapharmIn_p_go(1)
		}

	}
</script>



 </body>

