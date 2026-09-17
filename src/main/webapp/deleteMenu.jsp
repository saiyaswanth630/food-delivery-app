<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.food.dao.RestaurantDAO"%>
<%@ page import="com.food.dao.MenuDAO"%>
<%@ page import="com.food.model.Restaurant"%>
<%@ page import="com.food.model.Menu"%>
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

RestaurantDAO restaurantDAO=new RestaurantDAO();

List<Restaurant> restaurants=restaurantDAO.getAllRestaurants();

String rid=request.getParameter("restaurantId");

List<Menu> menus=null;

if(rid!=null){

MenuDAO menuDAO=new MenuDAO();

menus=menuDAO.getMenusByRestaurantId(Integer.parseInt(rid));

}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>

Manage Menu

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

font-size:62px;

font-weight:800;

margin-bottom:20px;

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

max-width:430px;

animation:floating 4s infinite;

}

.select-box{

width:92%;

max-width:900px;

margin:60px auto;

background:white;

padding:40px;

border-radius:30px;

box-shadow:0 15px 35px rgba(0,0,0,.08);

}

.select-box label{

display:block;

font-size:18px;

font-weight:600;

margin-bottom:12px;

}

.select-box select{

width:100%;

padding:18px;

border:2px solid #ececec;

border-radius:15px;

font-size:17px;

margin-bottom:25px;

}

.menu-grid{

width:92%;

margin:60px auto;

display:grid;

grid-template-columns:repeat(auto-fit,minmax(340px,1fr));

gap:35px;

}

.menu-card{

background:white;

padding:30px;

border-radius:30px;

box-shadow:0 20px 40px rgba(0,0,0,.08);

transition:.35s;

}

.menu-card:hover{

transform:translateY(-10px);

box-shadow:0 25px 45px rgba(0,0,0,.15);

}

</style>

<script>

function confirmDelete(name){

return confirm("Delete '"+name+"' permanently?");

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

Manage

<span>

Menu

</span>

</h1>

<p>

Select a restaurant,
view all menu items,
edit dishes
or permanently remove them.

</p>

</div>

<div
align="center">

<img
src="images/manage-menu.png"
onerror="this.src='images/default-banner.png'">

</div>

</section>

<div
class="select-box">

<form
method="get">

<label>

Choose Restaurant

</label>

<select
name="restaurantId"
required>

<option value="">

Select Restaurant

</option>

<%

for(Restaurant r:restaurants){

%>

<option
value="<%=r.getId()%>"
<%=rid!=null&&rid.equals(String.valueOf(r.getId()))?"selected":""%>>

<%=r.getName()%>

</option>

<%

}

%>

</select>

<button
type="submit">

<i
class="fa-solid fa-list"></i>

Load Menu

</button>

</form>

</div>

<div
class="menu-grid">

<%

if(menus!=null){

if(menus.isEmpty()){

%>
<div
style="
grid-column:1/-1;
background:white;
padding:70px;
border-radius:30px;
text-align:center;
box-shadow:0 15px 35px rgba(0,0,0,.08);">

<i
class="fa-solid fa-bowl-food"
style="
font-size:90px;
color:#F97316;"></i>

<br><br>

<h1>

No Menu Items Found

</h1>

<br>

<p
style="
font-size:18px;
color:#666;">

This restaurant doesn't have any menu items yet.

</p>

<br><br>

<a
href="addMenu.jsp">

<button>

<i
class="fa-solid fa-plus"></i>

Add Menu Item

</button>

</a>

</div>

<%

}else{

for(Menu m:menus){

%>

<div
class="menu-card">

<h2>

<%=m.getItemName()%>

</h2>

<div
style="
display:flex;
justify-content:space-between;
align-items:center;
margin:18px 0;">

<span
style="
background:#FEF3C7;
padding:8px 18px;
border-radius:25px;
font-weight:700;
color:#b45309;">

₹ <%=String.format("%.2f",m.getPrice())%>

</span>

<span
style="
background:#ECFDF5;
padding:8px 18px;
border-radius:25px;
font-weight:600;
color:#15803d;">

Available

</span>

</div>

<p
style="
color:#666;
line-height:1.8;
margin:18px 0;">

<%=m.getDescription()%>

</p>

<div
style="
display:flex;
gap:15px;
margin-top:25px;">

<a
href="editMenu.jsp?id=<%=m.getId()%>"
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
href="deleteMenu?id=<%=m.getId()%>"
onclick="return confirmDelete('<%=m.getItemName()%>')"
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

<%

}

}

}

%>

</div>

<!-- CONTINUE PART 3 -->
<!-- ================= MENU MANAGEMENT ================= -->

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

Manage Menu Items

</h1>

<p
style="
font-size:20px;
line-height:1.8;
margin-bottom:30px;">

Maintain your restaurant's menu by editing,
removing,
or updating menu items to provide customers
with the latest dishes and prices.

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

🍔 Edit Items

</div>

<div
style="
background:rgba(255,255,255,.20);
padding:15px 22px;
border-radius:15px;">

🗑 Remove Items

</div>

<div
style="
background:rgba(255,255,255,.20);
padding:15px 22px;
border-radius:15px;">

⭐ Keep Updated

</div>

</div>

</div>

<div
align="center">

<img
src="images/menu-management.png"
onerror="this.src='images/default-banner.png'"
style="
width:100%;
max-width:380px;">

</div>

</div>

</section>

<!-- ================= ADMIN TIPS ================= -->

<section
class="section">

<h1
class="section-title">

Menu

<span>

Management Tips

</span>

</h1>

<div
class="dashboard-grid">

<div
class="stat-card
text-center">

<i
class="fa-solid fa-pen"
style="
font-size:60px;
color:#3B82F6;"></i>

<h2>

Edit

</h2>

<p>

Update food names, prices and descriptions whenever required.

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

Remove unavailable dishes from restaurant menus.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-indian-rupee-sign"
style="
font-size:60px;
color:#22C55E;"></i>

<h2>

Pricing

</h2>

<p>

Maintain accurate pricing for every food item.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-bowl-food"
style="
font-size:60px;
color:#F97316;"></i>

<h2>

Quality

</h2>

<p>

Offer customers fresh and attractive menu options.

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

Menu Management Complete

</h1>

<p
style="
font-size:18px;
color:#666;
margin-bottom:35px;">

Continue managing menu items,
add new dishes,
or return to the Admin Dashboard.

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

Add Menu

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
href="addRestaurant.jsp">

<button
style="
padding:18px 35px;
background:#22C55E;">

<i
class="fa-solid fa-store"></i>

Add Restaurant

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

Premium Food Management System

Java • JSP • Servlets • JDBC • MySQL

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

Super Administrator

</p>

<br>

<p>

<i class="fa-solid fa-circle-check"></i>

System Running

</p>

</div>

</div>

<div
class="footer-bottom">

© 2026 FoodApp Admin Panel |
Designed by Sai Yaswanth |
Java Full Stack Project

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

".menu-card,.stat-card,.select-box"

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