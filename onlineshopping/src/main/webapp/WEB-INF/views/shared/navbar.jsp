<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />

	<script>
		window.userRole = '${userModel.role}';
	</script>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Chuyển đổi điều hướng</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${contextRoot}/home">Trang chủ</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li id="about">
                        <a href="${contextRoot}/about">Giới thiệu</a>
                    </li>

                    <li id="contact">
                        <a href="${contextRoot}/contact">Liên hệ</a>
                    </li>
                    
                    <li id="listProducts">
                        <a href="${contextRoot}/show/all/products">Hiển thị sản phẩm</a>
                    </li>
					<security:authorize access="hasAuthority('ADMIN')">
	                    <li id="manageProduct">
	                        <a href="${contextRoot}/manage/product">Quản lý sản phẩm</a>
	                    </li>
	                    <li id="manageCart">
	                        <a href="${contextRoot}/manage/manageCart">Quản lý đơn hàng</a>
	                    </li>
	                    <li id="manageAmount">
	                        <a href="${contextRoot}/manage/manageAmount">Quản lý ví tiền</a>
	                    </li>				
					</security:authorize>
                </ul>
			    
			    <ul class="nav navbar-nav navbar-right">
			    	<security:authorize access="isAnonymous()">
	                    <li id="signup">
	                        <a href="${contextRoot}/membership">Đăng ký</a>
	                    </li>
						<li id="login">
	                        <a href="${contextRoot}/login">Đăng nhập</a>
	                    </li> 			    	
			    	</security:authorize>
			    	<security:authorize access="isAuthenticated()">
						<li class="dropdown" id="userModel">
						  <a class="btn btn-default dropdown-toggle" href="javascript:void(0)" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						    ${userModel.fullName}
						    <span class="caret"></span>
						  </a>
						  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
		                    <security:authorize access="hasAuthority('USER')">
			                    <li id="cart">
			                        <a href="${contextRoot}/cart/show">
			                        	<span class="glyphicon glyphicon-shopping-cart"></span>&#160;<span class="badge">${userModel.cart.cartLines}</span> - <fmt:formatNumber value="${userModel.cart.grandTotal}"/> &#8363; 
			                        </a>
			                    </li>
			                    <li>
			                        <a>
			                        	<span class="glyphicon glyphicon-credit-card"></span>&#160;<span class="badge">Ví</span>
			                        	<span id="gentAmountUser1"></span>
			                        </a>
			                    </li>
			                	<li role="separator" class="divider"></li>
			                	<li id="amount">
			                        <a href="${contextRoot}/amount">Nạp tiền</a>
			                    </li>	                                   
		                    </security:authorize>
							<li id="logout">
		                        <a href="${contextRoot}/logout">Đăng xuất</a>
		                    </li>                    			    	
						  </ul>		
						</li>    			    
			    	</security:authorize>                    
			    </ul>                
                
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

<!-- jQuery -->
<script src="${js}/jquery.js"></script>


<script>
	$( document ).ready(function() {
		$.ajax({
			url : location.protocol + '//' + location.host + "<%=request.getContextPath()%>/cart/getAmount",
			type : 'GET',
			method : 'GET',
			success : function(res) {
				$('#gentAmountUser1').html(res.amount + ' &#8363;');
			},
			error : function(res) {
				
			}
		});
	});
</script>
