<jsp:include page="base.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@page session="true"%>
<html>
<%response.sendRedirect("home");
%>
<body>
    <h1>Description : ${description}</h1>
    <a href="items">view all items</a><br>
    <a href="orders">Your orders</a><br>
    <a href="cart">Go to cart</a><br>
    <a href="profile">Profile</a><br>
  
</body>
</html>