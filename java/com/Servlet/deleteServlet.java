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

@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer noteid=Integer.parseInt(req.getParameter("note_id"));
        AddNotesDAO dao=new AddNotesDAO(DBConnection.getConn());
        boolean f=dao.DeleteNotes(noteid);
        HttpSession session=null;
        if(f){
            session=req.getSession();
            session.setAttribute("updateMsg","Notes Delete Sucessfully");
            resp.sendRedirect("showNotes.jsp");
        }
        else {
            session=req.getSession();
            session.setAttribute("wrongMsg","Something went wrong on server");
            resp.sendRedirect("showNotes.jsp");
        }

    }
}
