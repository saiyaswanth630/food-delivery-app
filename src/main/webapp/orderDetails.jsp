<%@ page import="java.util.List"%>
<%@ page import="com.food.model.OrderItem"%>

<%
List<OrderItem> items=(List<OrderItem>)request.getAttribute("items");

int orderId=(Integer)request.getAttribute("orderId");

double total=0;
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Order Details</title>

<link rel="stylesheet" href="css/style.css?v=1.0">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.order-box{

width:850px;

max-width:95%;

margin:40px auto;

background:white;

padding:35px;

border-radius:20px;

box-shadow:0 15px 35px rgba(0,0,0,.12);

}

.item{

display:flex;

justify-content:space-between;

align-items:center;

padding:18px;

margin:15px 0;

border-radius:12px;

background:#f9f9f9;

transition:.3s;

}

.item:hover{

transform:translateY(-3px);

box-shadow:0 10px 20px rgba(0,0,0,.08);

}

.price{

font-weight:bold;

color:#28a745;

}

.qty{

background:#ff6b35;

color:white;

padding:5px 12px;

border-radius:20px;

font-size:14px;

}

.total{

margin-top:30px;

padding-top:20px;

border-top:2px dashed #ddd;

text-align:right;

font-size:26px;

font-weight:bold;

color:#ff6b35;

}

</style>

</head>

<body>

<div class="navbar">

<h2>

<i class="fa-solid fa-receipt"></i>

Order Details

</h2>

<div class="nav-links">

<a href="restaurants">Restaurants</a>

<a href="history">History</a>

<a href="profile.jsp">Profile</a>

<a href="logout">Logout</a>

</div>

</div>

<div class="order-box">

<h1>

Order #<%=orderId%>

</h1>

<br>

<%

for(OrderItem item:items){

total+=item.getSubtotal();

%>

<div class="item">

<div>

<h2>

<%=item.getItemName()%>

</h2>

<p>

&#8377; <%=item.getPrice()%> each

</p>

</div>

<div>

<span class="qty">

Qty : <%=item.getQuantity()%>

</span>

<br><br>

<div class="price">

&#8377; <%=item.getSubtotal()%>

</div>

</div>

</div>

<%

}

%>

<div class="total">

Grand Total : &#8377; <%=total%>

</div>

<br>

<div style="text-align:center;">

<a href="history">

<button>

<i class="fa-solid fa-arrow-left"></i>

Back to Orders

</button>

</a>

</div>

</div>

<div class="footer">

© 2026 FoodApp

</div>

</body>

</html>