<%@page import="java.util.List"%>
<%@page import="mnm.n13.shoppingbackend.dto.OrderDetail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />

<div class="container">
	<c:choose>
		<c:when test="${not empty orderDetail}">
			<table id="cart" class="table table-hover table-condensed">
				<thead>
					<tr>
						<th>Đơn hàng</th>
						<th>Người mua</th>
						<th>Địa chỉ</th>
						<th>Giá</th>
						<th>Duyệt</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orderDetail}" var="detail">

						<tr>
							<td>
								<div class="col-md-12">
									<h4>${detail.id}</h4>
								</div>
							</td>
							<td>
								<div class="col-md-12">
									${detail.user.firstName} ${detail.user.lastName} <br>
									${detail.user.contactNumber}
								</div>
							</td>
							<td>
								<div class="col-md-12">
									${detail.shipping.address} <br> ${detail.shipping.street}
									<br> ${detail.shipping.town} <br>
									${detail.shipping.city}
								</div>
							</td>
							<td data-th="Product">
								<div class="col-md-12"><fmt:formatNumber value="${detail.orderTotal}"/> &#8363;</div>
							</td>
							<td data-th="Product">
								<div class="col-md-12">
								<c:choose>
								  <c:when test="${detail.imagePath == null}">
								    Thanh toán khi nhận hàng
								  </c:when>
								  <c:when test="${detail.imagePath == '-1'}">
								   	Thanh toán qua ví
								  </c:when>
								  <c:otherwise>
								    <img src="${detail.imagePath}"
										class="img-responsive dataTableImg" />
								  </c:otherwise>
								</c:choose>
									
								</div>
							</td>

							<td data-th="Product">
								<div class="col-md-12">
									<c:if test="${detail.status == 0}">
										<a
											href="<%=request.getContextPath()%>/manage/manageCart/update?id=${detail.id}"
											type="button" class="btn btn-primary">Chưa duyệt</a>
									</c:if>
									<c:if test="${detail.status == 1}">
										<button class="btn btn-primary" disabled>Đã duyệt</button>
									</c:if>
								</div>

							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</c:when>

		<c:otherwise>

			<div class="jumbotron">

				<h3 class="text-center">Hiện tại chưa có đơn hàng!</h3>

			</div>

		</c:otherwise>
	</c:choose>

</div>
