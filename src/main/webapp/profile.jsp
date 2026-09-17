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
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>

My Profile

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

.profile-banner{

padding:100px 8%;

display:grid;

grid-template-columns:1fr 1fr;

align-items:center;

gap:60px;

background:

linear-gradient(135deg,#fff5f7,#ffffff);

}

.profile-banner h1{

font-size:65px;

font-weight:800;

margin-bottom:25px;

line-height:1.2;

}

.profile-banner span{

color:#ff4d6d;

}

.profile-banner p{

font-size:20px;

line-height:1.8;

color:#666;

}

.profile-banner img{

width:100%;

max-width:450px;

animation:floating 4s infinite;

}

.profile-wrapper{

width:92%;

margin:60px auto;

display:grid;

grid-template-columns:1fr 2fr;

gap:35px;

}

.profile-card{

background:white;

padding:35px;

border-radius:30px;

box-shadow:0 15px 35px rgba(0,0,0,.08);

text-align:center;

}

.profile-avatar{

width:150px;

height:150px;

margin:auto;

border-radius:50%;

background:linear-gradient(135deg,#ff4d6d,#ff8a5c);

display:flex;

justify-content:center;

align-items:center;

font-size:70px;

color:white;

margin-bottom:25px;

}

.profile-card h2{

font-size:34px;

margin-bottom:10px;

}

.profile-card p{

color:#666;

font-size:17px;

}

.info-card{

background:white;

padding:35px;

border-radius:30px;

box-shadow:0 15px 35px rgba(0,0,0,.08);

}

.info-card h2{

font-size:36px;

margin-bottom:30px;

}

.info-row{

display:flex;

align-items:center;

gap:20px;

padding:22px;

margin-bottom:20px;

border-radius:18px;

background:#f8fafc;

transition:.3s;

}

.info-row:hover{

background:#fff4f8;

transform:translateX(8px);

}

.info-row i{

font-size:28px;

width:40px;

color:#ff4d6d;

}

.info-row h3{

margin-bottom:6px;

font-size:22px;

}

.info-row p{

color:#666;

font-size:17px;

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

<i class="fa-solid fa-user"></i>

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

<section
class="profile-banner">

<div>

<h1>

My

<span>

Profile

</span>

</h1>

<p>

Manage your personal information,
track your activity
and continue enjoying your favourite meals.

</p>

<br>

<a href="restaurants">

<button>

<i class="fa-solid fa-utensils"></i>

Order Food

</button>

</a>

</div>

<div
align="center">

<img
src="images/profile-banner.png"
onerror="this.src='images/default-banner.png'">

</div>

</section>

<div
class="profile-wrapper">

<div
class="profile-card">

<div
class="profile-avatar">

<i
class="fa-solid fa-user"></i>

</div>

<h2>

<%=user.getName()%>

</h2>

<p>

FoodApp Customer

</p>

<br>

<button
style="width:100%;">

<i
class="fa-solid fa-pen"></i>

Edit Profile

</button>

</div>

<div
class="info-card">

<h2>

Personal Information

</h2>
<div
class="info-row">

<i
class="fa-solid fa-user"></i>

<div>

<h3>

Full Name

</h3>

<p>

<%=user.getName()%>

</p>

</div>

</div>

<div
class="info-row">

<i
class="fa-solid fa-envelope"></i>

<div>

<h3>

Email Address

</h3>

<p>

<%=user.getEmail()%>

</p>

</div>

</div>

<div
class="info-row">

<i
class="fa-solid fa-location-dot"></i>

<div>

<h3>

Delivery Address

</h3>

<p>

<%=user.getAddress()%>

</p>

</div>

</div>

<div
class="info-row">

<i
class="fa-solid fa-user-tag"></i>

<div>

<h3>

Account Type

</h3>

<p>

Premium FoodApp Customer

</p>

</div>

</div>

<div
style="
display:grid;
grid-template-columns:repeat(auto-fit,minmax(180px,1fr));
gap:20px;
margin-top:35px;">

<div
class="stat-card
text-center">

<i
class="fa-solid fa-bowl-food"
style="
font-size:55px;
color:#ff4d6d;"></i>

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
class="fa-solid fa-motorcycle"
style="
font-size:55px;
color:#3b82f6;"></i>

<h2>

30 Min

</h2>

<p>

Fast Delivery

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

<br><br>

<div
style="
display:flex;
gap:20px;
flex-wrap:wrap;">

<a
href="history"
style="flex:1;">

<button
style="
width:100%;">

<i
class="fa-solid fa-clock-rotate-left"></i>

Order History

</button>

</a>

<a
href="restaurants"
style="flex:1;">

<button
style="
width:100%;
background:#22c55e;">

<i
class="fa-solid fa-utensils"></i>

Continue Ordering

</button>

</a>

</div>

</div>

</div>

<!-- ================= ACCOUNT FEATURES ================= -->

<section
class="section">

<h1
class="section-title">

Account

<span>

Features

</span>

</h1>

<div
class="dashboard-grid">

<div
class="stat-card
text-center">

<i
class="fa-solid fa-shield-halved"
style="
font-size:60px;
color:#22c55e;"></i>

<h2>

Secure Account

</h2>

<p>

Your account is protected with secure authentication.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-bell"
style="
font-size:60px;
color:#f59e0b;"></i>

<h2>

Notifications

</h2>

<p>

Receive order updates and exclusive offers.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-heart"
style="
font-size:60px;
color:#ff4d6d;"></i>

<h2>

Favorite Foods

</h2>

<p>

Quickly reorder your favorite meals.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-headset"
style="
font-size:60px;
color:#3b82f6;"></i>

<h2>

24×7 Support

</h2>

<p>

We're always ready to help you.

</p>

</div>

</div>

</section>

<!-- CONTINUE PART 3 -->
<!-- ================= MEMBER BENEFITS ================= -->

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
font-size:56px;
margin-bottom:20px;">

Premium Member

</h1>

<p
style="
font-size:20px;
line-height:1.8;
margin-bottom:30px;">

Enjoy faster ordering,
exclusive discounts,
cashback rewards
and premium customer support.

</p>

<div
style="
display:flex;
gap:18px;
flex-wrap:wrap;">

<div
style="
background:rgba(255,255,255,.20);
padding:15px 22px;
border-radius:15px;">

🎁 Special Offers

</div>

<div
style="
background:rgba(255,255,255,.20);
padding:15px 22px;
border-radius:15px;">

⚡ Priority Delivery

</div>

<div
style="
background:rgba(255,255,255,.20);
padding:15px 22px;
border-radius:15px;">

💰 Cashback

</div>

</div>

</div>

<div
align="center">

<img
src="images/profile-offer.png"
onerror="this.src='images/default-banner.png'"
style="
width:100%;
max-width:380px;">

</div>

</div>

</section>

<!-- ================= ACCOUNT ACTIVITY ================= -->

<section
class="section">

<h1
class="section-title">

Your

<span>

Activity

</span>

</h1>

<div
class="dashboard-grid">

<div
class="stat-card
text-center">

<i
class="fa-solid fa-utensils"
style="
font-size:55px;
color:#ff4d6d;"></i>

<h2>

Food Orders

</h2>

<p>

Browse and order from hundreds of restaurants.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-wallet"
style="
font-size:55px;
color:#22c55e;"></i>

<h2>

Secure Payments

</h2>

<p>

Protected online payment with multiple options.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-location-dot"
style="
font-size:55px;
color:#3b82f6;"></i>

<h2>

Saved Address

</h2>

<p>

Quick delivery using your saved location.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-gift"
style="
font-size:55px;
color:#f59e0b;"></i>

<h2>

Rewards

</h2>

<p>

Unlock rewards and special discounts regularly.

</p>

</div>

</div>

</section>

<!-- ================= CUSTOMER MESSAGE ================= -->

<section
class="section">

<div
style="
background:white;
padding:70px;
border-radius:35px;
box-shadow:0 15px 40px rgba(0,0,0,.08);
text-align:center;">

<i
class="fa-solid fa-heart"
style="
font-size:80px;
color:#ff4d6d;
margin-bottom:25px;"></i>

<h1
style="
font-size:46px;
margin-bottom:20px;">

Thank You,

<%=user.getName()%>

❤️

</h1>

<p
style="
font-size:20px;
color:#666;
line-height:1.8;
max-width:750px;
margin:auto;">

Thank you for being a valued FoodApp customer.

We are committed to providing delicious food,
fast delivery,
and an outstanding experience every time you order.

</p>

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

Stay Connected

</h1>

<p
style="
font-size:18px;
color:#666;
margin-bottom:35px;">

Subscribe to receive exclusive offers,
new restaurant updates,
cashback rewards and exciting discounts.

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

FoodApp brings together your favourite restaurants,
fast delivery,
secure payments
and an unforgettable food experience.

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

<li><a href="cart.jsp">My Cart</a></li>

<li><a href="profile.jsp">Profile</a></li>

<li><a href="logout">Logout</a></li>

</ul>

</div>

<div>

<h3>

Services

</h3>

<ul>

<li>Online Ordering</li>

<li>Fast Delivery</li>

<li>Secure Payment</li>

<li>Live Order Updates</li>

<li>24 × 7 Support</li>

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

Always Available

</p>

</div>

</div>

<div
class="footer-bottom">

© 2026 FoodApp |
Java Full Stack Project |
Designed with ❤️ by Sai Yaswanth

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

".profile-card,.info-card,.stat-card"

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