<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>
    <h1>Name(Admin) : ${name}</h1>
    <h1>Description : ${description}</h1>
     <a href="/dbms/admin/items">view all items</a><br>
    <a href="/dbms/admin/additem">Add Item</a><br>
    <a href="/dbms/admin/employees">All employees</a><br>
 	<a href="/dbms/admin/addemployee">Add employee</a><br>
 	<a href="/dbms/admin/orders">View orders</a><br>
 	<a href="/dbms/admin/offers">View offers</a><br>
 	<a href="/dbms/admin/users">View all users</a><br>
 	<a href="offline/records">Go to offline records</a><br>
 	<a href="salary/records">Go to salary record</a><br>
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <h2>
            Welcome : ${user} | <a
                href="<c:url value="/j_spring_security_logout" />"> Logout</a>
        </h2>
    </c:if>
</body>
</html>
