<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.food.model.User"%>

<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);

User user=(User)session.getAttribute("user");

if(user==null){

response.sendRedirect("login.jsp");

return;

}

Integer orderId=(Integer)request.getAttribute("orderId");

Double total=(Double)session.getAttribute("total");

String payment=(String)request.getAttribute("payment");

if(total==null){

total=0.0;

}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>

Order Successful

</title>

<meta
name="viewport"
content="width=device-width,initial-scale=1.0">

<link
rel="stylesheet"
href="css/style.css?v=2.0">

<link
rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.success-hero{

padding:90px 8%;

display:grid;

grid-template-columns:1fr 1fr;

align-items:center;

gap:60px;

background:

linear-gradient(135deg,#ECFDF5,#ffffff);

}

.success-hero h1{

font-size:65px;

font-weight:800;

line-height:1.2;

margin-bottom:25px;

}

.success-hero span{

color:#22c55e;

}

.success-hero p{

font-size:20px;

line-height:1.8;

color:#666;

}

.success-hero img{

width:100%;

max-width:450px;

animation:floating 4s infinite;

}

.success-wrapper{

width:92%;

margin:60px auto;

display:grid;

grid-template-columns:2fr 1fr;

gap:35px;

align-items:start;

}

.success-card{

background:white;

padding:40px;

border-radius:30px;

box-shadow:0 15px 35px rgba(0,0,0,.08);

}

.success-icon{

width:120px;

height:120px;

margin:auto;

border-radius:50%;

display:flex;

justify-content:center;

align-items:center;

background:#ECFDF5;

font-size:60px;

color:#22c55e;

margin-bottom:25px;

}

.success-card h2{

text-align:center;

font-size:42px;

margin-bottom:20px;

color:#22c55e;

}

.success-card p{

text-align:center;

font-size:18px;

color:#666;

margin-bottom:35px;

}

.order-summary{

background:white;

padding:35px;

border-radius:30px;

box-shadow:0 15px 35px rgba(0,0,0,.08);

position:sticky;

top:110px;

}

.order-summary h2{

font-size:34px;

margin-bottom:25px;

}

.row{

display:flex;

justify-content:space-between;

margin:18px 0;

font-size:18px;

}

.status{

background:#ECFDF5;

padding:14px;

border-radius:15px;

text-align:center;

font-weight:700;

color:#15803d;

margin-top:25px;

}

</style>

</head>

<body>

<nav class="navbar">

<h2>

<i class="fa-solid fa-bowl-food"></i>

FoodApp

</h2>

<div class="nav-links">

<a href="restaurants">

Restaurants

</a>

<a href="history">

History

</a>

<a href="profile.jsp">

Profile

</a>

<a href="logout">

Logout

</a>

</div>

</nav>

<section class="success-hero">

<div>

<h1>

Order

<span>

Confirmed

</span>

</h1>

<p>

Your delicious meal has been successfully placed.

Our restaurant has already started preparing your order.

</p>

</div>

<div align="center">

<img
src="images/order-success.png"
onerror="this.src='images/default-banner.png'">

</div>

</section>

<div class="success-wrapper">

<div class="success-card">

<div class="success-icon">

<i class="fa-solid fa-circle-check"></i>

</div>

<h2>

Order Placed Successfully

</h2>

<p>

Thank you for choosing FoodApp.

Your food is being prepared.

</p>
<div
style="
display:grid;
grid-template-columns:1fr 1fr;
gap:25px;">

<div
style="
background:#F8FAFC;
padding:22px;
border-radius:20px;">

<h3
style="
margin-bottom:18px;">

Order Information

</h3>

<div
class="row">

<span>

Order ID

</span>

<b>

#<%=orderId%>

</b>

</div>

<div
class="row">

<span>

Payment

</span>

<b>

<%=payment%>

</b>

</div>

<div
class="row">

<span>

Order Date

</span>

<b>

Today

</b>

</div>

<div
class="row">

<span>

Delivery Time

</span>

<b>

30 - 40 Min

</b>

</div>

</div>

<div
style="
background:#F8FAFC;
padding:22px;
border-radius:20px;">

<h3
style="
margin-bottom:18px;">

Payment Summary

</h3>

<div
class="row">

<span>

Food Total

</span>

<b>

&#8377;<%=String.format("%.2f",total)%>

</b>

</div>

<div
class="row">

<span>

Delivery

</span>

<b
style="
color:#22c55e;">

FREE

</b>

</div>

<div
class="row">

<span>

Platform Fee

</span>

<b>

Included

</b>

</div>

<hr
style="
margin:18px 0;
border:none;
height:1px;
background:#ddd;">

<div
class="row"
style="
font-size:22px;
font-weight:700;
color:#22c55e;">

<span>

Paid

</span>

<span>

&#8377;<%=String.format("%.2f",total)%>

</span>

</div>

</div>

</div>

<br>

<div
style="
display:flex;
gap:20px;
flex-wrap:wrap;">

<a
href="restaurants"
style="flex:1;">

<button
style="
width:100%;">

<i
class="fa-solid fa-utensils"></i>

Order More

</button>

</a>

<a
href="history"
style="flex:1;">

<button
style="
width:100%;
background:#22c55e;">

<i
class="fa-solid fa-clock-rotate-left"></i>

Order History

</button>

</a>

</div>

</div>

<!-- ================= SUMMARY CARD ================= -->

<div
class="order-summary">

<h2>

Order Status

</h2>

<div
class="row">

<span>

Current Status

</span>

<span
style="
color:#22c55e;
font-weight:700;">

Preparing

</span>

</div>

<div
class="row">

<span>

Restaurant

</span>

<span>

Accepted

</span>

</div>

<div
class="row">

<span>

Estimated Delivery

</span>

<span>

30-40 Min

</span>

</div>

<div
class="row">

<span>

Payment

</span>

<span>

<%=payment%>

</span>

</div>

<div
class="row">

<span>

Amount

</span>

<span>

&#8377;<%=String.format("%.2f",total)%>

</span>

</div>

<div
class="status">

<i
class="fa-solid fa-bowl-food"></i>

&nbsp;

Your delicious food is now being prepared.

</div>

</div>

</div>

<!-- CONTINUE PART 3 -->
<!-- ================= DELIVERY TIMELINE ================= -->

<section
class="section">

<h1
class="section-title">

Order

<span>

Timeline

</span>

</h1>

<p
class="section-subtitle">

Your order is progressing successfully.

</p>

<div
style="
max-width:950px;
margin:auto;
display:flex;
justify-content:space-between;
flex-wrap:wrap;
gap:25px;">

<div
class="stat-card
text-center"
style="flex:1;min-width:180px;">

<i
class="fa-solid fa-circle-check"
style="
font-size:60px;
color:#22c55e;"></i>

<h2>

Order Placed

</h2>

<p>

Completed

</p>

</div>

<div
class="stat-card
text-center"
style="flex:1;min-width:180px;">

<i
class="fa-solid fa-kitchen-set"
style="
font-size:60px;
color:#f59e0b;"></i>

<h2>

Preparing

</h2>

<p>

In Progress

</p>

</div>

<div
class="stat-card
text-center"
style="flex:1;min-width:180px;">

<i
class="fa-solid fa-motorcycle"
style="
font-size:60px;
color:#3b82f6;"></i>

<h2>

Out For Delivery

</h2>

<p>

Pending

</p>

</div>

<div
class="stat-card
text-center"
style="flex:1;min-width:180px;">

<i
class="fa-solid fa-house"
style="
font-size:60px;
color:#ff4d6d;"></i>

<h2>

Delivered

</h2>

<p>

Pending

</p>

</div>

</div>

</section>

<!-- ================= THANK YOU ================= -->

<section
class="section">

<div
style="
background:
linear-gradient(135deg,#22c55e,#16a34a);
padding:75px;
border-radius:35px;
display:grid;
grid-template-columns:1fr 1fr;
align-items:center;
gap:40px;
color:white;">

<div>

<h1
style="
font-size:56px;
margin-bottom:20px;">

Thank You!

</h1>

<p
style="
font-size:20px;
line-height:1.8;">

Your support means a lot to us.

Our chefs are preparing your meal with fresh ingredients and care.

</p>

<br>

<div
style="
display:flex;
gap:18px;
flex-wrap:wrap;">

<div
style="
background:rgba(255,255,255,.20);
padding:14px 22px;
border-radius:15px;">

🚚 Fast Delivery

</div>

<div
style="
background:rgba(255,255,255,.20);
padding:14px 22px;
border-radius:15px;">

🍔 Fresh Food

</div>

</div>

</div>

<div
align="center">

<img
src="images/delivery-boy.png"
onerror="this.src='images/default-banner.png'"
style="
width:100%;
max-width:380px;">

</div>

</div>

</section>

<!-- ================= CUSTOMER PROMISE ================= -->

<section
class="section">

<h1
class="section-title">

Our

<span>

Promise

</span>

</h1>

<div
class="dashboard-grid">

<div
class="stat-card
text-center">

<i
class="fa-solid fa-fire"
style="
font-size:55px;
color:#ff4d6d;"></i>

<h2>

Hot & Fresh

</h2>

<p>

Prepared only after your order is confirmed.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-clock"
style="
font-size:55px;
color:#3b82f6;"></i>

<h2>

On Time

</h2>

<p>

Quick delivery with real-time order updates.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-face-smile"
style="
font-size:55px;
color:#22c55e;"></i>

<h2>

Customer First

</h2>

<p>

Dedicated support to ensure your satisfaction.

</p>

</div>

</div>

</section>

<!-- CONTINUE PART 4 -->
<!-- ================= NEWSLETTER ================= -->

<section
class="section">

<div
style="
background:white;
padding:70px;
border-radius:35px;
box-shadow:0 15px 40px rgba(0,0,0,.08);
text-align:center;">

<h1
style="
font-size:46px;
margin-bottom:20px;">

Enjoy Exclusive Rewards

</h1>

<p
style="
font-size:18px;
color:#666;
margin-bottom:35px;">

Subscribe to receive special coupons,
festival offers,
cashback rewards and new restaurant updates.

</p>

<div
style="
display:flex;
justify-content:center;
gap:15px;
flex-wrap:wrap;">

<input

type="email"

placeholder="Enter your email"

style="
width:420px;
padding:18px;
border:2px solid #eee;
border-radius:50px;
font-size:17px;
outline:none;">

<button>

Subscribe

</button>

</div>

</div>

</section>

<!-- ================= FOOTER ================= -->

<footer
class="footer">

<div
class="footer-grid">

<div>

<h2>

<i class="fa-solid fa-bowl-food"></i>

FoodApp

</h2>

<p>

Thank you for ordering with FoodApp.

We hope you enjoy your delicious meal.
We look forward to serving you again.

</p>

<div
class="social">

<i class="fa-brands fa-facebook-f"></i>

<i class="fa-brands fa-instagram"></i>

<i class="fa-brands fa-x-twitter"></i>

<i class="fa-brands fa-linkedin-in"></i>

<i class="fa-brands fa-youtube"></i>

</div>

</div>

<div>

<h3>

Quick Links

</h3>

<ul>

<li><a href="restaurants">Restaurants</a></li>

<li><a href="history">Order History</a></li>

<li><a href="profile.jsp">Profile</a></li>

<li><a href="cart.jsp">Cart</a></li>

<li><a href="logout">Logout</a></li>

</ul>

</div>

<div>

<h3>

Customer Care

</h3>

<ul>

<li>24×7 Support</li>

<li>Easy Refunds</li>

<li>Secure Payments</li>

<li>Fast Delivery</li>

<li>Help Center</li>

</ul>

</div>

<div>

<h3>

Contact

</h3>

<p>

<i class="fa-solid fa-location-dot"></i>

Bangalore, India

</p>

<br>

<p>

<i class="fa-solid fa-phone"></i>

+91 9876543210

</p>

<br>

<p>

<i class="fa-solid fa-envelope"></i>

support@foodapp.com

</p>

<br>

<p>

<i class="fa-solid fa-clock"></i>

Available 24 × 7

</p>

</div>

</div>

<div
class="footer-bottom">

© 2026 FoodApp |
Built using Java, JSP, Servlets & MySQL |
Made with ❤️

</div>

</footer>

<!-- ================= BACK TO TOP ================= -->

<button

id="topBtn"

style="
position:fixed;
bottom:40px;
right:35px;
width:60px;
height:60px;
border-radius:50%;
display:none;
z-index:999;">

<i
class="fa-solid fa-arrow-up"></i>

</button>

<!-- ================= JAVASCRIPT ================= -->

<script>

window.onscroll=function(){

const btn=document.getElementById("topBtn");

if(document.documentElement.scrollTop>300){

btn.style.display="block";

}else{

btn.style.display="none";

}

};

document.getElementById("topBtn").onclick=function(){

window.scrollTo({

top:0,

behavior:"smooth"

});

};

const cards=document.querySelectorAll(

".success-card,.order-summary,.stat-card,.card"

);

const observer=new IntersectionObserver(

(entries)=>{

entries.forEach(entry=>{

if(entry.isIntersecting){

entry.target.style.opacity="1";

entry.target.style.transform="translateY(0)";

}

});

},

{

threshold:0.15

}

);

cards.forEach(card=>{

card.style.opacity="0";

card.style.transform="translateY(40px)";

card.style.transition=".8s";

observer.observe(card);

});

setTimeout(function(){

alert("🎉 Your order has been placed successfully!");

},800);

</script>

</body>

</html>