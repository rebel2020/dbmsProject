<jsp:include page="adminBase.jsp"></jsp:include>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<!--  	<link rel="stylesheet" href='<c:url value="/resources/css/gridView.css"></c:url>'>	-->
</head>
<body>
	<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!------ Include the above in your HEAD tag ---------->
<!--  
<div class="container">
    <div class="row">
        <div class="col-lg-12 my-3">
            <div class="pull-right">
                <div class="btn-group">
                    <button class="btn btn-info" id="list">
                        List View
                    </button>
                    <button class="btn btn-danger" id="grid">
                        Grid View
                    </button>
                </div>
            </div>
        </div>
    </div>
 
 <div id="products" class="row view-group">
 	 <c:forEach items="${list }" var="item">
                <div class="item col-xs-4 col-lg-4">
                    <div class="thumbnail card">
                        <div class="img-event">
                            <img class="group list-group-image img-fluid" src="data:image/jpeg;base64,${item.forImage }" alt="" style="max-height:40vh;"/>
                        </div>
                        <div class="caption card-body">
                            <h4 class="group card-title inner list-group-item-heading">
                                Product title</h4>
                            <p class="group inner list-group-item-text">
                                ${item.name }
                                
                                </p>
                            <div class="row">
                                <div class="col-xs-12 col-md-6">
                                    <p class="lead">
                                        Rs ${item.price }.000</p>
                                </div>
                                <div class="col-xs-12 col-md-6">
                                    <a class="btn btn-success" href="http://www.jquery2dotnet.com">Add to cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
	</c:forEach>
 </div>
-->







<div class="col-sm-12">
<c:forEach items="${list }" var="item">
<a href="item/${item.itemId }">
<div class="panel panel-default col-sm-3" style="margin-right:2%;margin-top:2%;background-color:rgb(200,200,200);width:23vw;height:75%;overflow:hidden;text-overflow:ellipsis">
	<center><div><img alt="" src="data:image/jpeg;base64,${item.forImage }" class="img-responsive" style="height:55vh;width:22vw"></div></center>
	<div style="display:block;">
	<center><div style="overflow:hidden;font-size:180%;height:70px">${item.name }(${item.weight }gm)</div></center>
<center><h3>Price: ${item.price }.00 Rs</h3></center>
	
	</div>
</div>
</a>
</c:forEach>
</div>
</body>
</html>