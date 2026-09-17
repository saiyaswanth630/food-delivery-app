<%@ page language="java" contentType="text/html; charset=UTF-8"

pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>FoodApp | Order Food Online</title>

<meta name="viewport"

content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"

href="css/style.css?v=2.0">

<link rel="preconnect"

href="https://fonts.googleapis.com">

<link rel="preconnect"

href="https://fonts.gstatic.com"

crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"

rel="stylesheet">

<link rel="stylesheet"

href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

</head>

<body>

<!-- ================= NAVBAR ================= -->

<nav class="navbar">

<h2>

<i class="fa-solid fa-bowl-food"></i>

FoodApp

</h2>

<div class="nav-links">

<a href="#home">

Home

</a>

<a href="#categories">

Categories

</a>

<a href="#restaurants">

Restaurants

</a>

<a href="#features">

Features

</a>

<a href="login.jsp">

<i class="fa-solid fa-right-to-bracket"></i>

Login

</a>

<a href="register.jsp">

<button>

Register

</button>

</a>

</div>

</nav>

<!-- ================= HERO ================= -->

<section

class="hero"

id="home">

<h1>

Delicious Food

<span>

Delivered

</span>

To Your Door

</h1>

<p>

Order from your favourite restaurants,

discover amazing dishes,

and enjoy lightning fast delivery.

</p>

<div class="hero-buttons">

<a href="login.jsp">

<button>

<i class="fa-solid fa-burger"></i>

Order Now

</button>

</a>

<a href="#restaurants">

<button

class="outline-btn">

Explore

</button>

</a>

</div>

<div class="search-box">

<form

action="restaurants"

method="get">

<input

type="text"

name="search"

placeholder="Search restaurants, pizza, burger, biryani...">

<button

type="submit">

<i class="fa-solid fa-magnifying-glass"></i>

</button>

</form>

</div>

</section>

<!-- ================= CATEGORIES ================= -->

<section

class="section"

id="categories">

<h1

class="section-title">

Popular

<span>

Categories

</span>

</h1>

<p

class="section-subtitle">

Explore food from your favourite cuisines

</p>

<div

class="category-grid">

<div

class="category-card">

<img

src="images/pizza.jpg">

<h3>

Pizza

</h3>

<p>

Italian Cheese Specials

</p>

</div>

<div

class="category-card">

<img

src="images/burgerking.jpg">

<h3>

Burger

</h3>

<p>

Juicy Burgers

</p>

</div>

<div

class="category-card">

<img

src="images/biryani.jpg">

<h3>

Biryani

</h3>

<p>

Hyderabadi Specials

</p>

</div>

<div

class="category-card">

<img

src="images/mcd.jpg">

<h3>

Chinese

</h3>

<p>

Noodles & Fried Rice

</p>

</div>

<div

class="category-card">

<img

src="images/creamsone.jpg">

<h3>

Desserts

</h3>

<p>

Ice Cream & Cakes

</p>

</div>

<div

class="category-card">

<img

src="images/freshmenu.jpg">

<h3>

Drinks

</h3>

<p>

Juices & Beverages

</p>

</div>

</div>

</section>

<!-- ================= FEATURED ================= -->

<section

class="section"

id="restaurants">

<h1

class="section-title">

Featured

<span>

Restaurants

</span>

</h1>

<p

class="section-subtitle">

Handpicked restaurants near you

</p>

<div

class="container">

<div

class="card">

<div

class="offer">

50% OFF

</div>

<div

class="favorite">

<i

class="fa-regular fa-heart"></i>

</div>

<img

src="images/pizza.jpg">

<div

class="card-content">

<div

class="restaurant-info">

<span

class="rating">

⭐ 4.8

</span>

<span

class="delivery">

25 min

</span>

</div>

<h2>

Pizza Palace

</h2>

<p>

Italian • Pizza • Pasta • Garlic Bread

</p>

<a

href="login.jsp">

<button>

Order Now

</button>

</a>

</div>

</div>

<div

class="card">

<div

class="offer">

30% OFF

</div>

<div

class="favorite">

<i

class="fa-regular fa-heart"></i>

