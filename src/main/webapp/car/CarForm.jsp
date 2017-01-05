<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Add New Car</title>
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
		$("#carFormModal").modal('show');
		$("#closeButton").click(function() {
			window.location = "../../home";
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
					<a class="navbar-brand" href="../home"
						style="font-size: 39px;">Top Car</a>
				</div>
			</div>
			<div id="navBarLeftPart">
				<ul class="nav navbar-nav navbar-left"
					style="display: inline-block;">
					<li class="navbar-link"><a href="list">Buy</a></li>
					<li class="navbar-link active"><a href="car/form">Sell</a></li>
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

	<!-- Control flow -->
	<c:choose>
		<c:when test="${id==null}">
			<c:set var="action" value="add"></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="action" value="../add"></c:set>
		</c:otherwise>
	</c:choose>
	<!-- Control flow end -->

	<!-- Car form MODAL -->
	<div id="carFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content" align="center">
				<div class="modal-header" style="padding: 30px 40px;">
					<button id="closeButton" class="close"
						data-dismiss="modal" >&times;</button>
					<h4 style="color: red;">Car For Sale</h4>

				</div>

				<div class="modal-body" align="center">
					<form:form class="form-inline" method="POST" id="command"
						action="${action}" text-align="center">
						<div class="form-group">
							<label for="#id" class="pull-left"><span
								class="glyphicon glyphicon-asterisk"></span> Car ID</label><br>
							<form:input path="id" class="form-control" size="62"
								placeholder="ID of Your Car" id="id" name="id" />

						</div>

						<div class="form-group">
							<label for="#name" class="pull-left"><span
								class="glyphicon glyphicon-asterisk"></span> Car Name </label><br>
							<form:input path="name" class="form-control" size="62"
								placeholder="Name of Your Car" name="name" />
							<form:errors path="name" />
						</div>


						<div class="form-group">
							<label for="#manufacturerID" class="pull-left"><span
								class="glyphicon glyphicon-home"></span> Manufacturer ID</label><br>
							<form:input path="manufacturerId" class="form-control" size="62"
								placeholder="Manufacturer ID" />
							<form:errors path="manufacturerId" />
						</div>

						<div class="form-group">
							<label for="#producedYear" class="pull-left"><span
								class="glyphicon glyphicon-flag"></span> Produced Year</label><br>
							<form:input path="year" class="form-control" size="62"
								placeholder="Produced year" />
							<form:errors path="year" />
						</div>

						<div class="form-group">
							<label for="#sellerId" class="pull-left"><span
								class="glyphicon glyphicon-user"></span> Your ID</label><br>
							<form:input path="sellerId" class="form-control" size="62"
								placeholder="Your ID" />
							<form:errors path="sellerId" />
						</div>

						<div class="form-group">
							<label for="#id" class="pull-left"><span
								class="glyphicon glyphicon-dashboard"></span> Car Status:</label><br>
							<form:input path="status" class="form-control" size="62"
								placeholder="New or Old?" />
						</div>

						<div class="form-group">
							<label for="#id" class="pull-left"><span
								class="glyphicon glyphicon-usd"></span> Price x1000</label><br>
							<form:input path="price" class="form-control" size="62"
								placeholder="Price x1000" type="number" step="1000" />
						</div>
						<br>

						<div class="form-group">
							<input type="submit" value="Next (1/5)"
								class="btn btn-success btn-block ">
						</div>

					</form:form>
					
				</div>
			</div>
		</div>
	</div>
	<!-- Car form modal END -->

	<!-- div class="jumbotron text-center">
		<h2 class="text-info">Tell us about your car</h2>
	</div>
	<c:choose>
		<c:when test="${id==null}">
			<c:set var="action" value="add"></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="action" value="../add"></c:set>
		</c:otherwise>
	</c:choose>

	

	<form class="form-inline" enctype="multipart-file" method="POST">
		<div class="container">
			<div class="row">
				<div class="col-md-12" align="center">
					<input type="file" id="files" name="file"> <img id="image"
						class="image-responsive" style="max-width: 62%;" />
				</div>
			</div>
		</div>
	</form -->


	<!-- script type="text/javascript">
	$(document).ready(function(){
		$("#uploadButton").hide();
		document.getElementById("files").onchange = function() {
			var reader = new FileReader();

			reader.onload = function(e) {
				document.getElementById("image").src = e.target.result;
			};

			reader.readAsDataURL(this.files[0]);
		}
		$("#submitButton").click(function(){
			$("#uploadButton").click();
		});
	});	
	
	</script>

	<!-- UPLOAD IMG at first time -->

	<!--  -->

	<!-- UPLOAD IMG while EDITING RECORD -->
	<!-- div class="jumbotron text-center">
		<h2 class="text-info">Please upload an image of your car</h2>
		<br>
		<div class="row">
			<div class="col-md-12" align="center">
				<form id="form1" method="post" action="img/save" enctype="multipart/form-data">
					<input type="hidden" name="hiddenId" value="${id}" id="hiddenId" /> 
					<input type="file" id="files" name="file"> 
					<img id="image"	class="image-responsive" style="max-width: 62%;" /> 
					<br> 
					<input	type="submit" value="Upload" />
				</form>
			</div>
		</div>
	</div-->

	<!-- script type="text/javascript">
		$("#idInput").change(function(){
			alert($("#id").val());
			$("#h").attr("value",$("#idInput").val());
		});
	</script -->


	<!-- -->
	<!-- form role="form" method="post" action="../avatar/save/{id}"
		enctype="multipart/form-data">
		
		<div class="form-group" align="center">
			<input type="hidden" name="id" value="${id}" />
		</div>
		<div class="form-group" align="center">
			<input id="chooseFile" type="file" name="file" type="hidden"
				class="btn btn-info" />
		</div>
		
	</form-->
</body>

</html>