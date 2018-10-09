
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <link rel="stylesheet" href='<c:url value="/resources/css/font.css"></c:url>'>
    <jsp:include page="base.jsp"></jsp:include>
<html>
<head>
	<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script>
    $(document).ready(function () {
        $('.dropdown-toggle').dropdown();
    });
</script>
<style>
    @media (max-width: 700px) {
        #test {
            display: none;
        }
    }
</style>

<style>
@font-face{
	font-family:"myFont";
	src: url("<c:url value="/resources/css/boldFont.ttf"></c:url>");
}
@import url('https://fonts.googleapis.com/css?family=Open+Sans:400,700,800');
div {
}

.normal {
  font-weight: 400;
}

.bold {
  font-weight: 700;
}

.extra-bold {
  font-weight: 800;
}

div.sticky {
    position: -webkit-sticky;
    position: sticky;
}
.imgtext {
  color: white;
  width: 80vw;
  height: 50vh;
  padding: 50px 15px 0 15px;
  opacity: 0;
  position: absolute;
  top: 5vh;
  left: 10vw;
  font-size:400%;
  -webkit-transition: all 300ms ease-in-out;
  -o-transition: all 300ms ease-in-out;
  transition: all 300ms ease-in-out;
}
.texm {
  color: white;
  width: 40vw;
  height: 50vh;
  padding: 50px 15px 0 15px;
  opacity: 0;
  position: absolute;
  top: 5vh;
  left: 10vw;
  font-size:200%;
  -webkit-transition: all 300ms ease-in-out;
  -o-transition: all 300ms ease-in-out;
  transition: all 300ms ease-in-out;
}

.pic {
  position: relative;
  overflow: hidden;
  width: 100%;
  height: 100%;
  margin: 0px;
  float:top;
}

.pic:hover img {
  -webkit-transition: all 300ms ease-in-out;
  -o-transition: all 300ms ease-in-out;
  transition: all 300ms ease-in-out;
  -webkit-filter: blur(4px);
  -moz-filter: blur(4px);
  -ms-filter: blur(4px);
  -o-filter: blur(4px);
  filter: blur(4px);
  transform: scale(1.03);
}

.pic:hover .imgtext {
  -webkit-opacity: 1;
  opacity: 1;
}
</style>
</head>
<body >
<!-- 
<div class="pic">
  <img src='<c:url value="/resources/Honey5.jpg"></c:url>'>
  <span class="imgtext">
			<h1>THIS IS A TITLE</h1>
			<p>and this is a description</p>
		</span>
</div>
-->

<!-- 
	<div class="col-sm-12" style="background-color:fffaf0;position:relative;">
		<div class="col-sm-7" style="position:relative;top:18px;">
		<div style="height:16%;width:100%" class="responsive;">
		<p style="font-family: Lobster,cursive;font-size:300%;margin-left:5%;position:relative;top:-15%" class="responsive">Honey Paradise
		</p>
		<b style="position:relative;margin-left:9%;top:-30px;">Bees and Honey Business</b>
		</div>
		</div>
		<div class="col-sm-5" style="position:relative;top:18px;">
			<div class="col-sm-7">
				<div class="col-sm-1">
					<span class="glyphicon glyphicon-earphone" style="float:right;font-size:300%;color:red"></span>		
				</div>
				<div class="col-sm-11">
					<div style="position:relative;top:-42px">
						Phone:<br>
						<sub >+91-9984739387<br><br><br>+91-9589177540</sub>
					</div>
				</div>
			
			</div>
			<div class="col-sm-5">
				<div class="col-sm-6">
					<span class="glyphicon glyphicon-map-marker" style="float:right;font-size:300%;color:red"></span>
				</div>
				<div class="col-sm-6" style="font-size:80%">
				Location:<br>
					42 MS Road Kailaras,Morena (476224)		
				</div>
			</div>
	
		</div>
	</div>
	
	 -->
	
  	
	
  	<div id="myCarousel" class="carousel slide" data-ride="carousel" style="float:top">
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <div class="carousel-inner">
    <div class="item active">
    <div class="item pic">
      <img src='<c:url value="/resources/Honey7.jpg" ></c:url>' class="responsive" style="width:100%;height:90%;overrflow:hidden">
    <span class="imgtext">
           <center><div style="font-family:'myFont';font-size:200%">OFFERING PLENTY OF PREMIUM QUALITY PRODUCTS</div></center>
           </span>
    </div>
    </div>

    <div class="item pic">
 	    <img src='<c:url value="/resources/new.png"></c:url>' class="responsive" style="width:100%;height:90%;overrflow:hidden">
     	<span class="imgtext">
           <center><div style="font-family:'myFont';font-size:200%">DELIVERING NATURAL HONEY RIGHT FROM THE HIVE</div></center>
           </span>
     </div>

         <div class="item pic">
      <img src='<c:url value="/resources/bee4.jpg"></c:url>' class="responsive" style="width:100%;height:90%;overrflow:hidden">
            <span class="imgtext">
           	<center><div style="font-family:'myFont';font-size:200%">OUR BEES ARE WORKING FOR YOUR HEALTH</div></center>
           </span>     
    </div>
  </div>

  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<div style="background-color:fffaf0;font-family:'myFont';font-size:800%;position:relative;top:-6%">
	<center>WELCOME</center>	
