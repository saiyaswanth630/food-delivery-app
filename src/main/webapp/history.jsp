<%@ page import="java.util.List"%>
<%@ page import="com.food.model.Order"%>
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

List<Order> orders=(List<Order>)request.getAttribute("orders");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>

Order History

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

.history-banner{

padding:100px 8%;

display:grid;

grid-template-columns:1fr 1fr;

align-items:center;

gap:60px;

background:linear-gradient(135deg,#fff5f7,#ffffff);

}

.history-banner h1{

font-size:64px;

font-weight:800;

line-height:1.2;

margin-bottom:25px;

}

.history-banner span{

color:#ff4d6d;

}

.history-banner p{

font-size:19px;

line-height:1.8;

color:#666;

}

.history-banner img{

width:100%;

max-width:480px;

animation:floating 4s infinite;

}

.history-container{

width:92%;

margin:60px auto;

display:flex;

flex-direction:column;

gap:30px;

}

.order-card{

display:grid;

grid-template-columns:180px 1fr auto;

gap:30px;

align-items:center;

background:white;

padding:28px;

border-radius:30px;

box-shadow:0 15px 35px rgba(0,0,0,.08);

transition:.35s;

}

.order-card:hover{

transform:translateY(-8px);

box-shadow:0 20px 45px rgba(0,0,0,.15);

}

.order-image{

width:170px;

height:170px;

border-radius:25px;

overflow:hidden;

}

.order-image img{

width:100%;

height:100%;

object-fit:cover;

}

.order-info h2{

font-size:34px;

margin-bottom:15px;

}

.order-price{

font-size:30px;

font-weight:700;

color:#ff4d6d;

margin:18px 0;

}

.status{

display:inline-block;

padding:10px 18px;

border-radius:30px;

background:#ECFDF5;

color:#15803d;

font-weight:700;

margin-top:10px;

}

.empty-box{

width:700px;

max-width:95%;

margin:80px auto;

background:white;

padding:70px;

border-radius:30px;

box-shadow:0 15px 35px rgba(0,0,0,.08);

text-align:center;

}

</style>

<script>

function confirmLogout(){

return confirm("Logout?");

}

</script>

</head>

<body>

<nav class="navbar">

<h2>

<i class="fa-solid fa-clock-rotate-left"></i>

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

<a href="logout"

onclick="return confirmLogout()">

Logout

</a>

</div>

</nav>

<section class="history-banner">

<div>

<h1>

My

<span>

Orders

</span>

</h1>

<p>

Track all your previous orders,
view order details
and reorder your favourite meals anytime.

</p>

<br>

<a href="restaurants">

<button>

<i class="fa-solid fa-arrow-left"></i>

Continue Shopping

</button>

</a>

</div>

<div align="center">

<img
src="images/history-banner.png"
onerror="this.src='images/default-banner.png'">

</div>

</section>

<div class="history-container">

<%

if(orders!=null && !orders.isEmpty()){

for(Order o:orders){

%>
<div
class="order-card">

<div
class="order-image">

<img
src="images/order-food.jpg"
onerror="this.src='images/default-food.jpg'">

</div>

<div
class="order-info">

<h2>

Order #<%=o.getId()%>

</h2>

<p
style="
color:#666;
font-size:17px;">

Thank you for ordering with FoodApp.

Your meal was prepared using fresh ingredients
and delivered with care.

</p>

<div
class="order-price">

&#8377;<%=String.format("%.2f",o.getTotalAmount())%>

</div>

<div
style="
display:flex;
gap:15px;
flex-wrap:wrap;
margin-bottom:18px;">

<span
style="
background:#EEF2FF;
padding:10px 18px;
border-radius:25px;
font-weight:600;">

<i
class="fa-solid fa-calendar-days"></i>

&nbsp;

<%=o.getOrderDate()%>

</span>

<span
style="
background:#FFF7ED;
padding:10px 18px;
border-radius:25px;
font-weight:600;">

<i
class="fa-solid fa-receipt"></i>

&nbsp;

#<%=o.getId()%>

</span>

</div>

<div
class="status">

<i
class="fa-solid fa-circle-check"></i>

&nbsp;

<%=o.getStatus()%>

</div>

</div>

<div
style="
display:flex;
flex-direction:column;
gap:15px;
width:220px;">

<a
href="orderDetails?id=<%=o.getId()%>">

<button
style="width:100%;">

<i
class="fa-solid fa-eye"></i>

View Details

</button>

</a>

<a
href="restaurants">

<button
style="
width:100%;
background:#22c55e;">

<i
class="fa-solid fa-rotate-right"></i>

Order Again

</button>

</a>

</div>

</div>

<%

}

}else{

%>

<div
class="empty-box">

<i
class="fa-solid fa-box-open"
style="
font-size:90px;
color:#ff4d6d;"></i>

<br><br>

<h1>

No Orders Yet

</h1>

<br>

<p
style="
font-size:18px;
color:#666;">

You haven't placed any orders yet.

Start exploring delicious restaurants now.

</p>

<br><br>

<a
href="restaurants">

<button>

<i
class="fa-solid fa-utensils"></i>

Browse Restaurants

</button>

</a>

</div>

<%

}

%>

</div>

<!-- ================= ORDER STATS ================= -->

<section
class="section">

<h1
class="section-title">

Your

<span>

Food Journey

</span>

</h1>

<div
class="dashboard-grid">

<div
class="stat-card
text-center">

<i
class="fa-solid fa-bowl-food"
style="
font-size:60px;
color:#ff4d6d;"></i>

<h2>

<%=orders!=null?orders.size():0%>

</h2>

<p>

Orders Placed

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-star"
style="
font-size:60px;
color:#f59e0b;"></i>

<h2>

4.9

</h2>

<p>

Average Experience

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-truck-fast"
style="
font-size:60px;
color:#3b82f6;"></i>

<h2>

30 Min

</h2>

<p>

Average Delivery

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-heart"
style="
font-size:60px;
color:#22c55e;"></i>

<h2>

100%

</h2>

<p>

Fresh & Hygienic

</p>

</div>

</div>

</section>

<!-- CONTINUE PART 3 -->
<!-- ================= ORDER TIMELINE ================= -->

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

Track every stage of your food delivery.

</p>

<div
style="
display:flex;
justify-content:space-between;
flex-wrap:wrap;
gap:25px;
max-width:1100px;
margin:auto;">

<div
class="stat-card
text-center"
style="flex:1;min-width:200px;">

<i
class="fa-solid fa-circle-check"
style="
font-size:60px;
color:#22c55e;"></i>

<h2>

Order Placed

</h2>

<p>

Your order has been confirmed.

</p>

</div>

<div
class="stat-card
text-center"
style="flex:1;min-width:200px;">

<i
class="fa-solid fa-utensils"
style="
font-size:60px;
color:#f59e0b;"></i>

<h2>

Preparing

</h2>

<p>

Fresh food is being cooked.

</p>

</div>

<div
class="stat-card
text-center"
style="flex:1;min-width:200px;">

<i
class="fa-solid fa-motorcycle"
style="
font-size:60px;
color:#3b82f6;"></i>

<h2>

On The Way

</h2>

<p>

Delivery partner is assigned.

</p>

</div>

<div
class="stat-card
text-center"
style="flex:1;min-width:200px;">

<i
class="fa-solid fa-house"
style="
font-size:60px;
color:#ff4d6d;"></i>

<h2>

Delivered

</h2>

<p>

Enjoy your delicious meal.

</p>

</div>

</div>

</section>

<!-- ================= CUSTOMER BENEFITS ================= -->

<section
class="section">

<div
style="
background:linear-gradient(135deg,#ff4d6d,#ff6b35);
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
font-size:58px;
margin-bottom:20px;">

Thank You ❤️

</h1>

<p
style="
font-size:20px;
line-height:1.8;
margin-bottom:25px;">

Every order helps us serve you better.

We hope to see you again soon.

</p>

<div
style="
display:flex;
gap:18px;
flex-wrap:wrap;">

<div
style="
background:rgba(255,255,255,.2);
padding:15px 22px;
border-radius:15px;">

🚚 Fast Delivery

</div>

<div
style="
background:rgba(255,255,255,.2);
padding:15px 22px;
border-radius:15px;">

🍕 Fresh Food

</div>

<div
style="
background:rgba(255,255,255,.2);
padding:15px 22px;
border-radius:15px;">

⭐ Premium Service

</div>

</div>

</div>

<div
align="center">

<img
src="images/history-delivery.png"
onerror="this.src='images/default-banner.png'"
style="
width:100%;
max-width:380px;">

</div>

</div>

</section>

<!-- ================= RECENT ACHIEVEMENTS ================= -->

<section
class="section">

<h1
class="section-title">

Why Customers

<span>

Love FoodApp

</span>

</h1>

<div
class="dashboard-grid">

<div
class="stat-card
text-center">

<i
class="fa-solid fa-face-smile"
style="
font-size:55px;
color:#22c55e;"></i>

<h2>

10K+

</h2>

<p>

Happy Customers

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-bowl-food"
style="
font-size:55px;
color:#ff4d6d;"></i>

<h2>

500+

</h2>

<p>

Menu Items

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-store"
style="
font-size:55px;
color:#3b82f6;"></i>

<h2>

100+

</h2>

<p>

Restaurants

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-star"
style="
font-size:55px;
color:#f59e0b;"></i>

<h2>

4.9★

</h2>

<p>

Customer Rating

</p>

</div>

</div>

</section>
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

Stay Updated

</h1>

<p
style="
font-size:18px;
color:#666;
margin-bottom:35px;">

Subscribe to receive exclusive offers,
new restaurant launches,
cashback deals and exciting discounts.

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
outline:none;
font-size:17px;">

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

FoodApp makes food ordering simple,
fast and enjoyable.

Thank you for choosing us.
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

Customer Support

</h3>

<ul>

<li>24 × 7 Support</li>

<li>Easy Returns</li>

<li>Fast Delivery</li>

<li>Secure Payments</li>

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

Open 24 × 7

</p>

</div>

</div>

<div
class="footer-bottom">

© 2026 FoodApp |
Java Full Stack Project |
Made with ❤️ by Sai Yaswanth

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

".order-card,.stat-card,.card"

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

</script>

</body>

</html>

<!-- CONTINUE PART 4 -->