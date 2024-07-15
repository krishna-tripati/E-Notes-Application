package com.Servlet;

import com.DAO.UserDAO;
import com.Db.DBConnection;
import com.User.UserDetails;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/userservlet")
public class UserServlet extends HttpServlet {
    public void doPost(HttpServletRequest req , HttpServletResponse resp) throws ServletException, IOException
    {
        String name=req.getParameter("uname");
        String email=req.getParameter("uemail");
        String password=req.getParameter("upassword");

        UserDetails ud=new UserDetails();
        ud.setName(name);
        ud.setEmail(email);
        ud.setPassword(password);

        UserDAO dao=new UserDAO(DBConnection.getConn());
        boolean f= dao.addUser(ud);
        HttpSession session;
        if(f){
            session=req.getSession();
            session.setAttribute("reg-sucess","Registration Sucessfully...");
            resp.sendRedirect("register.jsp");
        }else {
            session=req.getSession();
            session.setAttribute("failed-msg","Something went wrong on server");
            resp.sendRedirect("register.jsp");
        }
    }

}
