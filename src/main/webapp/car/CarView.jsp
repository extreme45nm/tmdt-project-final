<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>${name}</title>
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
.blackout {
	background-color: #000;
	opacity: .7;
	filter: alpha(opacity = 70);
	height: 100%;
	width: 100%;
	position: fixed;
	top: 0;
	left: 0;
	z-index: 100;
	display: none;
	cursor: pointer;
}

.modal-header, .h4, .close {
	background-color: #5cb85c;
	color: white !important;
	text-align: center;
	font-size: 30px;
}

.modal-footer {
	background-color: #f9f9f9;
}

/*Font modification*/
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
/*font ends*/

/*Nav bar*/
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

/*Nav bar END*/


#tabs{
	padding-top: 50px;
	width:100%;
	background-color: #000000;
	border-style: solid;
}
#tabs li a{
	color: #ffffff !important;
	font-weight: bold;
	font-size: 15px;
}
#tabs li{
	color: #ffffff !important;
	font-weight: bold;
	font-size: 25px;
}
#tabs li a:hover{
	color: #000000 !important;
}
#tabs li:active{
	color: #000000 !important;
}
.modal{
	position: fixed;
}
</style>
</head>
<body>
	<!-- NAVBAR -->
	<nav class="navbar navbar-inverse navbar-fixed-top" data-spy="affix"
		data-offset-top="197" style="margin: auto;">
		<div class="container">
			<div class="navbar-header">
				<div class="container-fluid">
					<a class="navbar-brand" href="../../home" style="font-size: 39px;">Top
						Car</a>
				</div>
			</div>
			<div id="navBarLeftPart">
				<ul class="nav navbar-nav navbar-left"
					style="display: inline-block;">
					<li class="navbar-link active"><a href="../list">Buy</a></li>
					<li class="navbar-link"><a href="../form">Sell</a></li>
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

	
			<div>
				<ul class="nav nav-tabs nav-justified" id="tabs">
				<li class="nav-tabs" style="text-align: left;">${car.name} - ${car.year}</li>
					<li class="nav-tabs-link" id="basicInfoTab" ><a data-toggle="modal"
				data-target="#basicInfoModal" href="#basicInfoModal">Basic Info</a></li>
					<li class="nav-tabs-link" id="specTab"><a data-toggle="modal"
				data-target="#specModal" href="#specModal">Specification</a></li>
					<li class="nav-tabs-link" id="utilTab"><a data-toggle="modal"
				data-target="#utilModal" href="#utilModal">Ultilities</a></li>
					<li class="nav-tabs-link" id="pricingTab"><a data-toggle="modal"
				data-target="#pricingModal" href="#pricingModal">Pricing</a></li>
				</ul>
			</div>
		
	<!-- CAROUSEL -->
	<div id="carCarousel" class="carousel-slide" data-ride="carousel">
		<!-- Indicators -->

		<!-- Wrapper for Slide -->
		<div class="carousel-inner" role="list-box">
			<div class="item active">
				<div class="row">
					<div class="col-sm-12" align="center">
						<img src="../img/${car.id}.jpg" alt="${car.id}"
							class="img-responsive" align="bottom">
					</div>
				</div>
			</div>
		</div>

		<!-- Controls -->

		<a class="left carousel-control" href="#carCarousel" role="button"
			data-slide="prev" style="margin-top: 700px"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="false"
			style="margin-top: 300px"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carCarousel" role="button"
			data-slide="next" style="margin-top: 700px"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="false"
			style="margin-top: 300px"></span> <span class="sr-only">Next</span>
		</a>
	</div>
	<!-- CAROUSEL END -->
	
	<!-- Specification MODAL -->
	<div id="specModal" class="modal fade" role="dialog" 
		tabindex="-1" aria-labelledby="basicInfoModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-header" style="padding: 40px 50px;">
				<h4>${car.name}</h4>
				<h5>Specification</h5>

			</div>
			<div class="modal-body" style="padding: 40px 50px;">
				<div class="all-content">
					<div class="row">
						<div class="col-md-12" align="center">
							<ul class="list-group">
								<li class="list-group-item">Type: ${specification.type}</li>
								<li class="list-group-item">Seat: ${specification.seat}</li>
								<li class="list-group-item">Engine: ${specification.engine}</li>
								<li class="list-group-item">Torque: ${specification.torque}</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Spec MODAL end -->

	<!-- Basic Info MODAL -->
	<div id="basicInfoModal" class="modal fade" role="dialog" 
		tabindex="-1" aria-labelledby="basicInfoModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-header" style="padding: 40px 50px;">
				<h4>${car.name}</h4>
				<h5>Basic Info</h5>
			</div>
			<div class="modal-body" style="padding: 40px 50px;">
				<div class="all-content">
					<div class="row">
						<div class="col-md-12" align="center">
							<ul class="list-group">
								<li class="list-group-item">Car Id : ${car.id}</li>
								<li class="list-group-item">Car Name: ${car.name}</li>
								<li class="list-group-item">Manufacturer:
									${manufacturer.name}</li>
								<li class="list-group-item">Year: ${car.year}</li>
								<li class="list-group-item">Seller Name: ${seller.name}</li>
								<li class="list-group-item">New</li>
								<li class="list-group-item">Price: ${car.price}</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Basic Info MODAL end -->

	<!-- Util MODAL -->
	<div id="utilModal" class="modal fade" role="dialog" 
		tabindex="-1" aria-labelledby="utilModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-header" style="padding: 40px 50px;">
				<h4>${car.name}</h4>
				<h5>Utilities</h5>
			</div>
			<div class="modal-body" style="padding: 40px 50px;">
				<div class="all-content">
					<div class="row">
						<div class="col-md-12" align="center">
							<ul class="list-group">
								<li class="list-group-item">Airbag: ${util.airBag}</li>
								<li class="list-group-item">5.1 Soundsystem:
									${util.soundSystem}</li>
								<li class="list-group-item">Wheel: ${util.wheel}</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Util MODAL end -->

	

	<div id="PopUp"
		style='display: none; margin: 30px auto 0; position: absolute; top: 50%; left: 50%; margin-left: -250px; margin-top: 100px; border: solid black 5px; padding: 5px; background-color: rgb(255, 255, 255); text-align: justify; font-size: 12px; width: 500px;'
		onmouseover="document.getElementById('PopUp').style.display='none'">
		<span id="PopUpText">TEXT</span>
	</div>

