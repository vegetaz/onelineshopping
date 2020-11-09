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
						<h4>Thông tin địa chỉ</h4>
					</div>
					
					<div class="panel-body">
										
						<sf:form
							method="POST"
							modelAttribute="billing"
							class="form-horizontal"
							id="billingForm"
						>
						
							
							<div class="form-group">
								<label class="control-label col-md-4" for="address">Địa chỉ</label>
								<div class="col-md-8">
									<sf:input type="text" path="address" class="form-control"
										placeholder="Nhập vào địa chỉ" />
									<sf:errors path="address" cssClass="help-block" element="em"/> 
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4" for="street">Đường</label>
								<div class="col-md-8">
									<sf:input type="text" path="street" class="form-control"
										placeholder="Nhập vào tên đường" />
									<sf:errors path="street" cssClass="help-block" element="em"/> 
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4" for="ward">Phường/Xã</label>
								<div class="col-md-8">
									<sf:input type="text" path="ward" class="form-control"
										placeholder="Nhập vào tên phường/xã" />
									<sf:errors path="ward" cssClass="help-block" element="em"/> 
								</div>
							</div>
							
							<div class="form-group">
								<label class="control-label col-md-4" for="postalCode">Mã bưu chính</label>
								<div class="col-md-8">
									<sf:input type="text" path="postalCode" class="form-control"
										placeholder="Nhập vào mã bưu chính" />
									<sf:errors path="postalCode" cssClass="help-block" element="em"/> 
								</div>
							</div>							
						
							<div class="form-group">
								<label class="control-label col-md-4" for="town">Quận/Huyện</label>
								<div class="col-md-8">
									<sf:input type="text" path="town" class="form-control"
										placeholder="Nhập vào tên quận/huyện" />
									<sf:errors path="town" cssClass="help-block" element="em"/> 
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4" for="city">Tỉnh/Thành phố</label>
								<div class="col-md-8">
									<sf:input type="text" path="city" class="form-control"
										placeholder="Nhập vào tên tỉnh/thành phố" />
									<sf:errors path="city" cssClass="help-block" element="em"/> 
								</div>
							</div>
							
							
							<div class="form-group">
								<div class="col-md-offset-4 col-md-8">
									<button type="submit" name="_eventId_personal" class="btn btn-primary">
										<span class="glyphicon glyphicon-chevron-left"></span>Quay lại
									</button>								
									<button type="submit" name="_eventId_confirm" class="btn btn-primary">
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
