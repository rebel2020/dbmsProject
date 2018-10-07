
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
<body>
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

</body>
</html>