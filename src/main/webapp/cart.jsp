<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page import="java.util.Map" %>

<%@ page import="com.food.dao.MenuDAO" %>
<%@ page import="com.food.model.Menu" %>
<%@ page import="com.food.model.User" %>

<%
/* ================= SESSION / AUTH ================= */

response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);

User user = (User) session.getAttribute("user");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}


/* ================= CART DATA ================= */

List<Integer> cart =
        (List<Integer>) session.getAttribute("cart");

MenuDAO dao = new MenuDAO();

double total = 0;


/* ================= GROUP QUANTITIES ================= */

Map<Integer, Integer> quantities =
        new LinkedHashMap<>();

if(cart != null){

    for(Integer id : cart){

        quantities.put(
                id,
                quantities.getOrDefault(id, 0) + 1
        );
    }
}

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Shopping Cart | FoodApp</title>


<!-- Main CSS -->

<link rel="stylesheet"
      href="css/style.css?v=2.0">


<!-- Font Awesome -->

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">


<style>

/* =====================================================
   CART PAGE
===================================================== */

.cart-banner{

    padding:90px 8%;

    display:grid;

    grid-template-columns:1fr 1fr;

    align-items:center;

    background:
    linear-gradient(135deg,#fff5f7,#ffffff);

    gap:60px;
}


.cart-banner h1{

    font-size:64px;

    font-weight:800;

    margin-bottom:25px;
}


.cart-banner span{

    color:#ff4d6d;
}


.cart-banner p{

    font-size:19px;

    color:#666;

    line-height:1.8;
}


.cart-banner img{

    width:100%;

    max-width:500px;

    animation:floating 4s infinite;
}


/* =====================================================
   CART WRAPPER
===================================================== */

.cart-wrapper{

    width:92%;

    margin:60px auto;

    display:grid;

    grid-template-columns:2fr 1fr;

    gap:35px;

    align-items:start;
}


.cart-list{

    display:flex;

    flex-direction:column;

    gap:30px;
}


/* =====================================================
   CART ITEM
===================================================== */

.cart-box{

    background:white;

    border-radius:28px;

    padding:25px;

    display:flex;

    gap:25px;

    align-items:center;

    box-shadow:0 15px 35px rgba(0,0,0,.08);

    transition:.35s;
}


.cart-box:hover{

    transform:translateY(-8px);

    box-shadow:
    0 20px 40px rgba(0,0,0,.15);
}


/* =====================================================
   FOOD IMAGE
===================================================== */

.food-image{

    width:170px;

    height:150px;

    border-radius:20px;

    overflow:hidden;

    flex-shrink:0;
}


.food-image img{

    width:100%;

    height:100%;

    object-fit:cover;

    transition:.5s;
}


.cart-box:hover .food-image img{

    transform:scale(1.08);
}


/* =====================================================
   FOOD DETAILS
===================================================== */

.food-details{

    flex:1;
}


.food-details h2{

    font-size:30px;

    margin-bottom:12px;
}


.food-desc{

    color:#666;

    line-height:1.8;

    margin-bottom:10px;
}


.food-price{

    font-size:30px;

    font-weight:700;

    color:#ff4d6d;

    margin:15px 0;
}


/* =====================================================
   QUANTITY CONTROL
===================================================== */

.quantity-control{

    display:inline-flex;

    align-items:center;

    gap:18px;

    margin:10px 0 15px;

    padding:6px 10px;

    background:#f8f8f8;

    border-radius:30px;
}


.quantity-control form{

    margin:0;

    padding:0;
}


.quantity-btn{

    width:35px;

    height:35px;

    border:none;

    border-radius:50%;

    background:#ff4d6d;

    color:white;

    font-size:20px;

    font-weight:bold;

    cursor:pointer;

    display:flex;

    align-items:center;

    justify-content:center;

    padding:0;

    transition:.2s;
}


.quantity-btn:hover{

    transform:scale(1.08);
}


.quantity-number{

    min-width:25px;

    text-align:center;

    font-size:18px;

    font-weight:700;
}


/* =====================================================
   FRESH BADGE
===================================================== */

.fresh-badge{

    display:inline-block;

    background:#ecfdf5;

    color:#15803d;

    padding:8px 16px;

    border-radius:25px;

    font-size:14px;

    font-weight:600;

    margin-left:8px;
}


/* =====================================================
   REMOVE BUTTON
===================================================== */

.remove-btn{

    background:#dc2626;

    color:white;

    border:none;

    padding:11px 18px;

    border-radius:10px;

    margin-top:15px;

    cursor:pointer;

    font-size:14px;

    transition:.2s;
}


.remove-btn:hover{

    background:#b91c1c;

    transform:translateY(-2px);
}


/* =====================================================
   ORDER SUMMARY
===================================================== */

.summary{

    background:white;

    padding:35px;

    border-radius:28px;

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

    font-size:17px;
}


.bill-total{

    display:flex;

    justify-content:space-between;

    font-size:28px;

    font-weight:700;

    margin:25px 0;

    color:#ff4d6d;
}


/* =====================================================
   EMPTY CART
===================================================== */

.empty-cart{

    width:650px;

    max-width:95%;

    margin:80px auto;

    background:white;

    padding:60px;

    text-align:center;

    border-radius:30px;

    box-shadow:0 15px 35px rgba(0,0,0,.08);
}


/* =====================================================
   RESPONSIVE
===================================================== */

@media(max-width:900px){

    .cart-banner{

        grid-template-columns:1fr;

        text-align:center;

        padding:60px 5%;
    }


    .cart-banner h1{

        font-size:45px;
    }


    .cart-wrapper{

        grid-template-columns:1fr;
    }


    .summary{

        position:static;
    }

}


@media(max-width:600px){

    .cart-box{

        flex-direction:column;

        align-items:flex-start;
    }


    .food-image{

        width:100%;

        height:220px;
    }


    .food-details{

        width:100%;
    }


    .fresh-badge{

        margin-left:0;

        margin-top:8px;
    }


    .cart-banner h1{

        font-size:38px;
    }


    .summary{

        padding:25px;
    }

}


/* =====================================================
   FLOATING ANIMATION
===================================================== */

@keyframes floating{

    0%{

        transform:translateY(0);
    }

    50%{

        transform:translateY(-12px);
    }

    100%{

        transform:translateY(0);
    }
}

</style>


<script>

function confirmRemove(){

    return confirm("Remove this item from your cart?");
}


function confirmLogout(){

    return confirm("Logout?");
}

</script>

</head>


<body>


<!-- =====================================================
     NAVBAR
===================================================== -->

<nav class="navbar">

    <h2>

        <i class="fa-solid fa-cart-shopping"></i>

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



<!-- =====================================================
     CART BANNER
===================================================== -->

<section class="cart-banner">

    <div>

        <h1>

            Your

            <span>
                Shopping Cart
            </span>

        </h1>


        <p>

            Review your selected meals before checkout.

            Fresh food, fast delivery and secure payment.

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
          
    src="images/cart-banner.png"
    alt="Shopping Cart"
    onerror="this.onerror=null;this.src='images/pizza.jpg';">

    </div>

</section>



<!-- =====================================================
     EMPTY CART
===================================================== -->

<%

if(cart == null || cart.isEmpty()){

%>

<div class="empty-cart">

    <i
        class="fa-solid fa-cart-shopping"
        style="font-size:90px;color:#ff4d6d;">
    </i>


    <br><br>


    <h1>
        Your Cart is Empty
    </h1>


    <br>


    <p>

        Looks like you haven't added
        anything yet.

    </p>


    <br>


    <a href="restaurants">

        <button>

            <i class="fa-solid fa-utensils"></i>

            Browse Restaurants

        </button>

    </a>

</div>


<%

}else{

%>


<!-- =====================================================
     CART CONTENT
===================================================== -->

<div class="cart-wrapper">


    <!-- =================================================
         CART ITEMS
    ================================================== -->

    <div class="cart-list">


<%

for(Map.Entry<Integer,Integer> entry :
        quantities.entrySet()){


    int id = entry.getKey();

    int quantity = entry.getValue();


    Menu m = dao.getMenuById(id);


    if(m != null){


        double itemTotal =
                m.getPrice() * quantity;


        total += itemTotal;

%>


        <!-- =============================================
             SINGLE CART ITEM
        ============================================== -->

        <div class="cart-box">


            <!-- FOOD IMAGE -->

            <div class="food-image">

                <img
                    src="<%=request.getContextPath()%>/<%=m.getImage()%>"
                    alt="<%=m.getItemName()%>"
                    onerror="this.onerror=null;this.src='<%=request.getContextPath()%>/images/default-food.jpg';">

            </div>



            <!-- FOOD DETAILS -->

            <div class="food-details">


                <h2>

                    <%=m.getItemName()%>

                </h2>


                <p class="food-desc">

                    <%=m.getDescription()%>

                </p>


                <!-- ITEM TOTAL -->

                <div class="food-price">

                    ₹<%=String.format("%.2f",itemTotal)%>

                </div>



                <!-- =====================================
                     QUANTITY CONTROL
                ====================================== -->

<div class="quantity-control">

    <button
        type="button"
        class="quantity-btn"
        onclick="updateQuantity(<%=id%>, 'decrease', this)">

        &minus;

    </button>


    <span
        class="quantity-number"
        id="qty-<%=id%>">

        <%=quantity%>

    </span>


    <button
        type="button"
        class="quantity-btn"
        onclick="updateQuantity(<%=id%>, 'increase', this)">

        +

    </button>

</div>



                <!-- FRESH BADGE -->

                <span class="fresh-badge">

                    <i class="fa-solid fa-leaf"></i>

                    Freshly Prepared

                </span>



                <!-- REMOVE -->

                <br>


                <a
                    href="remove?id=<%=id%>"
                    onclick="return confirmRemove()">

                    <button
                        type="button"
                        class="remove-btn">

                        <i class="fa-solid fa-trash"></i>

                        Remove

                    </button>

                </a>


            </div>

        </div>


<%

    }

}

%>


    </div>



    <!-- =================================================
         ORDER SUMMARY
    ================================================== -->

    <div class="summary">


        <h2>

            <i class="fa-solid fa-receipt"></i>

            Order Summary

        </h2>



        <!-- SUBTOTAL -->

        <div class="bill-row">

            <span>
                Subtotal
            </span>

            <span>

                ₹<%=String.format("%.2f",total)%>

            </span>

        </div>



        <!-- DELIVERY -->

        <div class="bill-row">

            <span>
                Delivery Fee
            </span>

            <span style="color:#16a34a;">

                FREE

            </span>

        </div>



        <!-- PLATFORM -->

        <div class="bill-row">

            <span>
                Platform Fee
            </span>

            <span>

                ₹5.00

            </span>

        </div>



        <!-- GST -->

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



        <!-- GRAND TOTAL -->

        <div class="bill-total">

            <span>
                Grand Total
            </span>

            <span>

                ₹<%=String.format("%.2f",total + 5)%>

            </span>

        </div>


<%

session.setAttribute(
        "total",
        total + 5
);

%>


        <!-- COUPON -->

        <button
            style="
            width:100%;
            font-size:18px;
            padding:18px;">

            <i class="fa-solid fa-tag"></i>

            Apply Coupon

        </button>


        <br><br>


        <!-- PAYMENT -->

        <a href="payment.jsp">

            <button
                style="
                width:100%;
                font-size:18px;
                padding:18px;">

                <i class="fa-solid fa-credit-card"></i>

                Proceed To Payment

            </button>

        </a>


    </div>

</div>


<%

}

%>



<!-- =====================================================
     OFFER CARD
===================================================== -->

<section class="section">

    <div
        style="
        background:linear-gradient(135deg,#ff4d6d,#ff6b35);
        padding:70px;
        border-radius:35px;
        display:grid;
        grid-template-columns:1fr 1fr;
        align-items:center;
        color:white;">


        <div>

            <h1
                style="
                font-size:54px;
                margin-bottom:20px;">

                Flat 40% OFF

            </h1>


            <p
                style="
                font-size:20px;
                line-height:1.8;">

                Use coupon

                <b>
                    FOOD40
                </b>

                to unlock today's special discount.

            </p>

        </div>


        <div align="center">

            <img
                src="images/offer-food.png"
                style="
                width:100%;
                max-width:350px;"
                alt="Special Offer">

        </div>

    </div>

</section>



<!-- =====================================================
     WHY ORDER WITH US
===================================================== -->

<section class="section">

    <h1 class="section-title">

        Why Shop With

        <span>
            FoodApp
        </span>

    </h1>


    <p class="section-subtitle">

        Every order is prepared fresh and delivered quickly.

    </p>


    <div class="dashboard-grid">


        <div class="stat-card text-center">

            <i class="fa-solid fa-truck-fast"></i>

            <h2>
                Fast Delivery
            </h2>

            <p>
                Average delivery time
                within 30 minutes.
            </p>

        </div>


        <div class="stat-card text-center">

            <i class="fa-solid fa-bowl-food"></i>

            <h2>
                Fresh Food
            </h2>

            <p>
                Prepared only after
                your order is placed.
            </p>

        </div>


        <div class="stat-card text-center">

            <i class="fa-solid fa-shield-heart"></i>

            <h2>
                Safe Packaging
            </h2>

            <p>
                Hygienic packaging
                with secure delivery.
            </p>

        </div>


        <div class="stat-card text-center">

            <i class="fa-solid fa-wallet"></i>

            <h2>
                Secure Payment
            </h2>

            <p>
                UPI, Card and Cash
                on Delivery available.
            </p>

        </div>


    </div>

</section>



<!-- =====================================================
     RECOMMENDED ITEMS
===================================================== -->

<section class="section">

    <h1 class="section-title">

        Customers Also

        <span>
            Ordered
        </span>

    </h1>


    <div class="container">


        <div class="card">

            <img
                src="images/foods/pizza.jpg"
                onerror="this.src='images/default-food.jpg'"
                alt="Pizza">


            <div class="card-content">

                <h2>
                    Margherita Pizza
                </h2>

                <p>
                    Cheesy classic pizza with fresh toppings.
                </p>

                <div class="price">
                    ₹299
                </div>

                <button style="width:100%;">
                    View Item
                </button>

            </div>

        </div>



        <div class="card">

            <img
                src="images/foods/burger.jpg"
                onerror="this.src='images/default-food.jpg'"
                alt="Burger">


            <div class="card-content">

                <h2>
                    Chicken Burger
                </h2>

                <p>
                    Crispy chicken burger with fries.
                </p>

                <div class="price">
                    ₹199
                </div>

                <button style="width:100%;">
                    View Item
                </button>

            </div>

        </div>



        <div class="card">

            <img
                src="images/foods/biryani.jpg"
                onerror="this.src='images/default-food.jpg'"
                alt="Biryani">


            <div class="card-content">

                <h2>
                    Chicken Biryani
                </h2>

                <p>
                    Authentic Hyderabadi dum biryani.
                </p>

                <div class="price">
                    ₹349
                </div>

                <button style="width:100%;">
                    View Item
                </button>

            </div>

        </div>


    </div>

</section>



<!-- =====================================================
     PAYMENT METHODS
===================================================== -->

<section class="section">

    <h1 class="section-title">

        Payment

        <span>
            Methods
        </span>

    </h1>


    <div class="container">


        <div class="card">

            <div class="card-content text-center">

                <i
                    class="fa-brands fa-google-pay"
                    style="
                    font-size:65px;
                    color:#4285F4;">
                </i>

                <h2>
                    UPI
                </h2>

                <p>
                    Google Pay, PhonePe,
                    Paytm and BHIM.
                </p>

            </div>

        </div>



        <div class="card">

            <div class="card-content text-center">

                <i
                    class="fa-solid fa-credit-card"
                    style="
                    font-size:65px;
                    color:#ff4d6d;">
                </i>

                <h2>
                    Cards
                </h2>

                <p>
                    Debit and Credit Cards
                    accepted securely.
                </p>

            </div>

        </div>



        <div class="card">

            <div class="card-content text-center">

                <i
                    class="fa-solid fa-money-bill-wave"
                    style="
                    font-size:65px;
                    color:#22c55e;">
                </i>

                <h2>
                    Cash
                </h2>

                <p>
                    Cash On Delivery
                    available.
                </p>

            </div>

        </div>


    </div>

</section>



<!-- =====================================================
     DELIVERY GUARANTEE
===================================================== -->

<section class="section">

    <div
        style="
        background:linear-gradient(135deg,#ff4d6d,#ff6b35);
        padding:70px;
        border-radius:35px;
        color:white;
        display:grid;
        grid-template-columns:1fr 1fr;
        align-items:center;
        gap:40px;">


        <div>

            <h1
                style="
                font-size:56px;
                margin-bottom:20px;">

                30 Minute
                Delivery

            </h1>


            <p
                style="
                font-size:20px;
                line-height:1.8;">

                Hot and delicious food
                delivered quickly
                from your favourite restaurants.

            </p>


            <br>


            <a href="restaurants">

                <button
                    style="
                    background:white;
                    color:#ff4d6d;">

                    Order More

                </button>

            </a>

        </div>


        <div align="center">

            <img
                src="images/delivery-boy.png"
                style="
                width:100%;
                max-width:420px;"
                alt="Delivery">

        </div>

    </div>

</section>



<!-- =====================================================
     NEWSLETTER
===================================================== -->

<section class="section">

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

            Get Amazing Deals

        </h1>


        <p
            style="
            font-size:18px;
            color:#666;
            margin-bottom:35px;">

            Subscribe and receive exclusive coupons,
            festival offers and newly launched menu updates.

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



<!-- =====================================================
     FOOTER
===================================================== -->

<footer class="footer">

    <div class="footer-grid">


        <div>

            <h2>

                <i class="fa-solid fa-bowl-food"></i>

                FoodApp

            </h2>


            <p>

                FoodApp provides a premium food ordering
                experience with modern UI,
                fast delivery,
                secure payments,
                and trusted restaurant partners.

            </p>


            <div class="social">

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

                <li>
                    <a href="restaurants">
                        Restaurants
                    </a>
                </li>

                <li>
                    <a href="history">
                        Order History
                    </a>
                </li>

                <li>
                    <a href="profile.jsp">
                        Profile
                    </a>
                </li>

                <li>
                    <a href="payment.jsp">
                        Checkout
                    </a>
                </li>

                <li>
                    <a href="logout">
                        Logout
                    </a>
                </li>

            </ul>

        </div>



        <div>

            <h3>
                Services
            </h3>


            <ul>

                <li>
                    Online Ordering
                </li>

                <li>
                    Fast Delivery
                </li>

                <li>
                    Fresh Food
                </li>

                <li>
                    UPI Payments
                </li>

                <li>
                    Customer Support
                </li>

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

                24 × 7 Available

            </p>

        </div>


    </div>



    <div class="footer-bottom">

        © 2026 FoodApp |

        Built using Java, JSP, Servlets & MySQL |

        Made with ❤️

    </div>

</footer>



<!-- =====================================================
     BACK TO TOP
===================================================== -->

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

    <i class="fa-solid fa-arrow-up"></i>

</button>



<!-- =====================================================
     JAVASCRIPT
===================================================== -->

<script>


/* BACK TO TOP */

window.onscroll = function(){

    let btn =
        document.getElementById("topBtn");


    if(document.documentElement.scrollTop > 300){

        btn.style.display = "block";

    }else{

        btn.style.display = "none";

    }

};


document.getElementById("topBtn").onclick = function(){

    window.scrollTo({

        top:0,

        behavior:"smooth"

    });

};



/* SCROLL ANIMATION */

const cards =
    document.querySelectorAll(
        ".cart-box,.card,.stat-card"
    );


const observer =
    new IntersectionObserver(

        (entries)=>{

            entries.forEach(entry=>{

                if(entry.isIntersecting){

                    entry.target.style.opacity = "1";

                    entry.target.style.transform =
                        "translateY(0)";

                }

            });

        },

        {
            threshold:.15
        }

    );


cards.forEach(card=>{

    card.style.opacity = "0";

    card.style.transform =
        "translateY(50px)";

    card.style.transition = ".8s";

    observer.observe(card);

});

</script>
<script>

async function updateQuantity(menuId, action, button) {

    const quantityElement =
        document.getElementById("qty-" + menuId);

    const oldQuantity =
        parseInt(quantityElement.innerText);


    let newQuantity = oldQuantity;


    if (action === "increase") {

        newQuantity++;

    }

    else if (action === "decrease") {

        newQuantity--;

    }


    if (newQuantity < 1) {

        newQuantity = 0;

    }


    button.disabled = true;


    try {

        const response = await fetch(
            "addToCart",
            {
                method: "POST",

                headers: {
                    "Content-Type":
                        "application/x-www-form-urlencoded"
                },

                body:
                    "menuId=" +
                    encodeURIComponent(menuId) +
                    "&action=" +
                    encodeURIComponent(action)
            }
        );


        if (!response.ok) {

            throw new Error(
                "Server error"
            );
        }


        const result =
            await response.json();


        if (result.success) {

            if (newQuantity === 0) {

                /*
                 * Remove this cart card
                 */

                const card =
                    button.closest(".cart-box");

                card.remove();

                /*
                 * If no cart items remain,
                 * reload once to show empty cart.
                 */

                const remaining =
                    document.querySelectorAll(
                        ".cart-box"
                    );

                if (remaining.length === 0) {

                    window.location.reload();

                    return;
                }

            }

            else {

                quantityElement.innerText =
                    newQuantity;

            }


            /*
             * Update page totals
             */

            updateCartTotals();

        }

    }

    catch(error) {

        console.error(error);

        alert(
            "Unable to update cart."
        );

    }

    finally {

        button.disabled = false;

    }

}


/* =========================================
   UPDATE TOTALS
========================================= */

function updateCartTotals() {

    /*
     * For now the server-side total remains
     * authoritative after page refresh.
     *
     * Quantity UI changes instantly.
     */

}

</script>


</body>

</html>