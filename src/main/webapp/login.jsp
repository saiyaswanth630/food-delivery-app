<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Login | FoodApp</title>

<link rel="stylesheet" href="css/style.css?v=1.0">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.login-page{

height:100vh;

display:flex;

justify-content:center;

align-items:center;

background:linear-gradient(135deg,#ff512f,#dd2476);

}

.login-card{

width:420px;

background:white;

padding:40px;

border-radius:20px;

box-shadow:0 15px 40px rgba(0,0,0,.25);

}

.login-card h1{

text-align:center;

margin-bottom:30px;

color:#dd2476;

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

font-size:15px;

outline:none;

}

.input-box i{

position:absolute;

right:15px;

top:50%;

transform:translateY(-50%);

cursor:pointer;

color:#777;

}

.login-card button{

width:100%;

margin-top:10px;

}

.login-card p{

margin-top:20px;

text-align:center;

}

.login-card a{

text-decoration:none;

color:#dd2476;

font-weight:600;

}

</style>

</head>

<body>

<div class="login-page">

<div class="login-card">

<h1>

<i class="fa-solid fa-user"></i>

Login

</h1>

<form action="login" method="post">

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

<button type="submit">

<i class="fa-solid fa-right-to-bracket"></i>

Login

</button>

</form>

<p>

Don't have an account?

<a href="register.jsp">

Register

</a>

</p>

</div>

</div>

<script>

function togglePassword(icon){

let pwd=document.getElementById("password");

if(pwd.type==="password"){

pwd.type="text";

icon.classList.remove("fa-eye");

icon.classList.add("fa-eye-slash");

}else{

pwd.type="password";

icon.classList.remove("fa-eye-slash");

icon.classList.add("fa-eye");

}

}

</script>

</body>

</html>