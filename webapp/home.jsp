<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

	<%
    UserDetails user2=(UserDetails)session.getAttribute("userD");
    if(user2 ==null){
    response.sendRedirect("login.jsp");
    session.setAttribute("login-error", "Please Login..");
    }
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Note Taker: Home page</title>
<%@include file="all-css-js.jsp"%>

</head>
<body>
<%@include file="navbar.jsp"%>
<div class="card  shadow bg-white py-5">
			<img alt="" class="img-fluid mx-auto" style="max-width: 350px;"
				src="img/notepad.png">
			<h1 class="text-primary text-uppercase text-center mt-3">Start
				Taking your notes</h1>

			<div class="container text-center">
				<a href="addNotes.jsp" class="btn btn-outline-primary text-center">Start
					here</a>
			</div>

		</div>

	</div>
	<%@include file="footer.jsp"%>

</body>

</html>