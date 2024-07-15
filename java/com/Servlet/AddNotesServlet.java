package com.Servlet;

import com.DAO.AddNotesDAO;
import com.Db.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException
    {

        int uid=Integer.parseInt(req.getParameter("uid"));
        String title=req.getParameter("title");
        String content=req.getParameter("content");


        AddNotesDAO dao=new AddNotesDAO(DBConnection.getConn());
        boolean f=dao.AddNotes(title,content,uid);
        if(f){

            resp.sendRedirect("showNotes.jsp");
            System.out.println("data insert sucessfully");
        }else {
            System.out.println("data not inserted");
        }


    }
}
