<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.food.dao.AdminDAO"%>
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

if(!"ADMIN".equalsIgnoreCase(user.getRole())){

response.sendRedirect("restaurants");

return;

}

AdminDAO dao=new AdminDAO();

int restaurants=dao.getRestaurantCount();

int menus=dao.getMenuCount();

int customers=dao.getCustomerCount();

int orders=dao.getOrderCount();

String msg=request.getParameter("msg");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>

FoodApp Admin

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

.admin-hero{

padding:90px 8%;

display:grid;

grid-template-columns:1fr 1fr;

align-items:center;

gap:60px;

background:

linear-gradient(135deg,#fff5f7,#ffffff);

}

.admin-hero h1{

font-size:65px;

font-weight:800;

margin-bottom:20px;

line-height:1.2;

}

.admin-hero span{

color:#ff4d6d;

}

.admin-hero p{

font-size:20px;

line-height:1.8;

color:#666;

}

.admin-hero img{

width:100%;

max-width:470px;

animation:floating 4s infinite;

}

.stats{

width:92%;

margin:60px auto;

display:grid;

grid-template-columns:repeat(auto-fit,minmax(260px,1fr));

gap:30px;

}

.stat{

padding:35px;

border-radius:30px;

color:white;

box-shadow:0 20px 40px rgba(0,0,0,.12);

transition:.35s;

position:relative;

overflow:hidden;

}

.stat:hover{

transform:translateY(-10px);

}

.stat i{

font-size:60px;

opacity:.25;

position:absolute;

right:25px;

bottom:20px;

}

.stat h4{

font-size:18px;

margin-bottom:15px;

}

.stat h1{

font-size:52px;

}

.s1{

background:linear-gradient(135deg,#6366F1,#8B5CF6);

}

.s2{

background:linear-gradient(135deg,#10B981,#22C55E);

}

.s3{

background:linear-gradient(135deg,#F59E0B,#FB923C);

}

.s4{

background:linear-gradient(135deg,#EC4899,#F43F5E);

}

.manage{

width:92%;

margin:60px auto;

display:grid;

grid-template-columns:repeat(auto-fit,minmax(300px,1fr));

gap:35px;

}

.manage-card{

background:white;

padding:40px;

border-radius:30px;

text-align:center;

box-shadow:0 15px 35px rgba(0,0,0,.08);

transition:.35s;

}

.manage-card:hover{

transform:translateY(-10px);

box-shadow:0 20px 45px rgba(0,0,0,.15);

}

.manage-card i{

font-size:70px;

color:#ff4d6d;

margin-bottom:25px;

}

.manage-card h2{

margin-bottom:15px;

}

.manage-card p{

color:#666;

line-height:1.8;

margin-bottom:25px;

}

</style>

<script>

function logout(){

return confirm("Logout from Admin Panel?");

}

</script>

</head>

<body>

<nav class="navbar">

<h2>

<i class="fa-solid fa-user-shield"></i>

FoodApp Admin

</h2>

<div class="nav-links">

<a href="restaurants">

Home

</a>

<a href="logout"

onclick="return logout()">

Logout

</a>

</div>

</nav>

<%

if(msg!=null){

%>

<div class="success">

<%=msg%>

</div>

<%

}

%>

<section
class="admin-hero">

<div>

<h1>

Welcome

<span>

Admin

</span>

</h1>

<p>

Manage restaurants,
menus,
customers
and orders
from one powerful dashboard.

</p>

</div>

<div
align="center">

<img
src="images/admin-banner.png"
onerror="this.src='images/default-banner.png'">

</div>

</section>
<div
class="stats">

<div
class="stat s1">

<h4>

Total Restaurants

</h4>

<h1>

<%=restaurants%>

</h1>

<i
class="fa-solid fa-store"></i>

</div>

<div
class="stat s2">

<h4>

Menu Items

</h4>

<h1>

<%=menus%>

</h1>

<i
class="fa-solid fa-utensils"></i>

</div>

<div
class="stat s3">

<h4>

Customers

</h4>

<h1>

<%=customers%>

</h1>

<i
class="fa-solid fa-users"></i>

</div>

<div
class="stat s4">

<h4>

Orders

</h4>

<h1>

<%=orders%>

</h1>

<i
class="fa-solid fa-cart-shopping"></i>

</div>

</div>

<!-- ================= MANAGEMENT ================= -->

<section
class="section">

<h1
class="section-title">

Management

<span>

Center

</span>

</h1>

<p
class="section-subtitle">

Manage every part of your FoodApp from one place.

</p>

<div
class="manage">

<div
class="manage-card">

<i
class="fa-solid fa-store"></i>

<h2>

Restaurant Management

</h2>

<p>

Add new restaurants,
edit restaurant details
or remove inactive restaurants.

</p>

<a
href="addRestaurant.jsp">

<button
style="width:100%;">

<i
class="fa-solid fa-plus"></i>

Add Restaurant

</button>

</a>

<br><br>

<a
href="deleteRestaurant.jsp">

<button
style="
width:100%;
background:#ef4444;">

<i
class="fa-solid fa-trash"></i>

Manage Restaurants

</button>

</a>

</div>

<div
class="manage-card">

<i
class="fa-solid fa-utensils"></i>

<h2>

Menu Management

</h2>

<p>

Create menu items,
update food information
and remove unavailable dishes.

</p>

<a
href="addMenu.jsp">

<button
style="width:100%;">

<i
class="fa-solid fa-plus"></i>

Add Menu

</button>

</a>

<br><br>

<a
href="deleteMenu.jsp">

<button
style="
width:100%;
background:#ef4444;">

<i
class="fa-solid fa-trash"></i>

Manage Menu

</button>

</a>

</div>

</div>

</section>

<!-- ================= DASHBOARD ANALYTICS ================= -->

<section
class="section">

<h1
class="section-title">

Dashboard

<span>

Analytics

</span>

</h1>

<div
class="dashboard-grid">

<div
class="stat-card
text-center">

<i
class="fa-solid fa-chart-line"
style="
font-size:60px;
color:#3b82f6;"></i>

<h2>

Growth

</h2>

<p>

Monitor business performance and platform growth.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-user-group"
style="
font-size:60px;
color:#22c55e;"></i>

<h2>

Users

</h2>

<p>

Track registered customers and active users.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-money-bill-trend-up"
style="
font-size:60px;
color:#f59e0b;"></i>

<h2>

Revenue

</h2>

<p>

Analyze orders and improve business performance.

</p>

</div>

</div>

</section>

<!-- CONTINUE PART 3 -->
<!-- ================= ADMIN FEATURES ================= -->

<section
class="section">

<div
style="
background:linear-gradient(135deg,#6366F1,#8B5CF6);
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

Powerful Admin Panel

</h1>

<p
style="
font-size:20px;
line-height:1.8;
margin-bottom:30px;">

Manage restaurants,
menus,
orders,
and customers
through one modern dashboard.

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

🍽 Restaurant Control

</div>

<div
style="
background:rgba(255,255,255,.20);
padding:15px 22px;
border-radius:15px;">

📋 Menu Management

</div>

<div
style="
background:rgba(255,255,255,.20);
padding:15px 22px;
border-radius:15px;">

📦 Order Tracking

</div>

</div>

</div>

<div
align="center">

<img
src="images/admin-dashboard.png"
onerror="this.src='images/default-banner.png'"
style="
width:100%;
max-width:420px;">

</div>

</div>

</section>

<!-- ================= QUICK ACTIONS ================= -->

<section
class="section">

<h1
class="section-title">

Quick

<span>

Actions

</span>

</h1>

<div
class="dashboard-grid">

<div
class="stat-card
text-center">

<i
class="fa-solid fa-plus"
style="
font-size:60px;
color:#22c55e;"></i>

<h2>

Create

</h2>

<p>

Add restaurants and menu items quickly.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-pen-to-square"
style="
font-size:60px;
color:#3b82f6;"></i>

<h2>

Update

</h2>

<p>

Modify restaurant and menu information.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-trash"
style="
font-size:60px;
color:#ef4444;"></i>

<h2>

Delete

</h2>

<p>

Remove outdated restaurants and menu items.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-chart-pie"
style="
font-size:60px;
color:#f59e0b;"></i>

<h2>

Statistics

</h2>

<p>

Monitor application performance instantly.

</p>

</div>

</div>

</section>

<!-- ================= ADMIN MESSAGE ================= -->

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
class="fa-solid fa-user-shield"
style="
font-size:80px;
color:#6366F1;
margin-bottom:25px;">

</i>

<h1
style="
font-size:46px;
margin-bottom:20px;">

Welcome,

<%=user.getName()%>

</h1>

<p
style="
font-size:20px;
color:#666;
line-height:1.8;
max-width:750px;
margin:auto;">

Use this dashboard to efficiently manage your restaurants,
menus,
customers,
and orders.

Every update you make is reflected throughout the application.

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

Admin Updates

</h1>

<p
style="
font-size:18px;
color:#666;
margin-bottom:35px;">

Manage your restaurants,
menus,
customers and orders
from one modern dashboard.

</p>

<div
style="
display:flex;
justify-content:center;
gap:15px;
flex-wrap:wrap;">

<input

type="text"

placeholder="Search Restaurant or Menu"

style="
width:420px;
padding:18px;
border:2px solid #eee;
border-radius:50px;
font-size:17px;
outline:none;">

<button>

Search

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

<i class="fa-solid fa-user-shield"></i>

FoodApp Admin

</h2>

<p>

Manage restaurants,
menus,
customers and orders
through one powerful dashboard.

</p>

<div
class="social">

<i class="fa-brands fa-facebook-f"></i>

<i class="fa-brands fa-instagram"></i>

<i class="fa-brands fa-linkedin-in"></i>

<i class="fa-brands fa-x-twitter"></i>

<i class="fa-brands fa-youtube"></i>

</div>

</div>

<div>

<h3>

Restaurant

</h3>

<ul>

<li><a href="addRestaurant.jsp">Add Restaurant</a></li>

<li><a href="editRestaurant.jsp">Edit Restaurant</a></li>

<li><a href="deleteRestaurant.jsp">Delete Restaurant</a></li>

</ul>

</div>

<div>

<h3>

Menu

</h3>

<ul>

<li><a href="addMenu.jsp">Add Menu</a></li>

<li><a href="editMenu.jsp">Edit Menu</a></li>

<li><a href="deleteMenu.jsp">Delete Menu</a></li>

</ul>

</div>

<div>

<h3>

System</h3>

<p>

<i class="fa-solid fa-user"></i>

<%=user.getName()%>

</p>

<br>

<p>

<i class="fa-solid fa-user-shield"></i>

Administrator

</p>

<br>

<p>

<i class="fa-solid fa-clock"></i>

System Online

</p>

</div>

</div>

<div
class="footer-bottom">

© 2026 FoodApp Admin Panel |
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

".stat,.manage-card,.stat-card"

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