</div>

<img

src="images/burgerking.jpg">

<div

class="card-content">

<div

class="restaurant-info">

<span

class="rating">

⭐ 4.6

</span>

<span

class="delivery">

20 min

</span>

</div>

<h2>

Burger Hub

</h2>

<p>

Burger • Fries • Sandwich • Drinks

</p>

<a

href="login.jsp">

<button>

Order Now

</button>

</a>

</div>

</div>

<div

class="card">

<div

class="offer">

40% OFF

</div>

<div

class="favorite">

<i

class="fa-regular fa-heart"></i>

</div>

<img

src="images/biryani.jpg">

<div

class="card-content">

<div

class="restaurant-info">

<span

class="rating">

⭐ 4.9

</span>

<span

class="delivery">

30 min

</span>

</div>

<h2>

Biryani House

</h2>

<p>

Biryani • Kebabs • Tandoori

</p>

<a

href="login.jsp">

<button>

Order Now

</button>

</a>

</div>

</div>

</div>

</section>

<!-- ================= WHY CHOOSE US ================= -->

<section

class="section"

id="features">

<h1

class="section-title">

Why Choose

<span>

FoodApp

</span>

</h1>

<p

class="section-subtitle">

Fast, Secure and Reliable Food Delivery

</p>

<div

class="container">

<div

class="card">

<div

class="card-content text-center">

<i

class="fa-solid fa-truck-fast"

style="font-size:65px;color:#ff4d6d;margin-bottom:20px;"></i>

<h2>

Fast Delivery

</h2>

<p>

Average delivery time under 30 minutes with live order tracking.

</p>

</div>

</div>

<div

class="card">

<div

class="card-content text-center">

<i

class="fa-solid fa-shield-heart"

style="font-size:65px;color:#ff4d6d;margin-bottom:20px;"></i>

<h2>

100% Hygienic

</h2>

<p>

Fresh ingredients prepared safely by verified restaurants.

</p>

</div>

</div>

<div

class="card">

<div

class="card-content text-center">

<i

class="fa-solid fa-wallet"

style="font-size:65px;color:#ff4d6d;margin-bottom:20px;"></i>

<h2>

Secure Payments

</h2>

<p>

UPI, Cards and Cash on Delivery with encrypted transactions.

</p>

</div>

</div>

</div>

</section>

<!-- ================= STATS ================= -->

<section

class="section">

<h1

class="section-title">

Trusted By

<span>

Thousands

</span>

</h1>

<div

class="dashboard-grid">

<div

class="stat-card text-center">

<i

class="fa-solid fa-users"></i>

<h1>

25K+

</h1>

<h3>

Happy Customers

</h3>

</div>

<div

class="stat-card text-center">

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

class="stat-card text-center">

<i

class="fa-solid fa-burger"></i>

<h1>

600+

</h1>

<h3>

Food Items

</h3>

</div>

<div

class="stat-card text-center">

<i

class="fa-solid fa-truck"></i>

<h1>

50K+

</h1>

<h3>

Orders Delivered

</h3>

</div>

</div>

</section>

<!-- ================= APP DOWNLOAD ================= -->

<section

class="section">

<div

style="background:linear-gradient(135deg,#ff4d6d,#ff6b35);

border-radius:30px;

padding:70px;

display:grid;

grid-template-columns:1fr 1fr;

align-items:center;

gap:40px;

color:white;">

<div>

<h1

style="font-size:55px;

margin-bottom:20px;">

Download Our App

</h1>

<p

style="font-size:20px;

line-height:1.8;">

Order food anytime, anywhere.

Track orders in real-time and enjoy exclusive app offers.

</p>

<br>

<button

style="background:white;

color:#ff4d6d;">

<i class="fa-brands fa-google-play"></i>

Google Play

</button>

<button

style="margin-left:15px;

background:black;">

<i class="fa-brands fa-apple"></i>

App Store

</button>

</div>

<div

class="text-center">

<img

src="images/mobile-app.png"

style="width:90%;

max-width:420px;">

</div>

</div>

</section>

<!-- ================= TESTIMONIALS ================= -->

<section

