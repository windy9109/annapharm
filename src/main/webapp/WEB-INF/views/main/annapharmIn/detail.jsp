<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="annapharmInList" value="${dataMap.annapharmInList }" />
<c:set var="replyList" value="${dataMap.replyList }" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 약사IN 상세(답글이 있는 경우)</title>
<style type="text/css">
body{
    font-size: 14px;
}
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
	    background-color: transparent;
}
</style>


</head>
<body>
	<div class="content-wrapper" >


	<div class="card" style=" margin:20px;">
			<a href="<%=request.getContextPath()%>/annapharmIn/list.do"><input type="button" value="< &nbsp; 목록으로" class="btn_back " style="padding: 30px; font-weight: bold; padding-bottom: 0;"></a> <br>
			<div style="padding: 0px 100px; padding-bottom: 70px; padding-top: 0px; min-height: 300px; position: relative;">

				<span style="font-weight: bold; color: #2F88FF; font-size: 3.0em;">Q</span>
				<span
					style="font-weight: bold; font-size: 1.5em; margin-left: 20px;">${annapharmIn.chemistInTitle }</span>

				<!-- 자신이 올린 게시글이고 답변이 안달렸을 경우 활성화 -->
				<c:if test="${loginUser.memId eq annapharmIn.chemistInWriter}">
					<div style="margin-bottom: 0; width: 100%; border-top: 1px solid #ddd; padding-top: 20px; padding-bottom: 0; margin-top: 20px; display: inline-block;">
						<button type="button" class="btn btn-block btn-primary modify"
							onclick="modify_go();"
							style="width: 70px; display: inline-block;">수정</button>
						<button type="button" class="btn btn-block btn-danger delete"
							onclick="remove_go();"
							style="width: 70px; display: inline-block; margin: 0px;">삭제</button>
					</div>
				</c:if>

				<div style="margin: 40px 0px; min-height: 200px;">
					<!-- 내용 -->
					${ annapharmIn.chemistInContent }
				</div>
				<div style=" width: 100%; border-top: 1px solid #ddd; padding-top: 20px;  margin-top: 20px; display: inline-block;">
					<span style="font-weight: bold;">${annapharmIn.chemistInWriter }</span>
					<span style="margin-left: 20px;">${annapharmIn.chemistInDate }</span>

				</div>

			</div>

</div>

			<!-- Reply content -->

			<section class="content container-fluid">
				<!-- reply component start -->
				<div class="row">
					<div class="col-md-12" style="padding: 0;">

							<div class="card-body" style=" padding: 10px 30px; padding: 10px 60px;">
							<c:if test="${ param.chemistInReplyCnt ne '0'}">
								<div class="rte121"
									style="text-align: left; margin-bottom: 20px; margin-right: 10px;">
									<span class="fgd1" style="font-size: 30px; color: #2F88FF;">A</span>
									<span class="fgd2" style="margin-left: 5px;">${param.chemistInReplyCnt}개</span>
								</div>
							</c:if>

								<!-- The time line -->
								<div class="timeline2">
									<!-- timeline time label -->
									<div class="time-label" id="repliesDiv">
										<!-- <span class="bg-green" style="padding: 15px 20px; display: inline-block;  margin-bottom: 15px; border-radius: 5px;">답변 리스트</span> -->
									</div>


								</div>
								<div class='text-center'>
									<ul id="pagination"
										class="pagination justify-content-center m-0">

									</ul>
								</div>
							</div>





							<%-- ${replyList} --%>

							<c:if test="${loginUser.memAuthority eq '약사'}">
								<div class="card-footer"
									style="padding: 30px 100px; background: #cad4dd;">
									<label for="newReplyText">답변하기</label> <input
										class="form-control" type="text" placeholder="답변내용을 작성해주세요."
										id="newChemistInReply"> <br />
									<button type="button" class="btn btn-primary" id="replyAddBtn"
										onclick="replyRegist_go(this);">확인</button>
								</div>
							</c:if>

						</div>

					</div>
					<!-- end col-md-12 -->
				</div>
				<!-- end row -->
			</section>









	<!-- /.content-wrapper -->

	<!-- Modal -->
	<div id="modifyModal" class="modal modal-default fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" style="display: none;">수정하기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" data-rno>
					<p>
						<input type="text" id="chemistInReply" class="form-control"
							name="chemistInReply">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replyModBtn"
						onclick="replyModify_go(this);">Modify</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="reply_js.jsp"%>













	<form role="form">
		<input type="hidden" name="chemistInCode"
			value="${annapharmIn.chemistInCode}" />
		<input type="hidden" name="chemistInReplyCnt"
			value="${param.chemistInReplyCnt}" />
	</form>

	<script>

		function modify_go() {
			var formObj = $("form[role='form']");
			formObj.attr({
				'action' : 'modifyForm.do',
				'method' : 'post'
			});
			formObj.submit();
		}
		function remove_go() {
			var formObj = $("form[role='form']");
			var answer = confirm("정말 삭제하시겠습니까?");
			if (answer) {
				formObj.attr("action", "remove.do");
				formObj.attr("method", "post");
				formObj.submit();
			}
		}

		<c:if test="${from eq 'modify'}" >
		alert("정상적으로 수정되었습니다.");
		</c:if>
		<c:if test="${from eq 'selection'}" >
		alert("채택완료!");
		</c:if>
		<c:if test="${from eq 'remove'}" >
		alert("삭제되었습니다.");
		window.close();
		window.opener.location.reload();
		</c:if>
	</script>





</body>
</html>