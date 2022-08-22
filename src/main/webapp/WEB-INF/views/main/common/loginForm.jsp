<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%-- <%@ include file="/WEB-INF/decorator/main/header.jsp"%> --%>
<style>
.form-group {
	height: 38px;
	margin-bottom: 10px;
	align-items: center;
	display: flex;
}
</style>


<div class="hold-transition login-page" style="font-size: 14px;">
	<div class="login-box">
		<!-- /.login-logo -->
		<div class="card" style="width: 400px;">
			<div class="card-header">
				<img src="/annapharm/resources/img/logo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="margin-top: 10px; width: 100px;" onclick="javascript:location.href='<%=request.getContextPath()%>/index.do'"> <a style="float: right; margin-top: 10px;">Sign in</a>
			</div>
			<div class="card-body login-card-body">
				<form action="login.do" method="post">
					<input name="retUrl" value="${retUrl }" type="hidden" />
					<div class="form-group has-feedback row">
						<div class="col-4">
							<span style="padding-right: 40px; font-weight: bold;">ID</span>
						</div>
						<div class="col-8">
							<input type="text" class="form-control" name="memId" placeholder="아이디를 입력하세요." style="width: 300px; float: right; " value="${pastID }"> <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
						</div>
					</div>
					<div class="form-group has-feedback row">
						<div class="col-4">
						<span style="padding-right: 17px; font-weight: bold;">PASS</span>
						</div>
						<div class="col-8">
						<input type="password" class="form-control" name="memPwd" placeholder="패스워드를 입력하세요." style="width: 300px; float: right;" value=""> <span class="glyphicon glyphicon-lock form-control-feedback"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-8">
							<div class="checkbox icheck" style="width: 360px;">
								<label style="width: 360px; margin-bottom: 15px;"> <a href="<%=request.getContextPath() %>/common/foundIdPassword.do" style="float: right;">아이디/패스워드 찾기</a><br>
								</label>
							</div>
						</div>
						<!-- /.col -->

						<!-- /.col -->
					</div>
					<!-- 					<div class="col-sm-4" style="float:right;">   -->
					<button type="submit" class="btn btn-primary btn-block btn-flat" style="font-weight: bold; border-radius:5px;">로그인</button>
					<!-- 					</div> -->
				</form>






			</div>
			<!-- /.login-box-body -->
		</div>
	</div>
	<!-- /.login-box -->

</div>



<%-- <%@ include file="/WEB-INF/decorator/main/footer.jsp"%> --%>


