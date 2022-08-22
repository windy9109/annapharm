<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.card-title{
	float:unset;
}
.table td, .table th {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.card-body {
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	min-height: 1px;
	padding: 0.5rem;
	padding-top: 0px;
}
</style>
<div class="card">
	<div class="card-header" style="text-align:center;">
		<h3 class="card-title" style="font-weight:bold;">최고 방문 연령별 최다 처방 약품</h3>
	</div>

	<div class="card-body table-responsive">
		<table class="table table-hover text-nowrap" style="table-layout: fixed;">
			<colgroup>
				<col width="10%" />
				<col width="35%" />
				<col width="30%" />
				<col width="25%" />
			</colgroup>
			<thead>
				<tr>
					<th style="padding-left: 5px; padding-right: 5px;">No</th>
					<th>약명</th>
					<th>연령대</th>
					<th style="padding-left: 5px; padding-right: 5px;">판매수(건)</th>
				</tr>
			</thead>
			<tbody>
				<tr id="salesStatistics_m"></tr>
			</tbody>
		</table>
	</div>

</div>