</body>
</html>
<!-- script type="text/javascript">

function showPos(event,text){
	var el = document.getElementById('PopUp');
	var x,y;
	
	if(window.event){
		x = window.event.clientX
			+ document.documentElement.scrollLeft+document.body.scrollLeft;
		y = window.event.clientY
			+ document.documentElement.srollTop+document.body.scrollTop;				
	}else{
		x = event.clientX + window.scrollX;
		y = event.clientY + window.scrollY;
	}
	x -=2;
	y -=2;
	y  =y+15;
	el.style.left=x+"px";
	el.style.top=y+"px";
	el.style.display="block";
	document.getElementById('PopUpText').innerHTML=text;
}

	function viewSpecification(event,id){
		var xmlHttp = new XMLHttpRequest();
		xmlHttp.open("GET","/car/view/${car.id}",true);
		xmlHttp.onload = function(){
			if(this.status == 200){
				var car = (this.responseText);
				showPos(event,
							+'<ul class="list-group">'
								+'<li class="list-group-item">Type: ${specification.type}</li>'
								+'<li class="list-group-item">Seats: ${specification.seat}</li>'
								+'<li class="list-group-item">Engine: ${specification.engine}</li>'
								+'<li class="list-group-item">Torque:${specification.torque}</li>'
							+'</ul>'
						+'</div>');
			}
		};
		xmlHttp.send();
	}
	
	function viewBasicInfo(event,id){
		var xmlHttp = new XMLHttpRequest();
		xmlHttp.open("GET","/car/view/${car.id}",true);
		xmlHttp.onload = function(){
			
			if(this.status == 200){
				var car = (this.responseText);
				var status = ${car.status};
				if(status==true){
					showPos(event,'<label>Basic Information:</label>'+
							'<ul class="list-group">'+
						'<li class="list-group-item">Car Id : ${car.id}</li>'+
						'<li class="list-group-item">Car Name: ${car.name}</li>'+
						'<li class="list-group-item">Manufacturer: ${manufacturer.name}</li>'+
						'<li class="list-group-item">Year: ${car.year}</li>'+
						'<li class="list-group-item">Seller Name: ${seller.name}</li>'+
						'<li class="list-group-item">New</li>'+
						'<li class="list-group-item">Price: ${car.price}</li>'+
						'</ul>');
				}else{
					showPos(event,'<ul class="list-group">'+
							'<li class="list-group-item">Car Id : ${car.id}</li>'+
							'<li class="list-group-item">Car Name: ${car.name}</li>'+
							'<li class="list-group-item">Manufacturer: ${manufacturer.name}</li>'+
							'<li class="list-group-item">Year: ${car.year}</li>'+
							'<li class="list-group-item">Seller Name: ${seller.name}</li>'+
							'<li class="list-group-item">Old</li>'+
							'<li class="list-group-item">Price: ${car.price}</li>'+
							'</ul>');
				}
			}	
		};
		xmlHttp.send();
	}
	
	function viewUltilities(event,id){
		var xmlHttp = new XMLHttpRequest();
		xmlHttp.open("GET","/car/view/${car.id}",true);
		xmlHttp.onload = function(){
			
			if(this.status == 200){
				var car = (this.responseText);
				showPos(event,'<ul class="list-group">'+
						'<li class="list-group-item">Airbag: ${util.airBag}</li>'+
						'<li class="list-group-item">5.1 Soundsystem:'+
							'${util.soundSystem}</li>'+
						'<li class="list-group-item">Wheel: ${util.wheel}</li>'+
					'</ul>');
			}	
		};
		xmlHttp.send();
	}
	
</script -->