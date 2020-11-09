<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<%@include file="../flows-shared/header.jsp" %>
<div class="container">
	
	<div class="row">
	
		<div class="col-sm-6">
	
			<div class="panel panel-primary">
				
				<div class="panel-heading">
					<h4>Thông tin cá nhân</h4>
				</div>
			
				<div class="panel-body">
					<div class="text-center">
						<h3>Tên: <strong>${registerModel.user.firstName} ${registerModel.user.lastName}</strong></h3>
						<h4>Thư điện tử: <strong>${registerModel.user.email}</strong></h4>
						<h4>Liên hệ: <strong>${registerModel.user.contactNumber}</strong></h4>
						<h4>Quyền/Vai trò : <strong>${registerModel.user.role}</strong></h4>
						<p>
							<a href="${flowExecutionUrl}&_eventId_personal" class="btn btn-primary">Sửa</a>
						</p>
					</div>
				</div>
			
			</div>
					
		
		</div>
		
		<div class="col-sm-6">
		
			<div class="panel panel-primary">
				
				<div class="panel-heading">
					<h4>Địa chỉ thanh toán</h4>
				</div>
			
				<div class="panel-body">
					<div class="text-center">
						<p>${registerModel.billing.address}, ${registerModel.billing.street}</p>
						<p>${registerModel.billing.ward}, ${registerModel.billing.town}</p>
						<p>${registerModel.billing.city} -  ${registerModel.billing.postalCode}</p>
						<p>&#160;</p>
						<p>&#160;</p>
						<p>
							<a href="${flowExecutionUrl}&_eventId_billing" class="btn btn-primary">Sửa</a>
						</p>
					</div>
				</div>
			
			</div>
		
		</div>
	
	</div>
	
	<div class="row">
		
		<div class="col-sm-4 col-sm-offset-4">
			
			<div class="text-center">
				
				<a href="${flowExecutionUrl}&_eventId_submit" class="btn btn-lg btn-primary">Xác nhận</a>
				
			</div>
			
		</div>
		
	</div>

</div>
<%@include file="../flows-shared/footer.jsp" %>