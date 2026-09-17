<%@ page import="java.util.List"%>
<%@ page import="com.food.model.Restaurant"%>
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

List<Restaurant> restaurants=
(List<Restaurant>)request.getAttribute("restaurants");

List<Integer> cart=
(List<Integer>)session.getAttribute("cart");

int cartCount=(cart==null)?0:cart.size();
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>

Explore Restaurants | FoodApp

</title>

<meta
name="viewport"
content="width=device-width, initial-scale=1.0">

<link
rel="stylesheet"
href="css/style.css?v=2.0">

<link
rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.restaurant-banner{

padding:120px 8%;

display:flex;

justify-content:space-between;

align-items:center;

background:

linear-gradient(135deg,#fff5f7,#ffffff);

overflow:hidden;

}

.banner-left{

width:55%;

animation:fadeUp .8s ease;

}

.banner-left h1{

font-size:65px;

font-weight:800;

line-height:1.2;

margin-bottom:25px;

}

.banner-left h1 span{

color:#ff4d6d;

}

.banner-left p{

font-size:19px;

line-height:1.8;

color:#666;

margin-bottom:35px;

}

.banner-right{

width:40%;

text-align:center;

}

.banner-right img{

width:100%;

max-width:520px;

animation:floating 5s infinite;

}

.search-area{

margin-top:40px;

display:flex;

justify-content:center;

}

.search-area form{

width:700px;

display:flex;

background:white;

border-radius:60px;

overflow:hidden;

box-shadow:0 18px 35px rgba(0,0,0,.08);

}

.search-area input{

flex:1;

padding:20px;

border:none;

font-size:17px;

outline:none;

}

.search-area button{

border-radius:0;

padding:20px 35px;

}

.restaurant-title{

text-align:center;

font-size:48px;

font-weight:700;

margin-top:70px;

}

.restaurant-title span{

color:#ff4d6d;

}

.filter-bar{

display:flex;

justify-content:center;

gap:15px;

flex-wrap:wrap;

margin:40px 0;

}

.filter-chip{

padding:12px 25px;

background:white;

border-radius:40px;

cursor:pointer;

font-weight:600;

transition:.3s;

box-shadow:0 10px 20px rgba(0,0,0,.06);

}

.filter-chip:hover{

background:#ff4d6d;

color:white;

transform:translateY(-4px);

}

.restaurant-grid{

display:grid;

grid-template-columns:

repeat(auto-fit,minmax(340px,1fr));

gap:35px;

padding:20px 8% 80px;

}

.restaurant-card{

background:white;

border-radius:28px;

overflow:hidden;

box-shadow:0 15px 35px rgba(0,0,0,.08);

transition:.35s;

position:relative;

}

.restaurant-card:hover{

transform:translateY(-12px);

box-shadow:0 25px 45px rgba(0,0,0,.16);

}

.restaurant-image{

height:240px;

overflow:hidden;

position:relative;

}

.restaurant-image img{

width:100%;

height:100%;

object-fit:cover;

transition:.5s;

}

.restaurant-card:hover .restaurant-image img{

transform:scale(1.08);

}

.offer-badge{

position:absolute;

top:18px;

left:18px;

padding:8px 16px;

border-radius:30px;

background:linear-gradient(135deg,#ff4d6d,#ff6b35);

color:white;

font-size:13px;

font-weight:700;

}

.favorite{

position:absolute;

top:18px;

right:18px;

width:48px;

height:48px;

border-radius:50%;

background:white;

display:flex;

justify-content:center;

align-items:center;

font-size:20px;

cursor:pointer;

box-shadow:0 10px 25px rgba(0,0,0,.15);

transition:.3s;

}

.favorite:hover{

background:#ff4d6d;

color:white;

}

.restaurant-body{

padding:28px;

}

.restaurant-body h2{

font-size:30px;

margin-bottom:15px;

}

.info-row{

display:flex;

justify-content:space-between;

margin-bottom:22px;

}

.rating{

background:#16a34a;

color:white;

padding:8px 18px;

border-radius:25px;

font-size:14px;

font-weight:700;

}

.category{

background:#eef2ff;

padding:8px 18px;

border-radius:25px;

font-size:14px;

font-weight:600;

}

.delivery{

margin:18px 0;

display:flex;

justify-content:space-between;

font-size:15px;

color:#555;

}

.restaurant-body button{

width:100%;

padding:16px;

font-size:17px;

}

</style>

</head>

<body>

<!--================ NAVBAR ================-->

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

<!--================ HERO ================-->

<section class="restaurant-banner">

<div class="banner-left">

<h1>

Discover

<span>

Amazing Food

</span>

Near You

</h1>

<p>

Choose from premium restaurants,
exclusive offers,
fast delivery and freshly prepared meals.

</p>

<a href="#restaurants">

<button>

Explore Now

</button>

</a>

</div>

<div class="banner-right">

<img
src="images/restaurant-banner.png">

</div>

</section>

<!--================ SEARCH ================-->

<div class="search-area">

<form action="restaurants">

<input

type="text"

name="search"

placeholder="Search restaurants, pizza, biryani, burger...">

<button>

<i class="fa-solid fa-magnifying-glass"></i>

</button>

</form>

</div>

<h1
class="restaurant-title"
id="restaurants">

Popular

<span>

Restaurants

</span>

</h1>

<div class="filter-bar">

<div class="filter-chip">

All

</div>

<div class="filter-chip">

Pizza

</div>

<div class="filter-chip">

Burger

</div>

<div class="filter-chip">

Biryani

</div>

<div class="filter-chip">

Chinese

</div>

<div class="filter-chip">

Desserts

</div>

</div>

<div class="restaurant-grid">

<%
if(restaurants!=null){

for(Restaurant r:restaurants){
%>
<div class="restaurant-card">

<div class="restaurant-image">

<div class="offer-badge">

50% OFF

</div>

<div class="favorite">

<i class="fa-regular fa-heart"></i>

</div>

<img
src="images/<%=r.getImage()%>"
alt="<%=r.getName()%>">

</div>

<div class="restaurant-body">

<h2>

<%=r.getName()%>

</h2>

<div class="info-row">

<span class="category">

<i class="fa-solid fa-utensils"></i>

<%=r.getCategory()%>

</span>

<span class="rating">

<i class="fa-solid fa-star"></i>

<%=r.getRating()%>

</span>

</div>

<div class="delivery">

<span>

<i class="fa-solid fa-clock"></i>

25-35 min

</span>

<span>

<i class="fa-solid fa-motorcycle"></i>

Free Delivery

</span>

</div>

<div
style="
display:flex;
justify-content:space-between;
align-items:center;
margin:20px 0;">

<div>

<p
style="
font-size:15px;
color:#777;">

Starting From

</p>

<h3
style="
font-size:28px;
color:#ff4d6d;">

&#8377;99

</h3>

</div>

<div
style="
display:flex;
gap:10px;">

<span
style="
padding:8px 12px;
background:#FFF4E5;
border-radius:20px;
font-size:13px;
font-weight:600;">

🔥 Trending

</span>

</div>

</div>

<div
style="
display:flex;
gap:12px;">

<a
href="menu?restaurantId=<%=r.getId()%>"
style="flex:1;">

<button
style="width:100%;">

<i class="fa-solid fa-book-open"></i>

View Menu

</button>

</a>

<a
href="#"
style="width:60px;">

<button
style="
width:60px;
padding:15px;">

<i class="fa-solid fa-share-nodes"></i>

</button>

</a>

</div>

</div>

</div>

<%

}

}

else{

%>

<div
style="
grid-column:1/-1;
text-align:center;
padding:80px;">

<img
src="images/no-data.png"
style="
width:220px;
margin-bottom:25px;">

<h2>

No Restaurants Found

</h2>

<p
style="
margin-top:15px;
color:#666;">

Try searching with another keyword.

</p>

</div>

<%

}

%>

</div>

<!-- ================= FEATURE STRIP ================= -->

<section
class="section">

<div
style="
display:grid;
grid-template-columns:repeat(4,1fr);
gap:30px;">

<div
class="stat-card
text-center">

<i
class="fa-solid fa-bowl-food"></i>

<h1>

150+

</h1>

<h3>

Restaurants

</h3>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-burger"></i>

<h1>

600+

</h1>

<h3>

Menu Items

</h3>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-users"></i>

<h1>

25K+

</h1>

<h3>

Customers

</h3>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-truck-fast"></i>

<h1>

50K+

</h1>

<h3>

Orders Delivered

</h3>

</div>

</div>

</section>

<!-- CONTINUE PART 3 -->
<!-- ================= WHY ORDER FROM US ================= -->

<section
class="section">

<h1
class="section-title">

Why Customers

<span>

Love FoodApp

</span>

</h1>

<p
class="section-subtitle">

Premium food delivery experience with trusted restaurants.

</p>

<div
class="container">

<div
class="card">

<div
class="card-content text-center">

<i
class="fa-solid fa-bolt"
style="font-size:60px;color:#ff4d6d;"></i>

<h2>

Lightning Fast

</h2>

<p>

Average delivery in under 30 minutes with live order tracking.

</p>

</div>

</div>

<div
class="card">

<div
class="card-content text-center">

<i
class="fa-solid fa-shield-heart"
style="font-size:60px;color:#ff4d6d;"></i>

<h2>

100% Safe

</h2>

<p>

Verified restaurants with fresh ingredients and hygienic preparation.

</p>

</div>

</div>

<div
class="card">

<div
class="card-content text-center">

<i
class="fa-solid fa-tags"
style="font-size:60px;color:#ff4d6d;"></i>

<h2>

Best Offers

</h2>

<p>

Daily discounts, cashback and exclusive festival coupons.

</p>

</div>

</div>

</div>

</section>

<!-- ================= APP PROMOTION ================= -->

<section
class="section">

<div
style="
background:
linear-gradient(135deg,#ff4d6d,#ff6b35);
padding:70px;
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

Order Food

In Seconds

</h1>

<p
style="
font-size:20px;
line-height:1.8;
margin-bottom:30px;">

Download the FoodApp mobile application
and enjoy seamless ordering,
live tracking,
exclusive app discounts
and faster checkout.

</p>

<div
style="
display:flex;
gap:20px;
flex-wrap:wrap;">

<button
style="
background:white;
color:#ff4d6d;">

<i class="fa-brands fa-google-play"></i>

Google Play

</button>

<button
style="
background:black;">

<i class="fa-brands fa-apple"></i>

App Store

</button>

</div>

</div>

<div
class="text-center">

<img
src="images/mobile-app.png"
style="
width:100%;
max-width:420px;">

</div>

</div>

</section>

<!-- ================= CUSTOMER REVIEWS ================= -->

<section
class="section">

<h1
class="section-title">

Customer

<span>

Reviews

</span>

</h1>

<div
class="container">

<div
class="card">

<div
class="card-content">

<div
style="
display:flex;
align-items:center;
gap:18px;">

<img
src="images/users/user1.jpg"
style="
width:70px;
height:70px;
border-radius:50%;">

<div>

<h3>

Rahul Sharma

</h3>

⭐⭐⭐⭐⭐

</div>

</div>

<br>

<p>

Excellent delivery service.

The food arrived hot and exactly on time.

Highly recommended!

</p>

</div>

</div>

<div
class="card">

<div
class="card-content">

<div
style="
display:flex;
align-items:center;
gap:18px;">

<img
src="images/users/user2.jpg"
style="
width:70px;
height:70px;
border-radius:50%;">

<div>

<h3>

Priya Reddy

</h3>

⭐⭐⭐⭐⭐

</div>

</div>

<br>

<p>

Beautiful interface.

Ordering food is simple,
smooth and enjoyable.

</p>

</div>

</div>

<div
class="card">

<div
class="card-content">

<div
style="
display:flex;
align-items:center;
gap:18px;">

<img
src="images/users/user3.jpg"
style="
width:70px;
height:70px;
border-radius:50%;">

<div>

<h3>

Arjun Kumar

</h3>

⭐⭐⭐⭐⭐

</div>

</div>

<br>

<p>

Fast checkout,
great restaurant selection
and excellent customer support.

</p>

</div>

</div>

</div>

<!-- ================= NEWSLETTER ================= -->

<section
class="section">

<div
style="
background:white;
padding:70px;
border-radius:30px;
box-shadow:0 15px 40px rgba(0,0,0,.08);
text-align:center;">

<h1>

Get Exclusive Offers

</h1>

<p
style="
margin:20px 0;
font-size:18px;
color:#666;">

Subscribe to receive discounts and new restaurant updates.

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

<!-- CONTINUE PART 4 -->
<!-- ================= FOOTER ================= -->

<footer
class="footer">

<div
class="footer-grid">

<!-- ABOUT -->

<div>

<h2>

<i class="fa-solid fa-bowl-food"></i>

FoodApp

</h2>

<p>

FoodApp is a premium online food ordering
platform built using Java, JSP,
Servlets and MySQL.

Experience fast delivery,
beautiful interface,
secure payments and
your favourite restaurants
all in one place.

</p>

<div class="social">

<i class="fa-brands fa-facebook-f"></i>

<i class="fa-brands fa-instagram"></i>

<i class="fa-brands fa-x-twitter"></i>

<i class="fa-brands fa-linkedin-in"></i>

<i class="fa-brands fa-youtube"></i>

</div>

</div>

<!-- LINKS -->

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

<!-- SERVICES -->

<div>

<h3>

Services

</h3>

<ul>

<li>Online Ordering</li>

<li>Live Tracking</li>

<li>Fast Delivery</li>

<li>Secure Payments</li>

<li>24×7 Support</li>

<li>Restaurant Partners</li>

</ul>

</div>

<!-- CONTACT -->

<div>

<h3>

Contact Us

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

Always Open

</p>

</div>

</div>

<div class="footer-bottom">

© 2026 FoodApp

&nbsp;|&nbsp;

Built with ❤️ using Java, JSP, Servlets & MySQL

</div>

</footer>

<!-- ================= FLOATING CART ================= -->

<%

if(cartCount>0){

%>

<a
href="cart.jsp"
class="cart-floating">

<i
class="fa-solid fa-cart-shopping"></i>

</a>

<%

}

%>

<!-- ================= BACK TO TOP ================= -->

<button

id="topBtn"

style="
position:fixed;
bottom:120px;
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

let topBtn=document.getElementById("topBtn");

if(document.documentElement.scrollTop>300){

topBtn.style.display="block";

}else{

topBtn.style.display="none";

}

}

document.getElementById("topBtn").onclick=function(){

window.scrollTo({

top:0,

behavior:"smooth"

});

}

document.querySelectorAll(".favorite").forEach(btn=>{

btn.addEventListener("click",function(){

let icon=this.querySelector("i");

icon.classList.toggle("fa-regular");

icon.classList.toggle("fa-solid");

icon.style.color="#ff4d6d";

});

});

const cards=document.querySelectorAll(

".restaurant-card,.card,.stat-card"

);

const observer=new IntersectionObserver(

entries=>{

entries.forEach(entry=>{

if(entry.isIntersecting){

entry.target.style.opacity="1";

entry.target.style.transform="translateY(0)";

}

});

},

{

threshold:.15

}

);

cards.forEach(card=>{

card.style.opacity="0";

card.style.transform="translateY(60px)";

card.style.transition=".8s";

observer.observe(card);

});

</script>

</body>

</html>