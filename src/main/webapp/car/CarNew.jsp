<!DOCTYPE html>
<html>
<head>
<title>News</title>
<meta charset="utf-8">
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

</style>

<script type="text/javascript">

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

	<!-- Carousel -->
	<div id="newsCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->

		<ol class="carousel-indicators">
			<li data-target="#newsCarousel" data-slide-to="0"></li>
			<li data-target="#newsCarousel" data-slide-to="1"></li>
			<li data-target="#newsCarousel" data-slide-to="2"></li>
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

	<div id="paragraph" class="container">
	
	</div>

</body>
</html>