<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<%@include file="../flows-shared/header.jsp" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>			
	<div class="container">
		
		
		<div class="row">
			
			<div class="col-md-6 col-md-offset-3">
				
				<div class="panel panel-primary">
				
					<div class="panel-heading">
						<h4>Đăng ký tài khoản</h4>
					</div>
					
					<div class="panel-body">
										
						<sf:form
							method="POST"
							modelAttribute="user"
							class="form-horizontal"
							id="registerForm"
						>
						
							
							<div class="form-group">
								<label class="control-label col-md-4">Họ và tên đệm</label>
								<div class="col-md-8">
									<sf:input type="text" path="firstName" class="form-control"
										placeholder="Họ và tên đệm" />
									<sf:errors path="firstName" cssClass="help-block" element="em"/> 
								</div>
							</div>


							<div class="form-group">
								<label class="control-label col-md-4">Tên</label>
								<div class="col-md-8">
									<sf:input type="text" path="lastName" class="form-control"
										placeholder="Tên" />
									<sf:errors path="lastName" cssClass="help-block" element="em"/> 
								</div>
							</div>
						
							<div class="form-group">
								<label class="control-label col-md-4">Thư điện tử</label>
								<div class="col-md-8">
									<sf:input type="text" path="email" class="form-control"
										placeholder="Thư điện tử (abc@xyz.com)" />
									<sf:errors path="email" cssClass="help-block" element="em"/> 									
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4">Số điện thoại</label>
								<div class="col-md-8">
									<sf:input type="text" path="contactNumber" class="form-control"
										placeholder="Số điện thoại (10 số)" maxlength="10" />
									<sf:errors path="contactNumber" cssClass="help-block" element="em"/> 
								</div>
							</div>
							
							<div class="form-group">
								<label class="control-label col-md-4">Mật khẩu</label>
								<div class="col-md-8">
									<sf:input type="password" path="password" class="form-control"
										placeholder="Mật khẩu" />
									<sf:errors path="password" cssClass="help-block" element="em"/> 
								</div>
							</div>
							
							<div class="form-group">
								<label class="control-label col-md-4">Xác nhận mật khẩu</label>
								<div class="col-md-8">
									<sf:input type="password" path="confirmPassword" class="form-control"
										placeholder="Nhập lại mật khẩu" />
									<sf:errors path="confirmPassword" cssClass="help-block" element="em"/>										 
								</div>
							</div>
							
	<div class="form-group">
		<label class="control-label col-md-4">Lựa chọn vai trò</label>
		<div class="col-md-8">
			<label class="radio-inline">
				<sf:radiobutton path="role" value="USER" checked="checked"/>Khách hàng
			</label>
			<label class="radio-inline">
				<sf:radiobutton path="role" value="SUPPLIER"/>Nhà cung cấp
			</label>
		</div>
	</div>							

							<div class="form-group">
								<div class="col-md-offset-4 col-md-8">
									<button type="submit" name="_eventId_billing" class="btn btn-primary">
										Tiếp theo<span class="glyphicon glyphicon-chevron-right"></span>
									</button>																	 
								</div>
							</div>
						
						
						</sf:form>					
					
					
					</div>
				
				
				</div>
			
			
			</div>
		
		
		</div>
		
		
	</div>

<%@include file="../flows-shared/footer.jsp" %>			
