package com.clizo.model;

public class UploadQustnBankModel {
	
    private String className;
    private String question;
    private String option1;
    private String option2;
    private String option3;
    private String option4;
    private String option5;
    private String answerMultiple;
    private String answerDescrptive;
    private String answerImg;
    private String difficultylevel;
    private String Qn_type;
	private String Section;
	private String status;
	private String createdDate;
	
	private String timeperQuestion;
	private boolean editQuestion = false;
    
	public boolean isEditQuestion() {
		return editQuestion;
	}
	public void setEditQuestion(boolean editQuestion) {
		this.editQuestion = editQuestion;
	}
	public String getTimeperQuestion() {
		return timeperQuestion;
	}
	public void setTimeperQuestion(String timeperQuestion) {
		this.timeperQuestion = timeperQuestion;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getDifficultylevel() {
		return difficultylevel;
	}
	public void setDifficultylevel(String difficultylevel) {
		this.difficultylevel = difficultylevel;
	}
	public String getQn_type() {
		return Qn_type;
	}
	public void setQn_type(String qn_type) {
		Qn_type = qn_type;
	}
	public String getSection() {
		return Section;
	}
	public void setSection(String section) {
		Section = section;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getOption1() {
		return option1;
	}
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	public String getOption2() {
		return option2;
	}
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	public String getOption3() {
		return option3;
	}
	public void setOption3(String option3) {
		this.option3 = option3;
	}
	public String getOption4() {
		return option4;
	}
	public void setOption4(String option4) {
		this.option4 = option4;
	}
	public String getOption5() {
		return option5;
	}
	public void setOption5(String option5) {
		this.option5 = option5;
	}
	public String getAnswerMultiple() {
		return answerMultiple;
	}
	public void setAnswerMultiple(String answerMultiple) {
		this.answerMultiple = answerMultiple;
	}
	public String getAnswerDescrptive() {
		return answerDescrptive;
	}
	public void setAnswerDescrptive(String answerDescrptive) {
		this.answerDescrptive = answerDescrptive;
	}
	public String getAnswerImg() {
		return answerImg;
	}
	public void setAnswerImg(String answerImg) {
		this.answerImg = answerImg;
	}
	public String getQuestionImg() {
		return questionImg;
	}
	public void setQuestionImg(String questionImg) {
		this.questionImg = questionImg;
	}
	public String getOption1Img() {
		return option1Img;
	}
	public void setOption1Img(String option1Img) {
		this.option1Img = option1Img;
	}
	public String getOption2Img() {
		return option2Img;
	}
	public void setOption2Img(String option2Img) {
		this.option2Img = option2Img;
	}
	public String getOption3Img() {
		return option3Img;
	}
	public void setOption3Img(String option3Img) {
		this.option3Img = option3Img;
	}
	public String getOption4Img() {
		return option4Img;
	}
	public void setOption4Img(String option4Img) {
		this.option4Img = option4Img;
	}
	private String questionImg;
    private String option1Img;
    private String option2Img;
    private String option3Img;
    private String option4Img;
    
    private String area;
    public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
}
