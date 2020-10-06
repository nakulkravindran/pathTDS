package com.clizo.model;

import javax.persistence.*;

@Entity
@Table(name = "screen_access")
public class ScreenAccessModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private int userId;
    private int screenId;
    private String screenAccess;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getScreenId() {
        return screenId;
    }

    public void setScreenId(int screenId) {
        this.screenId = screenId;
    }

    public String getScreenAccess() {
        return screenAccess;
    }

    public void setScreenAccess(String screenAccess) {
        this.screenAccess = screenAccess;
    }
}
