<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login page</title>
<%@include file="all-css-js.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>

<div class="container-fluid ">
<div class='row'>
<div class="col-md-4 offset-md-4">

<div class="card mt-5">
<div class="card-header text-center text-black">
<i class="fa fa-user-circle-o fa-3x" aria-hidden="true"></i>
<h4>Login</h4>
</div>

<%
String invalid=(String)session.getAttribute("login-failed");
if(invalid !=null)
{
%>
<div class="alert alert-warning" role="alert"><%=invalid%></div>

<%
session.removeAttribute("login-failed");
}
%>

<%
String withoutlogin=(String)session.getAttribute("login-error");
if(withoutlogin !=null)
{ %>
<div class="alert alert-warning" role="alert"><%=withoutlogin%></div>
<%
session.removeAttribute("login-error");
}
%>

<%
String lgMsg=(String)session.getAttribute("logoutMsg");
if(lgMsg!=null)
{ %>
<div class="alert alert-warning" role="alert"><%=lgMsg%></div>
<%
session.removeAttribute("logoutMsg");
}
%>
<div class="card-body">

<form action="loginservlet" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="uemail">

  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="upassword">
  </div>

  <button type="submit" class="btn btn-primary badge-pill btn-block">Login</button>
</form>

</div>
</div>
</div>
</div>
</div>

</br></br> </br></br>
<%@include file="footer.jsp"%>
</body>
</html>
