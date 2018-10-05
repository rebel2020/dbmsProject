<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="base.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <link rel="stylesheet" href='<c:url value="/resources/css/font.css"></c:url>'>
<html>
<body>
<div class="col-md-3 font_meie_script" style="font-size:40px">
        <p>Honey paradise</p>
      </div>
	<div  style="height:15%" style="font-family:'Snell Roundhand Script';">
	</div>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src='<c:url value="/resources/Honey1.jpg"></c:url>' class="responsive">
    </div>

    <div class="item">
 	    <img src='<c:url value="/resources/Honey2.jpg"></c:url>' class="responsive">
     </div>

    <div class="item">
           <img src='<c:url value="/resources/Honey3.jpg"></c:url>' class="responsive">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	
</body>
</html>