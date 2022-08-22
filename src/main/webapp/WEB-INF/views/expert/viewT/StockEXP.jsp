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

	<div class="card-body table-responsive p-0">
		<table class="table table-hover text-nowrap" style="table-layout: fixed;">
			<colgroup>
				<col width="50%" />
				<col width="28%" />
				<col width="22%" />
			</colgroup>
			<thead>
				<tr>
					<th>약명</th>
					<th style="padding-left: 3px; padding-right: 1px;">남은유통기한(일)</th>
					<th>상태<i class="fa-solid fa-circle-question" id="stockEXPStatus"></i></th>
				</tr>
			</thead>
			<tbody>
				<tr id="stockEXP"></tr>
			</tbody>
		</table>
	</div>

</div>