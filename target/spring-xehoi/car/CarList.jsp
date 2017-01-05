<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Car List</title>
<meta charset="utf-8">
<!-- Mobile first-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--CSS-->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!--jQuery-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<!-- JS -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style type="text/css">
.modal-header, h4, .close {
	background-color: #5cb85c;
	color: white !important;
	text-align: center;
	font-size: 30px;
}

body {
	padding-top: 50px;
}

.navbar-sharpen {
	border-radius: 0 !important;
}

.nav-tabs {
	background-color: #000000;
	color: #000000;
}

/* .modal-fullscreen */
.modal-fullscreen {
	background: transparent;
}

.modal-fullscreen .modal-content {
	background: transparent;
	border: 0;
	-webkit-box-shadow: none;
	box-shadow: none;
}

.modal-backdrop.modal-backdrop-fullscreen {
	background: #ffffff;
}

.modal-backdrop.modal-backdrop-fullscreen.in {
	opacity: .97;
	filter: alpha(opacity = 97);
}

/* .modal-fullscreen size: we use Bootstrap media query breakpoints */
.modal-fullscreen .modal-dialog {
	margin: 0;
	margin-right: auto;
	margin-left: auto;
	width: 100%;
}

@media ( min-width : 768px) {
	.modal-fullscreen .modal-dialog {
		width: 750px;
	}
}

@media ( min-width : 992px) {
	.modal-fullscreen .modal-dialog {
		width: 970px;
	}
}

@media ( min-width : 1200px) {
	.modal-fullscreen .modal-dialog {
		width: 1170px;
	}
}
</style>

<!-- SCRIPT for FULL screen Modal -->
<script type="text/javascript">
	// .modal-backdrop classes
	$(document).ready(function() {
		$(".modal-transparent").on('show.bs.modal', function() {
			setTimeout(function() {
				$(".modal-backdrop").addClass("modal-backdrop-transparent");
			}, 0);
		});
		$(".modal-transparent").on('hidden.bs.modal', function() {
			$(".modal-backdrop").addClass("modal-backdrop-transparent");
		});

		$(".modal-fullscreen").on('show.bs.modal', function() {
			setTimeout(function() {
				$(".modal-backdrop").addClass("modal-backdrop-fullscreen");
			}, 0);
		});
		$(".modal-fullscreen").on('hidden.bs.modal', function() {
			$(".modal-backdrop").addClass("modal-backdrop-fullscreen");
		});
	});
</script>
<!-- SCRIPT for FULL screen Modal END -->
<!-- SCRIPT For tabs -->
<script type="text/javascript">
	$(document).ready(function() {
		$("#sedanTab").click(function() {
			$("#sedanTab").attr({
				"data-toggle" : "tab",
			});
		});
		$("#suvTab").click(function() {
			$("#suvTab").attr({
				"data-toggle" : "tab"
			});
		});
		$("#convertibleTab").click(function() {
			$("#convertibleTab").attr({
				"data-toggle" : "tab"
			});
		});
		$("#truckTab").click(function() {
			$("#truckTab").attr({
				"data-toggle" : "tab"
			});
		});
	});
</script>
<!--  Sript for tab ends -->

<!-- script for Category tab -->
<script type="text/javascript">
	$(document).ready(function() {
		$("#sedanTab").click(function() {
			$("#sedanModal").modal('show');
		});
		$("#suvTab").click(function() {
			$("#suvModal").modal('show');
		});
		$("#convertibleTab").click(function() {
			$("#convertibleModal").modal('show');
		});
		$("#truckTab").click(function() {
			$("#truckModal").modal('show');
		});
	});
</script>
<!-- script for Category tab END -->

