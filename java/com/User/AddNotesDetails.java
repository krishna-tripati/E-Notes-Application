package com.User;

import java.util.Date;

public class AddNotesDetails {

    private int id;
    private String  title;
    private String content;
    private Date date;
    private UserDetails user;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public UserDetails getUser() {
        return user;
    }

    public void setUser(UserDetails user) {
        this.user = user;
    }

    public AddNotesDetails(int id, String title, String content, Date date, UserDetails user) {
        super();
        this.id = id;
        this.title = title;
        this.content = content;
        this.date = date;
        this.user = user;
    }

    public AddNotesDetails() {
        super();
    }
}
