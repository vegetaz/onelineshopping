<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<div class="container">

	<c:if test="${not empty message}">	
		<div class="row">			
			<div class="col-xs-12 col-md-offset-2 col-md-8">			
				<div class="alert alert-info fade in">${message}</div>				
			</div>
		</div>
	</c:if>

	<div class="row">

		<div class="col-md-offset-2 col-md-8">

			<div class="panel panel-primary">

				<div class="panel-heading">

					<h4>Quản lý sản phẩm</h4>

				</div>

				<div class="panel-body">
					<sf:form class="form-horizontal" modelAttribute="product" action="${contextRoot}/manage/product" method="POST" enctype="multipart/form-data">
						<div class="form-group">
							<label class="control-label col-md-4">Tên</label>
							<div class="col-md-8">
								<sf:input type="text" path="name" class="form-control"
									placeholder="Tên sản phẩm" />
								<sf:errors path="name" cssClass="help-block" element="em"/> 
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-md-4">Hãng</label>
							<div class="col-md-8">
								<sf:input type="text" path="brand" class="form-control"
									placeholder="Tên hãng" /> 
								<sf:errors path="brand" cssClass="help-block" element="em"/>	
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Miêu tả</label>
							<div class="col-md-8">
								<sf:textarea path="description" class="form-control"
									placeholder="Miêu tả" /> 
								<sf:errors path="description" cssClass="help-block" element="em"/>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Giá</label>
							<div class="col-md-8">
								<sf:input type="number" path="unitPrice" class="form-control"
									placeholder="Giá đơn vị" />
								<sf:errors path="unitPrice" cssClass="help-block" element="em"/>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Số lượng</label>
							<div class="col-md-8">
								<sf:input type="number" path="quantity" class="form-control"
									placeholder="Số lượng" />
								<sf:errors path="quantity" cssClass="help-block" element="em"/> 
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-md-4">Tải lên 1 tệp</label>
							<div class="col-md-8">
								<sf:input type="file" path="file" class="form-control"/>
								<sf:errors path="file" cssClass="help-block" element="em"/> 
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-md-4">Danh mục</label>
							<div class="col-md-8">
								<sf:select path="categoryId" items="${categories}" itemLabel="name" itemValue="id" class="form-control"/>
							
								<div class="text-right">
									<br/>			
									<sf:hidden path="id"/>
									<sf:hidden path="code"/>
									<sf:hidden path="supplierId"/>
									<sf:hidden path="active"/>														
									<button type="button" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#myCategoryModal">Thêm danh mục mới</button>
								</div>							
							</div>
							
						</div>


					
						<div class="form-group">
							
							<div class="col-md-offset-4 col-md-4">
							
								<input type="submit" name="submit" value="Lưu" class="btn btn-primary"/>
								
							</div>
						</div>						
										
					</sf:form>

				</div>

			</div>

		</div>

	</div>

	<!-- Modal -->
	<div class="modal fade" id="myCategoryModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Danh mục mới</h4>
	      </div>
	      <div class="modal-body">
	        
	        <sf:form id="categoryForm" class="form-horizontal" modelAttribute="category" action="${contextRoot}/manage/category" method="POST">
	        	
       			<div class="form-group">
					<label class="control-label col-md-4">Tên</label>
					<div class="col-md-8 validate">
						<sf:input type="text" path="name" class="form-control"
							placeholder="Tên danh mục" /> 
					</div>
				</div>
       			
       			<div class="form-group">				
					<label class="control-label col-md-4">Miêu tả</label>
					<div class="col-md-8 validate">
						<sf:textarea path="description" class="form-control"
							placeholder="Nhập miêu tả danh mục ở đây!" /> 
					</div>
				</div>	        	        
	        
	        
				<div class="form-group">				
					<div class="col-md-offset-4 col-md-4">					
						<input type="submit" name="submit" value="Lưu" class="btn btn-primary"/>						
					</div>
				</div>	        
	        </sf:form>
	      </div>
	    </div>
	  </div>
	</div>
	
	<hr/>	
	<h1>Sản phẩm có sẵn</h1>
	<hr/>
	
	<div class="row">
				
		
		<div class='col-xs-12'>
		
		
			<table id="productsTable" class="table table-condensed table-bordered">
							
				<thead>					
					<tr>					
						<th>ID</th>
						<th>&#160;</th>
						<th>Tên</th>
						<th>Hãng</th>
						<th>Số lượng</th>
						<th>Giá đơn vị</th>
						<th>Kích hoạt</th>				
						<th>Sửa</th>
					</tr>					
				</thead>
				
				<tfoot>
					<tr>					
						<th>ID</th>
						<th>&#160;</th>
						<th>Tên</th>
						<th>Hãng</th>
						<th>Số lượng</th>
						<th>Giá đơn vị</th>
						<th>Kích hoạt</th>				
						<th>Sửa</th>
					</tr>									
				</tfoot>
				
							
			</table>
		
		
		</div>
	
	
	</div>

</div>