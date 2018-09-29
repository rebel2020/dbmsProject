<%@page import="java.util.Iterator"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="com.brijesh.model.Item"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
List<Item> list=(List<Item>)  request.getAttribute("list");
Iterator itr=list.iterator();
while(itr.hasNext())
{
	Item item=(Item)itr.next();
	out.println("<div style=\"background-color:red;float:left;width:30%;margin-left:5%;margin-top:5%\"><h4>"+item.getName() +"<a href=\"deleteitem/"+item.getItemId() +"\">delete this item</a></h4></div>");
	
}

%>
</body>
</html>