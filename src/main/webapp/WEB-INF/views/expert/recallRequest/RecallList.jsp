<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="retrieveList" value="${dataMap.retrieveList }" />

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.body {
	padding: 10px;
}

td, th, tr {
	font-size: 12px;
	padding: 4px !important;
}

.scrolltbody{
    display: block;
}
.scrolltbody tbody{
    display: block;
    height: 342px;
    max-height: 342px;
    overflow: auto;
}


.scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) { width: 35px; }
.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) { width: 318px; }
.scrolltbody th:nth-of-type(3), .scrolltbody td:nth-of-type(3) { width: 145px; }
.scrolltbody th:nth-of-type(4), .scrolltbody td:nth-of-type(4) { width: 100px; }
.scrolltbody th:nth-of-type(5), .scrolltbody td:nth-of-type(5) { width: 80px; }
.scrolltbody th:nth-of-type(6), .scrolltbody td:nth-of-type(6) { width: 80px;  }
.scrolltbody th:nth-of-type(7), .scrolltbody td:nth-of-type(7) { width: 388px;  }
.scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) { max-width: 35px;  }
.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) { max-width: 318px; }
.scrolltbody th:nth-of-type(3), .scrolltbody td:nth-of-type(3) { max-width: 145px; }
.scrolltbody th:nth-of-type(4), .scrolltbody td:nth-of-type(4) { max-width: 100px; }
.scrolltbody th:nth-of-type(5), .scrolltbody td:nth-of-type(5) { max-width: 80px; }
.scrolltbody th:nth-of-type(6), .scrolltbody td:nth-of-type(6) { max-width: 80px;  }
.scrolltbody th:nth-of-type(7), .scrolltbody td:nth-of-type(7) { max-width: 388px;  }

</style>
<meta charset="UTF-8">
<title>회수대상약품전송 내역</title>
</head>
<body>
	<div class="content-wrapper">
		<div class="body">
			<!-- 상단 메뉴 탭 -->
			<div class="row" style="margin-bottom: 4px;">
				<div class="col-6">
					<button class="btn btn-default" style="width: 100%; height: 30px; line-height: inherit; font-weight: bold;" onclick="location.href='<%=request.getContextPath()%>/retrieve/list.do'">회수약품등록</button>
				</div>
				<div class="col-6">
					<button class="btn btn-primary" style="width: 100%; height: 30px; line-height: inherit; font-weight: bold;" onclick="location.href='<%=request.getContextPath()%>/retrieveList/list.do'">회수약품내역</button>
				</div>
			</div>

			<div class="card card-primary card-outline">
				<!-- 검색 해더 -->
				<div class="card-header">
					<div style="display: inline-block; margin-left: 5px; font-size: 17px; font-weight: bold;">전체 회수 내역</div>
					<div style="float: right;">
						<input type="date" id="startDate" name="startDate" value="${cri.startDate }">&nbsp;~&nbsp;<input type="date" id="endDate" name="endDate" value="${param.endDate }">
						<div style="display: inline-block; margin-left: 20px;">
							<div class="input-group input-group-lg" style="width: 300px;">
								<input type="search" name="keyword" class="form-control form-control-lg" placeholder="검색어를 입력해주세요" style="height: 30px; font-size: 16px;" value="${param.keyword }" onkeypress="enterkey();">
								<div class="input-group-append">
									<button type="submit" class="btn btn-lg btn-default" style="height: 30px; font-size: 16px; padding: 0px 10px;" onclick="recallList_go(1)">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- card-header 끝! -->
				<!-- 검색결과 목록 -->
				<div class="card-body" style="padding: 8px; padding-top: 12px; height: 250px;">

					<table class="table table-hover table-bordered" style="table-layout: fixed; text-align: center; height: 20px;">
						<thead>
							<tr style="background-color: #E8F5FF;">
								<th style="width: 50px;">NO</th>
								<th style="width: 300px;">회수 작성일</th>
								<th style="width: 593px;">약명</th>
								<th style="width: 300px;">약사명</th>
							</tr>
						</thead>
						<tbody id="recallRequestList">

							<c:if test="${empty retrieveList }">
								<tr>
									<td colspan="9" style="text-align: center; padding: 4px;"><strong>해당조건에 맞는 약품이 없습니다!</strong></td>
								</tr>
							</c:if>
							<c:forEach items="${retrieveList }" var="retrieve" varStatus="count">
								<tr style="cursor:pointer;" class="proListTr" onclick="recallrequestDetail('${retrieve.retrieveNo }',this)" style="height: 23.5px;">
									<td style="padding: 4px;">${count.count}</td>
									<td class="retrieveDate" style="padding: 4px;"><fmt:formatDate pattern="yyyy.MM.dd" value="${retrieve.retrieveDate }" /></td>
									<td style="padding: 4px; text-align: left;" class="rlName">${retrieve.rlName }<c:if test="${retrieve.rlCount gt '1'}">
												&nbsp;외  ${retrieve.rlCount - 1 }
											</c:if>
									</td>
									<td style="padding: 4px;" class="memName">${retrieve.memName }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="card-footer" style="font-size: 12px; padding: 10px;">
					<%@ include file="./recallListPagination.jsp"%>
				</div>

			</div>
			<!-- card-body끝! -->

			<!-- 검색결과 목록 -->

			<div class="card card-primary card-outline" style="height: 450px;">
				<!-- 검색 해더 -->
				<div class="card-header">
					<div style="margin-left: 5px; font-size: 17px; font-weight: bold;">회수 상세 내역</div>
				</div>
				<div class="card-body" style="padding: 8px; padding-top: 12px; height: 250px;">
					<table class="table table-hover table-bordered scrolltbody" style="table-layout: fixed; text-align: center; ">
						<thead>
							<tr style="text-align: center; background-color: #E8F5FF;">
								<th style="text-align: center; width: 35px; ">NO</th>
								<th style="width: 318px;">약명</th>
								<th style="width: 145px; text-align: center; min-width: 220px;">QR코드</th>
								<th style="width: 100px; text-align: center; ">약코드</th>
								<th style="width: 80px; text-align: center;">회수수량</th>
								<th style="width: 80px; text-align: center;">단위</th>
								<th style="width: 388px;">회수사유</th>
							</tr>
						</thead>
						<!-- handlebars 들어갈 자리! -->
						<tbody id="recallDetail">

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

<%@ include file="/WEB-INF/views/expert/recallRequest/recallList_js.jsp" %>

</body>
</html>