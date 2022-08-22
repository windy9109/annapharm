<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/common.js" ></script>

<style>
input[type="date"] {
	width: 130px;
	height: 22px;   
	/* 	font-size: em; */ 
}
table {
	table-layout: fixed;	
}	  
td { 		
	vertical-align: middle; 		
	padding:5px;		
	overflow:hidden;		
	white-space : nowrap;		
	text-overflow: ellipsis;	 
}

.table td, .table th {
	padding: 5px;
	vertical-align: top;
	border-top: 1px solid #dee2e6;
}
.table td, .pagination{
	font-size:12px;
}
.table th{ 
	font-size:14px; 
	text-align:center;  
}
 
.btn-block+.btn-block{
	margin-top:0px;
}
.btn {
	width: 110px;
}
.btn-lg{
	font-size:16px;
}
.card-body11{
	padding:0px;
}
.card-body.p-0 .table tbody>tr>td:first-of-type, .card-body.p-0 .table tbody>tr>th:first-of-type, .card-body.p-0 .table tfoot>tr>td:first-of-type, .card-body.p-0 .table tfoot>tr>th:first-of-type, .card-body.p-0 .table thead>tr>td:first-of-type, .card-body.p-0 .table thead>tr>th:first-of-type {
    padding-left:0;
}
.card-body.p-0 .table thead>tr>th:last-of-type{
	padding-right:0;
}
.tableNum{
	text-align: center;   
}
.pro_number{
    position: relative;
    top: -7px;
    right: 12px;
    padding: 0px;
    width: 11px;
    height: 11px;
    margin-right: -10px;  
}
.pro_no{
	position: absolute;
}

.proListTr:hover{
	cursor: pointer;
	background-color: red !important;
	background: red !important;
}
#body1{
    min-width: 1200px;
    box-sizing: border-box;
}
</style>

</head>
<body>
	<div class="content-wrapper">
		<div class="row m-0">
			<div class="col-sm-6" style="height:882px; padding-left: 20px; padding-right: 0px;">
			<div class="card card-outline"></div>
				<iframe name="receiveOrder" id="receiveOrder" title="receiveOrder" src="receiveOrder" width="98%" height="98%" style="border:0px;"></iframe>
			</div>
			<div class="col-sm-6" style="height:882px;">
			<div class="card card-outline"></div>
				<iframe id="ownList" title="ownList" src="ownList" width="98%" height="98%" style="border:0px;"></iframe>		
			</div>
		</div>
	</div>
	
	<%@include file="./product_js.jsp" %>
	<%@ include file="/WEB-INF/views/common/receiveOrderPagination.jsp" %>
</body>







