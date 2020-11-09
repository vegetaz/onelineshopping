<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<c:set var="availableCount" value="${userModel.cart.cartLines}" />
<div class="container">


	<c:if test="${not empty message}">
		
		<div class="alert alert-info">
			<h3 class="text-center">${message}</h3>
		</div>		
	
	</c:if>
	
	<c:choose>
		<c:when test="${not empty cartLines}">
			<table id="cart" class="table table-hover table-condensed">
			   	<thead>
					<tr>
						<th style="width:50%">Sản phẩm</th>
						<th style="width:10%">Giá</th>
						<th style="width:8%">Số lượng</th>
						<th style="width:22%" class="text-center">Đơn giá</th>
						<th style="width:10%"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${cartLines}" var="cartLine">
					<c:if test="${cartLine.available == false}">
						<c:set var="availableCount" value="${availableCount - 1}"/>
					</c:if>
					
					<tr>
						<td data-th="Product">
							<div class="row">
								<div class="col-sm-2 hidden-xs">
									<img src="${images}/${cartLine.product.code}.jpg" alt="${cartLine.product.name}" class="img-responsive dataTableImg"/></div>
								<div class="col-sm-10">
									<h4 class="nomargin">${cartLine.product.name} 
										<c:if test="${cartLine.available == false}">
											<strong style="color:red">(Not Available)</strong> 
										</c:if>
									</h4>
									<p>Hãng : ${cartLine.product.brand}</p>
									<p>Miêu tả : ${cartLine.product.description}
								</div>
							</div>
						</td>
						<td data-th="Price"> <fmt:formatNumber value="${cartLine.buyingPrice}" /> &#8363;</td>
						<td data-th="Quantity">
							<input type="number" id="count_${cartLine.id}" class="form-control text-center" value="${cartLine.productCount}" min="1" max="3">
						</td>
						<td data-th="Subtotal" class="text-center"> <fmt:formatNumber value="${cartLine.total}" /> &#8363;</td>
						<td class="actions" data-th="">
							<c:if test="${cartLine.available == true}">
								<button type="button" name="refreshCart" class="btn btn-info btn-sm" value="${cartLine.id}"><span class="glyphicon glyphicon-refresh"></span></button>
							</c:if>												
							<a href="${contextRoot}/cart/${cartLine.id}/remove" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></a>								
						</td>
					</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr class="visible-xs">
						<td class="text-center"><strong>Tổng:  <fmt:formatNumber value="${userModel.cart.grandTotal}" /> &#8363;</strong></td>
					</tr>
					<tr>
						<td><a href="${contextRoot}/show/all/products" class="btn btn-warning"><span class="glyphicon glyphicon-chevron-left"></span>Quay lại</a></td>
						<td colspan="2" class="hidden-xs"></td>
						<td class="hidden-xs text-center"><strong>Tổng:  <fmt:formatNumber value="${userModel.cart.grandTotal}" /> &#8363;</strong></td>
						
						<c:choose>
							<c:when test="${availableCount != 0}">
								<td><a href="${contextRoot}/cart/validate" class="btn btn-success btn-block">Tiếp theo<span class="glyphicon glyphicon-chevron-right"></span></a></td>
							</c:when>							
							<c:otherwise>
								<td><a href="javascript:void(0)" class="btn btn-success btn-block disabled"><strike>Tiếp theo<span class="glyphicon glyphicon-chevron-right"></span></strike></a></td>
							</c:otherwise>
						</c:choose>						
					</tr>
				</tfoot>
			</table>
		
		</c:when>
		
		<c:otherwise>
			
			<div class="jumbotron">
				
				<h3 class="text-center">Giỏ hàng trống!</h3>
			
			</div>
		
		</c:otherwise>
	</c:choose>




</div>
