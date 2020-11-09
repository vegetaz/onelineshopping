<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>MNM - ${title}</title>

<!-- Bootstrap Core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Readable Theme -->
<link href="${css}/bootstrap-readable-theme.css" rel="stylesheet">


<!-- Custom CSS -->
<link href="${css}/myapp.css" rel="stylesheet">

<script>
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}'
</script>
</head>

<body>

	<div class="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<a class="navbar-brand" href="${contextRoot}/home">MNM</a>
				</div>
			</div>
		</nav>

		<!-- Page Content -->

		<div class="content">

			<div class="container">

				<div class="row">

					<div class="col-md-offset-3 col-md-6">

						<div class="panel panel-primary">

							<div class="panel-heading">
								<h4>Nạp tiền</h4>
							</div>

							<div class="panel-body">
								<form action="${contextRoot}/user-amount" method="POST" class="form-horizontal" id="amountForm_">
									
									<div class="form-group">
										<label for="username" class="col-md-4 control-label">Số dư trong ví: </label>
										<div class="col-md-8">
											<label id="gentAmountUser" style="text-align: left; text-transform: none; float: left;color: red;"></label>
										</div>
									</div>
									
									<div class="form-group">
										<label for="username" class="col-md-4 control-label">Biên
											lai nạp tiền: </label>
										<div class="col-md-8">
											<input type="file" name="fileAmount" id="fileAmount" class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="password" class="col-md-4 control-label">số
											tiền nạp: </label>
										<div class="col-md-8">
											<input type="number" name="amount" id="amount" required
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-offset-4 col-md-8">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
											<a onclick="amountForm();" class="btn btn-primary">Chuyển</a>
										</div>
									</div>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer comes here -->
		<%@include file="./shared/footer.jsp"%>

		<!-- jQuery -->
		<script src="${js}/jquery.js"></script>

		<script src="${js}/jquery.validate.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="${js}/bootstrap.min.js"></script>

		<!-- Self coded javascript -->
		<script src="${js}/myapp.js"></script>

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
<div class="modal fade" id="success" tabindex="-1" role="dialog"
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
				<p>Chuyển tiền thành công !</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="home_()">Về trang chủ</button>
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
	function home_() {
		window.location.href = location.protocol + '//' + location.host + '<%=request.getContextPath()%>/';
	}
	function amountForm() {
		var url = location.protocol + '//' + location.host + "<%=request.getContextPath()%>/user-amount";
	
		if (document.getElementById("fileAmount").files.length == 0) {
			$("#exampleModal").modal("show");
		} else {
	
			var form = $('#amountForm_')[0];
	
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
						$("#success").modal("show");
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

</body>
</html>