class="section">

<h1

class="section-title">

What Our

<span>

Customers Say

</span>

</h1>

<div

class="container">

<div

class="card">

<div

class="card-content">

<div

style="display:flex;

align-items:center;

gap:15px;">

<img

src="images/users/user1.jpg"

style="width:70px;

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

Amazing service. Food arrived hot and fresh. Delivery was super fast.

</p>

</div>

</div>

<div

class="card">

<div

class="card-content">

<div

style="display:flex;

align-items:center;

gap:15px;">

<img

src="images/users/user2.jpg"

style="width:70px;

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

The interface is beautiful and ordering is extremely easy.

</p>

</div>

</div>

<div

class="card">

<div

class="card-content">

<div

style="display:flex;

align-items:center;

gap:15px;">

<img

src="images/users/user3.jpg"

style="width:70px;

height:70px;

border-radius:50%;">

<div>

<h3>

Sai Yaswanth

</h3>

⭐⭐⭐⭐⭐

</div>

</div>

<br>

<p>

Best food delivery application.

</p>

</div>

</div>

</div>

<!-- CONTINUE IN PART 3 -->

<!-- ================= NEWSLETTER ================= -->

<section

class="section">

<div

style="

background:white;

border-radius:30px;

padding:70px;

box-shadow:0 20px 45px rgba(0,0,0,.08);

text-align:center;

max-width:1200px;

margin:auto;

">

<h1

style="

font-size:48px;

margin-bottom:20px;">

Stay Updated

</h1>

<p

style="

font-size:18px;

color:#666;

max-width:650px;

margin:auto;

line-height:1.8;">

Subscribe to receive exclusive discounts, festival offers,

new restaurant updates and exciting rewards.

</p>

<div

style="

display:flex;

justify-content:center;

margin-top:40px;

gap:15px;

flex-wrap:wrap;">

<input

type="email"

placeholder="Enter your email"

style="

width:450px;

padding:18px 25px;

border-radius:50px;

border:2px solid #eee;

font-size:17px;

outline:none;">

<button>

Subscribe

</button>

</div>

</div>

</section>

<!-- ================= HOW IT WORKS ================= -->

<section

class="section">

<h1

class="section-title">

How It

<span>

Works

</span>

</h1>

<p

class="section-subtitle">

Only four simple steps to enjoy your favourite meal.

</p>

<div

class="dashboard-grid">

<div

class="stat-card

text-center">

<i

class="fa-solid fa-magnifying-glass"></i>

<h2>

Search

</h2>

<p>

Find your favourite restaurant

or cuisine.

</p>

</div>

<div

class="stat-card

text-center">

<i

class="fa-solid fa-cart-shopping"></i>

<h2>

Add To Cart

</h2>

<p>

Choose delicious food

and customize your order.

</p>

</div>

<div

class="stat-card

text-center">

<i

class="fa-solid fa-credit-card"></i>

<h2>

Payment

</h2>

<p>

Pay securely using UPI,

Card or Cash on Delivery.

</p>

</div>

<div

class="stat-card

text-center">

<i

class="fa-solid fa-truck-fast"></i>

<h2>

Delivered

</h2>

<p>

Sit back and relax while

your food reaches your door.

</p>

</div>

</div>

</section>

<!-- ================= OFFER BANNER ================= -->

<section

class="section">

<div

style="

background:

