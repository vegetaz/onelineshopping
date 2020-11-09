<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<%@include file="../../flows-shared/header.jsp"%>
<div class="container">

	<div class="row">
		<!--  To display all the goods -->
		<div class="col-md-6">

			<div class="row">
				<c:forEach items="${checkoutModel.cartLines}" var="cartLine">
					<div class="col-xs-12">

						<div>
							<h3>${cartLine.product.name}</h3>
							<hr />
							<h4>Số lượng: ${cartLine.productCount}</h4>
							<h5>Giá: <fmt:formatNumber value="${cartLine.buyingPrice}"/> &#8363;</h5>							
						</div>
						<hr />
						<div class="text-right">
							<h3>Tổng cộng: <fmt:formatNumber value="${cartLine.total}"/> &#8363;</h3>
						</div>
					</div>
				</c:forEach>
			</div>


		</div>

		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Tài khoản nhận tiền của shop</h3>
				</div>
				<div class="panel-body">
					<form id="fileUploadForm" role="form" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-12">
								<div class="col-md-12" style="padding: 0px;">
									<label class="col-md-12"
										style="text-align: left; text-transform: none; padding-top: 0px; float: left;">1.
										Ngân hàng Thương mại cổ phần Ngoại thương Việt Nam
										(Vietcombank)</label> <label class="col-md-12"
										style="text-align: left; text-transform: none; padding-top: 0px; float: left;">STK:
										01239499495959</label>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<div class="col-md-12" style="padding: 0px;">
									<label class="col-md-12"
										style="text-align: left; text-transform: none; padding-top: 0px; float: left;">2.
										Ngân hàng Thương mại Cổ phần Tiên Phong(TPBank)</label> <label
										class="col-md-12"
										style="text-align: left; text-transform: none; padding-top: 0px; float: left;">STK:
										00009051001</label>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<div class="col-md-12" style="padding: 0px;">
									<label class="col-md-12"
										style="text-align: left; text-transform: none; padding-top: 0px; float: left;">3.
										Ngân hàng Quân đội (MB bank)</label> <label class="col-md-12"
										style="text-align: left: left; text-transform: none; padding-top: 0px; float: left;">STK:
										0000905100156456</label>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<div class="col-md-12">
									<label class=" col-md-12"
										style="text-align: left; text-transform: none; padding-top: 0px; float: left;">Biên
										lai chuyển tiền:</label>
									<div class="col-md-12">
										<input id="filepayOnline" name="file" type="file"
											accept=".png,.jpg,.jpeg" />
									</div>
								</div>
							</div>
						</div>

						<br />
						<ul class="nav nav-pills nav-stacked">
							<li class="active"><input type="hidden"
								name="${_csrf.parameterName}" value="${_csrf.token}" /> <a
								onclick="payOnline();" style="width: 100%;"
								class="btn btn-lg btn-primary"><span
									class="badge pull-right"> <fmt:formatNumber value="${checkoutModel.checkoutTotal}"/>
										&#8363;</span> Thanh toán qua thẻ ngân hàng </a></li>
						</ul>

					</form>
				</div>
			</div>
			
			<!-- ///// -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Thanh toán bằng tài khoản trong ví</h3>
				</div>
				<div class="panel-body">
					<form id="amountForm" role="form" enctype="multipart/form-data">
						
						<div class="row">
							<div class="col-md-12">
								<div class="col-md-12" style="padding: 0px;">
									<label class="col-md-12"
										style="text-align: left; text-transform: none; padding-top: 0px; float: left;">Số dư trong ví:</label> 
										<label id="gentAmountUser" class="col-md-12" style="text-align: left: left; text-transform: none; padding-top: 0px; float: left;color: red;"> &#8363;</label> 
								</div>
							</div>
						</div>

						<br />
						<ul class="nav nav-pills nav-stacked">
							<li class="active"><input type="hidden"
								name="${_csrf.parameterName}" value="${_csrf.token}" /> <a
								onclick="payAmount();" style="width: 100%;"
								class="btn btn-lg btn-primary"><span
									class="badge pull-right"> <fmt:formatNumber value="${checkoutModel.checkoutTotal}"/>
										&#8363;</span> Thanh toán qua ví tiền </a></li>
						</ul>

					</form>
				</div>
			</div>
			<!-- //// -->
			
			<!-- ///// -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Thanh toán và giao hàng tận nơi</h3>
				</div>
				<div class="panel-body">
					<form role="form" enctype="multipart/form-data">
						
						<ul class="nav nav-pills nav-stacked">
							<li class="active"><input type="hidden"
								name="${_csrf.parameterName}" value="${_csrf.token}" /> 
								<a href="${flowExecutionUrl}&_eventId_pay" style="width: 100%;"
								class="btn btn-lg btn-primary">
								<span class="badge pull-right"> <fmt:formatNumber value="${checkoutModel.checkoutTotal}"/>
										&#8363;</span> Thanh toán khi nhận hàng </a></li>
						</ul>

					</form>
				</div>
			</div>
			<!-- //// -->

		</div>

	</div>
</div>
<%@include file="../../flows-shared/footer.jsp"%>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>Bạn chưa nhập biên lai !</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="uploadFileSuccess" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Xác nhận thanh
					toán</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>Xác nhận thanh toán !</p>
			</div>
			<div class="modal-footer">
				<a role="button" href="${flowExecutionUrl}&_eventId_pay"
					class="btn btn-primary">Đồng ý</a>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="uploadFileError" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>Có lỗi xảy ra !</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="notok" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>Số tiền trong ví không đủ !</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
			</div>
		</div>
	</div>
</div>

<script>

	$.ajax({
		url : location.protocol + '//' + location.host + "<%=request.getContextPath()%>/cart/getAmount",
		type : 'GET',
		method : 'GET',
		success : function(res) {
			$('#gentAmountUser').html(res.amount + ' &#8363;');
		},
		error : function(res) {
			
		}
	});

	function payAmount(){
		var url = location.protocol + '//' + location.host + "<%=request.getContextPath()%>/cart/payAmount";

		//sử dụng ajax post
		$.ajax({
			url : url,
			type : 'GET',
			method : 'GET',
			success : function(res) {
				if (res == "ok") {
					$("#uploadFileSuccess").modal("show");
				} else if (res == "notok") {
					$("#notok").modal("show");
				}
			},
			error : function(res) {
				$("#uploadFileError").modal("show");
			}
		});
	}
	
	function payOnline() {
		var url = location.protocol + '//' + location.host + "<%=request.getContextPath()%>/cart/payonline";

		if (document.getElementById("filepayOnline").files.length == 0) {
			$("#exampleModal").modal("show");
		} else {

			var form = $('#fileUploadForm')[0];

			var data = new FormData(form);

			//sử dụng ajax post
			$.ajax({
				url : url,
				enctype : 'multipart/form-data',
				cache : false,
				contentType : false,
				processData : false,
				data : data,
				type : 'POST',
				method : 'POST',
				success : function(res) {
					if (res == "ok") {
						$("#uploadFileSuccess").modal("show");
					} else {
						$("#uploadFileError").modal("show");
					}
				},
				error : function(res) {
					$("#uploadFileError").modal("show");
				}
			});
		}
	}
</script>

