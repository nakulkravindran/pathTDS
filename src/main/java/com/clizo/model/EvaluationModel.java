package com.clizo.model;

import javax.persistence.*;

@Entity
@Table(name = "evaluation")
public class EvaluationModel{
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
	private int trainingRegistrationId;
	private int trainingId;
	private int questionId;
	private String ratingComments; 
	
	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTrainingRegistrationId() {
        return trainingRegistrationId;
    }

    public void setTrainingRegistrationId(int trRegId) {
        this.trainingRegistrationId = trRegId;
    }

    public int getTrainingId() {
        return trainingId;
    }

    public void setTrainingId(int trId) {
        this.trainingId = trId;
    }
    
    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int qnId) {
        this.questionId = qnId;
    }
    
    public String getRatingComments() {
		return ratingComments;
	}

	public void setRatingComments(String rtCmnt) {
		this.ratingComments = rtCmnt;
	}

	 
}