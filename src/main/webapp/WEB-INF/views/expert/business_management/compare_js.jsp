<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/x-handlebars-template"  id="Precautions-list-template" >
<div class="Precautions">
<h2 class="detailTitle">사용상의주의사항</h2>
{{#each .}}
<p class="font-weight-bold">{{this}}
	<a href="javascript:void(0);" onclick="Toggle(this);"><i class='fas fa-plus-circle'></i></a>
</p>
{{/each}}
<div>
</script>

<script type="text/x-handlebars-template"  id="effectDetail-list-template" >
<h2 class="effectDetail detailTitle">효능효과</h2>
{{#each .}}
<p class="effectDetail">{{this}}</p>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="useDetail-list-template" >
<h2 class="useDetail detailTitle">용법용량</h2>
{{#each .}}
<p class="useDetail">{{this}}</p>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="PrecautionsDetail-list-template" >
<div class="pl-3 detail" style="display: none;">
{{#each .}}
<p class="indent0 note">
{{this}}
</p>
{{/each}}
</div>
</script>

<script type="text/x-handlebars-template"  id="medicineDetailTable-list-template" >
{{#each .}}
<tr class="preferProductDetail hover" onclick="preferProductDetail(this)" data-mdNo="{{mdNo}}" data-sex="{{sex}}" data-age="{{age}}">
	<td class="text-center">{{inc @index}}</td>
	<td class="text-left">{{mdName}}</td>
	<td class="text-left">{{miCompany}}</td>
	<td class="text-center">{{mdClass}}</td>
	<td class="text-right">{{productOwnnum}}</td>
	<td class="text-center">{{prettifyDateCompare productDate}}</td>
</tr>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="nameSearchRecord-list-template" >
<div class="nameSearchRecord form-inline justify-content-between">
	<span class="btn nameSearch" style="font-size: 12px;">최근 검색어</span>
	<span class="btn nameSearch" style="font-size: 12px;"></span>
</div>
{{#each .}}
<div class="nameSearchRecord form-inline justify-content-between">
	<span class="btn nameSearch" style="font-size: 12px;">{{this}}</span>
	<span class="btn nameSearch deleteCookie" style="font-size: 12px;">❌</span>
</div>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="basisSearchRecord-list-template" >
<div class="basisSearchRecord form-inline justify-content-between">
	<span class="btn basisSearch" style="font-size: 12px;">최근 검색어</span>
	<span class="btn basisSearch" style="font-size: 12px;"></span>
</div>
{{#each .}}
<div class="basisSearchRecord form-inline justify-content-between">
	<span class="btn basisSearch" style="font-size: 12px;">{{this}}</span>
	<span class="btn basisSearch deleteCookie" style="font-size: 12px;">❌</span>
</div>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="longPrescriptionDetail-list-template" >
{{#each .}}
<tr class="longPrescriptionDetail hover" data-psCode="{{psCode}}">
	<td class="text-center"><i style="color: #007bff;font-size: 15px;" onclick="addSelectList('${loginUser.chemistCode}',this,{{mdNo}})" id="{{mdNo}}" class='{{selectMd}}'></i></td>
	<td class="text-center">{{inc @index}}</td>
	<td class="text-center">{{classFilter mdClass}}</td>
	<td class="text-left">{{mdNo}}</td>
	<td class="text-left">{{mdName}}</td>
	<td class="text-right">{{preDrugCount}}</td>
	<td class="text-right">{{preDrugDay}}</td>
	<td class="text-right">
	{{#eq ownNumCheck '부족'}}
		{{ownNum}}<span class="badge badge-pill badge-danger">부족</span>
	{{else}}
		{{ownNum}}
	{{/eq}}
	</td>
</tr>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="longPrescription-list-template" >
{{#each .}}
<tr class="longPrescription hover" onclick="longPrescriptionDetail(this);" data-psCode="{{psCode}}">
	<td class="text-center">{{prettifyDateCompare psCompleteDate}}</td>
	<td class="text-center">{{patientName}}</td>
	<td class="text-right">{{preDrugDay}}</td>
	<td class="text-left">{{hospitalName}}</td>
	<td class="text-center">{{doctorName}}</td>
	<td class="text-center">{{chemistName}}</td>
	<td class="text-center">
	{{#eq ownNumCheck '부족'}}
		<span class="badge badge-pill badge-danger">부족</span>
	{{else}}
		{{ownNumCheck}}
	{{/eq}}
	</td>
</tr>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="longPrescription-pagination-template" >
<ul id="pagination" class="pagination pagination-sm justify-content-center m-0" >								
	<li class="paginate_button page-item">
		<a href="javascript:longPrescriptionList(1,{{preDrugDay}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-double-left'></i>
		</a>
	</li>
	<li class="paginate_button page-item">
		<a href="javascript:longPrescriptionList({{#if prev}}{{prevPageNum}}{{else}}1{{/if}},{{preDrugDay}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-left'></i>
		</a>
	</li>
	{{#each pageNum}}
	<li class="paginate_button page-item {{signActive this}}">
		<a href="javascript:longPrescriptionList({{this}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			{{this}}
		</a>
	</li>
	{{/each}}
	
	<li class="paginate_button page-item ">
		<a href="javascript:longPrescriptionList({{#if next}}{{nextPageNum}}{{else}}{{realEndPage}}{{/if}},{{preDrugDay}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-right'></i>
		</a>
	</li>
	<li class="paginate_button page-item">
		<a href="javascript:longPrescriptionList({{realEndPage}},{{preDrugDay}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-double-right'></i>
		</a>
	</li>	
</ul>
</script>

<!-- 선호 약/건강기능식품 상세 재고 현황 -->
<script type="text/x-handlebars-template"  id="preferProductDetail-list-template" >
{{#each .}}
<tr class="preferProductDetail hover" onclick="preferProductDetail(this)" data-mdNo="{{mdNo}}" data-sex="{{sex}}" data-age="{{age}}">
	<td class="text-center">{{inc @index}}</td>
	<td class="text-left">{{mdName}}</td>
	<td class="text-left">{{miCompany}}</td>
	<td class="text-center">{{mdClass}}</td>
	<td class="text-right">{{productOwnnum}}</td>
	<td class="text-center">{{prettifyDateCompare productDate}}</td>
</tr>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="preferMedicineCompany-list-template" >
<datalist id="companylist">
{{#each .}}
	<option class="preferMedicineCompany">{{this}}</option>
{{/each}}
</datalist>
</script>


<script type="text/x-handlebars-template"  id="preferMedicine-list-template" >
{{#each .}}
<tr class="preferMedicineList hover" onclick="preferProductDetail(this)" data-mdNo="{{mdNo}}" data-sex="{{sex}}" data-age="{{age}}">
	<td class="text-center"><i style="color: #007bff;font-size: 15px;" onclick="addSelectList('${loginUser.chemistCode}',this,{{mdNo}})" id="{{mdNo}}" class='{{selectMd}}'></i></td>
	<td class="text-center">{{inc @index}}</td>
	<td class="text-left">{{mdName}}</td>
	<td class="text-left">{{miCompany}}</td>
	<td class="text-center">{{classFilter mdClass}}</td>
	<td class="text-right">{{num}}</td>
	<td class="text-right">{{numToComma price}}</td>
	<td class="text-right">{{ownNum}}</td>
</tr>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="preferMedicine-pagination-template" >
<ul id="pagination" class="pagination pagination-sm justify-content-center m-0" >								
	<li class="paginate_button page-item">
		<a href="javascript:getPreferMedicineList(0,1);" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-double-left'></i>
		</a>
	</li>
	<li class="paginate_button page-item">
		<a href="javascript:getPreferMedicineList(0,{{#if prev}}{{prevPageNum}}{{else}}1{{/if}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-left'></i>
		</a>
	</li>
	{{#each pageNum}}
	<li class="paginate_button page-item {{signActive this}}">
		<a href="javascript:getPreferMedicineList(0,{{this}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			{{this}}
		</a>
	</li>
	{{/each}}
	
	<li class="paginate_button page-item ">
		<a href="javascript:getPreferMedicineList(0,{{#if next}}{{nextPageNum}}{{else}}{{realEndPage}}{{/if}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-right'></i>
		</a>
	</li>
	<li class="paginate_button page-item">
		<a href="javascript:getPreferMedicineList(0,{{realEndPage}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-double-right'></i>
		</a>
	</li>	
</ul>
</script>

<script type="text/x-handlebars-template"  id="ageBySexList-list-template" >
{{#each .}}
<tr class="ageBySexList hover" onclick="getPreferMedicineList(this);">
	<td class="text-center">{{ageRange age}}</td>
	<td class="text-center">{{sex}}</td>
	<td class="text-right">{{count}}</td>
	<td class="text-right">{{numToComma price}}</td>
	<td class="text-right">{{biCount}}</td>
	<td class="text-right">{{numToComma biPrice}}</td>
	<td class="text-right">{{totalCount}}</td>
	<td class="text-right">{{numToComma totalPrice}}</td>
</tr>
{{/each}}
</script>
						
<script type="text/x-handlebars-template"  id="ageBySexList-pagination-template" >
<ul id="pagination" class="pagination pagination-sm justify-content-center m-0" >								
	<li class="paginate_button page-item">
		<a href="javascript:searchDateOfVisitor(1,0,'{{sortTarget}}','{{sortType}}');" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-double-left'></i>
		</a>
	</li>
	<li class="paginate_button page-item">
		<a href="javascript:searchDateOfVisitor({{#if prev}}{{prevPageNum}}{{else}}1{{/if}},0,'{{sortTarget}}','{{sortType}}');" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-left'></i>
		</a>
	</li>
	{{#each pageNum}}
	<li class="paginate_button page-item {{signActive this}}">
		<a href="javascript:searchDateOfVisitor({{this}},0,'{{../sortTarget}}','{{../sortType}}');" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			{{this}}
		</a>
	</li>
	{{/each}}
	
	<li class="paginate_button page-item ">
		<a href="javascript:searchDateOfVisitor({{#if next}}{{nextPageNum}}{{else}}{{realEndPage}}{{/if}},0,'{{sortTarget}}','{{sortType}}');" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-right'></i>
		</a>
	</li>
	<li class="paginate_button page-item">
		<a href="javascript:searchDateOfVisitor({{realEndPage}},0,'{{sortTarget}}','{{sortType}}');" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-double-right'></i>
		</a>
	</li>	
</ul>
</script>

<script type="text/x-handlebars-template"  id="searchMedicine-list-template" >
{{#each .}}
<tr class="mdList hover" onclick="goCompare('<%=request.getContextPath()%>/expert/business/compare/list/${loginUser.chemistCode}/' ,this)">
	<td data-toggle="tooltip" title="{{mdName}}">{{mdName}}</td>
	<td data-toggle="tooltip" title="{{componentFilter mdComponent}}">{{componentFilter mdComponent}}</td>
	<td class="text-center">{{classFilter mdClass}}</td>
	<td data-toggle="tooltip" title="{{unitFilter unit}}">{{unitFilter unit}}</td>
	<td class="text-center">{{miMaincode}}</td>
</tr>
{{/each}}
</script>
	
<script type="text/x-handlebars-template"  id="searchMedicine-pagination-template" >
<ul id="pagination" class="pagination pagination-sm justify-content-center m-0" >								
	<li class="paginate_button page-item">
		<a href="javascript:getSearchMedicinePage('<%=request.getContextPath()%>/expert/business/compare/mdsearch/',1);" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-double-left'></i>
		</a>
	</li>
	<li class="paginate_button page-item">
		<a href="javascript:getSearchMedicinePage('<%=request.getContextPath()%>/expert/business/compare/mdsearch/',{{#if prev}}{{prevPageNum}}{{else}}1{{/if}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-left'></i>
		</a>
	</li>
	{{#each pageNum}}
	<li class="paginate_button page-item {{signActive this}}">
		<a href="javascript:getSearchMedicinePage('<%=request.getContextPath()%>/expert/business/compare/mdsearch/',{{this}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			{{this}}
		</a>
	</li>
	{{/each}}
	
	<li class="paginate_button page-item ">
		<a href="javascript:getSearchMedicinePage('<%=request.getContextPath()%>/expert/business/compare/mdsearch/',{{#if next}}{{nextPageNum}}{{else}}{{realEndPage}}{{/if}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-right'></i>
		</a>
	</li>
	<li class="paginate_button page-item">
		<a href="javascript:getSearchMedicinePage('<%=request.getContextPath()%>/expert/business/compare/mdsearch/',{{realEndPage}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-double-right'></i>
		</a>
	</li>	
</ul>
</script>

<script type="text/x-handlebars-template"  id="basis-list-template" >
{{#each .}}
<tr class="basisList hover" onclick="goCompare('<%=request.getContextPath()%>/expert/business/compare/list/${loginUser.chemistCode}/',this)">
	<td class="text-center">{{miType}}</td>
	<td data-toggle="tooltip" title="{{componentFilter mdComponent}}">{{componentFilter mdComponent}}</td>
	<td class="text-center">{{miMaincode}}</td>
	<td data-toggle="tooltip" title="{{unitFilter unit}}">{{unitFilter unit}}</td>
	<td class="text-center">{{miUse}}</td>
</tr>
{{/each}}
</script>
	
<script type="text/x-handlebars-template"  id="basis-pagination-template" >
<ul id="pagination" class="pagination pagination-sm justify-content-center m-0" >								
	<li class="paginate_button page-item">
		<a href="javascript:getSearchBasisPage('<%=request.getContextPath()%>/expert/business/compare/basearch/',1);" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-double-left'></i>
		</a>
	</li>
	<li class="paginate_button page-item">
		<a href="javascript:getSearchBasisPage('<%=request.getContextPath()%>/expert/business/compare/basearch/',{{#if prev}}{{prevPageNum}}{{else}}1{{/if}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-left'></i>
		</a>
	</li>
	{{#each pageNum}}
	<li class="paginate_button page-item {{signActive this}}">
		<a href="javascript:getSearchBasisPage('<%=request.getContextPath()%>/expert/business/compare/basearch/',{{this}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			{{this}}
		</a>
	</li>
	{{/each}}
	
	<li class="paginate_button page-item ">
		<a href="javascript:getSearchBasisPage('<%=request.getContextPath()%>/expert/business/compare/basearch/',{{#if next}}{{nextPageNum}}{{else}}{{realEndPage}}{{/if}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-right'></i>
		</a>
	</li>
	<li class="paginate_button page-item">
		<a href="javascript:getSearchBasisPage('<%=request.getContextPath()%>/expert/business/compare/basearch/',{{realEndPage}});" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
			<i class='fas fa-angle-double-right'></i>
		</a>
	</li>	
</ul>
</script>

<script type="text/x-handlebars-template"  id="compare-list-template" >
{{#each .}}
<tr class="compareList" >
	<td class="text-center"><i style="color: #007bff;font-size: 15px;" onclick="addSelectList('${loginUser.chemistCode}',this,{{mdNo}})" id="{{mdNo}}" class='{{selectMd}}'></i></td>
	<td data-toggle="tooltip" title="{{mdName}}"><a  href="javascript:OpenWindows('<%=request.getContextPath() %>/medicinedetailone.do?mdNo='+{{mdNo}},'{{mdName}}','상세보기',800,700);">{{mdName}}</a></td>
	<td data-toggle="tooltip" title="{{miCompany}}">{{miCompany}}</td>
	<td class="text-center">{{classFilter mdClass}}</td>
	<td class="text-right" data-miPrice="{{miPrice}}">{{numToComma miPrice}}</td>
	<td class="text-center"><input class="compareCheck" value="{{mdNo}}" type="checkbox"/></td>
</tr>
{{/each}}
</script>

<script type="text/x-handlebars-template"  id="select-list-template" >
{{#each .}}
<tr class="selectList" >
	<td class="text-center"><i style="color: #007bff;font-size: 15px;" onclick="addSelectList('${loginUser.chemistCode}',this,{{mdNo}})" data-mdNo="{{mdNo}}" class='far fa-minus-square'></i></td>
	<td data-toggle="tooltip" title="{{mdName}}"><a href="javascript:OpenWindows('<%=request.getContextPath() %>/medicinedetailone.do?mdNo='+{{mdNo}},'{{mdName}}','상세보기',800,700);">{{mdName}}</a></td>
	<td data-toggle="tooltip" title="{{miCompany}}">{{miCompany}}</td>
	<td class="text-center">{{classFilter mdClass}}</td>
	<td class="text-right">{{numToComma miPrice}}</td>
	<td class="text-center"><input class="compareCheck" value="{{mdNo}}" type="checkbox"/></td>
</tr>
{{/each}}
</script>



<script>
// 약 이름 최근 검색 스크립트
if($('title').text() == '제약사별 매입가 비교'){
	
var input = document.querySelector('#nameKeyword');
var body = document.querySelector('body');
// body.addEventListener('click', clickBodyEvent);

var nameSearch = document.querySelector('.todo-inner.nameSearch');
input.onfocus = function(e) {
	nameSearch.style.display = 'block';
	
	printData(getCookieObjeck('mdName'),$('#nameSearchRecord'),$('#nameSearchRecord-list-template'),"nameSearchRecord");
};

body.addEventListener('click', function(event){
	var target = event.target;
	if(target == event.currentTarget.querySelector('.todo-inner.nameSearch')){
		return;
	}
	if(target == event.currentTarget.querySelector('#nameKeyword')){
		return;
	}
	
	if(target.className == 'btn nameSearch'){
		getSearchMedicinePage('<%=request.getContextPath()%>/expert/business/compare/mdsearch/',1,'yes',target.innerText);
		document.querySelector('#nameKeyword').value = target.innerText
		return;
	}
	
	if(target.className == 'btn nameSearch deleteCookie'){
		deleteCookie(target,'mdName');
		printData(getCookieObjeck('mdName'),$('#nameSearchRecord'),$('#nameSearchRecord-list-template'),"nameSearchRecord");
		return;
	}
	
	if(target.className == 'nameSearchRecord form-inline justify-content-between'){
		return;
	}
	
	nameSearch.style.display = 'none';
});
}
</script>

<script>
//주성분 최근 검색 스크립트
if($('title').text() == '제약사별 매입가 비교'){
	
var input = document.querySelector('#basisKeyword');
var body = document.querySelector('body');
// body.addEventListener('click', clickBodyEvent);

var basisSearch = document.querySelector('.todo-inner.basisSearch');
input.onfocus = function(e) {
	basisSearch.style.display = 'block';
	
	printData(getCookieObjeck('basis'),$('#basisSearchRecord'),$('#basisSearchRecord-list-template'),"basisSearchRecord");
};

body.addEventListener('click', function(event){
	var target = event.target;
	if(target == event.currentTarget.querySelector('.todo-inner.basisSearch')){
		return;
	}
	if(target == event.currentTarget.querySelector('#basisKeyword')){
		return;
	}
	
	if(target.className == 'btn basisSearch'){
		getSearchBasisPage('<%=request.getContextPath()%>/expert/business/compare/basearch/',1,'yes',target.innerText);
		document.querySelector('#basisKeyword').value = target.innerText
		return;
	}
	
	if(target.className == 'btn basisSearch deleteCookie'){
		deleteCookie(target,'basis');
		printData(getCookieObjeck('basis'),$('#basisSearchRecord'),$('#basisSearchRecord-list-template'),"basisSearchRecord");
		return;
	}
	
	if(target.className == 'basisSearchRecord form-inline justify-content-between'){
		return;
	}
	
	basisSearch.style.display = 'none';
});
}
</script>

<script>
var queryString;
// 화면 기본값 설정
$(function() {
	
	if($('title').text() == '제약사별 매입가 비교'){
		if(getCookieObjeck('mdName') != null){
			getSearchMedicinePage('<%=request.getContextPath()%>/expert/business/compare/mdsearch/',1,'no',getCookieObjeck('mdName')[0])
			$('#nameKeyword').val(getCookieObjeck('mdName')[0])
		}else{
			$('#searchMedicineList').append("<tr class='mdList'><td colspan='5' class='text-center'>최근 검색 기록이 없습니다.</td></tr>")
		}
		if(getCookieObjeck('basis') != null){
			getSearchBasisPage('<%=request.getContextPath()%>/expert/business/compare/basearch/',1,'no',getCookieObjeck('basis')[0])
			$('#basisKeyword').val(getCookieObjeck('basis')[0])
		}else{
			$('#searchBasisList').append("<tr class='basisList'><td colspan='5' class='text-center'>최근 검색 기록이 없습니다.</td></tr>")	
		}
		addSelectList("<c:out value='${loginUser.chemistCode}'/>");
	}
	
	if($('title').text() == '내방환자 분석'){
		date();
		addSelectList("<c:out value='${loginUser.chemistCode}'/>");
		searchDateOfVisitor(1);
		sortUp(document.querySelector('#totalcount div'));
		setTimeout(function() {
			getPreferMedicineList($('.ageBySexList')[0],1);
		}, 100);
		longPrescriptionList(1,30);
		setTimeout(function() {
			longPrescriptionDetail($('.longPrescription')[0]);
		}, 200);
		setTimeout(function() {
			preferProductDetail($('.preferMedicineList')[0],1);
		}, 300);
		$('#longPrescriptionInfo').tooltip({title: "<div class='text-left'>1개월 : 30일~60일 사이의 처방 </div><div class='text-left'>2개월 : 60일~90일 사이의 처방</div><div class='text-left'>3개월 이상 : 90일 이상 처방</div> ", html: true});
		
	}
})

$(document.body).tooltip({
	selector : "[data-toggle='tooltip']"
});

//날짜 설정
function compareDate(startDate, endDate) {
	
	var start = new Date(startDate);
	var end = new Date(endDate);
	
	var result;
	
	if(start <= end) result = true;
	else result = false;
	
	return result;
}

function date(){
	var end = new Date();
	var endDate = $('#endDate').val(end.toISOString().substring(0, 10));
	var start = new Date();
	start = new Date(start.setMonth(start.getMonth() - 1));
	var startDate = $('#startDate').val(start.toISOString().substring(0, 10));
	
	$('#endDate').attr('max',end.toISOString().substring(0, 10));
	$('#startDate').attr('max',end.toISOString().substring(0, 10));
	
	$('#endDate').change(function(){
		var changeEnd = $(this).val();
		$('#startDate').attr('max',changeEnd);
		
		var endDate = $('#endDate').val();
		var startDate = $('#startDate').val();
		
		if(!compareDate(startDate,endDate)){
			$('#startDate').val(endDate);
		}
	})	
}

// 선택한 행 고정!!!!
function fixLine(target){
// 	console.log(target);
// 	console.log(target.parentNode.querySelectorAll('tr'));
	var tr = target.parentNode.querySelectorAll('tr');
	tr.forEach(function(obj){
		obj.style.backgroundColor = 'white';
		obj.style.fontWeight = 'normal';
	});
	target.style.backgroundColor = 'skyblue';
	target.style.fontWeight = 'bold';
}

function deleteCookie(target,cookiName){
	var keyword = target.previousElementSibling.innerText;
	var array = [];
	if(getCookieObjeck(cookiName)){
		array = getCookieObjeck(cookiName);
		if(array.length > 0) array.pop();
	} 

	cookieObject = JSON.stringify(array);
// 	console.log(array);
	
	setCookieObject(cookiName, cookieObject);		
}


function addSelectListAll(){
	var selectLists = $('.selectList').find('i');
	$.each(selectLists, function(index, el){
		addSelectList(el,$(el).attr('data-mdNo'))
	})
}

function OpenWindows(UrlStr,mdName, WinTitle, WinWidth, WinHeight) {
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	title = mdName + WinTitle
	var win = window.open(UrlStr , title , "scrollbars=yes,width="+ WinWidth +", "
							+"height="+ WinHeight +", top="+ wintop +", left="
							+ winleft +", resizable=yes, status=yes"  );
}

//선택한 약 추가/삭제 토글 함수
function toggleStar(mdNo) {
	var target = $('#'+mdNo)[0];
	if(target){
		if(target.className == 'far fa-plus-square'){
// 			console.log(target.classList)
			target.classList.remove('fa-plus-square');
			target.classList.add('fa-minus-square');	
		}else {
			target.classList.remove('fa-minus-square');
			target.classList.add('fa-plus-square');	
		}
	}
}

// 선택한 약목록으로 이동하는 함수
function addSelectList(chemistCode,target,mdNo){
	var selectMd;
	if(!mdNo) mdNo = 0;
	if(!target){
		selectMd = "no";
	}else{
		selectMd = target.className;
	}
	
	var data={
		"mdNo":mdNo,
		"chemistCode":chemistCode,
		"selectMd":selectMd
	}
	
// 	console.log("mdNo : " + mdNo)
// 	console.log("selectMd : " + selectMd)
	
	$.ajax({
		url:"<%=request.getContextPath()%>/expert/business/compare/addselectlsit.do",
		type:"post",
		data:JSON.stringify(data),	
		contentType:'application/json',
		success:function(data){
// 			console.log(data)
			printData(data,$('#selectList'),$('#select-list-template'),"selectList");
			toggleStar(mdNo);
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);	
		}
	});
	
}
</script>	

	
<script type="text/javascript">
var nowPage=1;
var sortTarget = 'totalcount';
var sortType = 'desc';

// 비교테이블 띄우기
function doCompare() {
	var mdNoList = "";
	var avgPrice = document.querySelector('#avgPrice').innerText;
	$('.compareCheck:checked').each(function(index,obj){
		var mdNo = $(obj).val();
		mdNoList += mdNo + "i";
	})
// 	console.log(mdNoList);
	OpenWindows('<%=request.getContextPath() %>/medicinedetailTable.do?mdNo='+mdNoList + '&avgPrice=' + avgPrice,1,'상세보기',800,250);
}

// 체크박스
if($('title').text() == '제약사별 매입가 비교'){
	
$(document).delegate('.compareCheck','change',function(){
	
	var checkeds = $('.compareCheck:checked');
	var uncheckeds = $('.compareCheck:not(.compareCheck:checked)');
	
// 	console.log(checkeds)
// 	console.log(uncheckeds)
	if(checkeds.length >= 4){
		uncheckeds.attr('disabled',true);
	}else{
		uncheckeds.attr('disabled',false);
	}

});
}


function goCompare(pageInfo,target){
	var mainCode;
	if($(target).attr('class') == "mdList hover"){
		mainCode = $(target).children(':last').text();
	}else {
		mainCode = $(target).children(':eq(2)').text();
	}
	pageInfo += mainCode;
	fixLine(target);
	$.getJSON(pageInfo,function(data){
// 		console.log(data);
		var avg = 0;
		var length = data.length;
		data.forEach(function(element,index){
			avg += element.miPrice;
		});
		avg = Math.ceil(avg / length);
		document.querySelector('#avgPrice').innerText = avg.toLocaleString('ko-KR');;
// 		console.log(avg);
		printData(data,$('#compareList'),$('#compare-list-template'),"compareList");
		var compareList = document.querySelectorAll('.compareList');
		compareList.forEach(function(ele){
			var td = ele.querySelector('[data-miPrice]')
			var miPrice = Number(td.getAttribute('data-miPrice'));
			if(avg > miPrice){
				td.style.color = 'blue';
			}else if(avg < miPrice){
				td.style.color = 'red';
			}else {
				td.style.color = 'black';
			}
		});
		
	// 	console.log(document.querySelector('.compareList').querySelectorAll('td')[4].innerText)
// 		console.log(compareList);
	});
	
// 	console.log(mainCode);
}
// 약명 검색
var arrayName = [];
  
function getSearchMedicinePage(pageInfo,page,pagination,keyword){
	if(page) nowPage = page;
	if(!keyword) keyword = $("#nameKeyword").val();
	if(keyword == '') {
// 		alert("검색어를 입력해 주세요!!!");
		$('#searchMedicineList').append("<tr class='mdList'><td colspan='5' class='text-center'>최근 검색 기록이 없습니다.</td></tr>")			
		return;
	}
	
	if(getCookieObjeck('mdName')){
		arrayName = getCookieObjeck('mdName');
		arrayName.unshift(keyword);
		if(arrayName.length >= 6) arrayName.pop();
	} else{
		arrayName.unshift(keyword);
	}	

	cookieObject = JSON.stringify(arrayName);
	
	if(pagination == 'no'){
		setCookieObject('mdName', cookieObject);		
	}
	
// 	console.log("mdNameCookie : " + getCookieObjeck('mdName'));
	
	pageInfo += keyword + '/' + nowPage;
	$.getJSON(pageInfo,function(data){
		printData(data.searchMedicineList,$('#searchMedicineList'),$('#searchMedicine-list-template'),"medicineSearch");
		printPagination(data.pageMaker,$('#test3561'),$('#searchMedicine-pagination-template'));
	});
}
// 주성분 검색
var arrayBasis = [];

function getSearchBasisPage(pageInfo,page,pagination,keyword){
	if(page) nowPage = page;
	if(!keyword) keyword = $("#basisKeyword").val();
	if(keyword == '') {
		$('#searchBasisList').append("<tr class='basisList'><td colspan='5' class='text-center'>최근 검색 기록이 없습니다.</td></tr>")		
// 		alert("검색어를 입력해 주세요!!!");
		return;
	}
	
	if(getCookieObjeck('basis')){
		arrayBasis = getCookieObjeck('basis');
		arrayBasis.unshift(keyword);
		if(arrayBasis.length >= 6) arrayBasis.pop();
	} else{
		arrayBasis.unshift(keyword);
	}	

	cookieObject = JSON.stringify(arrayBasis);
	
	if(pagination == 'no'){
		setCookieObject('basis', cookieObject);	
	}
	
// 	console.log("basisCookie : " + getCookieObjeck('basis'));
	
	pageInfo += keyword + '/' + nowPage;
	$.getJSON(pageInfo,function(data){
		printData(data.searchBasisList,$('#searchBasisList'),$('#basis-list-template'),"basisSearch");
		printPagination(data.pageMaker,$('#basis3561'),$('#basis-pagination-template'));
	});
}

// 검색 엔터
function enterCheckName(){
	if(event.keyCode == 13){
		getSearchMedicinePage('<%=request.getContextPath()%>/expert/business/compare/mdsearch/',1,'no');
		printData(getCookieObjeck('mdName'),$('#nameSearchRecord'),$('#nameSearchRecord-list-template'),"nameSearchRecord");
	}
}

//검색 엔터
function enterCheckBasis(){
	if(event.keyCode == 13){
		getSearchBasisPage('<%=request.getContextPath()%>/expert/business/compare/basearch/',1,'no');
		printData(getCookieObjeck('basis'),$('#basisSearchRecord'),$('#basisSearchRecord-list-template'),"basisSearchRecord");
	}
}

function toggleSort(target){
	if(target.className == 'non'){
		allNon();
		target.className = 'asc';
		sortUp(target)
		searchDateOfVisitor(1,target);
	}else if(target.className == 'desc') {
		target.className = 'asc';
		sortUp(target)
		searchDateOfVisitor(1,target);
	}else if(target.className == 'asc'){
		target.className = 'desc';
		sortDown(target)
		searchDateOfVisitor(1,target);
	}else if(target == 1){
		allNon();
		target = document.querySelector('#maintarget');
		sortUp(target);
		searchDateOfVisitor(1,target);
	}
}

//정렬 아이콘 함수
function allNon(){
	var test = document.querySelectorAll('#allth div');
	test.forEach(function(e){
		e.className = 'non';
		sortNon(e)
	});
}

function sortUp(target){
	var up = target.childNodes[1];
	var down = target.childNodes[3];
	
	up.style.color = "#8080806b";
	down.style.color = 'black';
}

function sortDown(target){
	var up = target.childNodes[1];
	var down = target.childNodes[3];
	
	up.style.color = "black";
	down.style.color = '#8080806b';
	
}

function sortNon(target){
	var up = target.childNodes[1];
	var down = target.childNodes[3];
	
	up.style.color = "#8080806b";
	down.style.color = '#8080806b';
}

function toggleStar(mdNo) {
	var target = $('#'+mdNo)[0];
	if(target){
		if(target.className == 'far fa-plus-square'){
			target.classList.remove('fa-plus-square');
			target.classList.add('fa-minus-square');	
		}else {
			target.classList.remove('fa-minus-square');
			target.classList.add('fa-plus-square');	
		}
	}
}


//2.내방환자 분석
//연령별/성별 매출현황
function searchDateOfVisitor(page,target,sortTarget,sortType){
	if(page) nowPage = page;
	if(!target){
		target = document.querySelector('#maintarget');
	}
	
	var searchType2 = 'desc';
	var searchType = target.parentNode.id;
	if(target.className == 'non') searchType2 = 'desc';
	else if(target.className == 'asc') searchType2 = 'desc';
	else if(target.className == 'desc') searchType2 = 'asc';
	
	if(sortType) searchType2 = sortType;
	if(sortTarget) searchType = sortTarget;
	
	
	var startDate = document.getElementById('startDate').value;
	var endDate = document.getElementById('endDate').value;
// 	console.log("startDate : " + startDate)
// 	console.log("endDate : " + endDate)
	var data = {
		"startDate" : startDate,
		"endDate" : endDate,
		"page" : nowPage,
		"searchType" : searchType,
		"searchType2" : searchType2
	}
	
// 	console.log(sortTarget);
// 	console.log(sortType);
// 	console.log(target.parentNode.id)

	$.ajax({
		url:"<%=request.getContextPath()%>/expert/business/visitor/agebysex.do",
		type:"post",
		data:JSON.stringify(data),	
		contentType:'application/json',
		success:function(data){
// 			console.log(data);
			printData(data.salesByAgeList,$('#ageBySexList'),$('#ageBySexList-list-template'),"ageBySexList");
			printPagination(data.pageMaker,$('#ageBySexPagination'),$('#ageBySexList-pagination-template'));
// 			console.log(data.pageMaker)
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);	
		}
	});
}

// 선호 약/건강기능 식품 ajax
function getPreferMedicineList(target,page,filter){
	
	if(page) nowPage = page;
	var miCompany = ''
	var mdClass = 'ALL'
	if(filter){
		miCompany = document.querySelector('#company').value
		mdClass = document.querySelector('#gubun').value
	}
	var sex;
	var age;
	if(target == 0){
		var element = document.querySelector('.preferMedicineList');
		sex = element.getAttribute("data-sex");
		age = element.getAttribute("data-age");
	} else{
		var str = target.childNodes;
		age = str[1].innerText.substring(0, 1)*10;
		sex = str[3].innerText;
		fixLine(target);
	}
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	var data = {
		"startDate" : startDate,
		"endDate" : endDate,
		"page" : nowPage,
		"age" : age,
		"sex" : sex,
		"miCompany" : miCompany,
		"mdClass" : mdClass
	}
	
	document.getElementById('preferAge').innerText = age + '대';
	document.getElementById('preferSex').innerText = sex;
	
	
	$.ajax({
		url:"<%=request.getContextPath()%>/expert/business/visitor/prefermedicine.do",
		type:"post",
		data:JSON.stringify(data),	
		contentType:'application/json',
		success:function(data){
// 			console.log(data);
			printData(data.preferMedicineList,$('#preferMedicineList'),$('#preferMedicine-list-template'),"preferMedicineList");
			printData(data.companyList,$('#company'),$('#preferMedicineCompany-list-template'),"preferMedicineCompany");
			printPagination(data.pageMaker,$('#preferMedicinePagination'),$('#preferMedicine-pagination-template'));
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);	
		}
	});
}

// 선호 약/건강기능식품 상세재고현황
function preferProductDetail(target){
	var mdNo = target.getAttribute('data-mdNo');
// 	console.log(mdNo);
	fixLine(target)
	$.ajax({
		url:"<%=request.getContextPath()%>/expert/product/productDetail.do",
		type:"post",
		data:{"mdNo" : mdNo},	
		success:function(data){
// 			console.log(data.detail);
			printData(data.detail,$('#preferProductDetail'),$('#preferProductDetail-list-template'),"preferProductDetail");
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);	
		}
	});
}

// private String psCode;
// private String piHpid;
// private int preDrugDay;

// 장기조제환자 현황
function longPrescriptionList(page,preDrugDay,defaultValue){
// 	console.log(preDrugDay);
// 	console.log(piHpid);
	var preDay;
	if(page) nowPage = page;
	if(preDrugDay){
		preDay = preDrugDay;
		document.querySelector('#longPrescription').setAttribute('data-preDay', preDrugDay);
	} else {
		preDay = document.querySelector('#longPrescription').getAttribute('data-preDay');
	}
	
	var piHpid = "<c:out value='${loginUser.pharmacyCode}'/>"
	console.log("piHpid : " + piHpid);
	var data = {
		"preDrugDay" : preDay,
		"piHpid" : piHpid,
		"page" : nowPage
	}
	
	$.ajax({
		url:"<%=request.getContextPath()%>/expert/business/visitor/longPrescription.do",
		type:"post",
		data:JSON.stringify(data),	
		contentType:'application/json',
		success:function(data){
// 			console.log(data);
			printData(data.longList,$('#longPrescription'),$('#longPrescription-list-template'),"longPrescription");
			printPagination(data.pageMaker,$('#longPrescriptionPagination'),$('#longPrescription-pagination-template'));
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);	
		}
	});
}

//장기조제환자 상세처방내역
function longPrescriptionDetail(target){
	var psCode = target.getAttribute('data-psCode');
// 	if(psCodeValue){
// 		psCode = psCodeValue;
// 	}else{
// 		psCode = target.getAttribute('data-psCode');
// 	}
	var tdList = target.querySelectorAll('td');
	document.getElementById("longPsCode").innerText = psCode;
	document.getElementById("longPsDate").innerText = tdList[0].innerText;
	document.getElementById("longPsHos").innerText = tdList[3].innerText;
	document.getElementById("longPsDoctor").innerText = tdList[4].innerText;
	document.getElementById("longPsChemist").innerText = tdList[5].innerText;
	
	var data = {
		"psCode" : psCode
	}
	
	fixLine(target);
	
	$.ajax({
		url:"<%=request.getContextPath()%>/expert/business/visitor/longPrescriptionDetail.do",
		type:"post",
		data:JSON.stringify(data),	
		contentType:'application/json',
		success:function(data){
// 			console.log(data);
			printData(data,$('#longPrescriptionDetail'),$('#longPrescriptionDetail-list-template'),"longPrescriptionDetail");
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);	
		}
	});
	// console.log(tdList);
	// console.log(psCode);
}

// 비교테이블 약 상세정보
function getDetail(pageInfo,mdNo){
	pageInfo += mdNo;
	$.getJSON(pageInfo,function(data){
		console.log(data)
		printData(data.keyList,$('#Precautions'),$('#Precautions-list-template'),"Precautions");
		var detail = data.detail;
		var keyList = data.keyList;
		var vo = data.vo;
		keyList.forEach(function(obj,index){
			printData(detail[obj],$($('.font-weight-bold')[index]),$('#PrecautionsDetail-list-template'),"PrecautionsDetail");
		})
// 		console.log(detail['effect']);
		printData(detail['effect'],$('#effectDetail'),$('#effectDetail-list-template'),"effectDetail");
		printData(detail['use'],$('#useDetail'),$('#useDetail-list-template'),"useDetail");
		
		var basicInfo = document.querySelectorAll('#basicInfo td');
		basicInfo[0].innerText = vo['mdName'];
		basicInfo[1].innerText = vo['mdNature'];
		basicInfo[2].innerText = data.company;
		basicInfo[3].innerText = vo['mdClass'];
		basicInfo[4].innerText = vo['mdNo'];
		
		var mdComponentDetail = document.querySelector('#mdComponentDetail');
		mdComponentDetail.innerText = vo['mdComponent'].replace(/\[(.*?)\]/gm,'').replaceAll('|',',');;
		document.querySelector('#detailTitle').innerText = vo['mdName'] + '상세정보';
		
		var detailCard = document.querySelector('#detailCard');
		if(detailCard.style.display == 'none'){
			detailCard.style.display = 'block';
			window.resizeTo(800,1000);
		}
		
		compareList.forEach(function(ele){
			var td = ele.querySelector('[data-miPrice]')
			var miPrice = Number(td.getAttribute('data-miPrice'));
			if(avg > miPrice){
				td.style.color = 'blue';
			}else if(avg < miPrice){
				td.style.color = 'red';
			}else {
				td.style.color = 'black';
			}
		});
		
	});
}

function resize(width,height){
	window.resizeTo(width,width);
}

function Toggle(tag) {
	var className = $(tag).children().attr("class");
	
	$(tag).parent().next().toggle();
	
	if(className == 'fas fa-plus-circle'){
		$(tag).children().removeClass("fas fa-plus-circle")
		$(tag).children().addClass("fas fa-minus-circle")
	} else {
		$(tag).children().removeClass("fas fa-minus-circle")
		$(tag).children().addClass("fas fa-plus-circle")
	}
}

// Handlebars 필터함수 및 필터
Handlebars.registerHelper({
	"unitFilter" : function(unit){
		var newUnit = unit.slice(0,-1).substr(1);
		return newUnit;
	},
	"componentFilter" : function(component){
		return component.replace(/\[(.*?)\]/gm,'').replaceAll('|',',');
	},
	"signActive" : function(pageNum){
		if(pageNum == nowPage) return 'active';
	},
	"classFilter": function(className){
		return className.replace("의약품","");
	},
	"startNum":function(page){
		return page*5-4;
	},
	"endNum":function(page){
		return page*5;
	},
	"ageRange":function(age){
		var range = age + "~" + (age + 9);
		return range;
	},
	"numToComma":function(num){
		var comma = num.toLocaleString('ko-KR');
		return comma;
	},
	"prettifyDateCompare":function(timeValue){ //Handlbars에 날짜출력함수 등록
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		if(month < 10) month = '0' + month;
		var date=dateObj.getDate();
		if(date < 10) date = '0' + date;
		return year+"."+month+"."+date;
	},
	"inc":function(index){
		return index + 1;
	},
	"eq":function(arg1, arg2, options) {
		 return (arg1 == arg2) ? options.fn(this) : options.inverse(this);
	}
	
// 	"starCheck": function(selectMd){
// 		if(select)
// 		return null;
// 	}
});

function printData(replyArr,target,templateObject,targetName){
	var template=Handlebars.compile(templateObject.html());
	var html = template(replyArr);
	if(targetName == "medicineSearch") $('.mdList').remove();
	if(targetName == "basisSearch") $('.basisList').remove();
	if(targetName == "compareList") $('.compareList').remove();
	if(targetName == "selectList") $('.selectList').remove();
	if(targetName == "ageBySexList") $('.ageBySexList').remove();
	if(targetName == "preferMedicineList") $('.preferMedicineList').remove();
	if(targetName == "preferMedicineCompany") $('#companylist').remove();
	if(targetName == "preferProductDetail") $('.preferProductDetail').remove();
	if(targetName == "longPrescription") $('.longPrescription').remove();
	if(targetName == "longPrescriptionDetail") $('.longPrescriptionDetail').remove();
	if(targetName == "nameSearchRecord") $('.nameSearchRecord').remove();
	if(targetName == "basisSearchRecord") $('.basisSearchRecord').remove();
	if(targetName == "Precautions") $('.Precautions').remove();
	if(targetName == "PrecautionsDetail") $('.PrecautionsDetail').remove();
	if(targetName == "effectDetail") $('.effectDetail').remove();
	if(targetName == "useDetail") $('.useDetail').remove();
	target.after(html);
}

/* pagination */
function printPagination(pageMaker,target,templateObject){
	var pageNumArray = new Array(pageMaker.endPage-pageMaker.startPage+1);
	for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNumArray[i]=pageMaker.startPage+i;
	}	
	pageMaker.pageNum=pageNumArray;  
	pageMaker.prevPageNum=pageMaker.startPage-1;
	pageMaker.nextPageNum=pageMaker.endPage+1;
	
	var template=Handlebars.compile(templateObject.html());	
	var html = template(pageMaker);	
	target.html("").html(html);
}

</script>

<script>
// 브라우저가 닫히면 없어지는 쿠키 생성
function setCookieObject(cName, cValue){
	var expire = new Date();
	cookies = cName + '=' + escape(cValue)+";"; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
	document.cookie = cookies;
// 	alert(JSON.parse(document.cookie));
//	alert(document.cookie);
}

// 쿠키 가져오기 함수
function getCookieObjeck(cName) {
	cName = cName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cName);
	var cValue = '';
	var result;
	if(start != -1){
		start += cName.length;
		var end = cookieData.indexOf(';', start);
			if(end == -1)end = cookieData.length;
		cValue = cookieData.substring(start, end);
// 		console.log(cValue);
	}
	
	if(unescape(cValue)){
		result = JSON.parse(unescape(cValue));
// 		console.log(unescape(cValue));
// 		console.log("result : " + result[0]);
	}
	
	return result;
}

</script>


