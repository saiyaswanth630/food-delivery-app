<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.food.dao.RestaurantDAO"%>
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

if(!"ADMIN".equalsIgnoreCase(user.getRole())){

response.sendRedirect("restaurants");

return;

}

RestaurantDAO dao=new RestaurantDAO();

List<Restaurant> restaurants=dao.getAllRestaurants();
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>

Manage Restaurants

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

.hero{

padding:90px 8%;

display:grid;

grid-template-columns:1fr 1fr;

align-items:center;

gap:60px;

background:linear-gradient(135deg,#fff5f7,#ffffff);

}

.hero h1{

font-size:62px;

font-weight:800;

margin-bottom:20px;

}

.hero span{

color:#ef4444;

}

.hero p{

font-size:20px;

line-height:1.8;

color:#666;

}

.hero img{

width:100%;

max-width:430px;

animation:floating 4s infinite;

}

.restaurant-grid{

width:92%;

margin:60px auto;

display:grid;

grid-template-columns:repeat(auto-fit,minmax(340px,1fr));

gap:35px;

}

.restaurant-card{

background:white;

border-radius:30px;

overflow:hidden;

box-shadow:0 20px 40px rgba(0,0,0,.08);

transition:.35s;

}

.restaurant-card:hover{

transform:translateY(-10px);

box-shadow:0 25px 45px rgba(0,0,0,.15);

}

.restaurant-card img{

width:100%;

height:240px;

object-fit:cover;

}

.restaurant-body{

padding:28px;

}

.restaurant-body h2{

font-size:30px;

margin-bottom:15px;

}

.badge{

display:inline-block;

padding:8px 18px;

border-radius:30px;

background:#ECFDF5;

color:#15803d;

font-weight:700;

margin:8px 0;

}

.action-row{

display:flex;

gap:15px;

margin-top:25px;

}

</style>

<script>

function confirmDelete(name){

return confirm(

"Delete '"+name+"' permanently?"

);

}

function logoutConfirm(){

return confirm(

"Logout from Admin Panel?"

);

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

<a href="admin.jsp">

Dashboard

</a>

<a href="logout"

onclick="return logoutConfirm()">

Logout

</a>

</div>

</nav>

<section
class="hero">

<div>

<h1>

Manage

<span>

Restaurants

</span>

</h1>

<p>

Edit existing restaurants
or permanently remove restaurants
from the FoodApp platform.

</p>

</div>

<div
align="center">

<img
src="images/manage-restaurants.png"
onerror="this.src='images/default-banner.png'">

</div>

</section>

<div
class="restaurant-grid">

<%

if(restaurants!=null){

for(Restaurant r:restaurants){

%>
<div
class="restaurant-card">

<img
src="images/<%=r.getImage()%>"
alt="<%=r.getName()%>">

<div
class="restaurant-body">

<h2>

<%=r.getName()%>

</h2>

<div
style="
display:flex;
justify-content:space-between;
align-items:center;
margin:18px 0;">

<span
style="
background:#EEF2FF;
padding:8px 18px;
border-radius:25px;
font-weight:600;">

<i
class="fa-solid fa-utensils"></i>

<%=r.getCategory()%>

</span>

<span
style="
background:#FEF3C7;
padding:8px 18px;
border-radius:25px;
font-weight:700;
color:#b45309;">

⭐

<%=r.getRating()%>

</span>

</div>

<p
style="
color:#666;
line-height:1.8;
margin:20px 0;">

Manage this restaurant,
update its details
or permanently remove it from FoodApp.

</p>

<div
class="badge">

<i
class="fa-solid fa-circle-check"></i>

Restaurant Active

</div>

<div
class="action-row">

<a
href="editRestaurant.jsp?id=<%=r.getId()%>"
style="flex:1;">

<button
style="
width:100%;
background:#3B82F6;">

<i
class="fa-solid fa-pen"></i>

Edit

</button>

</a>

<a
href="deleteRestaurant?id=<%=r.getId()%>"
onclick="return confirmDelete('<%=r.getName()%>')"
style="flex:1;">

<button
style="
width:100%;
background:#EF4444;">

<i
class="fa-solid fa-trash"></i>

Delete

</button>

</a>

</div>

</div>

</div>

<%

}

}else{

%>

<div
style="
grid-column:1/-1;
background:white;
padding:80px;
border-radius:30px;
text-align:center;
box-shadow:0 15px 35px rgba(0,0,0,.08);">

<i
class="fa-solid fa-store-slash"
style="
font-size:90px;
color:#EF4444;"></i>

<br><br>

<h1>

No Restaurants Found

</h1>

<br>

<p
style="
font-size:18px;
color:#666;">

Start by adding your first restaurant.

</p>

<br><br>

<a
href="addRestaurant.jsp">

<button>

<i
class="fa-solid fa-plus"></i>

Add Restaurant

</button>

</a>

</div>

<%

}

%>

</div>

<!-- CONTINUE PART 3 -->
<!-- ================= ADMIN FEATURES ================= -->

<section
class="section">

<div
style="
background:linear-gradient(135deg,#EF4444,#F97316);
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

Restaurant Control

</h1>

<p
style="
font-size:20px;
line-height:1.8;
margin-bottom:30px;">

Manage every restaurant from one place.

Update restaurant information,
remove inactive restaurants
and keep your platform organized.

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

🏪 Restaurant List

</div>

<div
style="
background:rgba(255,255,255,.20);
padding:15px 22px;
border-radius:15px;">

✏ Edit Anytime

</div>

<div
style="
background:rgba(255,255,255,.20);
padding:15px 22px;
border-radius:15px;">

🗑 Delete Safely

</div>

</div>

</div>

<div
align="center">

<img
src="images/manage-admin.png"
onerror="this.src='images/default-banner.png'"
style="
width:100%;
max-width:380px;">

</div>

</div>

</section>

<!-- ================= QUICK INFORMATION ================= -->

<section
class="section">

<h1
class="section-title">

Management

<span>

Tips

</span>

</h1>

<div
class="dashboard-grid">

<div
class="stat-card
text-center">

<i
class="fa-solid fa-store"
style="
font-size:60px;
color:#3B82F6;"></i>

<h2>

Restaurants

</h2>

<p>

Manage every restaurant registered in FoodApp.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-pen-to-square"
style="
font-size:60px;
color:#22C55E;"></i>

<h2>

Update

</h2>

<p>

Keep restaurant information accurate.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-trash"
style="
font-size:60px;
color:#EF4444;"></i>

<h2>

Delete

</h2>

<p>

Remove restaurants that are no longer active.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-shield-halved"
style="
font-size:60px;
color:#F59E0B;"></i>

<h2>

Secure

</h2>

<p>

Only administrators can modify restaurant records.

</p>

</div>

</div>

</section>

<!-- CONTINUE PART 4 -->
<!-- ================= ADMIN ACTIONS ================= -->

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

Restaurant Management Complete

</h1>

<p
style="
font-size:18px;
color:#666;
margin-bottom:35px;">

You can continue managing restaurants
or switch to menu management using the options below.

</p>

<div
style="
display:flex;
justify-content:center;
gap:20px;
flex-wrap:wrap;">

<a
href="addRestaurant.jsp">

<button
style="
padding:18px 35px;">

<i
class="fa-solid fa-plus"></i>

Add Restaurant

</button>

</a>

<a
href="admin.jsp">

<button
style="
padding:18px 35px;
background:#6366F1;">

<i
class="fa-solid fa-house"></i>

Dashboard

</button>

</a>

<a
href="addMenu.jsp">

<button
style="
padding:18px 35px;
background:#22C55E;">

<i
class="fa-solid fa-utensils"></i>

Manage Menu

</button>

</a>

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

<i
class="fa-solid fa-user-shield"></i>

FoodApp Admin

</h2>

<p>

Restaurant Management Module

Java • JSP • Servlets • MySQL

</p>

<div
class="social">

<i class="fa-brands fa-facebook-f"></i>

<i class="fa-brands fa-instagram"></i>

<i class="fa-brands fa-linkedin-in"></i>

<i class="fa-brands fa-x-twitter"></i>

</div>

</div>

<div>

<h3>

Restaurant

</h3>

<ul>

<li><a href="addRestaurant.jsp">Add Restaurant</a></li>

<li><a href="editRestaurant.jsp">Edit Restaurant</a></li>

<li><a href="deleteRestaurant.jsp">Manage Restaurants</a></li>

</ul>

</div>

<div>

<h3>

Menu

</h3>

<ul>

<li><a href="addMenu.jsp">Add Menu</a></li>

<li><a href="editMenu.jsp">Edit Menu</a></li>

<li><a href="deleteMenu.jsp">Manage Menu</a></li>

</ul>

</div>

<div>

<h3>

Administrator

</h3>

<p>

<i class="fa-solid fa-user"></i>

<%=user.getName()%>

</p>

<br>

<p>

<i class="fa-solid fa-shield-halved"></i>

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
Restaurant Management

</div>

</footer>

<!-- ================= BACK TO TOP ================= -->

<button

id="topBtn"

style="
position:fixed;
bottom:35px;
right:35px;
width:60px;
height:60px;
border-radius:50%;
display:none;
z-index:999;">

<i
class="fa-solid fa-arrow-up"></i>

</button>

<script>

window.onscroll=function(){

const btn=document.getElementById("topBtn");

btn.style.display=

document.documentElement.scrollTop>300?

"block":"none";

};

document.getElementById("topBtn").onclick=function(){

window.scrollTo({

top:0,

behavior:"smooth"

});

};

const cards=document.querySelectorAll(

".restaurant-card,.stat-card"

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