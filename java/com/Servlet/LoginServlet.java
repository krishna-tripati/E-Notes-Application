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


@WebServlet("/loginservlet")
public class LoginServlet extends HttpServlet {

    public void doPost(HttpServletRequest req , HttpServletResponse resp) throws ServletException,IOException
    {
     String email=req.getParameter("uemail");
     String password=req.getParameter("upassword");

        UserDetails ud=new UserDetails();
        ud.setEmail(email);
        ud.setPassword(password);

        UserDAO dao=new UserDAO(DBConnection.getConn());
        UserDetails user= dao.loginuser(ud);

        if(user !=null){
            HttpSession session=req.getSession();
            session.setAttribute("userD", user);
            resp.sendRedirect("home.jsp");
        }else {
            HttpSession session=req.getSession();
            session.setAttribute("login-failed","Invalid User-Name and Password");
            resp.sendRedirect("login.jsp ");
        }
    }
}