linear-gradient(

135deg,

#ff4d6d,

#ff6b35);

border-radius:35px;

padding:80px;

display:flex;

justify-content:space-between;

align-items:center;

flex-wrap:wrap;

color:white;

overflow:hidden;">

<div>

<h1

style="

font-size:60px;

margin-bottom:20px;">

Get Flat

50% OFF

</h1>

<p

style="

font-size:22px;

margin-bottom:30px;">

On your first order.

Use Coupon

<b>

WELCOME50

</b>

</p>

<a

href="register.jsp">

<button

style="

background:white;

color:#ff4d6d;">

Claim Offer

</button>

</a>

</div>

<div>

<img

src="images/offer.png"

style="

width:420px;

max-width:100%;">

</div>

</div>

</section>

<!-- ================= CONTACT ================= -->

<section

class="section">

<h1

class="section-title">

Contact

<span>

Us

</span>

</h1>

<div

class="container">

<div

class="card">

<div

class="card-content

text-center">

<i

class="fa-solid fa-location-dot"

style="

font-size:60px;

color:#ff4d6d;"></i>

<h2>

Address

</h2>

<p>

Bangalore,

India

</p>

</div>

</div>

<div

class="card">

<div

class="card-content

text-center">

<i

class="fa-solid fa-phone"

style="

font-size:60px;

color:#ff4d6d;"></i>

<h2>

Call Us

</h2>

<p>

+91 9876543210

</p>

</div>

</div>

<div

class="card">

<div

class="card-content

text-center">

<i

class="fa-solid fa-envelope"

style="

font-size:60px;

color:#ff4d6d;"></i>

<h2>

Email

</h2>

<p>

support@foodapp.com

</p>

</div>

</div>

</div>

</section>

<!-- ================= CONTINUE PART 4 ================= -->

<!-- ================= FOOTER ================= -->

<footer

class="footer">

<div

class="footer-grid">

<!-- Company -->

<div>

<h2>

<i class="fa-solid fa-bowl-food"></i>

FoodApp

</h2>

<p>

FoodApp is a modern online food ordering platform

built using Java, JSP, Servlets and MySQL.

We connect customers with their favourite restaurants

through a fast, secure and user-friendly experience.

</p>

<div

class="social">

<i class="fa-brands fa-facebook-f"></i>

<i class="fa-brands fa-instagram"></i>

<i class="fa-brands fa-x-twitter"></i>

<i class="fa-brands fa-linkedin-in"></i>

</div>

</div>

<!-- Quick Links -->

<div>

<h3>

Quick Links

</h3>

<ul>

<li>

<a href="#home">

Home

</a>

</li>

<li>

<a href="#categories">

Categories

</a>

</li>

<li>

<a href="#restaurants">

Restaurants

</a>

</li>

<li>

<a href="login.jsp">

Login

</a>

</li>

<li>

<a href="register.jsp">

Register

</a>

</li>

</ul>

</div>

<!-- Services -->

<div>

<h3>

Services

</h3>

<ul>

<li>

Online Ordering

</li>

<li>

Live Tracking

</li>

<li>

Food Delivery

</li>

<li>

Secure Payment

</li>

<li>

Customer Support

</li>

</ul>

</div>

<!-- Contact -->

<div>

<h3>

Get In Touch

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

24 × 7 Customer Support

</p>

</div>

</div>

<div

class="footer-bottom">

© 2026 FoodApp |

Designed & Developed using Java Full Stack |

Made with ❤️ by Sai Yaswanth

</div>

</footer>

<!-- ================= FLOATING CART ================= -->

<a

href="login.jsp"

class="cart-floating">

<i

class="fa-solid fa-cart-shopping"></i>

</a>

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

z-index:999;

font-size:20px;">

<i class="fa-solid fa-arrow-up"></i>

</button>

<!-- ================= JAVASCRIPT ================= -->

<script>

window.onscroll=function(){

let btn=document.getElementById("topBtn");

if(document.documentElement.scrollTop>300){

btn.style.display="block";

}else{

btn.style.display="none";

}

}

document.getElementById("topBtn").onclick=function(){

window.scrollTo({

top:0,

behavior:"smooth"

});

}

const cards=document.querySelectorAll(".card");

const observer=new IntersectionObserver(entries=>{

entries.forEach(entry=>{

if(entry.isIntersecting){

entry.target.style.opacity="1";

entry.target.style.transform="translateY(0)";

}

});

});

cards.forEach(card=>{

card.style.opacity="0";

card.style.transform="translateY(40px)";

card.style.transition=".8s";

observer.observe(card);

});

document.querySelectorAll(".favorite").forEach(btn=>{

btn.onclick=function(){

let icon=this.querySelector("i");

icon.classList.toggle("fa-regular");

icon.classList.toggle("fa-solid");

icon.style.color="#ff4d6d";

};

});

</script>

</body>

</html>
