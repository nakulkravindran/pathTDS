package com.clizo.model;

import java.io.Serializable;
import java.util.ArrayList;

public class ResultDetailsPOJO implements Serializable{

	private Long id;
	private int newScore;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getNewScore() {
        return newScore;
    }

    public void setNewScore(int newScore) {
        this.newScore = newScore;
    }
}