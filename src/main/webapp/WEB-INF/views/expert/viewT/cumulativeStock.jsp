<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 최근누적재고 -->



<style>

.card-title{
	float:unset;
}
.card{
box-shadow:none;
}
</style>


<style>

body{
	font-size : 12px;
    background-color: #fff !important;
}
label {
	width: 90px;
	margin-left: 10px;
}


.title{
	font-weight: bold;
	
}

.patientList{
	padding:0px;
}

th{
	background-color: #E8F5FF;
	text-align: center;
	position: sticky;
    top: 0px;
}

/* 조제대기 버튼 배경 */
.statusReady{
	background-color: #FF3232;
	color : white;
}

/* 조제완료 버튼 배경 */
.statusEnd{
	background-color: #1478CD;
	color : white;
}

/* 수정요청 버튼 배경 */
.statusUpdate{
	background-color: #FF9B00;
	color : white;
}

.medicalTxt{
	text-align: left;
}

td{
	text-align: center;
}

.tableScroll{
	overflow:auto;
}

select {
  box-sizing: border-box;
/*   width: 100px; */
  padding: 4px;
  font-size: 14px;
  border-radius: 6px;
      float: right;
    height: 30px;
    width: 110px;
}

option {
  padding: 4px;
  font-size: 14px;
  background: #EBF5FF;
}

.selectTxt{
    display: block;
    float: right;
    margin: 10px 10px 0 0;
}

/* 버튼눌렀을때 */
a, a:visited {
  text-decoration: none;
  color: #00AE68;
}

a.button {
    display: block;
    position: relative;
    float: left;
    width: 55px;
    height: 25px;
    padding: 0;
    /* margin: 10px 20px 10px 0; */
    font-weight: 600;
    text-align: center;
    line-height: 25px;
    color: #FFF;
    border-radius: 5px;
    transition: all 0.2s;
}


/* 처방전상세내역버튼(추가, 저장, 취소) */
.preDetailBtn{
	background-color: #6e6e6e;
}


.btnBlueGreen {
  background: #1E82FF;
}

.btnFade.btnBlueGreen:hover {
  background: #0A6EFF;
}


/* 테이블에 마우스 오버시 메모 */
.arrow_box {
  display: none;
  position: absolute;
  width: 200px;
  padding: 8px;
  left: 0;
  -webkit-border-radius: 8px;
  -moz-border-radius: 8px;  
  border-radius: 8px;
  background: #333;
  color: #fff;
  font-size: 14px;
  text-align: left;
}

.arrow_box:after {
  position: absolute;
  bottom: 100%;
  left: 50%;
  width: 0;
  height: 0;
  margin-left: -10px;
  border: solid transparent;
  border-color: rgba(51, 51, 51, 0);
  border-bottom-color: #333;
  border-width: 10px;
  pointer-events: none;
  content: " ";
}


span:hover + p.arrow_box {
  display: block;
}


/* 구분 -> 전문 */
.sortPro{
	background-color: #FEBEBE;
}

/* 처방전작성 -> 약추가, 처방완료버튼 */
.locationBtn{
    display: flex;
    left: 30px;
}


.table td{
	padding: 5px;
}
.card-primary.card-outline{
border-top: 1px solid #000;
}
</style>



<div class="card">

	<div class="card-body table-responsive p-0" style="overflow-x: hidden;">
		<table class="table table-hover text-nowrap">
			<thead>
				<tr>
					<th>약품명</th>
					<th>최근입고일</th>
					<th>입고재고(개)</th>
					<th>전체재고(개)</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="list" >
					<tr>
					<td style="    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    word-break: break-all;
    width: 120px;
    display: inline-block;">${list.MD_NAME}</td>
					<td>${list.RECEIVE_LASTDATE}</td>
					<td>${list.RECEIVE_CART_NUM}</td>
					<td>${list.PRODUCT_OWNNUM}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>

</div>