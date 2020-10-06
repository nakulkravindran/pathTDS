package com.clizo.model;

import javax.persistence.*;

@Entity
@Table(name = "screens")
public class ScreenModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String screenName;
    private String status;
    private String pagename;
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getScreenName() {
        return screenName;
    }

    public void setScreenName(String screenName) {
        this.screenName = screenName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

	public String getPagename() {
		return pagename;
	}

	public void setPagename(String pagename) {
		this.pagename = pagename;
	}
    
}
