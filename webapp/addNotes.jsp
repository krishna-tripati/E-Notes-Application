<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
UserDetails user1=(UserDetails)session.getAttribute("userD");
if(user1 ==null){
response.sendRedirect("login.jsp");
session.setAttribute("login-error", "Please Login..");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="all-css-js.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
	<div class="container" >

		<h1>Add Your Notes</h1>
		<br>

		<!-- this is add form  -->

		<form action="AddNotesServlet" method="post">

			<div class="form-group">
             <%
             UserDetails ud=(UserDetails)session.getAttribute("userD");
             if(ud !=null){
             %>
             <input type="hidden" value="<%= ud.getId()%>" name="uid">
             <%
             } %>


	     	<label for="title">Note title</label>
				<input
				name="title"
				required
				type="text"
				class="form-control"
				id="title"
				aria-describedby="emailHelp"
				placeholder="Enter here" />
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea
				name="content"
				required
				id="content"
				placeholder="Enter your content here"
				class="form-control"
				style="height: 300px;"
					></textarea>
			</div>

			<div class="container text-center">

				<button type="submit" class="btn btn-primary">Add</button>
			</div>

		</form>
	</div>
	<%@include file="footer.jsp"%>

</body>
</html>