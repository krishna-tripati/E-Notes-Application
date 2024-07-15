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
    <title>edit Notes</title>
    <%@include file="all-css-js.jsp"%>
    </head>
    <body>
    <%@include file="navbar.jsp"%>
    <%
Integer noteid=Integer.parseInt(request.getParameter("note_id"));
AddNotesDAO dao=new AddNotesDAO(DBConnection.getConn());
AddNotesDetails a=dao.getDatabyId(noteid);
    %>
    	<div class="container" >
    		<h1>Edit Your Notes</h1>
    		<br>
    		<!-- this is add form  -->
                <form action="NoteEditServlet" method="post">
    		<input type="hidden" value="<%=noteid%>" name="noteid">

    		<%@ page import="com.User.AddNotesDetails" %>
            <%@ page import="com.DAO.AddNotesDAO" %>
            <%@ page import="com.Db.DBConnection" %>

    			<div class="form-group">
    	     	<label for="title">Note title</label>
    				<input
    				name="title"
    				required
    				type="text"
    				class="form-control"
    				id="title"
    				value="<%= a.getTitle()%>"
    				aria-describedby="emailHelp"
    				placeholder="Enter here" />

    			</div>

    			<div class="form-group">
    				<label for="content">Note Content</label>
    				<textarea
    				name="content"
    				required
    				id="content"
    				value="<%= a.getContent()%>"
    				placeholder="Enter your content here"
    				class="form-control"
    				style="height: 300px;"
    					></textarea>
    			</div>

    			<div class="container text-center">

    				<button type="submit" class="btn btn-primary">Add Notes</button>
    			</div>
    		</form>
    	</div>
    	<%@include file="footer.jsp"%>
    </body>
    </html>