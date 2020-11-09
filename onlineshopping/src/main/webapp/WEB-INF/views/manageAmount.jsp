<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />

<div class="container">
	<c:choose>
		<c:when test="${not empty logAmount}">
			<table id="cart" class="table table-hover table-condensed">
				<thead>
					<tr>
						<th>Mã nạp</th>
						<th>Người nạp</th>
						<th>Số tiền nạp</th>
						<th>Biên lai nạp tiền</th>
						<th>Duyệt</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${logAmount}" var="detail">

						<tr>
							<td>
								<div class="col-md-12">
									<h4>${detail.id}</h4>
								</div>
							</td>
							<td>
								<div class="col-md-12">
									${detail.email}
								</div>
							</td>
							<td data-th="Product">
								<div class="col-md-12"><fmt:formatNumber value="${detail.amount}" /> &#8363;</div>
							</td>
							<td data-th="Product">
								<div class="col-md-12">
									<img src="${detail.path_image}"
										class="img-responsive dataTableImg" />
								</div>
							</td>

							<td data-th="Product">
								<div class="col-md-12">
									<c:if test="${detail.status == 0}">
										<a
											href="<%=request.getContextPath()%>/manage/manageAmount/update?id=${detail.id}&amount=${detail.amount}"
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

				<h3 class="text-center">Ví trống!</h3>

			</div>

		</c:otherwise>
	</c:choose>

</div>
