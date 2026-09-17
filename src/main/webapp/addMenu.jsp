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

Add Menu Item

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

background:linear-gradient(135deg,#FFF7ED,#ffffff);

}

.hero h1{

font-size:60px;

font-weight:800;

margin-bottom:20px;

line-height:1.2;

}

.hero span{

color:#F97316;

}

.hero p{

font-size:20px;

line-height:1.8;

color:#666;

}

.hero img{

width:100%;

max-width:420px;

animation:floating 4s infinite;

}

.form-box{

width:92%;

max-width:900px;

margin:60px auto;

background:white;

padding:45px;

border-radius:35px;

box-shadow:0 20px 40px rgba(0,0,0,.08);

}

.form-box h2{

font-size:40px;

text-align:center;

margin-bottom:35px;

}

.form-group{

margin-bottom:28px;

}

.form-group label{

display:block;

font-size:17px;

font-weight:600;

margin-bottom:10px;

}

.form-group input,

.form-group select{

width:100%;

padding:18px;

border:2px solid #ececec;

border-radius:15px;

font-size:17px;

transition:.3s;

}

.form-group input:focus,

.form-group select:focus{

border-color:#F97316;

outline:none;

box-shadow:0 0 15px rgba(249,115,22,.18);

}

.btn-row{

display:flex;

gap:20px;

margin-top:35px;

}

</style>

<script>

function validateMenu(){

let price=document.getElementById("price").value;

if(price<=0){

alert("Price must be greater than 0");

return false;

}

return true;

}

function logoutConfirm(){

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

Add New

<span>

Menu Item

</span>

</h1>

<p>

Create delicious menu items
for your restaurants
and make them available to customers instantly.

</p>

</div>

<div
align="center">

<img
src="images/add-menu.png"
onerror="this.src='images/default-banner.png'">

</div>

</section>

<div
class="form-box">

<h2>

Menu Information

</h2>

<form
action="addMenu"
method="post"
onsubmit="return validateMenu()">
<div
class="form-group">

<label>

Select Restaurant

</label>

<select

name="restaurantId"

required>

<option value="">

Choose Restaurant

</option>

<%

for(Restaurant r:restaurants){

%>

<option
value="<%=r.getId()%>">

<%=r.getName()%>

</option>

<%

}

%>

</select>

</div>

<div
class="form-group">

<label>

Menu Item Name

</label>

<input

type="text"

name="itemName"

placeholder="Example : Chicken Biryani"

required>

</div>

<div
class="form-group">

<label>

Price (₹)

</label>

<input

type="number"

id="price"

name="price"

step="0.01"

min="1"

placeholder="Example : 299"

required>

</div>

<div
class="form-group">

<label>

Description

</label>

<input

type="text"

name="description"

placeholder="Enter food description"

required>

</div>

<div
style="
display:grid;
grid-template-columns:repeat(2,1fr);
gap:25px;">

<div
class="stat-card
text-center">

<i
class="fa-solid fa-bowl-food"
style="
font-size:55px;
color:#F97316;"></i>

<h2>

Food Item

</h2>

<p>

Create attractive menu items for customers.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-fire"
style="
font-size:55px;
color:#22C55E;"></i>

<h2>

Instant Live

</h2>

<p>

Customers can order once the menu is added.

</p>

</div>

</div>

<div
class="btn-row">

<button
type="submit"
style="
flex:1;
background:#F97316;">

<i
class="fa-solid fa-plus"></i>

Add Menu Item

</button>

<a
href="admin.jsp"
style="
flex:1;">

<button
type="button"
style="
width:100%;
background:#6366F1;">

<i
class="fa-solid fa-arrow-left"></i>

Dashboard

</button>

</a>

</div>

</form>

</div>

<!-- CONTINUE PART 3 -->
<!-- ================= MENU FEATURES ================= -->

<section
class="section">

<div
style="
background:linear-gradient(135deg,#F97316,#FB923C);
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

Create Delicious Menu

</h1>

<p
style="
font-size:20px;
line-height:1.8;
margin-bottom:30px;">

Add mouth-watering dishes,
update restaurant menus,
and provide customers with a rich dining experience.

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

🍔 Unlimited Menu

</div>

<div
style="
background:rgba(255,255,255,.20);
padding:15px 22px;
border-radius:15px;">

💰 Flexible Pricing

</div>

<div
style="
background:rgba(255,255,255,.20);
padding:15px 22px;
border-radius:15px;">

⭐ Better Experience

</div>

</div>

</div>

<div
align="center">

<img
src="images/menu-admin.png"
onerror="this.src='images/default-banner.png'"
style="
width:100%;
max-width:380px;">

</div>

</div>

</section>

<!-- ================= MENU GUIDELINES ================= -->

<section
class="section">

<h1
class="section-title">

Menu

<span>

Guidelines

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
color:#F97316;"></i>

<h2>

Food Name

</h2>

<p>

Use attractive and meaningful food names.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-money-bill-wave"
style="
font-size:60px;
color:#22C55E;"></i>

<h2>

Pricing

</h2>

<p>

Keep pricing accurate for customers.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-file-lines"
style="
font-size:60px;
color:#3B82F6;"></i>

<h2>

Description

</h2>

<p>

Write short and appealing food descriptions.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-circle-check"
style="
font-size:60px;
color:#EC4899;"></i>

<h2>

Ready

</h2>

<p>

New menu items appear instantly after saving.

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

Menu Item Ready

</h1>

<p
style="
font-size:18px;
color:#666;
margin-bottom:35px;">

Your menu item can now be added to the restaurant.
Continue managing restaurants or create more menu items.

</p>

<div
style="
display:flex;
justify-content:center;
gap:20px;
flex-wrap:wrap;">

<a
href="addMenu.jsp">

<button
style="
padding:18px 35px;
background:#F97316;">

<i
class="fa-solid fa-plus"></i>

Add Another Menu

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
href="deleteMenu.jsp">

<button
style="
padding:18px 35px;
background:#22C55E;">

<i
class="fa-solid fa-list"></i>

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

Menu Management Module

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
Menu Management Module

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

".stat-card,.form-box"

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