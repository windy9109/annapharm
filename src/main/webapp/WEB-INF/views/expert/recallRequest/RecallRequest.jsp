<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
    height: 160px;
    max-height: 160px;
    overflow: auto;
}

.scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) { width: 35px; }
.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) { width: 100px; }
.scrolltbody th:nth-of-type(3), .scrolltbody td:nth-of-type(3) { width: 145px; }
.scrolltbody th:nth-of-type(4), .scrolltbody td:nth-of-type(4) { width: 318px; }
.scrolltbody th:nth-of-type(5), .scrolltbody td:nth-of-type(5) { width: 388px; }
.scrolltbody th:nth-of-type(6), .scrolltbody td:nth-of-type(6) { width: 80px;  }
.scrolltbody th:nth-of-type(7), .scrolltbody td:nth-of-type(7) { width: 80px;  }
.scrolltbody th:nth-of-type(8), .scrolltbody td:nth-of-type(8) { width: 80px;  }
.scrolltbody th:nth-of-type(1), .scrolltbody td:nth-of-type(1) { max-width: 35px;  }
.scrolltbody th:nth-of-type(2), .scrolltbody td:nth-of-type(2) { max-width: 100px; }
.scrolltbody th:nth-of-type(3), .scrolltbody td:nth-of-type(3) { max-width: 145px; }
.scrolltbody th:nth-of-type(4), .scrolltbody td:nth-of-type(4) { max-width: 318px; }
.scrolltbody th:nth-of-type(5), .scrolltbody td:nth-of-type(5) { max-width: 388px; }
.scrolltbody th:nth-of-type(6), .scrolltbody td:nth-of-type(6) { max-width: 80px;  }
.scrolltbody th:nth-of-type(7), .scrolltbody td:nth-of-type(7) { max-width: 80px;  }
.scrolltbody th:nth-of-type(8), .scrolltbody td:nth-of-type(8) { max-width: 80px;  }

</style>
<meta charset="UTF-8">
<title>회수대상약품재고 전송</title>
</head>
<body>
	<div class="content-wrapper">
		<div class="body">
			<div class="row" style="margin-bottom: 4px;">
				<div class="col-6">
					<button class="btn  btn-primary" style="width: 100%; height: 30px; line-height: inherit; font-weight: bold;" onclick="location.href='<%=request.getContextPath()%>/retrieve/list.do'">회수약품등록</button>
				</div>
				<div class="col-6">
					<button class="btn  btn-default" style="width: 100%; height: 30px; line-height: inherit; font-weight: bold;" onclick="location.href='<%=request.getContextPath()%>/retrieveList/list.do'">회수약품내역</button>
				</div>
			</div>
			<iframe src="<%=request.getContextPath()%>/retrieve/productListIframe.do" width="1260" height="404" style="border: 0px;"></iframe>
			<div class="card card-primary card-outline">
				<div class="card-header">
					<span style="font-size: 17px; font-weight: bold;">약품 상세</span> <span style="font-size: 12px; margin-left: 10px;">회수 사유와 약품 수량을 정확히 기입해 주세요!</span>
				</div>
				<div class="card-body" style="padding: 8px; padding-top: 12px;">
					<div class="detail" style="font-size: 12px; margin-right: 17px;">
						<div class="row" style="margin-top: 5px;">
							<div class="col-1" style="text-align: right;">
								<span style="line-height: 19px;"> 약명</span>
							</div>
							<div class="col-5">
								<input class="miName" type="text" style="width: 100%;" value="" disabled>
							</div>

							<div class="col-1" style="text-align: right;">
								<span style="line-height: 19px;"> 약코드</span>
							</div>
							<div class="col-2">
								<input class="miCode" type="text" style="width: 100%;" value="" disabled>
							</div>
							<div class="col-1" style="text-align: right;">
								<span style="line-height: 19px;"> QR코드</span>
							</div>
							<div class="col-2">
								<input class="miQr" type="text" style="width: 100%;" value="" disabled>
							</div>
						</div>
						<div class="row" style="margin-top: 5px;">

							<div class="col-1" style="text-align: right;">
								<span style="line-height: 19px;"> 회수일</span>
							</div>
							<div class="col-2">
								<input id="endDate" class="miDate" type="date" style="width: 100%;">
							</div>
							<div class="col-1" style="text-align: right;">
								<span style="line-height: 19px;"> 수량</span>
							</div>
							<div class="col-2">
								<input type="number" class="miNum" style="width: 100%;" max="" min="0">
							</div>
							<div class="col-1" style="text-align: right;">
								<span style="line-height: 19px;"> 단위</span>
							</div>
							<div class="col-2">
								<input class="miUnit" type="text" style="width: 100%;" value="" disabled>
							</div>
						</div>
						<div class="row" style="margin-top: 5px;">
							<div class="col-1" style="text-align: right;">
								<span style="line-height: 19px;"> 회수사유</span>
							</div>
							<div class="col-10">
								<input type="text" class="reason" style="width: 100%;">
							</div>
							<div class="col-1">
								<input type="button" value="추가" class="btn btn-primary" style="font-size: 12px; height: 20px; line-height: 8px; width: 100%; font-weight: bold;" onclick="mdAdd();">
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- card 끝! -->
			<div class="card card-primary card-outline" style="height: 269px;   margin: 0px;">
				<div class="card-header">
					<span style="font-size: 17px; font-weight: bold;"> 회수약품</span> <span style="margin-left: 10px; font-size: 12px;"> 더블 클릭을 통해 목록에서 삭제할 수 있습니다. </span>
					<div style="float: right;">

						<span style="font-size: 12px; font-weight: bold;">총&nbsp;<span class="totalNum">0</span> 건
						</span> <input type="button" value="회수" class="btn btn-primary" style="margin-left: 10px; line-height: inherit; width: 88px; font-size: 14px; font-weight: bold;margin-right: 4px;" onclick="retrieveAdd()">
					</div>
				</div>

				<div class="card-body" style="padding: 8px; padding-top: 12px; max-height: 287px;">

					<table class="table table-hover table-bordered scrolltbody" style="table-layout: fixed; text-align: center;">
						<thead style="/* position: sticky; top: 0px; */">
							<tr style="background-color: #E8F5FF; height: 15px;">
								<th style="text-align: center; width: 35px; ">NO</th>
								<th style="width: 100px; text-align: center; ">약코드</th>
								<th style="width: 220px; min-width: 220px; text-align: center;">QR코드</th>
								<th style="width: 318px;">약명</th>
								<th style="width: 313px;">회수사유</th>
								<th style="width: 80px; text-align: center;">회수수량</th>
								<th style="width: 80px; text-align: center;">단위</th>
								<th style="width: 80px; text-align: center;">회수일</th>
							</tr>
						</thead>
						<tbody id="retrievelist">

						</tbody>
					</table>
				</div>
				<!-- card-body 끝! -->
			</div>
		</div>
	</div>

	<%@ include file="./recallRequest_js.jsp"%>

	<!-- 	<form id="retrieveListForm"> -->
	<!-- 		<input name=""> -->
	<!-- 	</form> -->
</body>
</html>