<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="productList" value="${dataMap.productList }" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="font-size: 12px;">


			<div class="card card-primary card-outline" style="font-size: 12px;">
				<div class="card-header">
					<div class="search">
						<i class="fas fa-capsules icon-size" style="margin-left: 10px; font-size: 18px;" aria-hidden="true"></i>
						<div style="display: inline-block; margin-left: 5px; font-weight: bold; font-size: 17px;">약품 목록</div>
						<div style="display: inline-block; margin-left: 20px;">
							<div class="input-group input-group-lg" style="width: 300px;">
								<input type="search" class="form-control form-control-lg" name="keyword" placeholder="검색어를 입력해주세요" style="height: 30px; font-size: 16px;" value="${cri.keyword }" onkeypress="enterkey()">
								<div class="input-group-append">
									<button type="submit" class="btn btn-lg btn-default" style="background-color: #007bff; height: 30px; font-size: 16px; padding: 0px 10px;" onclick="retrieveList_go(1);">
										<i class="fa fa-search" style="color: white;"></i>
									</button>
								</div>
							</div>
						</div>
						<div style="display: inline-block; margin-left: 10px;">
							<input value="C" type="checkbox" class="dateOver" id="searchType" name="searchType" ${cri.searchType eq "C" ? "checked" : "" } onchange="retrieveList_go(1);"> <span style="margin-left: 5px; font-size: 15px;">유통기한 지난 약품 </span>
						</div>
<!-- 						<div style="float: right;"> -->
<!-- 							<input type="button" value="QR 검색하기" class="btn  btn-primary" style="line-height: inherit; height: 30px; font-weight: bold; font-size: 14px;"> -->
<!-- 						</div> -->
					</div>
				</div>
				<!-- 검색결과 목록 -->
				<div class="card-body" style="padding: 8px;">
					<div class="card-body table-responsive p-0" style="height: 261px;">
						<table class="table table-hover table-bordered" style="table-layout: fixed; text-align: center; height: 20px;">
							<thead style="width: 100%;">
								<tr style="background-color: #E8F5FF; height: 25.5px;">
									<th style="width: 35px; padding: 4px;">NO</th>
									<th style="width: 120px; padding: 4px;">약코드</th>
									<th style="width: 553px; padding: 4px;">약명</th>
									<th style="width: 220px; padding: 4px;">QR코드</th>
									<th style="width: 90px; padding: 4px;">수량</th>
									<th style="width: 90px; padding: 4px;">단위</th>
									<th style="width: 118px; padding: 4px;">유통기한</th>
								</tr>
							</thead>
							<tbody id="recallRequestList">
								<c:if test="${empty productList }">
									<tr>
										<td colspan="9" style="text-align: center;padding: 4px;"><strong>해당조건에 맞는 약품이 없습니다!</strong></td>
									</tr>
								</c:if>
								<c:forEach items="${productList }" var="product" varStatus="count">
									<tr class="proListTr" onclick="md_detailGo(this);" style="height: 23.5px; cursor:pointer;">
										<td style="padding: 4px;">${count.count}</td>

										<td class="productNo" style="padding: 4px;">${product.mdNo }<c:if test="${product.distinctNum gt 1 }">
												<span class="badge badge-danger navbar-badge pro_number" style="margin-left: 10px;">${product.distinctNum }</span>
											</c:if>
										</td>
										<td style="text-align: left;padding: 4px;" class="productName" data-toggle="tooltip" title="${product.mdName }">${product.mdName }</td>
										<td style="padding: 4px;" class="productQr">${product.productQr }</td>
										<td style="padding: 4px;" class="productOwnnum">${product.productOwnnum }</td>
										<td style="padding: 4px;" class="productUnit">${product.productUnit }</td>
										<td style="padding: 4px;" class="productType" style="${product.dateOver >= 0 ? 'background:#dc3545; color:white;' : ''}"><fmt:formatDate pattern="yyyy.MM.dd" value="${product.productDate }" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- card-body 종료! -->
				<div class="card-footer" style="font-size: 12px; padding: 10px;">
					<%@ include file="./retrievePagination.jsp"%>
				</div>
			</div>
			<%@ include file="./RetrieveProductListIframe_js.jsp"%>
</body>
</html>