package com.clizo.model;

import java.util.List;

public class LoggedInUserDetailsPOJO extends AdduserModel{

    private List<String> screenList;

    public LoggedInUserDetailsPOJO(AdduserModel userDetails) {
        this.setDepartment(userDetails.getDepartment());
        this.setEmailid(userDetails.getEmailid());
        this.setEmployeid(userDetails.getEmployeid());
        this.setId(userDetails.getId());
        this.setJobtitle(userDetails.getJobtitle());
        this.setName(userDetails.getName());
        this.setPassword(userDetails.getPassword());
        this.setStatus(userDetails.getStatus());
        this.setUsername(userDetails.getUsername());
    }

    public List<String> getScreenList() {
        return screenList;
    }

    public void setScreenList(List<String> screenList) {
        this.screenList = screenList;
    }
}
