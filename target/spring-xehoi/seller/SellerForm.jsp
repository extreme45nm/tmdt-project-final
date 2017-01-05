<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Sign Up</title>
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
<style>
.modal-header, h4, .close {
	background-color: #5cb85c;
	color: white !important;
	text-align: center;
	font-size: 30px;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$("#signupModal").modal('show');
	});
</script>

</head>



<body>

	<nav class="navbar navbar-inverse ">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar"></button>
				<a class="navbar-brand" href="../../home">Top Car</a>
			</div>

			<div id="navBarLeftPart">
				<ul class="nav navbar-nav navbar-left">
					<li><a href="../car/list">Buy</a></li>
					<li><a href="../car/form">Sell</a></li>
					<li><a href="#about">Reviews</a></li>
					<li><a href="#about">News</a></li>
				</ul>
			</div>

			<div id="navBarCentertPart">
				<ul class="nav navbar-nav navbar-center">
					<li><a href="#about"><span
							class="glyphicon glyphicon-search"></span></a></li>
				</ul>
			</div>

			<div id="navBarRightPart">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#loginModal" data-target="#loginModal" 
						data-toggle="modal">Sign In</a></li>
					<li><a href="#services">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- SIGN UP MODAL -->
	<div class="modal fade" id="signupModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header" style="padding: 40px 50px;">
					<h4>Sign up</h4>
				</div>

				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form">
						<div class="form-group">
							<label for="signupUsername"><span
								class="glyphicon glyphicon-user"></span>User name</label> <input
								type="text" class="form-control" id="signupUsername"
								placeholder="Your user name">
						</div>
						<div class="form-group">
							<label for="signupPassword"><span
								class="glyphicon glyphicon-eye-open"></span>Password</label> <input
								type="password" class="form-control" id="signupPassword"
								placeholder="Your password">
						</div>
						<div class="form-group">
							<label for="signupEmail"><span
								class="glyphicon glyphicon-mail"></span>E-mail</label> <input
								type="email" class="form-control" id="signupEmail"
								placeholder="Your Email">
						</div>
						<div class="form-group">
							<label for="signupMobile"><span
								class="glyphicon glyphicon-user"></span>Mobile </label> <input
								type="number" class="form-control" id="signupMobile"
								placeholder="Your Mobile number">
						</div>
					</form>
					<p>
						<input type="checkbox" value=""> I agree to terms &
						conditions
					</p>
					<button type="submit" class="btn btn-success btn-block">Sign
						Up</button>
				</div>
				<div class="modal-footer">
					<p class="pull-left" align="justify">EDX Group</p>
					<button type="submit" class="btn btn-danger btn-default"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> Cancel
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- SIGN UP MODAL END -->

	<!-- SIGN IN MODAL -->
	<div id="loginModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header" style="padding: 50px 50px;">
					<h4 style="color: red;">Welcome back!</h4>
				</div>

				<div class="modal-body" style="padding: 50px 60px;">
					<form role="form">
						<div class="form-group">
							<label for="loginEmail"><span
								class="glyphicon glyphicon-user"></span> E-mail </label> <input
								type="text" class="form-control" id="loginEmail"
								placeholder="Your Email">
						</div>
						<div class="form-group">
							<label for="loginPassword"><span
								class="glyphicon glyphicon-eye-open"></span> Password </label> <input
								type="password" class="form-control" id="loginPassword"
								placeholder="Your password">
						</div>
						<div class="checkbox">
							<label><input type="checkbox" value="" checked>Remember
								me</label>
						</div>
						<button type="submit"
							class="btn btn-default btn-success btn-block">Login</button>
					</form>
				</div>

				<div class="modal-footer">
					<button type="submit" class="btn btn-danger btn-default pull-left"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> Cancel
					</button>
					<p>
						Not a member? <a href="form" data-target="#signupModal"
							data-toggle="modal"  onclick="hiding()">Sign Up</a>
					</p>
					<p>
						Forgot <a href="#forgotPasswordModal">password</a>
					</p>
				</div>
			</div>

		</div>
	</div>
	<script type="text/javascript">
		
			function hiding(){
				$("#loginModal").modal('hide');
			}
		
	</script>
	<!--SIGN IN MODAL END -->

</body>
<!-- body>
	<div class="jumbotron text-center">
		<h2 class="text-info">Come and join with us!</h2>
		<h4></h4>
	</div>
	<c:choose>
		<c:when test="${id==null}">
			<c:set var="action" value="add"></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="action" value="../add"></c:set>
		</c:otherwise>
	</c:choose>

	<form:form class="form-inline" method="POST" id="command"
		action="${action}" align="center">

		<form:input placeholder="Your ID" path="id" class="form-control" size="35"
			 require="true"  />
		<form:errors path="id" />
		<br>
		<form:input path="name" class="form-control" size="35"
			placeholder="Your Full Name" require="true"/>
		<form:errors path="name" />
		<br>
		<form:input path="age" class="form-control" size="35"
			placeholder="Your Age" require="true"/>
		<form:errors path="age" />
		<br>
		<form:input path="accountNumber" class="form-control" size="35"
			placeholder="Your account Number" require="true"/>
		<form:errors path="accountNumber"/>
		<br>
		<form:input path="number" class="form-control" size="35"
			placeholder="Your Mobile Number" require="true" />
		<form:errors path="number" />
		<br>
		<form:input path="address" class="form-control" size="35"
			placeholder="Address" />
		<br>
		
		<br>
	
		<div class="form-group" align="center">
			<input type="submit" value="Register" class="btn btn-primary">
		</div>


	</form:form>

	<c:choose>
		<c:when test="${id!=null}">
			<div class="jumbotron text-center">
				<h2 class="text-info">Please upload an image of your car</h2>
			</div>
			<form method="post" action="../img/save" enctype="multipart/form-data">
				<input type="hidden" name="id" value="${id}"/>
				<input type="file" name="file"/>
				<input type="submit" value="Upload">
			</form>
		</c:when>
	</c:choose>
	
	<! form role="form" method="post" action="../avatar/save/{id}"
		enctype="multipart/form-data">
		
		<div class="form-group" align="center">
			<input type="hidden" name="id" value="${id}" />
		</div>
		<div class="form-group" align="center">
			<input id="chooseFile" type="file" name="file" type="hidden"
				class="btn btn-info" />
		</div>
		
	</form>

		



</body -->

</html>