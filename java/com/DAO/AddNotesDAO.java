package com.DAO;

import com.User.AddNotesDetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AddNotesDAO {
    private Connection conn;

    public AddNotesDAO(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean AddNotes(String title,String content, int uid){
    boolean f=false;
    try {
      String query="insert into addnotes(title,content,uid)values(?,?,?)";
        PreparedStatement ps= conn.prepareStatement(query);
        ps.setString(1, title);
        ps.setString(2, content);
        ps.setInt(3,uid);
        int i=ps.executeUpdate();
        if(i==1){
            f=true;
        }

    }catch (Exception e){
        e.printStackTrace();

    }
    return f;
    }

    public List<AddNotesDetails> getData(int id) throws SQLException {
       List<AddNotesDetails> list=new ArrayList<AddNotesDetails>();
       AddNotesDetails AD=null;
       try{
           String query="select * from addnotes where uid=? order by id DESC";
           PreparedStatement ps=conn.prepareStatement(query);
           ps.setInt(1,id);

           ResultSet rs=ps.executeQuery();
           while (rs.next()){
               AD=new AddNotesDetails();
           AD.setId(rs.getInt(1));
           AD.setTitle(rs.getString(2));
           AD.setContent(rs.getString(3));
           AD.setDate(rs.getTimestamp(4));
           list.add(AD);
           }

       }catch (Exception e){
             e.printStackTrace();
       }

    return list;
    }

public AddNotesDetails getDatabyId(int noteId){
        AddNotesDetails a=null;
        try{
            String query="select * from addnotes where id=?";
            PreparedStatement ps=conn.prepareStatement(query);
            ps.setInt(1,noteId);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
             a=new AddNotesDetails();
             a.setId(rs.getInt(1));
                a.setTitle(rs.getString(2));
                a.setContent(rs.getString(3));

            }

        }catch (Exception e){
            e.printStackTrace();

        }

return a;
}


public boolean PostUpdate(int nid, String ti, String co){
        boolean f=false;
        try {
            String query="update addnotes set title=?, content=? where id=?";
            PreparedStatement ps=conn.prepareStatement(query);
            ps.setString(1,ti);
            ps.setString(2,co);
            ps.setInt(3,nid);
            int i=ps.executeUpdate();
            if(i==1){
                f=true;
            }
        }catch (Exception e){
            e.printStackTrace();

        }
        return f;
}

public boolean DeleteNotes(int nid){
        boolean f=false;
        try{
            String query="delete from addnotes where id=?";
            PreparedStatement ps=conn.prepareStatement(query);
            ps.setInt(1,nid);
            int i=ps.executeUpdate();
            if(i==1){
                f=true;
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
}
}
