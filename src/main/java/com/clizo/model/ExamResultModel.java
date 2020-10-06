package com.clizo.model;

import javax.persistence.*;

@Entity
@Table(name = "results")
public class ExamResultModel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String examId;
	private String questionPaperNumber;
	private String questionId;
	private Integer score;
	private String selectedOption;
	private Integer needReview;
	private Integer attentedTime;
	private Long applicantId;
	private String section;


	public Long getApplicantId() {
		return applicantId;
	}

	public void setApplicantId(Long applicantId) {
		this.applicantId = applicantId;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getExamId() {
		return examId;
	}

	public void setExamId(String examId) {
		this.examId = examId;
	}

	public String getQuestionPaperNumber() {
		return questionPaperNumber;
	}

	public void setQuestionPaperNumber(String questionPaperNumber) {
		this.questionPaperNumber = questionPaperNumber;
	}

	public String getQuestionId() {
		return questionId;
	}

	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}

	public String getSelectedOption() {
		return selectedOption;
	}

	public void setSelectedOption(String selectedOption) {
		this.selectedOption = selectedOption;
	}

	public Integer getNeedReview() {
		return needReview;
	}

	public void setNeedReview(Integer needReview) {
		this.needReview = needReview;
	}

	public Integer getAttentedTime() {
		return attentedTime;
	}

	public void setAttentedTime(Integer attentedTime) {
		this.attentedTime = attentedTime;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}
}
