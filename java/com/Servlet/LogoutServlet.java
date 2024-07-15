package com.Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        try{
            HttpSession session=req.getSession();
            session.removeAttribute("userD");

            HttpSession session1=req.getSession();
            session1.setAttribute("logoutMsg","Logout Sucessfully");
            resp.sendRedirect("login.jsp");

        }catch (Exception e){
            e.printStackTrace();

        }
    }
}
