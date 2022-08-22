<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav aria-label="Navigation">
	<ul class="pagination justify-content-center m-0">
		<c:if test="${pageMaker.prev eq true }">
		<li class="page-item"><a class="page-link" href="javascript:list_go(1, 'ownList');"> 
		<i class="fas fa-angle-double-left"></i>
		</a></li>
		</c:if>
		<c:if test="${cri.page gt 1 }">
		<li class="page-item"><a class="page-link" href="javascript:list_go(${cri.page } - 1, 'ownList');"> <i
				class="fas fa-angle-left"></i>
		</a></li>
		</c:if>
		<c:forEach var="i" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" step="1" varStatus="status">
			<li class="page-item ${i == cri.page? 'active' : '' }" ><a
				class="page-link" href="javascript:list_go(${i }, 'ownList');"> ${i } </a></li>
		</c:forEach>
		<c:if test="${cri.page lt pageMaker.realEndPage   }" >
		<li class="page-item"><a class="page-link" href="javascript:list_go(${cri.page } + 1, 'ownList');"> <i
				class="fas fa-angle-right"></i>
		</a></li>
		</c:if>
		<c:if test="${pageMaker.next eq true }">
		<li class="page-item"><a class="page-link" href="javascript:list_go(${pageMaker.realEndPage }, 'ownList');"> <i
				class="fas fa-angle-double-right"></i>
		</a></li>
		</c:if>
	</ul>
</nav>


<form id="jobForm">
	<input type="hidden" name="page" value="" />
	<input type="hidden" name="perPageNum" value="27" />
	<input type="hidden" name="searchType" value="" />
	<input type="hidden" name="searchType3" value="" />
	<input type="hidden" name="keyword" value="" />
</form>