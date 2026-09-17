<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="com.food.model.User"%>

<%
User user = (User) session.getAttribute("user");

if(user == null){

    response.sendRedirect("login.jsp");

    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Successful</title>
<link rel="stylesheet" href="css/style.css?v=1.0">
</head>

<body>

<div class="navbar">

<h2>FoodApp</h2>

<div class="nav-links">
<a href="restaurants">Restaurants</a>
<a href="history">Orders</a>
<a href="logout">Logout</a>
</div>

</div>

<div class="form-container" style="text-align:center;">

<h1 style="color:green;">✅ Order Placed Successfully</h1>

<br>

<p>
Thank you for ordering with FoodApp.
</p>

<br><br>

<a href="restaurants">
<button>Order Again</button>
</a>

<a href="history">
<button>View Orders</button>
</a>

</div>

</body>
</html>