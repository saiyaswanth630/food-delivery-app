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

Double total=(Double)session.getAttribute("total");

if(total==null){

total=0.0;

}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>

Secure Checkout | FoodApp

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

.checkout-hero{

padding:100px 8%;

display:grid;

grid-template-columns:1fr 1fr;

align-items:center;

gap:60px;

background:linear-gradient(135deg,#fff5f7,#ffffff);

}

.checkout-hero h1{

font-size:65px;

font-weight:800;

line-height:1.2;

margin-bottom:25px;

}

.checkout-hero span{

color:#ff4d6d;

}

.checkout-hero p{

font-size:19px;

line-height:1.8;

color:#666;

}

.checkout-hero img{

width:100%;

max-width:480px;

animation:floating 4s infinite;

}

.checkout-wrapper{

width:92%;

margin:60px auto;

display:grid;

grid-template-columns:2fr 1fr;

gap:35px;

align-items:start;

}

.payment-panel{

background:white;

padding:35px;

border-radius:30px;

box-shadow:0 15px 35px rgba(0,0,0,.08);

}

.payment-panel h2{

font-size:36px;

margin-bottom:30px;

}

.payment-option{

display:flex;

align-items:center;

gap:20px;

padding:22px;

border:2px solid #eee;

border-radius:20px;

margin-bottom:22px;

cursor:pointer;

transition:.35s;

}

.payment-option:hover{

border-color:#ff4d6d;

background:#fff4f8;

transform:translateX(8px);

}

.payment-option input{

transform:scale(1.4);

}

.payment-option i{

font-size:35px;

width:45px;

color:#ff4d6d;

}

.payment-option h3{

font-size:24px;

margin-bottom:8px;

}

.payment-option p{

color:#666;

font-size:15px;

}

.summary{

background:white;

padding:35px;

border-radius:30px;

box-shadow:0 15px 35px rgba(0,0,0,.08);

position:sticky;

top:110px;

}

.summary h2{

font-size:34px;

margin-bottom:25px;

}

.bill-row{

display:flex;

justify-content:space-between;

margin:18px 0;

font-size:18px;

}

.bill-total{

display:flex;

justify-content:space-between;

margin:30px 0;

font-size:30px;

font-weight:700;

color:#ff4d6d;

}

.secure-box{

background:#ECFDF5;

padding:18px;

border-radius:18px;

text-align:center;

font-weight:600;

color:#15803d;

margin-top:25px;

}

</style>

</head>

<body>

<nav class="navbar">

<h2>

<i class="fa-solid fa-credit-card"></i>

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

<section class="checkout-hero">

<div>

<h1>

Secure

<span>

Checkout

</span>

</h1>

<p>

Complete your payment safely using
UPI, Cards or Cash On Delivery.

Your order will be confirmed instantly.

</p>

<br>

<a href="cart.jsp">

<button>

<i class="fa-solid fa-arrow-left"></i>

Back To Cart

</button>

</a>

</div>

<div align="center">

<img
src="images/payment-banner.png"
onerror="this.src='images/default-banner.png'">

</div>

</section>

<div class="checkout-wrapper">

<div class="payment-panel">

<h2>

Choose Payment Method

</h2>

<form action="order">
<label class="payment-option">

<input
type="radio"
name="payment"
value="UPI"
checked>

<i
class="fa-brands fa-google-pay"></i>

<div>

<h3>

UPI Payment

</h3>

<p>

Google Pay • PhonePe • Paytm • BHIM UPI

</p>

</div>

</label>

<label class="payment-option">

<input
type="radio"
name="payment"
value="CARD">

<i
class="fa-solid fa-credit-card"></i>

<div>

<h3>

Credit / Debit Card

</h3>

<p>

Visa • MasterCard • RuPay • American Express

</p>

</div>

</label>

<label class="payment-option">

<input
type="radio"
name="payment"
value="NETBANKING">

<i
class="fa-solid fa-building-columns"></i>

<div>

<h3>

Net Banking

</h3>

<p>

Pay directly using your bank account.

</p>

</div>

</label>

<label class="payment-option">

<input
type="radio"
name="payment"
value="WALLET">

<i
class="fa-solid fa-wallet"></i>

<div>

<h3>

Digital Wallet

</h3>

<p>

Amazon Pay • Mobikwik • Freecharge

</p>

</div>

</label>

<label class="payment-option">

<input
type="radio"
name="payment"
value="COD">

<i
class="fa-solid fa-money-bill-wave"></i>

<div>

<h3>

Cash On Delivery

</h3>

<p>

Pay after your food is delivered.

</p>

</div>

</label>

<br>

<button
type="submit"
style="
width:100%;
padding:18px;
font-size:18px;">

<i
class="fa-solid fa-lock"></i>

Secure Place Order

</button>

</form>

</div>

<!-- ================= ORDER SUMMARY ================= -->

<div class="summary">

<h2>

Order Summary

</h2>

<div class="bill-row">

<span>

Subtotal

</span>

<span>

&#8377;<%=String.format("%.2f",total)%>

</span>

</div>

<div class="bill-row">

<span>

Delivery Fee

</span>

<span style="color:#16a34a;">

FREE

</span>

</div>

<div class="bill-row">

<span>

Platform Fee

</span>

<span>

&#8377;5.00

</span>

</div>

<div class="bill-row">

<span>

GST

</span>

<span>

Included

</span>

</div>

<hr
style="
margin:25px 0;
border:none;
height:1px;
background:#eee;">

<div class="bill-total">

<span>

Grand Total

</span>

<span>

&#8377;<%=String.format("%.2f",total)%>

</span>

</div>

<div class="secure-box">

<i class="fa-solid fa-shield-halved"></i>

256-bit SSL Secure Payment

</div>

</div>

</div>

<!-- CONTINUE PART 3 -->
<!-- ================= PAYMENT BENEFITS ================= -->

<section
class="section">

<h1
class="section-title">

Why Choose

<span>

FoodApp Payments

</span>

</h1>

<p
class="section-subtitle">

Safe, fast and trusted checkout for every order.

</p>

<div
class="dashboard-grid">

<div
class="stat-card text-center">

<i
class="fa-solid fa-shield-halved"
style="
font-size:55px;
color:#22c55e;"></i>

<h2>

100% Secure

</h2>

<p>

Bank-level encryption protects every payment transaction.

</p>

</div>

<div
class="stat-card text-center">

<i
class="fa-solid fa-bolt"
style="
font-size:55px;
color:#f59e0b;"></i>

<h2>

Instant Confirmation

</h2>

<p>

Receive order confirmation immediately after payment.

</p>

</div>

<div
class="stat-card text-center">

<i
class="fa-solid fa-wallet"
style="
font-size:55px;
color:#3b82f6;"></i>

<h2>

Multiple Payment Options

</h2>

<p>

UPI, Cards, Wallets, Net Banking and Cash On Delivery.

</p>

</div>

<div
class="stat-card text-center">

<i
class="fa-solid fa-headset"
style="
font-size:55px;
color:#ff4d6d;"></i>

<h2>

24 × 7 Support

</h2>

<p>

Our support team is available whenever you need help.

</p>

</div>

</div>

</section>

<!-- ================= SPECIAL OFFER ================= -->

<section
class="section">

<div
style="
background:linear-gradient(135deg,#ff4d6d,#ff6b35);
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
font-size:55px;
margin-bottom:20px;">

Congratulations!

</h1>

<p
style="
font-size:20px;
line-height:1.8;
margin-bottom:30px;">

Your delicious meal is almost on the way.

Complete payment to place your order instantly.

</p>

<div
style="
display:flex;
gap:20px;
flex-wrap:wrap;">

<div
style="
background:rgba(255,255,255,.20);
padding:14px 22px;
border-radius:15px;">

🚚 Free Delivery

</div>

<div
style="
background:rgba(255,255,255,.20);
padding:14px 22px;
border-radius:15px;">

⚡ Instant Order

</div>

</div>

</div>

<div
align="center">

<img
src="images/payment-offer.png"
onerror="this.src='images/default-banner.png'"
style="
width:100%;
max-width:380px;">

</div>

</div>

</section>

<!-- ================= PAYMENT PROCESS ================= -->

<section
class="section">

<h1
class="section-title">

Checkout

<span>

Steps

</span>

</h1>

<div
class="container">

<div
class="card">

<div
class="card-content text-center">

<i
class="fa-solid fa-cart-shopping"
style="
font-size:60px;
color:#ff4d6d;"></i>

<h2>

Review Cart

</h2>

<p>

Confirm all your selected food items before payment.

</p>

</div>

</div>

<div
class="card">

<div
class="card-content text-center">

<i
class="fa-solid fa-credit-card"
style="
font-size:60px;
color:#3b82f6;"></i>

<h2>

Pay Securely

</h2>

<p>

Select your preferred payment option and continue.

</p>

</div>

</div>

<div
class="card">

<div
class="card-content text-center">

<i
class="fa-solid fa-circle-check"
style="
font-size:60px;
color:#22c55e;"></i>

<h2>

Order Confirmed

</h2>

<p>

Your restaurant starts preparing the order immediately.

</p>

</div>

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

Get Exclusive Offers

</h1>

<p
style="
font-size:18px;
color:#666;
margin-bottom:35px;">

Subscribe to receive exciting discounts,
festival offers and cashback notifications.

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

Order delicious food from the best restaurants with secure payments,
fast delivery and premium customer service.

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

<li><a href="cart.jsp">Cart</a></li>

<li><a href="history">Order History</a></li>

<li><a href="profile.jsp">Profile</a></li>

<li><a href="logout">Logout</a></li>

</ul>

</div>

<div>

<h3>

Payment Options

</h3>

<ul>

<li>UPI</li>

<li>Credit Card</li>

<li>Debit Card</li>

<li>Net Banking</li>

<li>Cash On Delivery</li>

</ul>

</div>

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

24 × 7 Customer Support

</p>

</div>

</div>

<div
class="footer-bottom">

© 2026 FoodApp | Java Full Stack Project | Made with ❤️

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

".payment-option,.card,.stat-card"

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