<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <style>
    .nav-sidebar .nav-item>.nav-link{
		    position: relative;
		    font-size: 12px;
		    border-bottom: 1px solid #ddd;
		    border-radius: 0;
		    padding: 20px;
    }
    [class*=sidebar-dark] .user-panel{
		border-bottom:0;
    }

    body:not(.layout-fixed) .main-sidebar .sidebar{
		    padding-left: 20px;
    }
    </style>

<aside class="main-sidebar sidebar-dark-primary elevation-4">

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-1 pb-1 mb-1 d-flex">
        <div class="info" style="width:200px;">
             <div class="row" style="align-items: end;     margin-left: 0px;
    padding-bottom: 10px;
    border-bottom: 1px solid #658ad6;
    margin-bottom: 10px;">
		          &nbsp;<a href="#" class="d-block" style="    font-weight: bold;
    font-size: 20px;
    color: #9ddfff;" >
        ${loginUser.memName}
    </a>&nbsp;&nbsp;<span style="font-weight:bold;color:white">님</span>
	         </div>
	         <a href="#" style="    color: #fff;">ID : <span style="    font-size: 12px;">${loginUser.memId}</span> </a><br/><br/>
        </div>
      </div>


    </div>
    <!-- /.sidebar -->

    <!-- Sidebar Menu -->
    <div class="row" style="margin-left: 0px; ">
    	<ul class="nav nav-pills nav-sidebar flex-column subMenuList" data-widget="treeview" role="menu" data-accordion="false" style="width: 100%;">
			<c:forEach items="${menuList}" var="menu">
				<c:if test="${menu.mName eq '마이페이지'}"  >
   							<c:forEach items="${subMenuList}" var="subMenu">
   									<c:if test="${menu.mCode eq subMenu.parentId}">
			                        <li style="padding: 20px; border-bottom: 1px solid #ddd;"><i class="left fas fa-angle-right sideIcon"></i>&nbsp;
			                        	<a href="javascript:goPage('<%=request.getContextPath() %>${subMenu.mUrl }','${subMenu.mCode }');" style="    font-size: 14px;
    font-weight: 600;">${subMenu.mName}</a></li>
                    		</c:if>
                    	</c:forEach>

                </c:if>
               </c:forEach>
        </ul>
    </div>
    <!-- /.sidebar-menu -->
  </aside>
