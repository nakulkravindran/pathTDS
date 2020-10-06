package com.clizo.model;

import javax.persistence.*;

@Entity
@Table(name = "result_details")
public class ResultDetailsModel{
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;	
	private Long applicantId;
	private String examId;		
	private int questionpaperId;
	private int questionId;
	private int qnScore;
	private int totalScore;  //not sure
	private String qnAttemptedUnanswered;  //not sure
	private String section;
	private String markedOption;
	private String correctOption;
	private String markedDesc;
	private String correctDesc;
	private int newScore;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public Long getApplicantId() {
		return applicantId;
	}
	public void setApplicantId(Long applicantId) {
		this.applicantId = applicantId;
	}
	public String getExamId() {
		return examId;
	}
	public void setExamId(String examId) {
		this.examId = examId;
	}
	public int getQuestionpaperId() {
		return questionpaperId;
	}
	public void setQuestionpaperId(int questionpaperId) {
		this.questionpaperId = questionpaperId;
	}
	
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	
	public int getQnScore() {
		return qnScore;
	}
	public void setQnScore(int qnScore) {
		this.qnScore = qnScore;
	}
	public int getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}
	
	public String getQnAttemptedUnanswered() {
		return qnAttemptedUnanswered;
	}
	public void setQnAttemptedUnanswered(String qnAttemptedUnanswered) {
		this.qnAttemptedUnanswered = qnAttemptedUnanswered;
	}
	
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	
	public String getMarkedOption() {
		return markedOption;
	}
	public void setMarkedOption(String markedOption) {
		this.markedOption = markedOption;
	}
	
	public String getCorrectOption() {
		return correctOption;
	}
	public void setCorrectOption(String correctOption) {
		this.correctOption = correctOption;
	}	
	
	public String getMarkedDesc() {
		return markedDesc;
	}
	public void setMarkedDesc(String markedDesc) {
		this.markedDesc = markedDesc;
	}
	
	public String getCorrectDesc() {
		return correctDesc;
	}
	public void setCorrectDesc(String correctDesc) {
		this.correctDesc = correctDesc;
	}	
	
	public int getNewScore() {
		return newScore;
	}
	public void setNewScore(int newScore) {
		this.newScore = newScore;
	}
}