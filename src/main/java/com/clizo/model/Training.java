package com.clizo.model;

import java.io.Serializable;
import java.util.ArrayList;

public class Training implements Serializable{

	private Long id;
    private String name;
    private String type;
    private int sectionId;
    private float ratings;
    private float totScore;
    private float avgScore;
    
    public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    public int getSectionId() {
		return sectionId;
	}

	public void setSectionId(int sectionId) {
		this.sectionId = sectionId;
	}

    
    public float getRatings() {
        return ratings;
    }

    public void setRatings(float ratings) {
        this.ratings = ratings;
    }
    
    public float getTotScore() {
        return totScore;
    }

    public void setTotScore(float totScore) {
        this.totScore = totScore;
    }
    
    public float getAvgScore() {
        return avgScore;
    }

    public void setAvgScore(float avgScore) {
        this.avgScore = avgScore;
    }
    
}