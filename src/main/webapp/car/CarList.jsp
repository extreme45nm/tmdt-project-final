
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

.nav-tabs-link {
	background-color: #000000 !important;
	font-family: Montserrat, sans-serif;
	font-color: #ffffff !important;
	letter-spacing: 2px;
	opacity: 0.94;
	font-weight: 15px !important;
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
		width: 950px;
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
/* FUll screen modal end*/


/* NAV BAR */
.navbar {
	font-size: 15px !important;
	font-family: Montserrat, sans-serif;
	font-color: #ffffff;
	letter-spacing: 2px;
	opacity: 0.94;
	height: 60px;
}

.navbar-inverse {
	border-radius: 0 !important;
	
}

.navbar-fixed-top{
	height: 50px;
}

.navbar-nav li:hover {
	background-color: #009900 !important;
}

.navbar-nav li:click {
	background-color: #009900 !important;
}
.navbar-nav li a:active{
	background-color: #009900 !important;
}
.navbar li a, .navbar a {
	color: #ffffff !important;
	font-weight: 25px;
}

/* Nav Bar end */

/*Nav tabs*/
#tabs li a:hover{
	background-color: #009900 !important;
	color: #ffffff !important;
	border: 0px;
	border-radius: 0 !important;
}
#tabs li,a{
	opacity: 0.9;
	color: #ffffff !important;
	
}

.anchor {
    padding-top: 73px;
    margin-top: -73px;
}
/* Nav tabs END*/
/* Pinterest Layout */
@font-face {
	font-family: 'Calluna';
	src:
		url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/callunasansregular-webfont.woff')
		format('woff');
}

body {
	font-family: Calluna, Arial, sans-serif;
	min-height: 1000px;
}

#columns {
	column-width: 320px;
	column-gap: 15px;
	width: 80%;
	max-width: auto;
	margin: 50px auto;
}

div#columns figure {
	background: #fefefe;
	border: 2px solid #fcfcfc;
	box-shadow: 0 1px 2px rgba(34, 25, 25, 0.4);
	margin: 0 2px 15px;
	padding: 35px;
	padding-bottom: 10px;
	transition: opacity .2s ease-in-out;
	display: inline-block;
	column-break-inside: avoid;
}

div#columns figure img {
	width: 0px auto;
	height: 0px auto;
	border-bottom: 1px solid #ccc;
	padding-bottom: 15px;
	margin-bottom: 5px;
	width: 400px;
	text-align: center;
}

div#columns figure figcaption {
	font-size: 3 em;
	color: #444;
	line-height: 1.5;
	font-weight: bold;
	text-align: center;
}

div#columns small {
	font-size: 1rem;
	float: right;
	text-transform: uppercase;
	color: #aaa;
}

div#columns small a {
	color: #666;
	text-decoration: none;
	transition: .4s color;
}

div#columns:hover figure:not(:hover) {
	opacity: 0.4;
}

@media screen and (max-width: 750px) {
	#columns {
		column-gap: 30px;
	}
	#columns figure {
		width: 100%;
	}
}
/*PInterest layout end*/

/* find Modal*/
input[type="radio"]{
	margin: 0px 5px 0px 20px;
}
input[type="number"]{
	width: 200px;
}
/* find Modal*/
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
		$("#otherTab").click(function(){
			$("#otherModal").modal('show');
		});
		$("#searchIcon").click(function(){
			$("#findModal").modal('show');
		});
	});
</script>
<!-- SCRIPT for FULL screen Modal END -->

<!-- script for Category tab -->
<script type="text/javascript">
	$(document).ready(function() {
		$(".form-control").change(function(){
			$("#queryForName").val();
			$("#queryForManu").val();
			$("#queryForYear").val();
			$("#queryForStatus").val();
		});
	});
</script>
<!-- script for Category tab END -->

