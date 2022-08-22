<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="pastPrescriptionList" value="${dataMap.pastPrescriptionList }" />
<head>

<style type="text/css">
.btn_regist {
	border: none;
	border-radius: 5px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	padding: 0px 30px;
	background-color: #2F88FF;
	color: white;
}

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
</style>
</head>


<body>
	<div class="content-wrapper">

		<div class="contents">

			<div class="card" style="background: #fff; margin: 30px; margin-bottom: 0px; border-radius: 0.25rem 0 0.25rem 0.25rem;">

				<div class="card-header with-border" style="display: -webkit-box; padding: 20px; border-bottom: 0;">
					<span style="font-weight: bold; font-size: 20px; padding: 0px 7.5px;">과거처방내역</span>
					<div style="position: absolute; right: 20px; font-size: 14px; top: 20px; margin-bottom: 30px;">
						<span> 처방내역은 최대 <span style="color: #2F88FF">6개월</span>까지 조회가능합니다.
						</span>
					</div>
					<div style="position: absolute; right: 20px;">
						<div style="display: inline-block; margin-left: 20px;">
							<div class="input-group input-group-lg" style="width: 300px;">
								<input type="search" class="form-control form-control-lg" name="keyword" placeholder="검색어를 입력해주세요" value="${param.keyword }" style="height: 30px; font-size: 16px;" onkeydown="on_enter();">
								<div class="input-group-append">
									<button type="submit" class="btn btn-lg btn-default" style="height: 30px; font-size: 16px; padding: 0px 10px;" onclick="list_go(1)">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<br> <br>
				</div>
				<!-- card-header끝! -->
				<hr style="width: 95%; margin: auto;">

				<div class="card-body" style="min-height: 615px;">
					<table class="table table-hover table-bordered" style="font-size: 14px; text-align: center; border: 0px;">
						<thead style="border: 0px solid; border-top: 2px solid #0069d9;">
							<tr>
								<th style="width: 50px; border: 0; border-bottom: 1px solid #0069d9; color: #0069d9;">NO</th>
								<th style="width: 150px; border: 0; border-bottom: 1px solid #0069d9; color: #0069d9;">약국명</th>
								<th style="width: 550px; border: 0; border-bottom: 1px solid #0069d9; color: #0069d9;">처방약</th>
								<th style="width: 179px; border: 0; border-bottom: 1px solid #0069d9; color: #0069d9;">처방날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty pastPrescriptionList }">
								<tr>
									<td colspan="6" style="border: 0; border-bottom: 1px solid #d9d9d9;"><strong>해당 내용이 없습니다.</strong></td>
								</tr>
							</c:if>
							<c:forEach items="${pastPrescriptionList }" var="pastPrescription" varStatus="count">
								<tr  style="cursor:pointer" onclick="location.href='<%=request.getContextPath()%>/pastPrescription/detail.do?psCode=${pastPrescription.psCode }&piDutyname=${pastPrescription.piDutyname }&psDate=<fmt:formatDate pattern="yyyy-MM-dd" value="${pastPrescription.psDate }" />'">
									<td style=" border: 0; border-bottom: 1px solid #d9d9d9;">${count.count}</td>
									<td style=" border: 0; border-bottom: 1px solid #d9d9d9;">${pastPrescription.piDutyname }</td>
									<td style=" border: 0; border-bottom: 1px solid #d9d9d9;">${pastPrescription.mdName } <c:if test="${pastPrescription.mdCount > 1 }">&nbsp;외&nbsp;${pastPrescription.mdCount-1}개</c:if></td>
									<td style=" border: 0; border-bottom: 1px solid #d9d9d9;"><fmt:formatDate pattern="yyyy-MM-dd" value="${pastPrescription.psDate }" /></td>
								</tr>
							</c:forEach>
						</tbody>

					</table>
				</div>

				<div class="card-footer" style="background: transparent;">
					<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
				</div>
			</div>
			<!-- card끝! -->
		</div>
		<!-- contents끝! -->




	</div>
	<!-- content-wrapper 끝! -->

	<script type="text/javascript">
	function on_enter() {
		if(window.event.keyCode == 13){
			list_go(1);
		}
	}




	</script>
</body>
</html>