<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register page</title>
<%@include file="all-css-js.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>

<div class="container-fluid ">
<div class='row'>
<div class="col-md-4 offset-md-4">

<div class="card mt-5">
<div class="card-header text-center text-black">
<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
<h4>Registration</h4>
</div>

<%
   String regMsg=(String) session.getAttribute("reg-sucess");
   if(regMsg !=null){
%>
<div class="alert alert-primary" role="alert"><%=regMsg%> Login--><a href="login.jsp">
Click Here</a></div>
<%
 session.removeAttribute("reg-sucess");
}
%>

<%
   String FailedMsg=(String) session.getAttribute("failed-msg");
   if(FailedMsg !=null){
%>
<div class="alert alert-danger" role="alert"><%= FailedMsg %></div
<%
session.removeAttribute("failed-msg");
}
%>
<div class="card-body">

<form action="userservlet" method="post">

   <div class="mb-3">
      <label>Enter Full Name</label>
      <input type="text" class="form-control"  aria-describedby="emailHelp" name="uname" >

    </div>

  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="uemail">

  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1"  name="upassword">
  </div>

  <button type="submit" class="btn btn-primary badge-pill btn-block">Register</button>
</form>
</div>
</div>
</div>
</div>
</div>
</br>
<%@include file="footer.jsp"%>

</body>
</html>
