<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Specification</title>
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

.modal-footer {
	background-color: #f9f9f9;
}

.form-group {
	margin-bottom: 20px;
}

input {
	margin-bottom: 15px;
}

label, input {
	display: block;
}

.navbar {
	font-size: 18px !important;
	font-family: Montserrat, sans-serif;
	font-color: #ffffff;
	letter-spacing: 2px;
	opacity: 0.94;
}

.navbar-inverse {
	border-radius: 0 !important;
}

.navbar-nav li:hover {
	background-color: #009900 !important;
}

.navbar-nav li:click {
	background-color: #009900 !important;
}

.navbar-nav li a .active {
	background-color: #009900 !important;
}

.navbar li a, .navbar a {
	color: #ffffff !important;
	font-weight: 25px;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$("#specModal").modal('show');
		$("#cancelButton").click(function() {
			window.location.href = "delete/${carId}";
		});
	});
</script>

</head>

<body>

	<!-- NAVBAR -->
	<nav class="navbar navbar-inverse navbar-fixed-top" data-spy="affix"
		data-offset-top="197" style="margin: auto;">
		<div class="container">
			<div class="navbar-header">
				<div class="container-fluid">
					<a class="navbar-brand" href="home" style="font-size: 39px;">Top
						Car</a>
				</div>
			</div>
			<div id="navBarLeftPart">
				<ul class="nav navbar-nav navbar-left"
					style="display: inline-block;">
					<li class="navbar-link"><a href="car/list">Buy</a></li>
					<li class="navbar-link"><a href="car/form">Sell</a></li>
					<li class="navbar-link"><a href="">Reviews</a></li>
					<li class="navbar-link"><a href="">News</a></li>
					<li class="navbar-link" id="searchIcon"><a href="#search"><span
							class="glyphicon glyphicon-search"></span></a></li>
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
	<!-- NAVBAR-END -->

	<!-- Control flow -->
	<c:choose>
		<c:when test="${carId==null}">
			<c:set var="action" value="../home"></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="action" value="add-specification"></c:set>
		</c:otherwise>
	</c:choose>
	<!-- Control flow end -->

	<!-- Specification Modal -->
	<div class="modal fade" id="specModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding: 50px 50px;">
					<button id="cancelButton" type="submit" class="close"
						data-dismiss="modal">&times;</button>
					<h4 style="color: red;">Car For Sale</h4>
					<h4>Add More Specifications</h4>
				</div>
				<div class="modal-body" align="center">
					<form:form class="form-inline" method="POST" action="${action}"
						text-align="center" id="command">

						<form:input type="hidden" value="${carId}" name="id" path="carId" />
						<div class="form-group">
							<label for="#type" class="pull-left">Type:</label><br>
							<form:input type="text" path="type" class="form-control"
								size="62" placeholder="Type of Your Car" id="type" />
						</div>

						<div class="form-group">
							<label for="#seat" class="pull-left">Seats:</label><br>
							<form:input type="number" step="1" path="seat"
								class="form-control" size="62" placeholder="Number of seats " />
						</div>

						<div class="form-group">
							<label for="#engine" class="pull-left">Engine:</label><br>
							<form:input type="number" step="any" path="engine"
								class="form-control" size="62" placeholder="Engine...." />
						</div>

						<div class="form-group">
							<label for="#type" class="pull-left">Torque:</label><br>
							<form:input type="number" step="any" path="torque"
								class="form-control" size="62" placeholder="Type of Your Car" />
						</div>
						<br>
						<div class="form-group">
							<input type="submit" value="Next"
								class="btn btn-success btn-block">
						</div>
					</form:form>
				</div>
				<div class="modal-footer">
					<div class="pull-left">
						<h6>Step: 3/5</h6>
					</div>
					<button id="cancelButton" type="submit"
						class="btn btn-danger btn-default " data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> Cancel
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- SPEC Modal end -->


</body>

</html>