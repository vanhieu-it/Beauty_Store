<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="php"%>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Admin Page</title>
<!-- plugins:css -->
<link rel="stylesheet" href="Admin/template/vendors/feather/feather.css"
	type="text/css" media="screen">
<link rel="stylesheet"
	href="../Admin/template/vendors/mdi/css/materialdesignicons.min.css"
	type="text/css" media="screen">
<link rel="stylesheet"
	href="../Admin/template/vendors/ti-icons/css/themify-icons.css"
	type="text/css" media="screen">
<link rel="stylesheet"
	href="../Admin/template/vendors/typicons/typicons.css" type="text/css"
	media="screen">
<link rel="stylesheet"
	href="../Admin/template/vendors/simple-line-icons/css/simple-line-icons.css"
	type="text/css" media="screen">
<link rel="stylesheet"
	href="../Admin/template/vendors/css/vendor.bundle.base.css"
	type="text/css" media="screen">
<link rel="stylesheet"
	href="../Admin/template/vendors/datatables.net-bs4/dataTables.bootstrap4.css"
	type="text/css" media="screen">
<link rel="stylesheet"
	href="../Admin/template/js/select.dataTables.min.css" type="text/css"
	media="screen">
<link rel="stylesheet"
	href="../Admin/template/css/vertical-layout-light/style.css"
	type="text/css" media="screen">
<link rel="stylesheet" href="../Admin/template/css/main.css"
	type="text/css" media="screen">
<link rel="shortcut icon" href="Admin/template/images/favicon.png" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<div class="container-scroller">
		<nav
			class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row">
			<%@include file="../component/logoInfo.jsp"%>
			<%@include file="../component/navbarMenu.jsp"%>
		</nav>
		<div class="container-fluid page-body-wrapper">
			<%@include file='../component/themeSetting.jsp'%>
			<%@include file="../component/leftbar.jsp"%>
			<div class="main-panel">
				<div class="content-wrapper"
					style="padding: 20px; margin: 10px; width: 100%">
					<h1 class="text-center">Danh sách phiếu giảm giá</h1>
					<table
						class="table table-striped table-hover table-bordered text-center">
						<tr>
							<th>Mã phiếu</th>
							<th>Code</th>
							<th>Sự kiện</th>
							<th>Giá trị giảm</th>
							<th>Số lượng còn lại</th>
							<th>Xóa Phiếu</th>
						</tr>
						<php:forEach items="${coupons }" var="coupon">
							<tr>
								<td>${coupon.getId() }</td>
								<td>${coupon.getCode() }</td>
								<td><php:forEach items="${events }" var="event">
										<php:if test="${event.getId() == coupon.getEvent() }">
											<p>${event.getName() }</p>
										</php:if>
									</php:forEach></td>
								<td>${coupon.getDiscount() }</td>
								<td>${coupon.getRemain() }</td>
								<th><a class="btn btn-danger"
									href="couponDelete?id=${coupon.getId()}">Xóa Phiếu </a></th>
							</tr>

						</php:forEach>

					</table>

					<form action="couponAdd" method="post" style="margin-top: 50px; padding-right: 20px"
						class="d-flex align-items-center text-center">
						<div class="d-flex col-md-3">
							<p class="col-md-6 m-0" style="line-height: 32px; font-size: 16px">Tên phiếu</p>
							<div class="col-md-6">
								<input type="text" class="form-control" name="coupon"
									placeholder="Tên phiếu">
							</div>

						</div>
						<div class="d-flex col-md-2">
							<p class="col-md-6 m-0" style="line-height: 32px; font-size: 16px">Chọn sự kiện</p>
							<div class="col-md-6">

								<select name="event" class="col-md-9 mx-1 form-control p-0" >
									<php:forEach items="${events }" var="event">

										<option value="${event.getId() }">${event.getName() }</option>

									</php:forEach>
								</select>
							</div>
						</div>
						<div class="d-flex col-md-3">
							<p class="col-md-6 m-0" style="line-height: 32px; font-size: 16px">Giảm giá</p>
							<div class="col-md-6">
								<input type="text" class="form-control" name="discount"
									placeholder="Giảm giá">
							</div>
						</div>
						<div class="d-flex col-md-3">
							<p class="col-md-6 m-0" style="line-height: 32px; font-size: 16px">Số lượng</p>
							<div class="col-md-6">
								<input type="text" class="form-control" name="number"
									placeholder="Nhập số lượng">
							</div>
						</div>
						<div class="d-flex col-md-2 text-center ms-4	">
							<input type="submit" value="Thêm" class="btn btn-success col-md-4" >
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="../Admin/template/vendors/js/vendor.bundle.base.js"></script>
	<script src="../Admin/template/vendors/chart.js/Chart.min.js"></script>
	<script
		src="../Admin/template/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
	<script
		src="../Admin/template/vendors/progressbar.js/progressbar.min.js"></script>

	<script src="../Admin/template/js/off-canvas.js"></script>
	<script src="../Admin/template/js/hoverable-collapse.js"></script>
	<script src="../Admin/template/js/template.js"></script>
	<script src="../Admin/template/js/settings.js"></script>
	<script src="../Admin/template/js/todolist.js"></script>
	<script src="../Admin/template/js/dashboard.js"></script>
	<script src="../Admin/template/js/Chart.roundedBarCharts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>