</head>
<body>
	<!-- NAV BAr -->
	<nav id="navbarFixedTop"
		class="navbar navbar-inverse navbar-fixed-top navbar-sharpen">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar"></button>
				<a class="navbar-brand" href="../../home">Top Car</a>
			</div>

			<div id="navBarLeftPart">
				<ul class="nav navbar-nav navbar-left" id="navBarLeft">
					<li class="active"><a href="list">Buy</a></li>
					<li><a href="form">Sell</a></li>
					<li><a href="#about">Reviews</a></li>
					<li><a href="#about">News</a></li>
				</ul>
			</div>

			<div id="navBarCentertPart">
				<ul class="nav navbar-nav navbar-center" id="navBarCenter">
					<li id="searchButton"><a href="#findModal"
						data-target="#findModal" data-toggle="modal"> <span
							class="glyphicon glyphicon-search"></span>
					</a></li>
				</ul>
			</div>

			<div id="navBarRightPart">
				<ul class="nav navbar-nav navbar-right" id="navBarRight">
					<li><a href="#about">Sign In</a></li>
					<li><a href="#services">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- NAV BAR ENd -->


	<!-- FIND MODAL -->
	<div id="findModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4>
						<span class="glyphicon glyphicon-search" id="searchIcon"></span>
					</h4>
				</div>
				<div class="modal-body">
					<form role="form" method="get">
						<div class="form-group">
							<label for="queryForName"> Name: </label> <input type="text"
								class="form-control" id="queryForName" name="queryForName"
								placeholder="Find By Name">
						</div>
						<div class="form-group">
							<label for="queryForManu"> Manufacturer:</label> <input
								type="text" class="form-control" id="queryForManu"
								name="queryForManu" placeholder="Find By Manufacturer">
						</div>
						<div class="form-group">
							<label for="queryForYear"> Year: </label> <input type="number"
								class="form-control" id="queryForYear" name="queryForYear"
								placeholder="Find By Produced Year">
						</div>
						<div class="form-group">
							<label for="queryForStatus"> Status </label> <input type="text"
								class="form-control" id="queryForStatus" name="queryForStatus"
								placeholder="Find By Status">
						</div>
						<input type="submit" value="Find"
							class="btn btn-default btn-success btn-lg btn-block">
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- FIND MODAL END -->

	<!-- Categorized tab -->
	<div>
		<ul class="nav nav-tabs nav-justified" id="tabs">
			<li id="sedanTab" style="tab-color: #000000;"><a href="#">Sedan</a></li>
			<li id="suvTab"><a href="#">SUV</a></li>
			<li id="convertibleTab"><a href="#">Convertible</a></li>
			<li id="truckTab"><a href="#">Truck</a></li>
		</ul>
	</div>
	<!-- Cat tab END -->

	<!-- Sedan Modal -->
	<div id="sedanModal" class="modal modal-fullscreen fade" role="dialog"
		tabindex="-1" aria-labelledby="sedanModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding: 40px 50px;">
					<button type="button" class="close pull-right" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" id="sedanModalLabel">Sedan</h4>
				</div>
				<div class="modal-body">
				<c:forEach items="${specification}" var="spec">
						<c:choose>
							<c:when test="${spec.type == 'Sedan'}">
								<div class="col-md-6">
									<a href="view/${spec.carId}"><img alt="${spec.carId}"
										src="img/${spec.carId}" class="img-responsive" width="480"
										height="270"></a>
								</div>
							</c:when>
						</c:choose>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- Sedan Modal End -->

	<!-- SUV Modal -->
	<div id="suvModal" class="modal modal-fullscreen fade " role="dialog"
		tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding: 40px 50px;">
					<button type="button" class="close pull-right" data-dismiss="modal">&times;</button>
					<h4>SUV</h4>
				</div>
				<div class="modal-body">
				<c:forEach items="${specification}" var="spec">
						<c:choose>
							<c:when test="${spec.type == 'SUV'}">
								<div class="col-md-6">
									<a href="view/${spec.carId}"><img alt="${spec.carId}"
										src="img/${spec.carId}" class="img-responsive" width="480"
										height="270"></a>
								</div>
							</c:when>
						</c:choose>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- SUVModal End -->

	<!-- Convertible Modal -->
	<div id="convertibleModal" class="modal modal-fullscreen fade "
		role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding: 40px 50px;">
					<button type="button" class="close pull-right" data-dismiss="modal">&times;</button>
					<h4>Convertible</h4>
				</div>
				<div class="modal-body">
				<c:forEach items="${specification}" var="spec">
						<c:choose>
							<c:when test="${spec.type == 'Convertible'}">
								<div class="col-md-6">
									<a href="view/${spec.carId}"><img alt="${spec.carId}"
										src="img/${spec.carId}" class="img-responsive" width="480"
										height="270"></a>
								</div>
							</c:when>
						</c:choose>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- Convertible Modal End -->

	<!-- Truck Modal -->
	<div id="truckModal" class="modal modal-fullscreen fade " role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding: 40px 50px;">
					<button type="button" class="close pull-right" data-dismiss="modal">&times;</button>
					<h4>Truck</h4>
				</div>
				<div class="modal-body">
					<c:forEach items="${specification}" var="spec">
						<c:choose>
							<c:when test="${spec.type == 'Truck'}">
								<div class="col-md-6">
									<a href="view/${spec.carId}"><img alt="${spec.carId}"
										src="img/${spec.carId}" class="img-responsive" width="480"
										height="270"></a>
								</div>
							</c:when>
						</c:choose>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- Truck End -->

	<c:forEach items="${cars}" var="car">


		<div class="col-md-6">
			<a href="view/${car.id}"><img alt="${car.name}"
				src="img/${car.id}" class="img-responsive" width="480" height="270"></a>
		</div>
		<!-- div class="col-md-4">
						<p>
							<a href="view/${car.id}">${car.name}</a>
						</p>
						<p>${car.year}</p>
					</div>


					<div class="col-sm-4">
						<c:choose>
							<c:when test="${car.status==true}">
								<p>Status: New</p>
							</c:when>
							<c:otherwise>
								<p>Status: Old</p>
							</c:otherwise>
						</c:choose>
						<p>Price: ${car.price}</p>
					</div>
				</div-->


	</c:forEach>



	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr class="danger">
					<td>ID</td>
					<td>NAME</td>
					<td>Manufacturer</td>
					<td>Year</td>
					<td>Seller</td>
					<td>Status</td>
					<td>Price x1000</td>
					<td>Edit</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cars}" var="car">

					<tr>
						<td>${car.id}</td>
						<td><a href="view/${car.id}">${car.name}</a></td>
						<c:forEach items="${manufacturers}" var="manufacturer">
							<c:choose>
								<c:when test="${car.manufacturerId==manufacturer.id}">
									<td>${manufacturer.name}</td>
								</c:when>
							</c:choose>

						</c:forEach>
						<td>${car.year}</td>
						<c:forEach items="${sellers}" var="seller">
							<c:choose>
								<c:when test="${car.sellerId==seller.id}">
									<td>${seller.name}</td>
								</c:when>
							</c:choose>
						</c:forEach>

						<c:choose>
							<c:when test="${car.status==true }">
								<td>New</td>
							</c:when>
							<c:otherwise>
								<td>Used</td>
							</c:otherwise>
						</c:choose>

						<td>${car.price}</td>
						<td><a href="edit/${car.id}"><input type="button"
								value="Edit"></a></td>
					</tr>

				</c:forEach>
			</tbody>
		</table>

	</div>

</body>
</html>