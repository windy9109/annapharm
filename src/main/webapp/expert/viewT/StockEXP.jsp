<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 재고 유통기한 임박 -->

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

	<div class="card-body table-responsive" style="padding: 0px;">
		<table class="table table-hover text-nowrap" style="table-layout: fixed;">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="30%" />
				<col width="30%" />
			</colgroup>
			<thead>
				<tr>
					<th>약명</th>
					<th>남은재고(개)</th>
					<th>남은유통기한(일)</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
				<tr id="stockEXP"></tr>
			</tbody>
		</table>
	</div>

</div>