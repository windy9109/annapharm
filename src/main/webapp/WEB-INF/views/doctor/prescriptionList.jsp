<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="patient-pre-list">
{{#each .}}
<div class="tableScroll" style="height: 208px;">
	<table class="table table-hover table-bordered">
		<thead>
			<tr>
				<th>NO</th>
				<th>교부번호</th>
				<th>교부일자</th>
				<th>약명</th>
				<th>발행병원</th>
				<th>의사명</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>임시번호</td>
				<td>{{res.preInfo.ps_code}}</td>
				<td>{{res.preInfo.ps_date}}</td>
				<td class="medicalTxt">에트론가나콘정50밀리그램 외 3개</td>
				<td>DDIT병원</td>
				<td>오반짝</td>
				<td class="statusReady">조제대기</td>
			</tr>
		</tbody>
	</table>
</div>
{{/each}}
</script>