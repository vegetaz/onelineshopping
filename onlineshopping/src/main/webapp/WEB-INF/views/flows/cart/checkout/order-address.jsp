<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<%@include file="../../flows-shared/header.jsp" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>			
<div class="container">
	
	<div class="row">
		
			<div class="col-md-4">
				
				<h4>Chọn địa chỉ giao hàng</h4>
				<hr/>
				
				<div class="row">
					<c:forEach items="${addresses}" var="address">					
						<div class="cols-xs-12">
							<h4>Địa chỉ đã có:</h4>
							<hr/>
							<h3>${address.address}, ${address.street}</h3>
							<h3>${address.ward}, ${address.town}</h3>
							<h3>${address.city} - ${address.postalCode}</h4>
							<p>&#160;</p>
							<p>&#160;</p>
							<hr/>
							<div class="text-center">
								<a href="${flowExecutionUrl}&_eventId_addressSelection&shippingId=${address.id}" class="btn btn-primary">Chọn</a>
							</div>												
						</div>
					</c:forEach>			
				</div>
	
	
			</div>		
			
			<div class="col-md-8">
			
				
				<div class="panel panel-primary">
				
					<div class="panel-heading">
						<h4>Thêm địa chỉ mới</h4>
					</div>
					
					<div class="panel-body">
										
						<sf:form
							method="POST"
							modelAttribute="shipping"
							class="form-horizontal"
							id="billingForm"
						>
						
							
							<div class="form-group">
								<label class="control-label col-md-4" for="address">Địa chỉ</label>
								<div class="col-md-8">
									<sf:input type="text" path="address" class="form-control"
										placeholder="Địa chỉ" />
									<sf:errors path="address" cssClass="help-block" element="em"/> 
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4" for="street">Tên đường</label>
								<div class="col-md-8">
									<sf:input type="text" path="street" class="form-control"
										placeholder="Tên đường" />
									<sf:errors path="street" cssClass="help-block" element="em"/> 
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4" for="ward">Phường/Xã</label>
								<div class="col-md-8">
									<sf:input type="text" path="ward" class="form-control"
										placeholder="Phường/Xã" />
									<sf:errors path="ward" cssClass="help-block" element="em"/> 
								</div>
							</div>
							
							<div class="form-group">
								<label class="control-label col-md-4" for="postalCode">Mã bưu chính</label>
								<div class="col-md-8">
									<sf:input type="text" path="postalCode" class="form-control"
										placeholder="Mã bưu chính" />
									<sf:errors path="postalCode" cssClass="help-block" element="em"/> 
								</div>
							</div>							
						
							<div class="form-group">
								<label class="control-label col-md-4" for="town">Quận/Huyện</label>
								<div class="col-md-8">
									<sf:input type="text" path="town" class="form-control"
										placeholder="Quận/Huyện" />
									<sf:errors path="town" cssClass="help-block" element="em"/> 
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4" for="city">Tỉnh/Thành phố</label>
								<div class="col-md-8">
									<sf:input type="text" path="city" class="form-control"
										placeholder="Tỉnh/Thành phố" />
									<sf:errors path="city" cssClass="help-block" element="em"/> 
								</div>
							</div>
							
							
							<div class="form-group">
								<div class="col-md-offset-4 col-md-8">
									<button type="submit" name="_eventId_saveAddress" class="btn btn-primary">
										<span class="glyphicon glyphicon-plus"></span> Thêm địa chỉ
									</button>																	 
								</div>
							</div>
						
						
						</sf:form>					
					
					
					</div>
				
				
				</div>
			
								
			
			</div>
			

	</div>	

</div>	
<%@include file="../../flows-shared/footer.jsp" %>	