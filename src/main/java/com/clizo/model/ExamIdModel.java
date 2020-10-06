package com.clizo.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "examId")
public class ExamIdModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    //private String dateCreated;
    
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    
    /*public String getDateCreated() {
        return dateCreated;
    }      
    public void setDateCreated(String dateCreated) {
    Date todaysDate = new Date();
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
     this.dateCreated=df.format(todaysDate);
    }*/
    
}