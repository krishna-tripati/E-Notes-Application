<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img{
background: url("img/book.jpg");
width:100x;
height:80vh;
background-repeat:no-repeat;
background-size:cover;
}
</style>
<meta charset="ISO-8859-1">
<title>Home page</title>
<%@include file="all-css-js.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="container-fluid back-img">
<div class="text-center">
<h1 class="text-black"> <i class="fa fa-book" aria-hidden="true"></i>
 E Notes Save Your Notes</h1>
 <a href="login.jsp" class="btn btn-light"> <i class="fa fa-sign-in" aria-hidden="true"></i>
 Login</a>
 <a href="register.jsp"  class="btn btn-light"> <i class="fa fa-user-plus" aria-hidden="true"></i>
 Register</a>
 </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
