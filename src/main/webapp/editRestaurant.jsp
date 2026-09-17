<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

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

int id=Integer.parseInt(request.getParameter("id"));

RestaurantDAO dao=new RestaurantDAO();

Restaurant r=dao.getRestaurantById(id);
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>

Edit Restaurant

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

background:linear-gradient(135deg,#EEF2FF,#ffffff);

}

.hero h1{

font-size:60px;

font-weight:800;

margin-bottom:20px;

}

.hero span{

color:#6366F1;

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

.form-group input{

width:100%;

padding:18px;

border:2px solid #ececec;

border-radius:15px;

font-size:17px;

transition:.3s;

}

.form-group input:focus{

border-color:#6366F1;

outline:none;

box-shadow:0 0 15px rgba(99,102,241,.15);

}

.btn-row{

display:flex;

gap:20px;

margin-top:35px;

}

</style>

</head>

<body>

<nav class="navbar">

<h2>

<i class="fa-solid fa-pen-to-square"></i>

FoodApp Admin

</h2>

<div class="nav-links">

<a href="admin.jsp">

Dashboard

</a>

<a href="logout">

Logout

</a>

</div>

</nav>

<section
class="hero">

<div>

<h1>

Edit

<span>

Restaurant

</span>

</h1>

<p>

Update restaurant information,
ratings,
category
and image details.

</p>

</div>

<div
align="center">

<img
src="images/edit-restaurant.png"
onerror="this.src='images/default-banner.png'">

</div>

</section>

<div
class="form-box">

<h2>

Restaurant Details

</h2>

<form
action="editRestaurant"
method="post">

<input
type="hidden"
name="id"
value="<%=r.getId()%>">
<div
class="form-group">

<label>

Restaurant Name

</label>

<input

type="text"

name="name"

value="<%=r.getName()%>"

required>

</div>

<div
class="form-group">

<label>

Category

</label>

<input

type="text"

name="category"

value="<%=r.getCategory()%>"

required>

</div>

<div
class="form-group">

<label>

Restaurant Rating

</label>

<input

type="number"

name="rating"

step="0.1"

min="0"

max="5"

value="<%=r.getRating()%>"

required>

</div>

<div
class="form-group">

<label>

Restaurant Image

</label>

<input

type="text"

name="image"

value="<%=r.getImage()%>"

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
class="fa-solid fa-pen"
style="
font-size:55px;
color:#6366F1;"></i>

<h2>

Edit Details

</h2>

<p>

Update restaurant information anytime.

</p>

</div>

<div
class="stat-card
text-center">

<i
class="fa-solid fa-store"
style="
font-size:55px;
color:#22c55e;"></i>

<h2>

Restaurant Live

</h2>

<p>

Changes will reflect immediately after updating.

</p>

</div>

</div>

<div
class="btn-row">

<button
type="submit"
style="
flex:1;
background:#6366F1;">

<i
class="fa-solid fa-floppy-disk"></i>

Update Restaurant

</button>

<a
href="admin.jsp"
style="
flex:1;">

<button
type="button"
style="
width:100%;">

<i
class="fa-solid fa-arrow-left"></i>

Dashboard

</button>

</a>

</div>

</form>

</div>

<!-- CONTINUE PART 3 -->
<!-- ================= UPDATE BENEFITS ================= -->

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
font-size:56px;
margin-bottom:20px;">

Update Restaurant

</h1>

<p
style="
font-size:20px;
line-height:1.8;
margin-bottom:30px;">

Keep restaurant information accurate by updating
the restaurant name,
category,
rating
and restaurant image whenever required.

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

✏️ Edit Details

</div>

<div
style="
background:rgba(255,255,255,.20);
padding:15px 22px;
border-radius:15px;">

⭐ Update Rating

</div>

<div
style="
background:rgba(255,255,255,.20);
padding:15px 22px;
border-radius:15px;">

📷 Change Image

</div>

</div>

</div>

<div
align="center">

<img
src="images/edit-admin.png"
onerror="this.src='images/default-banner.png'"
style="
width:100%;
max-width:380px;">

</div>

</div>

</section>

<!-- ================= ADMIN GUIDELINES ================= -->

<section
class="section">

<h1
class="section-title">

Update

<span>

Guidelines

</span>

</h1>

<div
class="dashboard-grid">

<div
class="stat-card text-center">

<i
class="fa-solid fa-pen-to-square"
style="
font-size:60px;
color:#6366F1;"></i>

<h2>

Edit

</h2>

<p>

Modify restaurant information whenever required.

</p>

</div>

<div
class="stat-card text-center">

<i
class="fa-solid fa-star"
style="
font-size:60px;
color:#f59e0b;"></i>

<h2>

Ratings

</h2>

<p>

Maintain ratings between 0 and 5.

</p>

</div>

<div
class="stat-card text-center">

<i
class="fa-solid fa-image"
style="
font-size:60px;
color:#22c55e;"></i>

<h2>

Images

</h2>

<p>

Use high-quality restaurant images.

</p>

</div>

<div
class="stat-card text-center">

<i
class="fa-solid fa-circle-check"
style="
font-size:60px;
color:#ff4d6d;"></i>

<h2>

Save

</h2>

<p>

Updated information becomes available instantly.

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

Restaurant Updated?

</h1>

<p
style="
font-size:18px;
color:#666;
margin-bottom:35px;">

After saving the changes, you can continue managing
restaurants or start managing menu items.

</p>

<div
style="
display:flex;
justify-content:center;
gap:20px;
flex-wrap:wrap;">

<a
href="admin.jsp">

<button
style="
padding:18px 35px;">

<i
class="fa-solid fa-house"></i>

Dashboard

</button>

</a>

<a
href="deleteRestaurant.jsp">

<button
style="
padding:18px 35px;
background:#ef4444;">

<i
class="fa-solid fa-list"></i>

Manage Restaurants

</button>

</a>

<a
href="addMenu.jsp">

<button
style="
padding:18px 35px;
background:#22c55e;">

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

Restaurant Update Module

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

System Active

</p>

</div>

</div>

<div
class="footer-bottom">

© 2026 FoodApp Admin |
Restaurant Update Module

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

threshold:.15

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