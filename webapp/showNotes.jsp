<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

	<%
        UserDetails user3=(UserDetails)session.getAttribute("userD");
        if(user3==null){
        response.sendRedirect("login.jsp");
        session.setAttribute("login-error", "Please Login..");
        }
        %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Notes</title>
<%@include file="all-css-js.jsp"%>

</head>
<body>
<%@include file="navbar.jsp"%>

<%
String updateMsg=(String) session.getAttribute("updateMsg");
if(updateMsg!=null){
%>
<div class="alert alert-success" role="alert"><%=updateMsg%></div>
<%
session.removeAttribute("updateMsg");
}
%>

<%
String wrongMsg=(String) session.getAttribute("wrongMsg");
if(wrongMsg!=null){
%>
<div class="alert alert-danger" role="alert"><%=wrongMsg%></div>
<%
session.removeAttribute("wrongMsg");
}
%>

	<div class="container">
		<br>
		<h1 class="text-uppercase text-center" >All Notes:</h1>
		<div class="row">
			<div class="col-md-12">

			<%@ page import="com.User.AddNotesDetails" %>
            <%@ page import="com.DAO.AddNotesDAO" %>
            <%@ page import="com.Db.DBConnection" %>
            <%@ page import="java.util.List" %>
			  <%
            	if(user3 !=null){
            	AddNotesDAO d=new AddNotesDAO(DBConnection.getConn());
            	List<AddNotesDetails> add =d.getData(user3.getId());
            	for(AddNotesDetails ad:add)
            	{ %>
            <div class="card mt-3" >
            <img class="card-img-top m-4 mx-auto" style="max-width:100px;" src="img/notepad.png"
            alt="Card image cap">

            <div class="card-body px-5">

            <h5 class="card-title"><%=ad.getTitle()%></h5>
			<p><%=ad.getContent()%></p>

            <p>
            <b class="text-success">Published by:<%=user3.getName()%>
            </br></br> <b class="text-primary"></b>
            </p>

            <p>
            <b class="text-success">Published Date:<%=ad.getDate()%>
            </br></br> <b class="text-primary"></b>
            </p>
            <div class="container text-center mt-2">
            <a href="deleteServlet?note_id=<%=ad.getId()%>" class="btn btn-danger">Delete</a>
            <a href="edit.jsp?note_id=<%=ad.getId()%>" class="btn btn-primary">Edit</a>
            </div>
            </div>
            </div>
            	<%}
            	}
              %>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>