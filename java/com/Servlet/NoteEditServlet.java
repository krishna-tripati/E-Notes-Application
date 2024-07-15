package com.Servlet;

import com.DAO.AddNotesDAO;
import com.Db.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/NoteEditServlet")
public class NoteEditServlet  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        try{
            Integer noteid=Integer.parseInt(req.getParameter("noteid"));
            String Title=req.getParameter("title");
            String Content=req.getParameter("content");

            AddNotesDAO dao=new AddNotesDAO(DBConnection.getConn());
            boolean f=dao.PostUpdate(noteid,Title,Content);
            if(f){
                System.out.println("Data update Sucessfully");
                HttpSession session=req.getSession();
                session.setAttribute("updateMsg","Notes Update Sucessfully");
                resp.sendRedirect("showNotes.jsp");
            }else {
                System.out.println("Data not updated");
            }

        }catch (Exception e){
            e.printStackTrace();

        }

    }
}