</div>
<div class="col-sm-12">
<div style="margin-left:6%" >
	<div class="item pic col-sm-5" style="height:50vh;width:35vw">
      <img src='<c:url value="/resources/rawHoney.jpg"></c:url>' class="responsive" style="width:100%;height:90%;overrflow:hidden">
            <span class="imgtext" style="width:33vw;position:absolute;left:0vw"  style="font-family:myFont">
           	<center><div>Raw Honey</div></center>
           </span>     
    </div>
    <div class="col-sm-6">
    <div >
<label style="color:red;font-size:200%">Raw honey for immunity, Asthma and allergy</label>
<p><span style="color: #333399;font-size:130%"><span style="color: #000080;">Immunity can be increased by using honey daily.</span></span></p>
<p><span style="color: #333399;font-size:130%">Initially less pollen honey needs to be used.</span></p>
<p><span style="color: #333399;font-size:130%">Then less pollen honey along with wild forest honey needs to used.</span></p>
<p><span style="color: #333399;font-size:130%">Immunity, asthma, allergy and honey is a complex correlation</span></p>
<p><span style="color: #333399;font-size:130%">Complete details about the correlation is written in following article </span></p>
<p style="text-align: right;">View <a style="text-align: right;" href="https://www.healthline.com/health/food-nutrition/top-raw-honey-benefits" target="_blank" rel="noopener"><span style="color: #ff0000;"><strong> More benefits of raw honey</strong></span></a></p>    
    </div>
    </div>
</div>
</div>
<hr>
<div class="" style="margin-top:2%">
<div>
			<div class=" pic" style="width:80vw;margin-left:8vw;height:62vh">
			<img src='<c:url value="/resources/bulkHoney.jpg"></c:url>' alt="image" class="img-responsive" style="width:80vw;height:60vh;">
			<span class="imgtext" style="display:inline-block;">
		<center style="position:relative;left:-10vw">	<label><a href="bulk" style="color:white">Buy honey in bulk</a>	</label>
			</center></span>
		</div>
</div>
</div>
<br><br>
<div class=" col-sm-11" style="margin-left:6vw">
	<div class="col-sm-5">
	<p style="font-size:190%">
		Pure, Real Raw Honey
Enjoy pure, raw, unadulterated, unfiltered honey at its finest. Our honey is unpasteurized and totally raw. It has no sugars added. It is never mixed with cheap offshore honey.
 It still has naturally-occurring pollen from the bees. The live enzymes and yeasts are present. This is 100% raw honey! 
 <span style="color:red">Not sure what raw honey is?</span> Find out on our <a href="https://rationalwiki.org/wiki/Raw_honey">FAQ</a>. 
	</p>
	</div>
	<div col-sm-4>	
		<img src='<c:url value="/resources/rawHoney1.jpg"></c:url>' class="img-responsive">
	</div>
</div>
</body>

</+html>