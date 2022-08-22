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
<!-- 최다판매약품/한달  -->
	<div class="card-body table-responsive" style="padding: 0px;">
		<table class="table table-hover text-nowrap" style="table-layout: fixed;">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="30%" />
			</colgroup>
			<thead>
				<tr>
					<th>NO.</th>
					<th>약품명</th>
					<th>판매 합계(원)</th>
				</tr>
			</thead>
			<tbody>
				<tr id="maxSalesDrug_w"></tr>
				
			</tbody>
		</table>
	</div>

</div>