</head>
<body>
	<!-- NAVBAR -->
	<nav class="navbar navbar-inverse navbar-fixed-top" data-spy="affix"
		data-offset-top="197" style="margin: auto;">
		<div class="container">
			<div class="navbar-header">
				<div class="container-fluid">
					<a class="navbar-brand" href="../home" style="font-size: 39px;">Top
						Car</a>
				</div>
			</div>
			<div id="navBarLeftPart">
				<ul class="nav navbar-nav navbar-left "
					style="display: inline-block;">
					<li class="navbar-link active"><a href="list">Buy</a></li>
					<li class="navbar-link"><a href="form">Sell</a></li>
					<li class="navbar-link"><a href="">Reviews</a></li>
					<li class="navbar-link"><a href="">News</a></li>
					<li class="navbar-link" id="searchIcon"><a href="#findModal"
						data-target="modal" data-toggle="modal"><span class="glyphicon glyphicon-search"></span></a></li>
				</ul>
			</div>

			<div id="navBarRightPart">
				<ul class="nav navbar-nav pull-right">
					<li><a href="#loginModal" data-target="#loginModal"
						data-toggle="modal">Sign in</a></li>
					<li><a href="#contactModal" data-target="#contactModal"
						data-toggle="modal">About</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- NAVBAR-END -->

	<!-- Categorized tab -->
	<div>
		<ul class="nav nav-tabs nav-justified " id="tabs">
			<li class="nav-tabs-link" id="sedanTab"><a href="#">Sedan</a></li>
			<li class="nav-tabs-link" id="suvTab"><a href="#">SUV</a></li>
			<li class="nav-tabs-link" id="convertibleTab"><a href="#">Convertible</a></li>
			<li class="nav-tabs-link" id="truckTab"><a href="#">Truck</a></li>
			<li class="nav-tabs-link" id="otherTab"><a href="#">Other...</a></li>
		</ul>
	</div>
	<!-- Cat tab END -->


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
								placeholder="Find By Year">
						</div>
						<div class="form-group">
							<label for="queryForStatus"> Status: </label>
							<div class="form-group" >
								<input type="radio" id="queryForStatus" name="queryForStatus"
									value="true">New <input type="radio"
									name="queryForStatus" id="queryForStatus" value="false">
								Old
							</div>
						</div>
						<input type="submit" value="Find"
							class="btn btn-default btn-success btn-lg btn-block">
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- FIND MODAL END -->

	<!-- PINs -->
	
		<div id="columns" align="center">
			<c:forEach items="${cars}" var="car">

				<figure>
					<img alt="${car.id}" src="img/${car.id}.jpg" class="img-responsive">
					<figcaption>${car.name}-${car.price}VND</figcaption>
				</figure>
			</c:forEach>
		</div>
	
	<!-- PIN END -->


	

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
					<div id="columns" align="center">
						<c:forEach items="${specification}" var="spec">
							<c:choose>
								<c:when test="${spec.type == 'Sedan'}">
										<c:forEach items="${cars}" var="car">
											<c:choose>
												<c:when test="${car.id==spec.carId}">
													<figure>
														<a href="view/${spec.carId}"> <img alt="${spec.carId}"
															src="img/${spec.carId}"></a>
														<figcaption>${car.name}- ${car.price}VND</figcaption>
													</figure>
												</c:when>
											</c:choose>
										</c:forEach>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Sedan Modal End -->

	<!-- SUV Modal -->
	<div id="suvModal" class="modal modal-fullscreen fade " role="dialog"
		tabindex="-1" aria-labelledby="suvModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding: 40px 50px;">
					<button type="button" class="close pull-right" data-dismiss="modal">&times;</button>
					<h4>SUV</h4>
				</div>
				<div class="modal-body">
					<div id="columns" align="center">
						<c:forEach items="${specification}" var="spec">
							<c:choose>
								<c:when test="${spec.type == 'SUV'}">
										<c:forEach items="${cars}" var="car">
											<c:choose>
												<c:when test="${car.id==spec.carId}">
													<figure>
														<a href="view/${spec.carId}"> <img alt="${spec.carId}"
															src="img/${spec.carId}"></a>
														<figcaption>${car.name}- ${car.price}VND</figcaption>
													</figure>
												</c:when>
											</c:choose>
										</c:forEach>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- SUVModal End -->

	<!-- Convertible Modal -->
	<div id="convertibleModal" class="modal modal-fullscreen fade " role="dialog"
		tabindex="-1" aria-labelledby="convertibleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding: 40px 50px;">
					<button type="button" class="close pull-right" data-dismiss="modal">&times;</button>
					<h4>Convertible</h4>
				</div>
				<div class="modal-body">
					<div id="columns" align="center">
						<c:forEach items="${specification}" var="spec">
							<c:choose>
								<c:when test="${spec.type == 'Convertible'}">
										<c:forEach items="${cars}" var="car">
											<c:choose>
												<c:when test="${car.id==spec.carId}">
													<figure>
														<a href="view/${spec.carId}"> <img alt="${spec.carId}"
															src="img/${spec.carId}"></a>
														<figcaption>${car.name}- ${car.price}VND</figcaption>
													</figure>
												</c:when>
											</c:choose>
										</c:forEach>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Convertible Modal End -->

	<!-- Truck Modal -->
	<div id="truckModal" class="modal modal-fullscreen fade " role="dialog"
		tabindex="-1" aria-labelledby="truckModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding: 40px 50px;">
					<button type="button" class="close pull-right" data-dismiss="modal">&times;</button>
					<h4>Truck</h4>
				</div>
				<div class="modal-body">
					<div id="columns" align="center">
						<c:forEach items="${specification}" var="spec">
							<c:choose>
								<c:when test="${spec.type == 'Truck'}">
										<c:forEach items="${cars}" var="car">
											<c:choose>
												<c:when test="${car.id==spec.carId}">
													<figure>
														<a href="view/${spec.carId}"> <img alt="${spec.carId}"
															src="img/${spec.carId}"></a>
														<figcaption>${car.name}- ${car.price}VND</figcaption>
													</figure>
												</c:when>
											</c:choose>
										</c:forEach>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Truck End -->
	
	<!-- Other Modal -->
	<div id="otherModal" class="modal modal-fullscreen fade " role="dialog"
		tabindex="-1" aria-labelledby="sedanModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding: 40px 50px;">
					<button type="button" class="close pull-right" data-dismiss="modal">&times;</button>
					<h4>Other...</h4>
				</div>
				<div class="modal-body">
					<div id="columns" align="center">
						<c:forEach items="${specification}" var="spec">
							<c:choose>
								<c:when
									test="${spec.type != 'Truck'&&spec.type != 'Sedan'&&spec.type != 'Convertible'&&spec.type != 'SUV'}">
									<figure>
										<a href="view/${spec.carId}"> <img alt="${spec.carId}"
											src="img/${spec.carId}"></a>
										<c:forEach items="${cars}" var="car">
											<c:choose>
												<c:when test="${car.id==spec.carId}">
													<figcaption>${car.name}-${car.price}VND</figcaption>
												</c:when>
											</c:choose>
										</c:forEach>
									</figure>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Other END -->
</body>
</html>