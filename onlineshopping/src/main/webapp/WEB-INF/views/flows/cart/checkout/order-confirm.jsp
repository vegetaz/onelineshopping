<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Xác nhận đơn hàng</title>

<script>

	window.contextRoot = '${contextRoot}'
	
</script>

<!-- Bootstrap Core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Readable Theme -->
<link href="${css}/bootstrap-readable-theme.css" rel="stylesheet">


<!-- Bootstrap DataTables -->
<link href="${css}/dataTables.bootstrap.css" rel="stylesheet">


<!-- Custom CSS -->
<link href="${css}/myapp.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<div class="wrapper">

    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
           <div class="navbar-header">
               <a class="navbar-brand" href="${contextRoot}/home">Trang chủ</a>
           </div>
		</div>
	</nav>


	<!-- Page Content -->
	
	<div class="content">
		<div class="container">
			<div class="alert alert-success">
				<h3 class="text-center">Đơn hàng của bạn đã được xác nhận!</h3>
			</div>
		    <div class="row">
		        <div class="col-xs-12">
		    		<div class="invoice-title">
		    			<h2>Hoá đơn</h2><h3 class="pull-right">Đơn hàng # ${orderDetail.id}</h3>
		    		</div>
		    		<hr>
		    		<div class="row">
		    			<div class="col-xs-6">
		    				<address>
		    				<strong>Thông tin hoá đơn:</strong><br>
		    					${orderDetail.user.firstName} ${orderDetail.user.lastName}<br>
		    					${orderDetail.billing.address}, ${orderDetail.billing.street}<br>
		    					${orderDetail.billing.ward}, ${orderDetail.billing.town}<br>
		    					${orderDetail.billing.city} - ${orderDetail.billing.postalCode}<br>
		    					</hr> 
		    				</address>
		    			</div>
		    			<div class="col-xs-6 text-right">
		    				<address>
		        			<strong>Giao hàng tới:</strong><br>
		    					${orderDetail.user.firstName} ${orderDetail.user.lastName}<br>
		    					${orderDetail.billing.address}, ${orderDetail.billing.street}<br>
		    					${orderDetail.billing.ward}, ${orderDetail.billing.town}<br>
		    					${orderDetail.billing.city} - ${orderDetail.billing.postalCode}<br>
		    					</hr>
		    				</address>
		    			</div>
		    		</div>
		    		<div class="row">
		    			<div class="col-xs-6">
		    				<address>
		    					<strong>Phương thức thanh toán:</strong><br>
		    					
		    					<c:choose>
								  <c:when test="${orderDetail.imagePath == null}">
								    Thanh toán khi nhận hàng
								  </c:when>
								  <c:when test="${orderDetail.imagePath == '-1'}">
								   	Thanh toán qua ví
								  </c:when>
								  <c:otherwise>
								    Thanh toán qua thẻ ngân hàng
								  </c:otherwise>
								</c:choose>
		    					 <br>
		    					${orderDetail.user.email}
		    				</address>
		    			</div>
		    			<div class="col-xs-6 text-right">
		    				<address>
		    					<strong>Ngày thanh toán:</strong><br>
		    					${orderDetail.orderDate}<br><br>
		    				</address>
		    			</div>
		    		</div>
		    	</div>
		    </div>
		    
		    <div class="row">
		    	<div class="col-md-12">
		    		<div class="panel panel-default">
		    			<div class="panel-heading">
		    				<h3 class="panel-title"><strong>Thông tin thanh toán</strong></h3>
		    			</div>
		    			<div class="panel-body">
		    				<div class="table-responsive">
		    					<table class="table table-condensed">
		    						<thead>
		                                <tr>
		        							<td><strong>Sản phẩm</strong></td>
		        							<td class="text-center"><strong>Giá</strong></td>
		        							<td class="text-center"><strong>Số lượng</strong></td>
		        							<td class="text-right"><strong>Tổng</strong></td>
		                                </tr>
		    						</thead>
		    						<tbody>
		    							<!-- foreach ($order->lineItems as $line) or some such thing here -->
		    							<c:forEach items="${orderDetail.orderItems}" var="orderItem">
			    							<tr>
			    								<td>${orderItem.product.name}</td>
			    								<td class="text-center"> <fmt:formatNumber value="${orderItem.buyingPrice}"/> &#8363;</td>
			    								<td class="text-center">${orderItem.productCount}</td>
			    								<td class="text-right"> <fmt:formatNumber value="${orderItem.total}"/> &#8363;</td>
			    							</tr>
		    							</c:forEach>
		    						</tbody>
		    					</table>
		    				</div>
		    			</div>
		    		</div>
		    	</div>
		    </div>
		    <div class="text-center">
		    	<a href="${contextRoot}/show/all/products" class="btn btn-lg btn-warning">Quay lại trang hiển thị tất cả các sản phẩm</a>
		    </div>
		</div>
<%@include file="../../flows-shared/footer.jsp" %>	