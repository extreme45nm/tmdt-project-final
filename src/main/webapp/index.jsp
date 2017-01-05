<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Top Car</title>
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
<link href='https://fonts.googleapis.com/css?family=Roboto:500'
	rel='stylesheet' type='text/css'>
<style>
.modal-header, h4, .close {
	background-color: #5cb85c;
	color: white !important;
	text-align: center;
	font-size: 30px;
}

.modal-footer {
	background-color: #f9f9f9;
}

.bg-grey {
	background-color: #f6f6f6;
}

.bg-white {
	background-color: #ffffff;
}

.header-2 {
	font-family: sans-serif;
	font-weight: bold;
	font-size: 45px;
	color: #696969;
}

.header-2-slogan {
	font-family: sans-serif;
	font-weight: lighter;
}

.navbar {
	font-size: 15px !important;
	font-family: Montserrat, sans-serif;
	font-color: #ffffff;
	letter-spacing: 2px;
	opacity: 0.94;
}

.navbar-fixed-top {
	height: 60px;
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
	padding-top: 21px;
}

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

#googleMap {
	z-index: -1;
}

#search {
	position: absolute;
	top: 50px;
	left: 0px;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	-webkit-transition: all 0.5s ease-in-out;
	-moz-transition: all 0.5s ease-in-out;
	-o-transition: all 0.5s ease-in-out;
	-ms-transition: all 0.5s ease-in-out;
	transition: all 0.5s ease-in-out;
	-webkit-transform: translate(0px, -100%) scale(0, 0);
	-moz-transform: translate(0px, -100%) scale(0, 0);
	-o-transform: translate(0px, -100%) scale(0, 0);
	-ms-transform: translate(0px, -100%) scale(0, 0);
	transform: translate(0px, -100%) scale(0, 0);
	opacity: 0;
	z-index: 0;
}

#search.open {
	-webkit-transform: translate(0px, 0px) scale(1, 1);
	-moz-transform: translate(0px, 0px) scale(1, 1);
	-o-transform: translate(0px, 0px) scale(1, 1);
	-ms-transform: translate(0px, 0px) scale(1, 1);
	transform: translate(0px, 0px) scale(1, 1);
	opacity: 1;
}

#search input[type="search"] {
	position: relative;
	top: 50%;
	width: 100%;
	color: rgb(255, 255, 255);
	background: rgba(0, 0, 0, 0);
	font-size: 50px;
	font-weight: 300;
	text-align: center;
	border: 0px;
	margin-top: 260px;
	padding-left: 50px;
	outline: none;
}

#search .btn {
	position: absolute;
}

#search .close {
	position: absolute;
	top: 15px;
	right: 15px;
	color: #fff;
	border-color: #357ebd;
	opacity: 1;
	padding: 10px 17px;
	font-size: 27px;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	height: 60%;
	margin: auto;
}

.carousel-caption h3 {
	color: #fff !important;
}
.carousel-inner{
	opacity:0.65;
}

h3{
	text-align: left;
	font-size: 40px;
	font-weight: bold;
}

h5{
	text-align: left;
	font-size: 30px;
}
</style>

<script type="text/javascript">
	$(document).ready(
			function() {

				$("#signUpLink").click(function() {
					$("#loginModal").modal('hide');
				});
				$("#signUpCancelButton").click(function() {
					$("#signupModal").modal('hide');
				});

				$('a[href="#search"]').on('click', function(event) {
					event.preventDefault();
					$('#search').addClass('open');
					$('#search > form > input[type="search"]').focus();
				});
				$('#search, #search button.close').on(
						'click keyup',
						function(event) {
							if (event.target == this
									|| event.target.className == 'close'
									|| event.keyCode == 27) {
								$(this).removeClass('open');
							}
						});
			});
</script>
</head>

<body data-spy="scroll" data-target="navbar-fixed-top">

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

	<!-- Carousel -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		
				<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<a href="car/view/1"> <img src="car/img/1.jpg" alt="1"
					class="img-responsive"></a>
				<div class="carousel-caption">
					<h3>Nissan NP300</h3>
					<h5>450 Tr</h5>
				</div>

			</div>

			<div class="item">
				<a href="car/view/2"> <img src="car/img/2.jpg" alt="2"
					class="img-responsive">
				</a>
				<div class="carousel-caption">
					<h3>Ford Super Duty</h3>
					<h5>3.2 T</h5>
				</div>
			</div>

			<div class="item">
				<a href="car/view/3"> <img src="car/img/3.jpg" alt="3"
					class="img-responsive">
				</a>
				<div class="carousel-caption">
					<h3>Chervolet TraiBlazer</h3>
					<h5>2.5 T</h5>
				</div>
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- Carousel END-->

	<!-- Fullscreen search -->
	<div id="search" align="center">
		<button type="submit" class="close">&times;</button>
		<form>
			<input type="search" value="" placeholder="type keyword(s) here" />
			<button type="submit" class="btn btn-success btn-lg">
				<span class="glyphicon glyphicon-search"></span>
			</button>
		</form>
	</div>
	<!-- Fullscreen search END -->


	<!-- SIGN IN MODAL -->
	<div id="loginModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header" style="padding: 30px 30px;">
					<button type="submit" class="close" data-dismiss="modal">&times;</button>
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
						<p class="pull-right"><a href="#forgotPassword"> Forgot?</a></p>
						<div class="checkbox">
							<label><input type="checkbox" value="" checked>Remember
								me</label>
						</div>
						<button type="submit"
							class="btn btn-default btn-success btn-block">Login</button>
					</form>
				</div>

				<div class="modal-footer">

					<p align="center">
						Not a member? <a href="seller/form" data-target="seller/form"
							data-toggle="modal" id="signUpLink">Sign Up</a>
					</p>
					
				</div>
			</div>

		</div>
	</div>

	<!--SIGN IN MODAL END -->

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
						<input type="checkbox" value=""> I agree to terms and
						conditions
					</p>
					<button type="submit" class="btn btn-success btn-block">Sign
						Up</button>
				</div>
				<div class="modal-footer">
					<p class="pull-left" align="justify">EDX Group</p>
					<button type="submit" class="btn btn-danger btn-default pull-left"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> Cancel
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- SIGN UP MODAL END -->

	<!-- contactModal -->
	<div id="contactModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding: 40px 50px;">
					<h4>Contact Us</h4>
				</div>
				<div class="modal-body" style="padding: 50px 60px;">
					<div class="content" align="center">
						<p>
							<span class="glyphicon glyphicon-map-marker"></span> Location:
							Pham Van Dong Str.
						</p>
						<p>
							<span class="glyphicon glyphicon-phone"></span> Hotline:
							+123456789
						</p>
						<p>
							<span class="glyphicon glyphicon-envelope"></span> E-mail:
							123@abc.com
						</p>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success btn-block"
						data-dismiss="modal">Go Back</button>
				</div>
			</div>
		</div>
	</div>
	<!-- contactModal END -->



	<!-- Add Google Maps -->
	<!-- div id="googleMap" style="height: 400px; width: 100%;"></div-->

</body>
</html>
