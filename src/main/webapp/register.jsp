<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Register | FoodApp</title>

<link rel="stylesheet" href="css/style.css?v=1.0">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.register-page{

min-height:100vh;

display:flex;

justify-content:center;

align-items:center;

background:linear-gradient(135deg,#ff512f,#dd2476);

padding:40px;

}

.register-card{

width:460px;

background:white;

padding:40px;

border-radius:20px;

box-shadow:0 15px 40px rgba(0,0,0,.25);

}

.register-card h1{

text-align:center;

color:#dd2476;

margin-bottom:30px;

}

.input-box{

position:relative;

margin-bottom:20px;

}

.input-box input{

width:100%;

padding:14px 45px 14px 15px;

border:1px solid #ddd;

border-radius:12px;

outline:none;

font-size:15px;

}

.input-box i{

position:absolute;

right:15px;

top:50%;

transform:translateY(-50%);

cursor:pointer;

color:#777;

}

.register-card button{

width:100%;

margin-top:10px;

}

.register-card p{

text-align:center;

margin-top:20px;

}

.register-card a{

text-decoration:none;

font-weight:600;

color:#dd2476;

}

</style>

</head>

<body>

<div class="register-page">

<div class="register-card">

<h1>

<i class="fa-solid fa-user-plus"></i>

Create Account

</h1>

<form action="register" method="post">

<div class="input-box">

<input
type="text"
name="name"
placeholder="Full Name"
required>

</div>

<div class="input-box">

<input
type="email"
name="email"
placeholder="Email Address"
required>

</div>

<div class="input-box">

<input
type="password"
name="password"
id="password"
placeholder="Password"
required>

<i class="fa-solid fa-eye"
onclick="togglePassword(this)"></i>

</div>

<div class="input-box">

<input
type="text"
name="address"
placeholder="Address"
required>

</div>

<button type="submit">

<i class="fa-solid fa-user-check"></i>

Register

</button>

</form>

<p>

Already have an account?

<a href="login.jsp">

Login

</a>

</p>

</div>

</div>

<script>

function togglePassword(icon){

let pwd=document.getElementById("password");

if(pwd.type==="password"){

pwd.type="text";

icon.classList.replace("fa-eye","fa-eye-slash");

}else{

pwd.type="password";

icon.classList.replace("fa-eye-slash","fa-eye");

}

}

</script>

</body>

</html>