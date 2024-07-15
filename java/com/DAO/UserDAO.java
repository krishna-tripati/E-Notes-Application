package com.DAO;

import com.User.UserDetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    private Connection conn;
    public UserDAO(Connection conn) {
        super();
        this.conn=conn;
    }
    public boolean addUser(UserDetails UD){

        boolean f=false;
        try {
            String query="insert into user(Name, Email, password) values(?,?,?)";
            PreparedStatement ps=conn.prepareStatement(query);
            ps.setString(1, UD.getName());
            ps.setString(2,UD.getEmail());
            ps.setString(3, UD.getPassword());

            int i=ps.executeUpdate();
            if(i==1){
                f=true;
            }


        }catch (Exception e){
            e.printStackTrace();
        }

        return f;
    }

    public UserDetails loginuser(UserDetails ud){
        UserDetails user=null;
        try {

            String query="select * from user where email=? and password=?";
            PreparedStatement ps=conn.prepareStatement(query);
            ps.setString(1, ud.getEmail());
            ps.setString(2, ud.getPassword());
            ResultSet rs=ps.executeQuery();
             if(rs.next()){
                 user=new UserDetails();
                 user.setId(rs.getInt("ID"));
                 user.setName(rs.getString("Name"));
                 user.setEmail(rs.getString("Email"));
                 user.setPassword("password");

             }


        }catch (Exception e){
         e.printStackTrace();
        }

        return user;
    }
}
