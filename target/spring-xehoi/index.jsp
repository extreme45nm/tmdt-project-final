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

.jb-center {
	
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

.navbar-inverse {
	border-radius: 0 !important;
}
</style>

<script type="text/javascript">
		$(document).ready(function() {
			$("#signUpLink").click(function() {
				$("#loginModal").modal('hide');
			});
			$("#signUpCancelButton").click(function() {
				$("#signupModal").modal)('hide');
			});
		});
</script>
</head>


<body>

	<!-- NAVBAR -->
	<nav class="navbar navbar-inverse navbar-fixed-top" data-spy="affix"
		data-offset-top="197">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="home">Top Car</a>
			</div>

			<div id="navBarLeftPart">
				<ul class="nav navbar-nav navbar-left">
					<li><a href="car/list">Buy</a></li>
					<li><a href="car/form">Sell</a></li>
					<li><a href="">Reviews</a></li>
					<li><a href="">News</a></li>
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
					<li><a href="#contactModal" data-target="#contactModal"
						data-toggle="modal">About</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- NAVBAR-END -->

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
						Not a member? <a href="seller/form" data-target="seller/form"
							data-toggle="modal" id="signUpLink">Sign Up</a>
					</p>
					<p>
						Forgot <a href="#forgotPasswordModal">password</a>
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
						<input type="checkbox" value=""> I agree to terms &
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

	<!-- CAROUSEL -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active" align="center">
				<a href="car/view/112233"><img class="responsive"
					src="car/img/112233.jpg" alt="New York" width="1400" height="900"></a>
				<div class="carousel-caption">
					<h3>Chervolet Traiblazer - Used</h3>
					<p>Limited edition</p>
				</div>
			</div>

			<div class="item">
				<a href="car/view/223344"><img class="responsive"
					src="car/img/223344.jpg" alt="Chicago" width="14200" height="900"></a>
				<div class="carousel-caption">
					<h3>BMW X5- Used</h3>
					<p>Thank you, Chicago - A night we won't forget.</p>
				</div>
			</div>

			<div class="item">
				<a href="car/view/55555"><img class="responsive"
					src="car/img/55555.jpg" alt="Los Angeles" width="1400" height="900"></a>
				<div class="carousel-caption">
					<h3>BMW X2 - NEW</h3>
					<p>Limited Edition</p>
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
	<!-- END CAROUSEL -->

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
	<!-- MAIN  -->

	<div class="row" align="center" style="">
		<div class="col-sm-4">
			<div class="panel panel-default text-center">
				<div class="panel-heading">
					<h2>Feedback</h2>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-sm-6 form-group">
							<input class="form-control" id="name" name="name"
								placeholder="Name" type="text" required>
						</div>
						<div class="col-sm-6 form-group">
							<input class="form-control" id="email" name="email"
								placeholder="Email" type="email" required>
						</div>
					</div>
					<textarea class="form-control" id="comments" name="comments"
						placeholder="Comment" rows="4"></textarea>
					<br>
				</div>
				<div class="panel-footer">
					<button class="btn btn-lg">Send</button>
				</div>

			</div>
		</div>



		<div class="col-sm-4" align="center" id="contact">
			<div class="panel panel-default text-center">
				<div class="panel-heading">
					<h2>Contact</h2>
				</div>
				<div class="panel-body">
					<br>
					<p>
						<span class="glyphicon glyphicon-map-marker"></span>Pham Van Dong
						Str.
					</p>
					<p>
						<span class="glyphicon glyphicon-phone"></span> +84 123456789
					</p>
					<p>
						<span class="glyphicon glyphicon-print"></span> +84 1223947234
					</p>
					<p>
						<span class="glyphicon glyphicon-envelope"></span> EDXedxEdxeDx
					</p>
					<br>

				</div>
				<div class="panel-footer">
					<button class="btn btn-lg">E-mail</button>
				</div>
			</div>
		</div>




		<div class="col-sm-4">
			<div class="panel panel-default text-center">
				<div class="panel-heading">
					<h2>Sign Up</h2>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-sm-12 form-group">
							<input class="form-control" id="name" name="name"
								placeholder="Name" type="text" required>
						</div>
						<div class="col-sm-12 form-group">
							<input class="form-control" id="email" name="email"
								placeholder="Email" type="email" required>
						</div>
						<div class="col-sm-12 form-group">
							<input class="form-control" id="email" name="email"
								placeholder="Mobile" type="number" required> <br>
						</div>
					</div>
				</div>
				<div class="panel-footer">
					<button class="btn btn-lg">Done</button>
				</div>
			</div>
		</div>

	</div>

	<br>


	<div id="googleMap" style="height: 400px; width: 100%;"></div>

	<!-- Add Google Maps -->
	<script src="http://maps.googleapis.com/maps/api/js"></script>
	<script>
		var myCenter = new google.maps.LatLng(21.050595, 105.783532);

		function initialize() {
			var mapProp = {
				center : myCenter,
				zoom : 12,
				scrollwheel : false,
				draggable : false,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};

			var map = new google.maps.Map(document.getElementById("googleMap"),
					mapProp);

			var marker = new google.maps.Marker({
				position : myCenter,
			});

			marker.setMap(map);
		}

		google.maps.event.addDomListener(window, 'load', initialize);
	</script>

	<footer class="container-fluid text-center">
		<a href="home" title="To Top"> <span
			class="glyphicon glyphicon-chevron-up"></span>
		</a>
		<p>Edx Group</p>
	</footer>

	<!-- script>
		$(document).ready(
				function() {
					// Add smooth scrolling to all links in navbar + footer link
					$(".navbar a, footer a[href='#myPage']").on('click',
							function(event) {

								// Prevent default anchor click behavior
								event.preventDefault();

								// Store hash
								var hash = this.hash;

								// Using jQuery's animate() method to add smooth page scroll
								// The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
								$('html, body').animate({
									scrollTop : $(hash).offset().top
								}, 900, function() {

									// Add hash (#) to URL when done scrolling (default click behavior)
									window.location.hash = hash;
								});
							});

					$(window).scroll(function() {
						$(".slideanim").each(function() {
							var pos = $(this).offset().top;

							var winTop = $(window).scrollTop();
							if (pos < winTop + 600) {
								$(this).addClass("slide");
							}
						});
					});
				})
	</script-->


</body>
</html>
